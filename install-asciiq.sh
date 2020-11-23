#!/bin/bash

fail() {
echo $1
exit $2
echo "press something"
read out
}

pass() {
echo $1
exit $2
}


                                         #sites for wget#

site2=http://www.robobunny.com/projects/asciiquarium/asciiquarium.tar.gz
site=http://search.cpan.org/CPAN/authors/id/K/KB/KBAUCOM/Term-Animation-2.6.tar.gz
#                            #####    main    #######

touch ~/pond
cd pond
sudo apt install libcurses-perl && echo "libcurses installed" && echo $! ||  fail "curses not installed" 1
cd /tmp && echo $!
sleep 1s
clear
wget $site  && tar -zxvf Term-Animation-2.6.tar.gz && echo "wget and un-tar worked" && echo $! || fail "could not wget and untar" 2
cd Term-Animation-2.6 && echo $! || fail "couldnt access tmp" 2.5
sleep 1s
clear
perl Makefile.PL &&  make &&   make test && echo "make and make test worked" && echo $! || fail "make and test failed" 3
sleep 1s
clear
sudo make install && echo "make install worked term animation compleate" && echo $! || fail " term animation failed install" 4
cd /tmp && echo $! || fail "couldnt get back to tmp" 4.5
wget --no-check-certificate $site2 && tar -zxvf asciiquarium.tar.gz && echo "pond installed almost" && echo $! || fail "fail instll pond" 5
cd asciiquarium_1.1 && echo "almost there" && echo $! || fail"where is asciiq file?" 5.5
sleep 1s
clear
sudo cp asciiquarium /usr/local/bin/ && echo "copied to local bin" && echo $! || fail "couldnt copy to local bin" 6
sleep 1s
clear
sudo chmod 0755 /usr/local/bin/asciiquarium && echo "making it exec-able" && echo $! || fail "couldnt change permissions" 7
asciiquarium && echo 'alias pond="asciiquarium"' >> ~/bash_aliases && echo $! || fail "wtf" 8
sleep 1s
exit 0



