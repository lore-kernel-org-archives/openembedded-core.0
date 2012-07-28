Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SvEJ5-0004oY-8n
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 23:12:16 +0200
Received: from localhost ([127.0.0.1]:40263 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1SvE7t-0001VW-Ah
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 21:00:41 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=message-id
	:date:from:reply-to:mime-version:to:subject:content-type; s=
	default; bh=4i5lJZpxFpU6SWENBEnl2rTtzM4=; b=JAH5vMXo5vH1yRdckbtA
	sn2TjDXaF/7MIjt1DZNK7rUwypmpJaOyOAqV901sb5txS+YGjvoL7uZUlCN1/kFK
	wbBJWrjj7TB7vNAFY8LXlpJHzVuToA+OQCrF/o66tn8HuvvY9U8Kbi5UD1aWXI2K
	1IhMYcpH8UqPIHotUUcDSNs=
Received: from cpc2-cmbg15-2-0-cust171.5-4.cable.virginmedia.com
	([86.26.12.172]:53889 helo=[192.168.1.113])
	by eumx.net with esmtpsa (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <ml@communistcode.co.uk>)
	id 1SvE31-0001Qj-AL for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 20:55:41 +0000
Message-ID: <501451CA.2020700@communistcode.co.uk>
Date: Sat, 28 Jul 2012 21:55:38 +0100
From: Jack Mitchell <ml@communistcode.co.uk>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: eglibc 2.16 do_install fail
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: ml@communistcode.co.uk,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 28 Jul 2012 21:12:16 -0000
X-Groupsio-MsgNum: 26442
Content-Type: multipart/mixed; boundary="------------060103080306000209070506"

--------------060103080306000209070506
Content-Type: multipart/alternative;
 boundary="------------060805090707030209050906"

--------------060805090707030209050906
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

This seems to be a long standing issue that occasionally pops up. The 
last instance of it I can find is in 2008, all this eglibc stuff is way 
over my head so if anyone can decipher what the issue is here it would 
be much appreciated!

| install: cannot stat 
'/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc/rpcsvc/bootparam_prot.h': 
No such file or directory

Regards,
Jack.

Attached (1)

--------------060805090707030209050906
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=ISO-8859-1">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-flowed" style="font-family: -moz-fixed;
      font-size: 14px;" lang="x-western">This seems to be a long
      standing issue that occasionally pops up. The last instance of it
      I can find is in 2008, all this eglibc stuff is way over my head
      so if anyone can decipher what the issue is here it would be much
      appreciated!
      <br>
      <br>
      | install: cannot stat
      '/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc/rpcsvc/bootparam_prot.h':

      No such file or directory
      <br>
      <br>
      Regards,
      <br>
      Jack.
      <br>
      <br>
      Attached (1)
      <br>
    </div>
  </body>
</html>

--------------060805090707030209050906--

--------------060103080306000209070506
Content-Type: text/plain; charset=windows-1252;
 name="log.do_install.13591"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="log.do_install.13591"

DEBUG: SITE files ['endian-little', 'bit-32', 'arm-common', 'common-linux',=
 'common-glibc', 'arm-linux', 'arm-linux-gnueabi', 'common']
DEBUG: Executing shell function do_install
NOTE: make PARALLELMFLAGS=3D-j3 install_root=3D/mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image inst=
all
LANGUAGE=3DC LC_ALL=3DC; export LANGUAGE LC_ALL; \
make -r PARALLELMFLAGS=3D"-j3" -C /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc objdir=
=3D`pwd` install
make[1]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc'
make -j3 subdir=3Dcsu -C csu ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make -j3 subdir=3Diconv -C iconv ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconv'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconv'
make -j3 subdir=3Dlocale -C locale ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/locale'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/locale'
make -j3 subdir=3Dlocaledata -C localedata ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/localedata'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/localedata'
make -j3 subdir=3Diconvdata -C iconvdata ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconvdata'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconvdata'
make -j3 subdir=3Dassert -C assert ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/assert'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/assert'
make -j3 subdir=3Dctype -C ctype ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/ctype'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/ctype'
make -j3 subdir=3Dintl -C intl ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/intl'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/intl'
make -j3 subdir=3Dcatgets -C catgets ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/catgets'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/catgets'
make -j3 subdir=3Dmath -C math ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/math'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/math'
make -j3 subdir=3Dsetjmp -C setjmp ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make -j3 subdir=3Dsignal -C signal ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make -j3 subdir=3Dstdlib -C stdlib ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make -j3 subdir=3Dstdio-common -C stdio-common ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdio-commo=
n'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdio-common=
'
make -j3 subdir=3Dlibio -C libio ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libio'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libio'
make -j3 subdir=3Ddlfcn -C dlfcn ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dlfcn'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dlfcn'
make -j3 subdir=3Dmalloc -C malloc ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/malloc'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/malloc'
make -j3 subdir=3Dstring -C string ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make -j3 subdir=3Dwcsmbs -C wcsmbs ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wcsmbs'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wcsmbs'
make -j3 subdir=3Dtimezone -C timezone ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/timezone'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/timezone'
make -j3 subdir=3Dtime -C time ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make -j3 subdir=3Ddirent -C dirent ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make -j3 subdir=3Dgrp -C grp ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/grp'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/grp'
make -j3 subdir=3Dpwd -C pwd ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/pwd'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/pwd'
make -j3 subdir=3Dposix -C posix ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make -j3 subdir=3Dio -C io ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make -j3 subdir=3Dtermios -C termios ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/termios'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/termios'
make -j3 subdir=3Dresource -C resource ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resource'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resource'
make -j3 subdir=3Dmisc -C misc ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make -j3 subdir=3Dsocket -C socket ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/socket'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/socket'
make -j3 subdir=3Dsysvipc -C sysvipc ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sysvipc'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sysvipc'
make -j3 subdir=3Dgmon -C gmon ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make -j3 subdir=3Dgnulib -C gnulib ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gnulib'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gnulib'
make -j3 subdir=3Dwctype -C wctype ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wctype'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wctype'
make -j3 subdir=3Dmanual -C manual ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/manual'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/manual'
make -j3 subdir=3Dshadow -C shadow ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/shadow'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/shadow'
make -j3 subdir=3Dgshadow -C gshadow ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gshadow'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gshadow'
make -j3 subdir=3Dpo -C po ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/po'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/po'
make -j3 subdir=3Dargp -C argp ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/argp'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/argp'
make -j3 subdir=3Dcrypt -C crypt ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/crypt'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/crypt'
make -j3 subdir=3Dnptl -C nptl ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make -j3 subdir=3Dresolv -C resolv ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resolv'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resolv'
make -j3 subdir=3Dnss -C nss ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nss'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nss'
make -j3 subdir=3Drt -C rt ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/rt'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/rt'
make -j3 subdir=3Dconform -C conform ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/conform'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/conform'
make -j3 subdir=3Ddebug -C debug ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/debug'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/debug'
make -j3 subdir=3Dlibidn -C libidn ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libidn'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libidn'
make -j3 subdir=3Dnptl_db -C nptl_db ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl_db'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl_db'
make -j3 subdir=3Dinet -C inet ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/inet'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/inet'
make -j3 subdir=3Dhesiod -C hesiod ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/hesiod'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/hesiod'
make -j3 subdir=3Dsunrpc -C sunrpc ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc'
make -j3 subdir=3Dnis -C nis ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nis'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nis'
make -j3 subdir=3Dnscd -C nscd ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nscd'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nscd'
make -j3 subdir=3Dstreams -C streams ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/streams'
make[2]: Nothing to be done for `subdir_lib'.
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/streams'
make -j3 subdir=3Dlogin -C login ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/login'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/login'
make -j3 subdir=3Delf -C elf ..=3D../ subdir_lib
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
make -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/librtld.mk -f rt=
ld-Rules
make[3]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
make subdir=3Dcsu -C ../csu ..=3D../ objdir=3D/mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-p=
oky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D=
'rtld-check_fds.os rtld-errno.os rtld-divdi3.os rtld-sysdep.os'
make subdir=3Ddirent -C ../dirent ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-closedir.os rtld-readdir.os rtld-rewinddir.os rtld-getdents.os =
rtld-fdopendir.os'
make subdir=3Dgmon -C ../gmon ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-profil.os rtld-prof-freq.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make subdir=3Dio -C ../io ..=3D../ objdir=3D/mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-pok=
y-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'r=
tld-xstat64.os rtld-fxstat64.os rtld-lxstat64.os rtld-open.os rtld-close.os=
 rtld-read.os rtld-write.os rtld-lseek.os rtld-access.os rtld-fcntl.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make subdir=3Dmisc -C ../misc ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-getpagesize.os rtld-mmap.os rtld-munmap.os rtld-mprotect.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make subdir=3Dnptl -C ../nptl ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-libc-lowlevellock.os rtld-libc-cancellation.os rtld-libc_multiple_=
threads.os rtld-forward.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make subdir=3Dposix -C ../posix ..=3D../ objdir=3D/mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-a=
rm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-module=
s=3D'rtld-uname.os rtld-_exit.os rtld-getpid.os rtld-environ.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make subdir=3Dsetjmp -C ../setjmp ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-setjmp.os rtld-__longjmp.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make subdir=3Dsignal -C ../signal ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-sigaction.os rtld-sigrestorer.os rtld-raise.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make subdir=3Dstdlib -C ../stdlib ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-exit.os rtld-cxa_atexit.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make subdir=3Dstring -C ../string ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-strchr.os rtld-strcmp.os rtld-strcpy.os rtld-strlen.os rtld-str=
nlen.os rtld-memchr.os rtld-memcmp.os rtld-memmove.os rtld-memset.os rtld-m=
empcpy.os rtld-stpcpy.os rtld-memcpy.os rtld-wordcopy.os rtld-rawmemchr.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make subdir=3Dtime -C ../time ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-setitimer.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make[3]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
./scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libc.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc_nonshared.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_nonshared.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_pic.a
make -C elf ldso_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
make -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/librtld.mk -f rt=
ld-Rules
make[3]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
make subdir=3Dcsu -C ../csu ..=3D../ objdir=3D/mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-p=
oky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D=
'rtld-check_fds.os rtld-errno.os rtld-divdi3.os rtld-sysdep.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make subdir=3Ddirent -C ../dirent ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-closedir.os rtld-readdir.os rtld-rewinddir.os rtld-getdents.os =
rtld-fdopendir.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make subdir=3Dgmon -C ../gmon ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-profil.os rtld-prof-freq.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make subdir=3Dio -C ../io ..=3D../ objdir=3D/mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-pok=
y-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'r=
tld-xstat64.os rtld-fxstat64.os rtld-lxstat64.os rtld-open.os rtld-close.os=
 rtld-read.os rtld-write.os rtld-lseek.os rtld-access.os rtld-fcntl.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make subdir=3Dmisc -C ../misc ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-getpagesize.os rtld-mmap.os rtld-munmap.os rtld-mprotect.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make subdir=3Dnptl -C ../nptl ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-libc-lowlevellock.os rtld-libc-cancellation.os rtld-libc_multiple_=
threads.os rtld-forward.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make subdir=3Dposix -C ../posix ..=3D../ objdir=3D/mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-a=
rm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-module=
s=3D'rtld-uname.os rtld-_exit.os rtld-getpid.os rtld-environ.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make subdir=3Dsetjmp -C ../setjmp ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-setjmp.os rtld-__longjmp.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make subdir=3Dsignal -C ../signal ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-sigaction.os rtld-sigrestorer.os rtld-raise.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make subdir=3Dstdlib -C ../stdlib ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-exit.os rtld-cxa_atexit.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make subdir=3Dstring -C ../string ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-strchr.os rtld-strcmp.os rtld-strcpy.os rtld-strlen.os rtld-str=
nlen.os rtld-memchr.os rtld-memcmp.os rtld-memmove.os rtld-memset.os rtld-m=
empcpy.os rtld-stpcpy.os rtld-memcpy.os rtld-wordcopy.os rtld-rawmemchr.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make subdir=3Dtime -C ../time ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-setitimer.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[3]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/ld.s=
o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/lib/ld-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/ld-2.16.so.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/li=
b/ld-2.16.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libc.so =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/lib/libc-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libc-2.16.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
lib/libc-2.16.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/ld-linux.so.3
ln -s ld-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/ld-linux.so.3
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libc.so =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/lib/libc-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libc-2.16.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
lib/libc-2.16.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libc.so.6
ln -s libc-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libc.so.6
(echo '/* GNU ld script';\
 echo '   Use the shared library, but some functions are only in';\
 echo '   the static library, so try that secondarily.  */';\
 cat /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/format.lds; \
 echo 'GROUP ( /lib/libc.so.6' \
      '/usr/lib/libc_nonshared.a'\
      ' AS_NEEDED (' /lib/ld-linux.so.3 ') )' \
) > /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egl=
ibc-2.16-r4+svnr19383/image/usr/lib/libc.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libc.so.new /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/lib/libc.so
./scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include
/usr/bin/install -c -m 644 include/limits.h /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inc=
lude/limits.h
/usr/bin/install -c -m 644 include/values.h /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inc=
lude/values.h
/usr/bin/install -c -m 644 include/features.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/features.h
/usr/bin/install -c -m 644 include/gnu-versions.h /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/include/gnu-versions.h
./scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/bits
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/bits
/usr/bin/install -c -m 644 nptl/sysdeps/pthread/bits/libc-lock.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/bits/libc-lock.h
/usr/bin/install -c -m 644 include/bits/xopen_lim.h /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/include/bits/xopen_lim.h
./scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/gnu
/usr/bin/install -c -m 644 include/gnu/libc-version.h /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/include/gnu/libc-version.h
/usr/bin/install -c -m 644 include/stdc-predef.h /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/include/stdc-predef.h
/usr/bin/install -c -m 644 ports/sysdeps/arm/bits/predefs.h /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/include/bits/predefs.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/lib-names.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/lib-names.h
{ \
 echo '/* This file is automatically generated.';\
 echo "   This file selects the right generated file of \`__stub_FUNCTION' =
macros";\
 echo '   based on the architecture being compiled for.  */'; \
 echo ''; \
  \
 echo ''; \
   echo '#if !defined __ARM_PCS_VFP'; echo '# include <gnu/stubs-soft.h>'; =
echo '#endif'; rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/stubs.h.newsof=
t;    echo '#if defined __ARM_PCS_VFP'; echo '# include <gnu/stubs-hard.h>'=
; echo '#endif'; rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-pok=
y-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/stubs.h.newh=
ard;  \
} > /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egl=
ibc-2.16-r4+svnr19383/image/usr/include/gnu/stubs.h.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/gnu/stubs.h.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/include/gnu/stubs.h
make -j3 subdir=3Dcsu -C csu ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
su/crt1.o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/crt1.o
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
su/gcrt1.o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gcrt1.o
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
su/Mcrt1.o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/Mcrt1.o
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
su/Scrt1.o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/Scrt1.o
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
su/crti.o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/crti.o
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
su/crtn.o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/crtn.o
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make -j3 subdir=3Diconv -C iconv ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconv'
/usr/bin/install -c -m 644 iconv.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/icon=
v.h
/usr/bin/install -c -m 644 gconv.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gcon=
v.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sbin
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/sbin
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/bin
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconv/ic=
onvconfig /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/sbin/iconvconfig.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconv/ic=
onv_prog /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/bin/iconv.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/sbin/iconvconfig.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/sbin/iconvconfig
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/iconv.new /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/bin/iconv
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconv'
make -j3 subdir=3Dlocale -C locale ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/locale'
/usr/bin/install -c -m 644 locale.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/loc=
ale.h
/usr/bin/install -c -m 644 bits/locale.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/locale.h
/usr/bin/install -c -m 644 langinfo.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/l=
anginfo.h
/usr/bin/install -c -m 644 xlocale.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/xl=
ocale.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/locale/l=
ibBrokenLocale.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libBrokenLocale-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ocale/libBrokenLocale.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libBrokenLocale.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ocale/libBrokenLocale_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libBrokenLocale=
_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libBrokenLocale-2.16.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/lib/libBrokenLocale-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibBrokenLocale.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libBrokenLocale_pic.map
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/locale/l=
ocaledef /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/bin/localedef.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/locale/l=
ocale /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/locale.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/localedef.new /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/bin/localedef
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/locale.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/locale
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libBrokenLocale.so.1
ln -s libBrokenLocale-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-=
vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libBrokenLocale.s=
o.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libBrokenLocale.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libBrokenLocale.so=
.1 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egli=
bc-2.16-r4+svnr19383/image/usr/lib/libBrokenLocale.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libBrokenLocale.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/libBrokenLocale.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/locale'
make -j3 subdir=3Dlocaledata -C localedata ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/localedata'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n
mkdir: cannot create directory '/mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n': Fi=
le exists
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
mkdir: cannot create directory '/mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share': File ex=
ists
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
mkdir: cannot create directory '/mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/char=
maps': File exists
mkdir: cannot create directory '/mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/char=
maps': File exists
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-ROMAN9 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/HP-ROMAN9.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM868 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM868.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1047 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1047.gz
/usr/bin/install -c -m 644 charmaps/IBM868 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM868
/usr/bin/install -c -m 644 charmaps/HP-ROMAN9 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/HP-ROMAN9
/usr/bin/install -c -m 644 charmaps/IBM1047 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1047
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-ROMAN9
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1047
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM868
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1133 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1133.gz
/usr/bin/install -c -m 644 charmaps/IBM1133 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1133
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-7 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-7.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-7 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-7
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-7
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-US /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EBCDIC-US.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM500 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM500.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1133
/usr/bin/install -c -m 644 charmaps/EBCDIC-US /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EBCDIC-US
/usr/bin/install -c -m 644 charmaps/IBM500 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM500
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-KR /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/EUC-KR.gz
/usr/bin/install -c -m 644 charmaps/EUC-KR /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/EUC-KR
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM500
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-US
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1004 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1004.gz
/usr/bin/install -c -m 644 charmaps/IBM1004 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1004
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-16 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-16.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-16 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-16
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-KR
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1004
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-16
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1163 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1163.gz
/usr/bin/install -c -m 644 charmaps/IBM1163 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1163
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM423 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM423.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1163
/usr/bin/install -c -m 644 charmaps/IBM423 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM423
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM423
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-JP-MS /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EUC-JP-MS.gz
/usr/bin/install -c -m 644 charmaps/EUC-JP-MS /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EUC-JP-MS
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM256 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM256.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-JP-MS
/usr/bin/install -c -m 644 charmaps/IBM256 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM256
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM273 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM273.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM256
/usr/bin/install -c -m 644 charmaps/IBM273 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM273
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-GR /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-GR.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM273
/usr/bin/install -c -m 644 charmaps/CSA_Z243.4-1985-GR /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/share/i18n/charmaps/CSA_Z243.4-1985-GR
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FR /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EBCDIC-FR.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-FR /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EBCDIC-FR
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-GR
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FR
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-IT /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EBCDIC-IT.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-IT /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EBCDIC-IT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GB_1988-80 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/GB_1988-80.gz
/usr/bin/install -c -m 644 charmaps/GB_1988-80 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/GB_1988-80
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-IT
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GB_1988-80
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/DIN_66003 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/DIN_66003.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FI-SE-A /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FI-SE-A.gz
/usr/bin/install -c -m 644 charmaps/DIN_66003 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/DIN_66003
/usr/bin/install -c -m 644 charmaps/EBCDIC-FI-SE-A /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/EBCDIC-FI-SE-A
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/DIN_66003
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-TW /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/EUC-TW.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FI-SE-A
/usr/bin/install -c -m 644 charmaps/EUC-TW /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/EUC-TW
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ARMSCII-8 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/ARMSCII-8.gz
/usr/bin/install -c -m 644 charmaps/ARMSCII-8 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/ARMSCII-8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1124 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1124.gz
/usr/bin/install -c -m 644 charmaps/IBM1124 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1124
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1124
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ARMSCII-8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-TW
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_646.BASIC /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ISO_646.BASIC.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-11 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-11.gz
/usr/bin/install -c -m 644 charmaps/ISO_646.BASIC /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ISO_646.BASIC
/usr/bin/install -c -m 644 charmaps/ISO-8859-11 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-11
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_646.BASIC
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-11
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-CA-FR /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/EBCDIC-CA-FR.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-CA-FR /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/EBCDIC-CA-FR
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_5428 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/ISO_5428.gz
/usr/bin/install -c -m 644 charmaps/ISO_5428 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/ISO_5428
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_5428
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-CA-FR
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM918 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM918.gz
/usr/bin/install -c -m 644 charmaps/IBM918 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM918
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-IR-197 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-IR-197.gz
/usr/bin/install -c -m 644 charmaps/ISO-IR-197 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-IR-197
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-IR-197
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-2 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-2.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM918
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937-2-25 /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ISO_6937-2-25.gz
/usr/bin/install -c -m 644 charmaps/ISO_6937-2-25 /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ISO_6937-2-25
/usr/bin/install -c -m 644 charmaps/ISO-8859-2 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937-2-25
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-PT /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EBCDIC-PT.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-2
/usr/bin/install -c -m 644 charmaps/EBCDIC-PT /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EBCDIC-PT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP770 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP770.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-PT
/usr/bin/install -c -m 644 charmaps/CP770 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP770
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP770
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM038 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM038.gz
/usr/bin/install -c -m 644 charmaps/IBM038 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM038
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM297 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM297.gz
/usr/bin/install -c -m 644 charmaps/IBM297 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM297
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM038
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM297
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-GREEK8 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/HP-GREEK8.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSN_369103 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/CSN_369103.gz
/usr/bin/install -c -m 644 charmaps/CSN_369103 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/CSN_369103
/usr/bin/install -c -m 644 charmaps/HP-GREEK8 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/HP-GREEK8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSN_369103
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-GREEK8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP949 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP949.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1258 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1258.gz
/usr/bin/install -c -m 644 charmaps/CP949 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP949
/usr/bin/install -c -m 644 charmaps/CP1258 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1258
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP949
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1258
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-DK-NO /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/EBCDIC-DK-NO.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-DK-NO /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/EBCDIC-DK-NO
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-DK-NO
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1129 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1129.gz
/usr/bin/install -c -m 644 charmaps/IBM1129 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1129
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1129
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BS_4730 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/BS_4730.gz
/usr/bin/install -c -m 644 charmaps/BS_4730 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/BS_4730
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BS_4730
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM865 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM865.gz
/usr/bin/install -c -m 644 charmaps/IBM865 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM865
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM865
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM424 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM424.gz
/usr/bin/install -c -m 644 charmaps/IBM424 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM424
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM424
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1254 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1254.gz
/usr/bin/install -c -m 644 charmaps/CP1254 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1254
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1254
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM891 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM891.gz
/usr/bin/install -c -m 644 charmaps/IBM891 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM891
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM891
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM871 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM871.gz
/usr/bin/install -c -m 644 charmaps/IBM871 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM871
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM871
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ANSI_X3.110-1983 /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/share/i18n/charmaps/ANSI_X3.110-1983.gz
/usr/bin/install -c -m 644 charmaps/ANSI_X3.110-1983 /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/charmaps/ANSI_X3.110-1983
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ANSI_X3.110-1983
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INIS /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/share/i18n/charmaps/INIS.gz
/usr/bin/install -c -m 644 charmaps/INIS /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/charmaps/INIS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INIS
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GB2312 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/GB2312.gz
/usr/bin/install -c -m 644 charmaps/GB2312 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/GB2312
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM277 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM277.gz
/usr/bin/install -c -m 644 charmaps/IBM277 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM277
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GB2312
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM277
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GEORGIAN-ACADEMY /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/share/i18n/charmaps/GEORGIAN-ACADEMY.gz
/usr/bin/install -c -m 644 charmaps/GEORGIAN-ACADEMY /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/charmaps/GEORGIAN-ACADEMY
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM284 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM284.gz
/usr/bin/install -c -m 644 charmaps/IBM284 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM284
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GEORGIAN-ACADEMY
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM284
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM869 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM869.gz
/usr/bin/install -c -m 644 charmaps/IBM869 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM869
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-13 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-13.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-13 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-13
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM869
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BIG5-HKSCS /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/BIG5-HKSCS.gz
/usr/bin/install -c -m 644 charmaps/BIG5-HKSCS /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/BIG5-HKSCS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-13
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-DK-NO-A /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-DK-NO-A.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-DK-NO-A /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/EBCDIC-DK-NO-A
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BIG5-HKSCS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-DK-NO-A
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-2 /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-2.gz
/usr/bin/install -c -m 644 charmaps/CSA_Z243.4-1985-2 /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/charmaps/CSA_Z243.4-1985-2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_8859-SUPP /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ISO_8859-SUPP.gz
/usr/bin/install -c -m 644 charmaps/ISO_8859-SUPP /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ISO_8859-SUPP
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_8859-SUPP
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-10 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-10.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-10 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-10
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM922 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM922.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-10
/usr/bin/install -c -m 644 charmaps/IBM922 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM922
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM922
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP10007 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/CP10007.gz
/usr/bin/install -c -m 644 charmaps/CP10007 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/CP10007
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM875 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM875.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP10007
/usr/bin/install -c -m 644 charmaps/IBM875 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM875
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM875
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1161 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1161.gz
/usr/bin/install -c -m 644 charmaps/IBM1161 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1161
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM274 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM274.gz
/usr/bin/install -c -m 644 charmaps/IBM274 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM274
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1161
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM274
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM903 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM903.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM855 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM855.gz
/usr/bin/install -c -m 644 charmaps/IBM903 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM903
/usr/bin/install -c -m 644 charmaps/IBM855 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM855
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM903
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM855
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-15 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-15.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-15 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-15
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INVARIANT /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/INVARIANT.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-15
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1164 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1164.gz
/usr/bin/install -c -m 644 charmaps/IBM1164 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1164
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1164
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937-2-ADD /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937-2-ADD.gz
/usr/bin/install -c -m 644 charmaps/ISO_6937-2-ADD /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/ISO_6937-2-ADD
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937-2-ADD
/usr/bin/install -c -m 644 charmaps/INVARIANT /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/INVARIANT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-AT-DE-A /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-AT-DE-A.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-4 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-4.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-AT-DE-A /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/EBCDIC-AT-DE-A
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INVARIANT
/usr/bin/install -c -m 644 charmaps/ISO-8859-4 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-4
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-AT-DE-A
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ES /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/share/i18n/charmaps/ES.gz
/usr/bin/install -c -m 644 charmaps/ES /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i1=
8n/charmaps/ES
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM862 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM862.gz
/usr/bin/install -c -m 644 charmaps/IBM862 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM862
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-4
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ES
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM862
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-14 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-14.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IT /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/share/i18n/charmaps/IT.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-14 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-14
/usr/bin/install -c -m 644 charmaps/IT /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i1=
8n/charmaps/IT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-3 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-3.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-14
/usr/bin/install -c -m 644 charmaps/ISO-8859-3 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-3
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-JP /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/EUC-JP.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM852 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM852.gz
/usr/bin/install -c -m 644 charmaps/EUC-JP /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/EUC-JP
/usr/bin/install -c -m 644 charmaps/IBM852 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM852
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-3
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-THAI8 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/HP-THAI8.gz
/usr/bin/install -c -m 644 charmaps/HP-THAI8 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/HP-THAI8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM852
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-JP
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-THAI8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-JISX0213 /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/EUC-JISX0213.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GBK /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/share/i18n/charmaps/GBK.gz
/usr/bin/install -c -m 644 charmaps/EUC-JISX0213 /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/EUC-JISX0213
/usr/bin/install -c -m 644 charmaps/GBK /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/charmaps/GBK
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EUC-JISX0213
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GBK
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ANSI_X3.4-1968 /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/ANSI_X3.4-1968.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM857 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM857.gz
/usr/bin/install -c -m 644 charmaps/ANSI_X3.4-1968 /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/ANSI_X3.4-1968
/usr/bin/install -c -m 644 charmaps/IBM857 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM857
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ANSI_X3.4-1968
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM857
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1252 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1252.gz
/usr/bin/install -c -m 644 charmaps/CP1252 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1252
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BRF /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/share/i18n/charmaps/BRF.gz
/usr/bin/install -c -m 644 charmaps/BRF /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/charmaps/BRF
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1252
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BRF
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM866NAV /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/IBM866NAV.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-IR-90 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/ISO-IR-90.gz
/usr/bin/install -c -m 644 charmaps/IBM866NAV /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/IBM866NAV
/usr/bin/install -c -m 644 charmaps/ISO-IR-90 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/ISO-IR-90
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM866NAV
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-IR-90
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES-A /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES-A.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-ES-A /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/EBCDIC-ES-A
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES-A
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-1 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-1.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-1 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP772 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP772.gz
/usr/bin/install -c -m 644 charmaps/CP772 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP772
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP772
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-ROMAN8 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/HP-ROMAN8.gz
/usr/bin/install -c -m 644 charmaps/HP-ROMAN8 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/HP-ROMAN8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_10646 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/ISO_10646.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-5 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-5.gz
/usr/bin/install -c -m 644 charmaps/ISO_10646 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/ISO_10646
/usr/bin/install -c -m 644 charmaps/ISO-8859-5 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-5
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-ROMAN8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_10646
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP737 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP737.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-5
/usr/bin/install -c -m 644 charmaps/CP737 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP737
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GOST_19768-74 /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/GOST_19768-74.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP737
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CWI /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/share/i18n/charmaps/CWI.gz
/usr/bin/install -c -m 644 charmaps/GOST_19768-74 /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/GOST_19768-74
/usr/bin/install -c -m 644 charmaps/CWI /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/charmaps/CWI
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP773 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP773.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GOST_19768-74
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CWI
/usr/bin/install -c -m 644 charmaps/CP773 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP773
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP773
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1160 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1160.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM874 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM874.gz
/usr/bin/install -c -m 644 charmaps/IBM1160 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1160
/usr/bin/install -c -m 644 charmaps/IBM874 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM874
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ECMA-CYRILLIC /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ECMA-CYRILLIC.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1160
/usr/bin/install -c -m 644 charmaps/ECMA-CYRILLIC /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ECMA-CYRILLIC
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM874
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ECMA-CYRILLIC
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM290 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM290.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM280 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM280.gz
/usr/bin/install -c -m 644 charmaps/IBM290 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM290
/usr/bin/install -c -m 644 charmaps/IBM280 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM280
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM851 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM851.gz
/usr/bin/install -c -m 644 charmaps/IBM851 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM851
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM290
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-6 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-6.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM280
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM851
/usr/bin/install -c -m 644 charmaps/ISO-8859-6 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-6
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_5427-EXT /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/ISO_5427-EXT.gz
/usr/bin/install -c -m 644 charmaps/ISO_5427-EXT /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/ISO_5427-EXT
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-6
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GB18030 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/GB18030.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_5427-EXT
/usr/bin/install -c -m 644 charmaps/GB18030 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/GB18030
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1256 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1256.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_8859-1,GL /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ISO_8859-1,GL.gz
/usr/bin/install -c -m 644 charmaps/CP1256 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1256
/usr/bin/install -c -m 644 charmaps/ISO_8859-1,GL /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ISO_8859-1,GL
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1256
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_8859-1,GL
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM864 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM864.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GB18030
/usr/bin/install -c -m 644 charmaps/IBM864 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM864
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EBCDIC-ES.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-ES /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EBCDIC-ES
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM864
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GREEK7 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/GREEK7.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_2033-1983 /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ISO_2033-1983.gz
/usr/bin/install -c -m 644 charmaps/ISO_2033-1983 /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ISO_2033-1983
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_2033-1983
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP775 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP775.gz
/usr/bin/install -c -m 644 charmaps/CP775 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP775
/usr/bin/install -c -m 644 charmaps/GREEK7 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/GREEK7
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GREEK7
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-9E /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO-8859-9E.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-9E /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO-8859-9E
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-9E
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP775
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-9 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-9.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-1 /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-1.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-9 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-9
/usr/bin/install -c -m 644 charmaps/CSA_Z243.4-1985-1 /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/charmaps/CSA_Z243.4-1985-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-9
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CSA_Z243.4-1985-1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM037 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM037.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISIRI-3342 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISIRI-3342.gz
/usr/bin/install -c -m 644 charmaps/IBM037 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM037
/usr/bin/install -c -m 644 charmaps/ISIRI-3342 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISIRI-3342
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM037
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISIRI-3342
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ES2 /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/share/i18n/charmaps/ES2.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM870 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM870.gz
/usr/bin/install -c -m 644 charmaps/ES2 /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/charmaps/ES2
/usr/bin/install -c -m 644 charmaps/IBM870 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM870
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ES2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM870
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM437 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM437.gz
/usr/bin/install -c -m 644 charmaps/IBM437 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM437
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_646.IRV /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO_646.IRV.gz
/usr/bin/install -c -m 644 charmaps/ISO_646.IRV /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO_646.IRV
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM437
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_646.IRV
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GREEK-CCITT /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/GREEK-CCITT.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INIS-CYRILLIC /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/INIS-CYRILLIC.gz
/usr/bin/install -c -m 644 charmaps/GREEK-CCITT /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/GREEK-CCITT
/usr/bin/install -c -m 644 charmaps/INIS-CYRILLIC /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/INIS-CYRILLIC
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GREEK-CCITT
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INIS-CYRILLIC
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1257 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1257.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM863 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM863.gz
/usr/bin/install -c -m 644 charmaps/CP1257 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1257
/usr/bin/install -c -m 644 charmaps/IBM863 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM863
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1257
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM863
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-AT-DE /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/EBCDIC-AT-DE.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM856 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM856.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-AT-DE /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/EBCDIC-AT-DE
/usr/bin/install -c -m 644 charmaps/IBM856 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM856
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM856
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-AT-DE
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1250 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1250.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BIG5 /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/share/i18n/charmaps/BIG5.gz
/usr/bin/install -c -m 644 charmaps/CP1250 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1250
/usr/bin/install -c -m 644 charmaps/BIG5 /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/charmaps/BIG5
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1250
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BIG5
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM905 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM905.gz
/usr/bin/install -c -m 644 charmaps/IBM905 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM905
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM905
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM904 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM904.gz
/usr/bin/install -c -m 644 charmaps/IBM904 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM904
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM904
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM278 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM278.gz
/usr/bin/install -c -m 644 charmaps/IBM278 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM278
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM278
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM285 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM285.gz
/usr/bin/install -c -m 644 charmaps/IBM285 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM285
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM285
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM880 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM880.gz
/usr/bin/install -c -m 644 charmaps/IBM880 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM880
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM880
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-IR-209 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-IR-209.gz
/usr/bin/install -c -m 644 charmaps/ISO-IR-209 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-IR-209
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM860 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM860.gz
/usr/bin/install -c -m 644 charmaps/IBM860 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM860
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-IR-209
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM860
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM850 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM850.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-UK /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/EBCDIC-UK.gz
/usr/bin/install -c -m 644 charmaps/IBM850 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM850
/usr/bin/install -c -m 644 charmaps/EBCDIC-UK /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/EBCDIC-UK
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM850
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-UK
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES-S /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES-S.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1253 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1253.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-ES-S /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/EBCDIC-ES-S
/usr/bin/install -c -m 644 charmaps/CP1253 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1253
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-ES-S
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1253
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_10367-BOX /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/ISO_10367-BOX.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1251 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1251.gz
/usr/bin/install -c -m 644 charmaps/ISO_10367-BOX /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/ISO_10367-BOX
/usr/bin/install -c -m 644 charmaps/CP1251 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1251
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_10367-BOX
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1251
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GREEK7-OLD /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/GREEK7-OLD.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_5427 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/ISO_5427.gz
/usr/bin/install -c -m 644 charmaps/GREEK7-OLD /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/GREEK7-OLD
/usr/bin/install -c -m 644 charmaps/ISO_5427 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/ISO_5427
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GREEK7-OLD
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_5427
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/DS_2089 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/DS_2089.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/DEC-MCS /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/DEC-MCS.gz
/usr/bin/install -c -m 644 charmaps/DS_2089 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/DS_2089
/usr/bin/install -c -m 644 charmaps/DEC-MCS /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/DEC-MCS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/DS_2089
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/DEC-MCS
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1255 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1255.gz
/usr/bin/install -c -m 644 charmaps/CP1255 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1255
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1255
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1125 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/CP1125.gz
/usr/bin/install -c -m 644 charmaps/CP1125 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/CP1125
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-8 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/ISO-8859-8.gz
/usr/bin/install -c -m 644 charmaps/ISO-8859-8 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/ISO-8859-8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP1125
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO-8859-8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM866 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM866.gz
/usr/bin/install -c -m 644 charmaps/IBM866 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM866
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1132 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1132.gz
/usr/bin/install -c -m 644 charmaps/IBM1132 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1132
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM866
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1132
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IEC_P27-1 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/IEC_P27-1.gz
/usr/bin/install -c -m 644 charmaps/IEC_P27-1 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/IEC_P27-1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ASMO_449 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/ASMO_449.gz
/usr/bin/install -c -m 644 charmaps/ASMO_449 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/ASMO_449
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IEC_P27-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ASMO_449
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-IS-FRISS /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-IS-FRISS.gz
/usr/bin/install -c -m 644 charmaps/EBCDIC-IS-FRISS /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/share/i18n/charmaps/EBCDIC-IS-FRISS
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM275 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM275.gz
/usr/bin/install -c -m 644 charmaps/IBM275 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM275
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-IS-FRISS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM275
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-TURKISH8 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/HP-TURKISH8.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GEORGIAN-PS /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/GEORGIAN-PS.gz
/usr/bin/install -c -m 644 charmaps/HP-TURKISH8 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/HP-TURKISH8
/usr/bin/install -c -m 644 charmaps/GEORGIAN-PS /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/GEORGIAN-PS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/HP-TURKISH8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/GEORGIAN-PS
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1162 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1162.gz
/usr/bin/install -c -m 644 charmaps/IBM1162 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1162
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INIS-8 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/INIS-8.gz
/usr/bin/install -c -m 644 charmaps/INIS-8 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/INIS-8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1162
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/INIS-8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP774 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP774.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FI-SE /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FI-SE.gz
/usr/bin/install -c -m 644 charmaps/CP774 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP774
/usr/bin/install -c -m 644 charmaps/EBCDIC-FI-SE /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/EBCDIC-FI-SE
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1026 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/IBM1026.gz
/usr/bin/install -c -m 644 charmaps/IBM1026 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/IBM1026
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP774
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/EBCDIC-FI-SE
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM1026
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM281 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM281.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_11548-1 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/ISO_11548-1.gz
/usr/bin/install -c -m 644 charmaps/IBM281 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM281
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP771 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/CP771.gz
/usr/bin/install -c -m 644 charmaps/ISO_11548-1 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/ISO_11548-1
/usr/bin/install -c -m 644 charmaps/CP771 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/CP771
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM281
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_11548-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/CP771
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BS_VIEWDATA /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/BS_VIEWDATA.gz
/usr/bin/install -c -m 644 charmaps/BS_VIEWDATA /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/BS_VIEWDATA
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/ISO_6937.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM861 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM861.gz
/usr/bin/install -c -m 644 charmaps/ISO_6937 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/ISO_6937
/usr/bin/install -c -m 644 charmaps/IBM861 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM861
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/BS_VIEWDATA
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/ISO_6937
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM861
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM420 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/IBM420.gz
/usr/bin/install -c -m 644 charmaps/IBM420 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/IBM420
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NF_Z_62-010_1973 /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/share/i18n/charmaps/NF_Z_62-010_1973.gz
/usr/bin/install -c -m 644 charmaps/NF_Z_62-010_1973 /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/charmaps/NF_Z_62-010_1973
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-CENTRALEUROPE /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-CENTRALEUROPE.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/IBM420
/usr/bin/install -c -m 644 charmaps/MAC-CENTRALEUROPE /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/charmaps/MAC-CENTRALEUROPE
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NF_Z_62-010_1973
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-RU /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/KOI8-RU.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-CENTRALEUROPE
/usr/bin/install -c -m 644 charmaps/KOI8-RU /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/KOI8-RU
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MACINTOSH /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/MACINTOSH.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-U /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/KOI8-U.gz
/usr/bin/install -c -m 644 charmaps/MACINTOSH /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/MACINTOSH
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-RU
/usr/bin/install -c -m 644 charmaps/KOI8-U /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/KOI8-U
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MACINTOSH
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-DANO /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/NATS-DANO.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/VISCII /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/VISCII.gz
/usr/bin/install -c -m 644 charmaps/NATS-DANO /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/NATS-DANO
/usr/bin/install -c -m 644 charmaps/VISCII /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/VISCII
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-U
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-DANO
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/VISCII
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SAMI /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/share/i18n/charmaps/SAMI.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-KANA /=
mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2=
.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-KANA.gz
/usr/bin/install -c -m 644 charmaps/SAMI /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/charmaps/SAMI
/usr/bin/install -c -m 644 charmaps/JIS_C6229-1984-KANA /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/share/i18n/charmaps/JIS_C6229-1984-KANA
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.003-MAC /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.003-MAC.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SAMI
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-KAN=
A
/usr/bin/install -c -m 644 charmaps/JUS_I.B1.003-MAC /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/charmaps/JUS_I.B1.003-MAC
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAND-A=
DD /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egli=
bc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAND-ADD.=
gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.003-MAC
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.002 /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.002.gz
/usr/bin/install -c -m 644 charmaps/JIS_C6229-1984-HAND-ADD /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAND-ADD
/usr/bin/install -c -m 644 charmaps/JUS_I.B1.002 /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/JUS_I.B1.002
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NS_4551-2 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/NS_4551-2.gz
/usr/bin/install -c -m 644 charmaps/NS_4551-2 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/NS_4551-2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAN=
D-ADD
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NS_4551-2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.002
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-CYRILLIC /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/MAC-CYRILLIC.gz
/usr/bin/install -c -m 644 charmaps/MAC-CYRILLIC /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/MAC-CYRILLIC
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SEN_850200_C /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/SEN_850200_C.gz
/usr/bin/install -c -m 644 charmaps/SEN_850200_C /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/SEN_850200_C
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-CYRILLIC
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6220-1969-JP /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6220-1969-JP.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SEN_850200_C
/usr/bin/install -c -m 644 charmaps/JIS_C6220-1969-JP /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/charmaps/JIS_C6220-1969-JP
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/TIS-620 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/TIS-620.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/WINDOWS-31J /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/WINDOWS-31J.gz
/usr/bin/install -c -m 644 charmaps/TIS-620 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/TIS-620
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6220-1969-JP
/usr/bin/install -c -m 644 charmaps/WINDOWS-31J /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/WINDOWS-31J
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/TIS-620
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NS_4551-1 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/NS_4551-1.gz
/usr/bin/install -c -m 644 charmaps/NS_4551-1 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/NS_4551-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/WINDOWS-31J
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/T.61-8BIT /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/T.61-8BIT.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NS_4551-1
/usr/bin/install -c -m 644 charmaps/T.61-8BIT /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/T.61-8BIT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/LATIN-GREEK-1 /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/LATIN-GREEK-1.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/T.61-8BIT
/usr/bin/install -c -m 644 charmaps/LATIN-GREEK-1 /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/LATIN-GREEK-1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/LATIN-GREEK /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/LATIN-GREEK.gz
/usr/bin/install -c -m 644 charmaps/LATIN-GREEK /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/LATIN-GREEK
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/LATIN-GREEK-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/LATIN-GREEK
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-DANO-ADD /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/NATS-DANO-ADD.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-SEFI /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/NATS-SEFI.gz
/usr/bin/install -c -m 644 charmaps/NATS-DANO-ADD /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/NATS-DANO-ADD
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NF_Z_62-010 /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/share/i18n/charmaps/NF_Z_62-010.gz
/usr/bin/install -c -m 644 charmaps/NF_Z_62-010 /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/charmaps/NF_Z_62-010
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-DANO-ADD
/usr/bin/install -c -m 644 charmaps/NATS-SEFI /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/NATS-SEFI
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NF_Z_62-010
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/T.101-G2 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/T.101-G2.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-SEFI
/usr/bin/install -c -m 644 charmaps/T.101-G2 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/T.101-G2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SAMI-WS2 /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/SAMI-WS2.gz
/usr/bin/install -c -m 644 charmaps/SAMI-WS2 /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/SAMI-WS2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/PT2 /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/share/i18n/charmaps/PT2.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/T.101-G2
/usr/bin/install -c -m 644 charmaps/PT2 /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/charmaps/PT2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SAMI-WS2
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/PT2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SHIFT_JISX0213 /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/SHIFT_JISX0213.gz
/usr/bin/install -c -m 644 charmaps/SHIFT_JISX0213 /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/SHIFT_JISX0213
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/TSCII /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/TSCII.gz
/usr/bin/install -c -m 644 charmaps/TSCII /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/TSCII
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI-8 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/KOI-8.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SHIFT_JISX0213
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/TSCII
/usr/bin/install -c -m 644 charmaps/KOI-8 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/KOI-8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI-8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAND /=
mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2=
.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAND.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/TCVN5712-1 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/TCVN5712-1.gz
/usr/bin/install -c -m 644 charmaps/JIS_C6229-1984-HAND /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/share/i18n/charmaps/JIS_C6229-1984-HAND
/usr/bin/install -c -m 644 charmaps/TCVN5712-1 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/TCVN5712-1
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-HAN=
D
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/TCVN5712-1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SEN_850200_B /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/share/i18n/charmaps/SEN_850200_B.gz
/usr/bin/install -c -m 644 charmaps/SEN_850200_B /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/charmaps/SEN_850200_B
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-R /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/KOI8-R.gz
/usr/bin/install -c -m 644 charmaps/KOI8-R /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/KOI8-R
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SEN_850200_B
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-R
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-B /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-B.gz
/usr/bin/install -c -m 644 charmaps/JIS_C6229-1984-B /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/charmaps/JIS_C6229-1984-B
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.003-SERB /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.003-SERB.gz
/usr/bin/install -c -m 644 charmaps/JUS_I.B1.003-SERB /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/charmaps/JUS_I.B1.003-SERB
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-B
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/PT /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/share/i18n/charmaps/PT.gz
/usr/bin/install -c -m 644 charmaps/PT /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i1=
8n/charmaps/PT
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/PT
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JUS_I.B1.003-SERB
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6220-1969-RO /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6220-1969-RO.gz
/usr/bin/install -c -m 644 charmaps/JIS_C6220-1969-RO /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/charmaps/JIS_C6220-1969-RO
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/PT154 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/PT154.gz
/usr/bin/install -c -m 644 charmaps/PT154 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/PT154
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6220-1969-RO
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/PT154
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MIK /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/share/i18n/charmaps/MIK.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/RK1048 /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/RK1048.gz
/usr/bin/install -c -m 644 charmaps/MIK /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/charmaps/MIK
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-SAMI /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/MAC-SAMI.gz
/usr/bin/install -c -m 644 charmaps/RK1048 /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/RK1048
/usr/bin/install -c -m 644 charmaps/MAC-SAMI /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/MAC-SAMI
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/RK1048
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MIK
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-SAMI
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/T.61-7BIT /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/T.61-7BIT.gz
/usr/bin/install -c -m 644 charmaps/T.61-7BIT /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/T.61-7BIT
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-IS /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/MAC-IS.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SHIFT_JIS /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/SHIFT_JIS.gz
/usr/bin/install -c -m 644 charmaps/MAC-IS /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/MAC-IS
/usr/bin/install -c -m 644 charmaps/SHIFT_JIS /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/SHIFT_JIS
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/T.61-7BIT
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-IS
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/VIDEOTEX-SUPPL /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/share/i18n/charmaps/VIDEOTEX-SUPPL.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/SHIFT_JIS
/usr/bin/install -c -m 644 charmaps/VIDEOTEX-SUPPL /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/charmaps/VIDEOTEX-SUPPL
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KSC5636 /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/share/i18n/charmaps/KSC5636.gz
/usr/bin/install -c -m 644 charmaps/KSC5636 /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sha=
re/i18n/charmaps/KSC5636
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/VIDEOTEX-SUPPL
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KSC5636
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/UTF-8 /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/UTF-8.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MSZ_7795.3 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/MSZ_7795.3.gz
/usr/bin/install -c -m 644 charmaps/UTF-8 /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/UTF-8
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NEXTSTEP /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/share/i18n/charmaps/NEXTSTEP.gz
/usr/bin/install -c -m 644 charmaps/NEXTSTEP /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/sh=
are/i18n/charmaps/NEXTSTEP
/usr/bin/install -c -m 644 charmaps/MSZ_7795.3 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/MSZ_7795.3
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/UTF-8
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NEXTSTEP
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MSZ_7795.3
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-T /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/KOI8-T.gz
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_X0201 /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/share/i18n/charmaps/JIS_X0201.gz
/usr/bin/install -c -m 644 charmaps/KOI8-T /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/KOI8-T
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/KOI8-T
/usr/bin/install -c -m 644 charmaps/JIS_X0201 /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/charmaps/JIS_X0201
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-UK /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/share/i18n/charmaps/MAC-UK.gz
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_X0201
/usr/bin/install -c -m 644 charmaps/MAC-UK /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/shar=
e/i18n/charmaps/MAC-UK
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/MAC-UK
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JOHAB /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/share/i18n/charmaps/JOHAB.gz
/usr/bin/install -c -m 644 charmaps/JOHAB /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/charmaps/JOHAB
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-B-ADD =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-B-ADD.gz
/usr/bin/install -c -m 644 charmaps/JIS_C6229-1984-B-ADD /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/share/i18n/charmaps/JIS_C6229-1984-B-ADD
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JOHAB
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-B-A=
DD
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-A /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-A.gz
/usr/bin/install -c -m 644 charmaps/JIS_C6229-1984-A /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/charmaps/JIS_C6229-1984-A
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/JIS_C6229-1984-A
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NC_NC00-10 /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/share/i18n/charmaps/NC_NC00-10.gz
/usr/bin/install -c -m 644 charmaps/NC_NC00-10 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/charmaps/NC_NC00-10
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NC_NC00-10
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-SEFI-ADD /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/share/i18n/charmaps/NATS-SEFI-ADD.gz
/usr/bin/install -c -m 644 charmaps/NATS-SEFI-ADD /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/charmaps/NATS-SEFI-ADD
gzip -9n /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/charmaps/NATS-SEFI-ADD
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/locales
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/i18n/locales
/usr/bin/install -c -m 644 locales/es_CL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_CL
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i18n/locales
/usr/bin/install -c -m 644 locales/ml_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ml_IN
/usr/bin/install -c -m 644 locales/en_ZW /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_ZW
/usr/bin/install -c -m 644 locales/iso14651_t1 /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/locales/iso14651_t1
/usr/bin/install -c -m 644 locales/es_PA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_PA
/usr/bin/install -c -m 644 locales/ar_IQ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_IQ
/usr/bin/install -c -m 644 locales/es_ES@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/es_ES@euro
/usr/bin/install -c -m 644 locales/ku_TR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ku_TR
/usr/bin/install -c -m 644 locales/ca_FR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ca_FR
/usr/bin/install -c -m 644 locales/ar_MA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_MA
/usr/bin/install -c -m 644 locales/kw_GB /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/kw_GB
/usr/bin/install -c -m 644 locales/sv_SE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sv_SE
/usr/bin/install -c -m 644 locales/yo_NG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/yo_NG
/usr/bin/install -c -m 644 locales/an_ES /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/an_ES
/usr/bin/install -c -m 644 locales/en_NZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_NZ
/usr/bin/install -c -m 644 locales/tt_RU@iqtelif /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/locales/tt_RU@iqtelif
/usr/bin/install -c -m 644 locales/crh_UA /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/crh_UA
/usr/bin/install -c -m 644 locales/lv_LV /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/lv_LV
/usr/bin/install -c -m 644 locales/de_LU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/de_LU
/usr/bin/install -c -m 644 locales/ht_HT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ht_HT
/usr/bin/install -c -m 644 locales/ru_RU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ru_RU
/usr/bin/install -c -m 644 locales/si_LK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/si_LK
/usr/bin/install -c -m 644 locales/nn_NO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/nn_NO
/usr/bin/install -c -m 644 locales/bo_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/bo_IN
/usr/bin/install -c -m 644 locales/en_ZM /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_ZM
/usr/bin/install -c -m 644 locales/nl_NL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/nl_NL
/usr/bin/install -c -m 644 locales/mk_MK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/mk_MK
/usr/bin/install -c -m 644 locales/de_BE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/de_BE@euro
/usr/bin/install -c -m 644 locales/en_IE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/en_IE@euro
/usr/bin/install -c -m 644 locales/zh_TW /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/zh_TW
/usr/bin/install -c -m 644 locales/ik_CA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ik_CA
/usr/bin/install -c -m 644 locales/fa_IR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fa_IR
/usr/bin/install -c -m 644 locales/sd_IN@devanagari /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/share/i18n/locales/sd_IN@devanagari
/usr/bin/install -c -m 644 locales/i18n /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/i=
18n/locales/i18n
/usr/bin/install -c -m 644 locales/tk_TM /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tk_TM
/usr/bin/install -c -m 644 locales/en_DK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_DK
/usr/bin/install -c -m 644 locales/tg_TJ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tg_TJ
/usr/bin/install -c -m 644 locales/th_TH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/th_TH
/usr/bin/install -c -m 644 locales/yue_HK /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/yue_HK
/usr/bin/install -c -m 644 locales/zu_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/zu_ZA
/usr/bin/install -c -m 644 locales/ga_IE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ga_IE
/usr/bin/install -c -m 644 locales/sr_RS /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sr_RS
/usr/bin/install -c -m 644 locales/se_NO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/se_NO
/usr/bin/install -c -m 644 locales/gez_ER /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/gez_ER
/usr/bin/install -c -m 644 locales/st_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/st_ZA
/usr/bin/install -c -m 644 locales/ur_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ur_IN
/usr/bin/install -c -m 644 locales/ber_DZ /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/ber_DZ
/usr/bin/install -c -m 644 locales/de_DE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/de_DE@euro
/usr/bin/install -c -m 644 locales/ha_NG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ha_NG
/usr/bin/install -c -m 644 locales/be_BY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/be_BY
/usr/bin/install -c -m 644 locales/el_GR@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/el_GR@euro
/usr/bin/install -c -m 644 locales/hr_HR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/hr_HR
/usr/bin/install -c -m 644 locales/translit_compat /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/locales/translit_compat
/usr/bin/install -c -m 644 locales/fo_FO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fo_FO
/usr/bin/install -c -m 644 locales/hne_IN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/hne_IN
/usr/bin/install -c -m 644 locales/dv_MV /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/dv_MV
/usr/bin/install -c -m 644 locales/or_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/or_IN
/usr/bin/install -c -m 644 locales/fi_FI /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fi_FI
/usr/bin/install -c -m 644 locales/aa_ER /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/aa_ER
/usr/bin/install -c -m 644 locales/nb_NO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/nb_NO
/usr/bin/install -c -m 644 locales/ca_ES@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/ca_ES@euro
/usr/bin/install -c -m 644 locales/es_US /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_US
/usr/bin/install -c -m 644 locales/mr_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/mr_IN
/usr/bin/install -c -m 644 locales/li_BE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/li_BE
/usr/bin/install -c -m 644 locales/ar_QA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_QA
/usr/bin/install -c -m 644 locales/km_KH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/km_KH
/usr/bin/install -c -m 644 locales/so_SO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/so_SO
/usr/bin/install -c -m 644 locales/ti_ER /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ti_ER
/usr/bin/install -c -m 644 locales/tt_RU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tt_RU
/usr/bin/install -c -m 644 locales/sk_SK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sk_SK
/usr/bin/install -c -m 644 locales/so_KE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/so_KE
/usr/bin/install -c -m 644 locales/sl_SI /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sl_SI
/usr/bin/install -c -m 644 locales/gl_ES@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/gl_ES@euro
/usr/bin/install -c -m 644 locales/eu_ES@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/eu_ES@euro
/usr/bin/install -c -m 644 locales/es_AR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_AR
/usr/bin/install -c -m 644 locales/de_LU@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/de_LU@euro
/usr/bin/install -c -m 644 locales/sc_IT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sc_IT
/usr/bin/install -c -m 644 locales/ta_LK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ta_LK
/usr/bin/install -c -m 644 locales/de_DE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/de_DE
/usr/bin/install -c -m 644 locales/sa_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sa_IN
/usr/bin/install -c -m 644 locales/en_AU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_AU
/usr/bin/install -c -m 644 locales/sq_MK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sq_MK
/usr/bin/install -c -m 644 locales/nl_NL@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/nl_NL@euro
/usr/bin/install -c -m 644 locales/pa_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/pa_IN
/usr/bin/install -c -m 644 locales/br_FR@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/br_FR@euro
/usr/bin/install -c -m 644 locales/yi_US /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/yi_US
/usr/bin/install -c -m 644 locales/gl_ES /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/gl_ES
/usr/bin/install -c -m 644 locales/sw_KE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sw_KE
/usr/bin/install -c -m 644 locales/ca_ES /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ca_ES
/usr/bin/install -c -m 644 locales/aa_ER@saaho /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/locales/aa_ER@saaho
/usr/bin/install -c -m 644 locales/mt_MT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/mt_MT
/usr/bin/install -c -m 644 locales/lg_UG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/lg_UG
/usr/bin/install -c -m 644 locales/bn_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/bn_IN
/usr/bin/install -c -m 644 locales/es_PR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_PR
/usr/bin/install -c -m 644 locales/az_AZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/az_AZ
/usr/bin/install -c -m 644 locales/ga_IE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/ga_IE@euro
/usr/bin/install -c -m 644 locales/et_EE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/et_EE
/usr/bin/install -c -m 644 locales/sid_ET /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/sid_ET
/usr/bin/install -c -m 644 locales/gez_ET@abegede /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/locales/gez_ET@abegede
/usr/bin/install -c -m 644 locales/aa_ET /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/aa_ET
/usr/bin/install -c -m 644 locales/hy_AM /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/hy_AM
/usr/bin/install -c -m 644 locales/mn_MN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/mn_MN
/usr/bin/install -c -m 644 locales/vi_VN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/vi_VN
/usr/bin/install -c -m 644 locales/en_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_ZA
/usr/bin/install -c -m 644 locales/mai_IN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/mai_IN
/usr/bin/install -c -m 644 locales/iso14651_t1_pinyin /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/locales/iso14651_t1_pinyin
/usr/bin/install -c -m 644 locales/da_DK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/da_DK
/usr/bin/install -c -m 644 locales/uz_UZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/uz_UZ
/usr/bin/install -c -m 644 locales/gez_ER@abegede /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/locales/gez_ER@abegede
/usr/bin/install -c -m 644 locales/ne_NP /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ne_NP
/usr/bin/install -c -m 644 locales/aa_DJ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/aa_DJ
/usr/bin/install -c -m 644 locales/eu_ES /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/eu_ES
/usr/bin/install -c -m 644 locales/fil_PH /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/fil_PH
/usr/bin/install -c -m 644 locales/ar_LB /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_LB
/usr/bin/install -c -m 644 locales/tn_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tn_ZA
/usr/bin/install -c -m 644 locales/es_BO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_BO
/usr/bin/install -c -m 644 locales/translit_small /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/locales/translit_small
/usr/bin/install -c -m 644 locales/wa_BE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/wa_BE
/usr/bin/install -c -m 644 locales/el_GR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/el_GR
/usr/bin/install -c -m 644 locales/fi_FI@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/fi_FI@euro
/usr/bin/install -c -m 644 locales/hi_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/hi_IN
/usr/bin/install -c -m 644 locales/ar_YE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_YE
/usr/bin/install -c -m 644 locales/af_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/af_ZA
/usr/bin/install -c -m 644 locales/lij_IT /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/lij_IT
/usr/bin/install -c -m 644 locales/translit_wide /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/locales/translit_wide
/usr/bin/install -c -m 644 locales/nl_BE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/nl_BE
/usr/bin/install -c -m 644 locales/iu_CA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/iu_CA
/usr/bin/install -c -m 644 locales/cy_GB /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/cy_GB
/usr/bin/install -c -m 644 locales/en_US /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_US
/usr/bin/install -c -m 644 locales/pap_AN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/pap_AN
/usr/bin/install -c -m 644 locales/lo_LA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/lo_LA
/usr/bin/install -c -m 644 locales/translit_hangul /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/locales/translit_hangul
/usr/bin/install -c -m 644 locales/li_NL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/li_NL
/usr/bin/install -c -m 644 locales/es_CU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_CU
/usr/bin/install -c -m 644 locales/translit_narrow /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/locales/translit_narrow
/usr/bin/install -c -m 644 locales/fr_LU@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/fr_LU@euro
/usr/bin/install -c -m 644 locales/cv_RU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/cv_RU
/usr/bin/install -c -m 644 locales/it_CH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/it_CH
/usr/bin/install -c -m 644 locales/te_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/te_IN
/usr/bin/install -c -m 644 locales/iw_IL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/iw_IL
/usr/bin/install -c -m 644 locales/uk_UA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/uk_UA
/usr/bin/install -c -m 644 locales/sv_FI /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sv_FI
/usr/bin/install -c -m 644 locales/translit_combining /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/locales/translit_combining
/usr/bin/install -c -m 644 locales/ff_SN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ff_SN
/usr/bin/install -c -m 644 locales/translit_circle /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/share/i18n/locales/translit_circle
/usr/bin/install -c -m 644 locales/ps_AF /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ps_AF
/usr/bin/install -c -m 644 locales/fr_FR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fr_FR
/usr/bin/install -c -m 644 locales/de_CH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/de_CH
/usr/bin/install -c -m 644 locales/zh_SG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/zh_SG
/usr/bin/install -c -m 644 locales/fy_NL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fy_NL
/usr/bin/install -c -m 644 locales/kl_GL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/kl_GL
/usr/bin/install -c -m 644 locales/fy_DE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fy_DE
/usr/bin/install -c -m 644 locales/nds_DE /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/nds_DE
/usr/bin/install -c -m 644 locales/pt_PT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/pt_PT
/usr/bin/install -c -m 644 locales/br_FR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/br_FR
/usr/bin/install -c -m 644 locales/mhr_RU /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/mhr_RU
/usr/bin/install -c -m 644 locales/zh_HK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/zh_HK
/usr/bin/install -c -m 644 locales/ber_MA /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/ber_MA
/usr/bin/install -c -m 644 locales/ar_KW /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_KW
/usr/bin/install -c -m 644 locales/nr_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/nr_ZA
/usr/bin/install -c -m 644 locales/pl_PL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/pl_PL
/usr/bin/install -c -m 644 locales/tl_PH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tl_PH
/usr/bin/install -c -m 644 locales/oc_FR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/oc_FR
/usr/bin/install -c -m 644 locales/gv_GB /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/gv_GB
/usr/bin/install -c -m 644 locales/translit_fraction /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/share/i18n/locales/translit_fraction
/usr/bin/install -c -m 644 locales/om_KE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/om_KE
/usr/bin/install -c -m 644 locales/my_MM /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/my_MM
/usr/bin/install -c -m 644 locales/ru_UA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ru_UA
/usr/bin/install -c -m 644 locales/ts_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ts_ZA
/usr/bin/install -c -m 644 locales/ast_ES /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/ast_ES
/usr/bin/install -c -m 644 locales/byn_ER /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/byn_ER
/usr/bin/install -c -m 644 locales/sv_FI@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/sv_FI@euro
/usr/bin/install -c -m 644 locales/en_NG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_NG
/usr/bin/install -c -m 644 locales/ss_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ss_ZA
/usr/bin/install -c -m 644 locales/gu_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/gu_IN
/usr/bin/install -c -m 644 locales/de_AT@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/de_AT@euro
/usr/bin/install -c -m 644 locales/om_ET /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/om_ET
/usr/bin/install -c -m 644 locales/hsb_DE /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/hsb_DE
/usr/bin/install -c -m 644 locales/it_IT@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/it_IT@euro
/usr/bin/install -c -m 644 locales/es_MX /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_MX
/usr/bin/install -c -m 644 locales/ur_PK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ur_PK
/usr/bin/install -c -m 644 locales/es_CR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_CR
/usr/bin/install -c -m 644 locales/fr_BE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/fr_BE@euro
/usr/bin/install -c -m 644 locales/nan_TW@latin /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/share/i18n/locales/nan_TW@latin
/usr/bin/install -c -m 644 locales/es_UY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_UY
/usr/bin/install -c -m 644 locales/es_HN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_HN
/usr/bin/install -c -m 644 locales/sq_AL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sq_AL
/usr/bin/install -c -m 644 locales/ks_IN@devanagari /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/share/i18n/locales/ks_IN@devanagari
/usr/bin/install -c -m 644 locales/rw_RW /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/rw_RW
/usr/bin/install -c -m 644 locales/ti_ET /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ti_ET
/usr/bin/install -c -m 644 locales/es_CO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_CO
/usr/bin/install -c -m 644 locales/nl_BE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/nl_BE@euro
/usr/bin/install -c -m 644 locales/ar_BH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_BH
/usr/bin/install -c -m 644 locales/en_GB /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_GB
/usr/bin/install -c -m 644 locales/sd_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sd_IN
/usr/bin/install -c -m 644 locales/lb_LU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/lb_LU
/usr/bin/install -c -m 644 locales/ar_AE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_AE
/usr/bin/install -c -m 644 locales/dz_BT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/dz_BT
/usr/bin/install -c -m 644 locales/fr_CH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fr_CH
/usr/bin/install -c -m 644 locales/ar_SD /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_SD
/usr/bin/install -c -m 644 locales/mg_MG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/mg_MG
/usr/bin/install -c -m 644 locales/es_SV /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_SV
/usr/bin/install -c -m 644 locales/gd_GB /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/gd_GB
/usr/bin/install -c -m 644 locales/ta_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ta_IN
/usr/bin/install -c -m 644 locales/nso_ZA /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/nso_ZA
/usr/bin/install -c -m 644 locales/en_BW /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_BW
/usr/bin/install -c -m 644 locales/shs_CA /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/shs_CA
/usr/bin/install -c -m 644 locales/is_IS /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/is_IS
/usr/bin/install -c -m 644 locales/ug_CN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ug_CN
/usr/bin/install -c -m 644 locales/es_PY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_PY
/usr/bin/install -c -m 644 locales/en_PH /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_PH
/usr/bin/install -c -m 644 locales/ar_LY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_LY
/usr/bin/install -c -m 644 locales/ky_KG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ky_KG
/usr/bin/install -c -m 644 locales/en_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_IN
/usr/bin/install -c -m 644 locales/ca_AD /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ca_AD
/usr/bin/install -c -m 644 locales/brx_IN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/brx_IN
/usr/bin/install -c -m 644 locales/ig_NG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ig_NG
/usr/bin/install -c -m 644 locales/lt_LT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/lt_LT
/usr/bin/install -c -m 644 locales/ar_JO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_JO
/usr/bin/install -c -m 644 locales/wa_BE@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/wa_BE@euro
/usr/bin/install -c -m 644 locales/ar_OM /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_OM
/usr/bin/install -c -m 644 locales/POSIX /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/POSIX
/usr/bin/install -c -m 644 locales/ar_DZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_DZ
/usr/bin/install -c -m 644 locales/bo_CN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/bo_CN
/usr/bin/install -c -m 644 locales/es_PE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_PE
/usr/bin/install -c -m 644 locales/ro_RO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ro_RO
/usr/bin/install -c -m 644 locales/sw_TZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sw_TZ
/usr/bin/install -c -m 644 locales/uz_UZ@cyrillic /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/share/i18n/locales/uz_UZ@cyrillic
/usr/bin/install -c -m 644 locales/translit_font /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/share/i18n/locales/translit_font
/usr/bin/install -c -m 644 locales/zh_CN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/zh_CN
/usr/bin/install -c -m 644 locales/tig_ER /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/tig_ER
/usr/bin/install -c -m 644 locales/translit_cjk_compat /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/share/i18n/locales/translit_cjk_compat
/usr/bin/install -c -m 644 locales/bg_BG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/bg_BG
/usr/bin/install -c -m 644 locales/ar_TN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_TN
/usr/bin/install -c -m 644 locales/ms_MY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ms_MY
/usr/bin/install -c -m 644 locales/en_CA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_CA
/usr/bin/install -c -m 644 locales/en_SG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_SG
/usr/bin/install -c -m 644 locales/tr_CY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tr_CY
/usr/bin/install -c -m 644 locales/kk_KZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/kk_KZ
/usr/bin/install -c -m 644 locales/ve_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ve_ZA
/usr/bin/install -c -m 644 locales/mi_NZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/mi_NZ
/usr/bin/install -c -m 644 locales/sr_ME /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/sr_ME
/usr/bin/install -c -m 644 locales/xh_ZA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/xh_ZA
/usr/bin/install -c -m 644 locales/pt_BR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/pt_BR
/usr/bin/install -c -m 644 locales/ar_EG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_EG
/usr/bin/install -c -m 644 locales/ca_IT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ca_IT
/usr/bin/install -c -m 644 locales/am_ET /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/am_ET
/usr/bin/install -c -m 644 locales/mag_IN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/mag_IN
/usr/bin/install -c -m 644 locales/ks_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ks_IN
/usr/bin/install -c -m 644 locales/fr_FR@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/fr_FR@euro
/usr/bin/install -c -m 644 locales/ar_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_IN
/usr/bin/install -c -m 644 locales/de_AT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/de_AT
/usr/bin/install -c -m 644 locales/translit_cjk_variants /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/share/i18n/locales/translit_cjk_variants
/usr/bin/install -c -m 644 locales/el_CY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/el_CY
/usr/bin/install -c -m 644 locales/iso14651_t1_common /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/share/i18n/locales/iso14651_t1_common
/usr/bin/install -c -m 644 locales/kok_IN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/kok_IN
/usr/bin/install -c -m 644 locales/fr_BE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fr_BE
/usr/bin/install -c -m 644 locales/pt_PT@euro /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/s=
hare/i18n/locales/pt_PT@euro
/usr/bin/install -c -m 644 locales/nl_AW /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/nl_AW
/usr/bin/install -c -m 644 locales/nds_NL /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/nds_NL
/usr/bin/install -c -m 644 locales/unm_US /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/unm_US
/usr/bin/install -c -m 644 locales/csb_PL /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/csb_PL
/usr/bin/install -c -m 644 locales/so_ET /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/so_ET
/usr/bin/install -c -m 644 locales/pa_PK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/pa_PK
/usr/bin/install -c -m 644 locales/os_RU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/os_RU
/usr/bin/install -c -m 644 locales/bn_BD /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/bn_BD
/usr/bin/install -c -m 644 locales/en_AG /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_AG
/usr/bin/install -c -m 644 locales/translit_neutral /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/share/i18n/locales/translit_neutral
/usr/bin/install -c -m 644 locales/es_ES /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_ES
/usr/bin/install -c -m 644 locales/de_BE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/de_BE
/usr/bin/install -c -m 644 locales/sr_RS@latin /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/locales/sr_RS@latin
/usr/bin/install -c -m 644 locales/ko_KR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ko_KR
/usr/bin/install -c -m 644 locales/bho_IN /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/bho_IN
/usr/bin/install -c -m 644 locales/ka_GE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ka_GE
/usr/bin/install -c -m 644 locales/fur_IT /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/fur_IT
/usr/bin/install -c -m 644 locales/it_IT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/it_IT
/usr/bin/install -c -m 644 locales/es_EC /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_EC
/usr/bin/install -c -m 644 locales/wal_ET /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/wal_ET
/usr/bin/install -c -m 644 locales/es_NI /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_NI
/usr/bin/install -c -m 644 locales/ja_JP /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ja_JP
/usr/bin/install -c -m 644 locales/fr_LU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fr_LU
/usr/bin/install -c -m 644 locales/es_GT /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_GT
/usr/bin/install -c -m 644 locales/be_BY@latin /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
share/i18n/locales/be_BY@latin
/usr/bin/install -c -m 644 locales/es_DO /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_DO
/usr/bin/install -c -m 644 locales/so_DJ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/so_DJ
/usr/bin/install -c -m 644 locales/en_IE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_IE
/usr/bin/install -c -m 644 locales/id_ID /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/id_ID
/usr/bin/install -c -m 644 locales/ar_SA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_SA
/usr/bin/install -c -m 644 locales/tr_TR /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/tr_TR
/usr/bin/install -c -m 644 locales/cs_CZ /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/cs_CZ
/usr/bin/install -c -m 644 locales/bem_ZM /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/bem_ZM
/usr/bin/install -c -m 644 locales/gez_ET /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/gez_ET
/usr/bin/install -c -m 644 locales/kn_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/kn_IN
/usr/bin/install -c -m 644 locales/es_VE /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/es_VE
/usr/bin/install -c -m 644 locales/fr_CA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/fr_CA
/usr/bin/install -c -m 644 locales/as_IN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/as_IN
/usr/bin/install -c -m 644 locales/hu_HU /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/hu_HU
/usr/bin/install -c -m 644 locales/wo_SN /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/wo_SN
/usr/bin/install -c -m 644 locales/bs_BA /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/bs_BA
/usr/bin/install -c -m 644 locales/ar_SY /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/ar_SY
/usr/bin/install -c -m 644 locales/wae_CH /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share=
/i18n/locales/wae_CH
/usr/bin/install -c -m 644 locales/he_IL /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/he_IL
/usr/bin/install -c -m 644 locales/en_HK /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/=
i18n/locales/en_HK
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/localedata'
make -j3 subdir=3Diconvdata -C iconvdata ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconvdata'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-3.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-3.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-2.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-2.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-1.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-1.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-2.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-2.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-1.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-1.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-3.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-3.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-4.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-4.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-5.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-5.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-4.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-4.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-6.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-6.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-5.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-5.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-7.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-7.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-6.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-6.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-8.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-7.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-7.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-9.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-9.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-8.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-8.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-10.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-10.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-9.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ISO8859-9.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-11.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-11.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-10.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-10.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-13.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-13.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-11.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-11.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-13.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-13.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-14.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-14.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-15.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-15.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-14.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-14.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-15.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-15.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/T.61.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/T.61.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-16.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-16.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_6937.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_6937.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/T.61.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/gconv/T.61.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/SJIS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/SJIS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_6937.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/ISO_6937.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/KOI-8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI-8.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/SJIS.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/gconv/SJIS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/HP-ROMAN8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-ROMAN8.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI-8.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/KOI-8.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-ROMAN8.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/HP-ROMAN8.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/HP-ROMAN9.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-ROMAN9.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-AT-DE.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-AT-DE.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-AT-DE-A.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-AT-DE-A.so=
.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-ROMAN9.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/HP-ROMAN9.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-CA-FR.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-CA-FR.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-AT-DE.so.new /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/lib/gconv/EBCDIC-AT-DE.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-CA-FR.so.new /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/lib/gconv/EBCDIC-CA-FR.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-AT-DE-A.so.new /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/lib/gconv/EBCDIC-AT-DE-A.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EUC-KR.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-KR.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/UHC.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/UHC.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-KR.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/EUC-KR.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/JOHAB.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/JOHAB.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/UHC.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/gconv/UHC.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/JOHAB.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/JOHAB.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/libJIS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/libJIS.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/libKSC.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/libKSC.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/libJIS.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/libJIS.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/libKSC.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/libKSC.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/BIG5.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/BIG5.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EUC-JP.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-JP.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/libGB.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/libGB.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/BIG5.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/gconv/BIG5.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-JP.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/EUC-JP.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/libGB.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/libGB.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EUC-CN.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-CN.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/libCNS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/libCNS.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EUC-TW.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-TW.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-CN.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/EUC-CN.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO646.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO646.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-TW.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/EUC-TW.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-DK-NO.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-DK-NO.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/libCNS.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/libCNS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-DK-NO-A.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-DK-NO-A.so=
.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-DK-NO.so.new /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/lib/gconv/EBCDIC-DK-NO.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO646.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/ISO646.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-ES.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-ES.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-ES-A.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-ES-A.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-ES.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EBCDIC-ES.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-DK-NO-A.so.new /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/lib/gconv/EBCDIC-DK-NO-A.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-ES-A.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/EBCDIC-ES-A.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-ES-S.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-ES-S.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-FI-SE.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-FI-SE.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-ES-S.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/EBCDIC-ES-S.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-FI-SE-A.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-FI-SE-A.so=
.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-FI-SE.so.new /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/lib/gconv/EBCDIC-FI-SE.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-FR.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-FR.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-IS-FRISS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-IS-FRISS.=
so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-FI-SE-A.so.new /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/lib/gconv/EBCDIC-FI-SE-A.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-FR.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EBCDIC-FR.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-IS-FRISS.so.new /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/lib/gconv/EBCDIC-IS-FRISS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-IT.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-IT.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-PT.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-PT.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-IT.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EBCDIC-IT.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-UK.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-UK.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-PT.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EBCDIC-PT.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EBCDIC-US.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-US.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-UK.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EBCDIC-UK.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM037.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM037.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EBCDIC-US.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EBCDIC-US.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM038.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM038.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM037.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM037.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM274.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM274.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM038.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM038.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM275.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM275.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM274.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM274.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM275.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM275.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM423.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM423.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM500.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM500.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM423.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM423.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM500.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM500.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM870.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM870.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM871.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM871.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM870.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM870.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM871.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM871.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM891.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM891.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM903.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM903.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM891.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM891.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM904.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM904.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM903.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM903.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM905.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM905.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM904.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM904.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1047.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1047.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM905.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM905.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1047.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1047.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM874.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM874.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP737.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP737.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM874.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM874.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP737.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP737.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP775.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP775.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-2022-KR.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-KR.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP775.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP775.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-KR.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/ISO-2022-KR.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/HP-TURKISH8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-TURKISH8.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/HP-THAI8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-THAI8.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-TURKISH8.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/HP-TURKISH8.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-THAI8.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/HP-THAI8.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/HP-GREEK8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-GREEK8.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/KOI8-R.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-R.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/HP-GREEK8.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/HP-GREEK8.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-R.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/KOI8-R.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/LATIN-GREEK.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/LATIN-GREEK.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/LATIN-GREEK-1.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/LATIN-GREEK-1.so.n=
ew
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/LATIN-GREEK.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/LATIN-GREEK.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM256.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM256.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/LATIN-GREEK-1.so.new /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/lib/gconv/LATIN-GREEK-1.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM273.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM273.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM256.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM256.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM277.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM277.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM273.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM273.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM278.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM278.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM277.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM277.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM280.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM280.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM278.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM278.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM281.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM281.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM280.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM280.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM284.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM284.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM281.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM281.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM285.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM285.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM284.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM284.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM290.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM290.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM285.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM285.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM297.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM297.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM290.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM290.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM297.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM297.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM420.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM420.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM424.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM424.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM420.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM420.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM437.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM437.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM424.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM424.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM850.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM850.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM437.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM437.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM851.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM851.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM850.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM850.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM852.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM852.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM851.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM851.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM855.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM855.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM852.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM852.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM857.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM857.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM855.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM855.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM860.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM860.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM857.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM857.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM861.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM861.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM860.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM860.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM861.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM861.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM862.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM862.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM862.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM862.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM863.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM863.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM864.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM864.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM863.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM863.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM865.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM865.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM868.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM868.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM865.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM865.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM868.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM868.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM864.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM864.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM869.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM869.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM875.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM875.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM880.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM880.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM869.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM869.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM875.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM875.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM880.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM880.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM866.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM866.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1258.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1258.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM922.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM922.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM866.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM866.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1258.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1258.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM922.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM922.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1124.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1124.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1129.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1129.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM932.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM932.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1124.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1124.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1129.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1129.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM932.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM932.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM943.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM943.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM856.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM856.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM943.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM943.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM930.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM930.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM856.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM856.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM933.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM933.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM930.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM930.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM935.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM935.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM937.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM937.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM933.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM933.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM935.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM935.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM937.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM937.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM939.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM939.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1046.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1046.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1132.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1132.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM939.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM939.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1046.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1046.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1133.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1133.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1132.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1132.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1160.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1160.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1161.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1161.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1133.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1133.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1160.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1160.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1161.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1161.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1162.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1162.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1163.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1163.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1162.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1162.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1164.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1164.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1163.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1163.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM918.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM918.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1004.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1004.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM918.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM918.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1164.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1164.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1004.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1004.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1026.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1026.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1125.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1125.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1026.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1026.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1250.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1250.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1125.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1125.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1251.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1251.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1250.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1250.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1252.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1252.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1251.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1251.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1253.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1253.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1252.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1252.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1254.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1254.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1255.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1255.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1253.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1253.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1254.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1254.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1255.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1255.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1256.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1256.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP1257.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1257.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-2022-JP.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-JP.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1256.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1256.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP1257.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/CP1257.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-JP.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/ISO-2022-JP.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/MACINTOSH.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/MACINTOSH.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IEC_P27-1.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IEC_P27-1.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/MACINTOSH.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/MACINTOSH.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ASMO_449.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ASMO_449.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ANSI_X3.110.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ANSI_X3.110.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IEC_P27-1.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/IEC_P27-1.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ASMO_449.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/ASMO_449.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ANSI_X3.110.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/ANSI_X3.110.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CSN_369103.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CSN_369103.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CWI.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CWI.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CSN_369103.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/CSN_369103.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/DEC-MCS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/DEC-MCS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CWI.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/gconv/CWI.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ECMA-CYRILLIC.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ECMA-CYRILLIC.so.n=
ew
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/DEC-MCS.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/DEC-MCS.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ECMA-CYRILLIC.so.new /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/lib/gconv/ECMA-CYRILLIC.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GOST_19768-74.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GOST_19768-74.so.n=
ew
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GREEK-CCITT.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GREEK-CCITT.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GOST_19768-74.so.new /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/lib/gconv/GOST_19768-74.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GREEK7.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GREEK7.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GREEK-CCITT.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/GREEK-CCITT.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GREEK7-OLD.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GREEK7-OLD.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GREEK7.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/GREEK7.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/INIS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/INIS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GREEK7-OLD.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/GREEK7-OLD.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/INIS-8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/INIS-8.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/INIS.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/gconv/INIS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/INIS-CYRILLIC.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/INIS-CYRILLIC.so.n=
ew
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_6937-2.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_6937-2.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/INIS-CYRILLIC.so.new /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/lib/gconv/INIS-CYRILLIC.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/INIS-8.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/INIS-8.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_6937-2.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO_6937-2.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_2033.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_2033.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_5427.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_5427.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_2033.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/ISO_2033.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_5427-EXT.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_5427-EXT.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_5427.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/ISO_5427.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_5428.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_5428.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_5427-EXT.so.new /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/lib/gconv/ISO_5427-EXT.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_10367-BOX.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_10367-BOX.so.n=
ew
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_5428.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/ISO_5428.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/MAC-IS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-IS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_10367-BOX.so.new /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/lib/gconv/ISO_10367-BOX.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/MAC-UK.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-UK.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-IS.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/MAC-IS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/NATS-DANO.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/NATS-DANO.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/NATS-SEFI.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/NATS-SEFI.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-UK.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/MAC-UK.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/NATS-DANO.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/NATS-DANO.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/NATS-SEFI.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/NATS-SEFI.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/SAMI-WS2.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/SAMI-WS2.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/SAMI-WS2.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/SAMI-WS2.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-IR-197.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-IR-197.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/TIS-620.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/TIS-620.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-IR-197.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO-IR-197.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/KOI8-U.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-U.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/TIS-620.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/TIS-620.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GBK.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GBK.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISIRI-3342.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISIRI-3342.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-U.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/KOI8-U.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISIRI-3342.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISIRI-3342.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GBGBK.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GBGBK.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-2022-CN.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-CN.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GBGBK.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/GBGBK.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GBK.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/gconv/GBK.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-CN.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/ISO-2022-CN.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/libISOIR165.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/libISOIR165.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/UTF-16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/UTF-16.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/UNICODE.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/UNICODE.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/libISOIR165.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/libISOIR165.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/UTF-16.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/UTF-16.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/UNICODE.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/UNICODE.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/UTF-32.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/UTF-32.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/UTF-7.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/UTF-7.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/BIG5HKSCS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/BIG5HKSCS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/UTF-32.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/UTF-32.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/UTF-7.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/UTF-7.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/BIG5HKSCS.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/BIG5HKSCS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GB18030.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GB18030.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-2022-CN-EXT.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-CN-EXT.=
so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/VISCII.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/VISCII.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GB18030.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/GB18030.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-CN-EXT.so.new /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/lib/gconv/ISO-2022-CN-EXT.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/VISCII.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/VISCII.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GBBIG5.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GBBIG5.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP10007.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP10007.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GBBIG5.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/GBBIG5.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP10007.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/CP10007.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/KOI8-T.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-T.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GEORGIAN-PS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GEORGIAN-PS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-T.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/KOI8-T.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/GEORGIAN-ACADEMY.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/GEORGIAN-ACADEM=
Y.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GEORGIAN-PS.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/GEORGIAN-PS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-IR-209.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-IR-209.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/MAC-SAMI.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-SAMI.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/GEORGIAN-ACADEMY.so.new /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/lib/gconv/GEORGIAN-ACADEMY.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-IR-209.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO-IR-209.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-SAMI.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/MAC-SAMI.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ARMSCII-8.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ARMSCII-8.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/TCVN5712-1.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/TCVN5712-1.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/libJISX0213.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/libJISX0213.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ARMSCII-8.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/ARMSCII-8.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/TCVN5712-1.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/TCVN5712-1.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/libJISX0213.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/libJISX0213.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EUC-JISX0213.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-JISX0213.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/SHIFT_JISX0213.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/SHIFT_JISX0213.so=
.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO-2022-JP-3.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-JP-3.so.n=
ew
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-JISX0213.so.new /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/lib/gconv/EUC-JISX0213.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/SHIFT_JISX0213.so.new /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/lib/gconv/SHIFT_JISX0213.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO-2022-JP-3.so.new /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/lib/gconv/ISO-2022-JP-3.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/TSCII.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/TSCII.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM866NAV.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM866NAV.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/TSCII.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/TSCII.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM866NAV.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/IBM866NAV.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP932.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP932.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/EUC-JP-MS.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-JP-MS.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP932.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP932.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/PT154.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/PT154.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/EUC-JP-MS.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/lib/gconv/EUC-JP-MS.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/RK1048.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/RK1048.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/PT154.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/PT154.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1025.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1025.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/RK1048.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/RK1048.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1122.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1122.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1025.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1025.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1137.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1137.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1122.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1122.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1153.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1153.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1137.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1137.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1154.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1154.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1153.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1153.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1155.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1155.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1154.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1154.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1156.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1156.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1157.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1157.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1155.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1155.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1156.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1156.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1158.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1158.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1157.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1157.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM803.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM803.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1158.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1158.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM901.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM901.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM803.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM803.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM902.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM902.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM901.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM901.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM921.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM921.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1008.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1008.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM902.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM902.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1008_420.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1008_420.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM921.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/gconv/IBM921.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1008.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1008.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1008_420.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/IBM1008_420.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1097.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1097.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1097.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1097.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1112.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1112.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1123.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1123.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1130.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1130.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1112.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1112.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1123.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1123.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1140.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1140.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1130.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1130.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1141.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1141.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1140.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1140.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1141.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1141.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1142.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1142.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1143.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1143.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1144.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1144.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1142.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1142.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1143.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1143.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1144.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1144.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1145.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1145.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1146.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1146.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1147.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1147.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1145.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1145.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1147.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1147.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1146.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1146.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1148.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1148.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1149.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1149.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1148.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1148.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1166.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1166.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1149.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1149.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1167.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1167.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1166.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1166.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM4517.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4517.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1167.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1167.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM4899.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4899.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4517.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM4517.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM4909.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4909.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4899.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM4899.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM4971.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4971.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4909.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM4909.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM5347.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM5347.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM4971.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM4971.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM9030.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM9030.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM5347.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM5347.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM9066.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM9066.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM9448.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM9448.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM9030.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM9030.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM9066.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM9066.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM9448.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM9448.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM12712.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM12712.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM16804.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM16804.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1364.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1364.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM12712.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/IBM12712.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM16804.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/gconv/IBM16804.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1371.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1371.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1388.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1388.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1364.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1364.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1371.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1371.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1390.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1390.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/IBM1399.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1399.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1388.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1388.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO_11548-1.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_11548-1.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO_11548-1.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/gconv/ISO_11548-1.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/MIK.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/MIK.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1390.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1390.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/IBM1399.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/IBM1399.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/MIK.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/gconv/MIK.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/BRF.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/BRF.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/MAC-CENTRALEUROPE.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-pok=
y-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-CENTRALEUR=
OPE.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/KOI8-RU.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-RU.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/MAC-CENTRALEUROPE.so.new /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/lib/gconv/MAC-CENTRALEUROPE.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/ISO8859-9E.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-9E.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/BRF.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/gconv/BRF.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/ISO8859-9E.so.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/lib/gconv/ISO8859-9E.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/KOI8-RU.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/gconv/KOI8-RU.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP770.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP770.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP771.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP771.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP770.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP770.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP772.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP772.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP771.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP771.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP773.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP773.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP772.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP772.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdat=
a/CP774.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP774.so.new
/usr/bin/install -c -m 644 gconv-modules /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gc=
onv/gconv-modules
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP774.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP774.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/gconv/CP773.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/lib/gconv/CP773.so
if test -f "/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/gconv/gconv-modules.cache"; the=
n \
   LC_ALL=3DC LANGUAGE=3DC \
   /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egli=
bc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/ld.so --library-path =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/build-arm-poky-linux-gnueabi:/mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-=
poky-linux-gnueabi/math:/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf:=
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/dlfcn:/mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/buil=
d-arm-poky-linux-gnueabi/nss:/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi=
/nis:/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/rt:/mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/bu=
ild-arm-poky-linux-gnueabi/resolv:/mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gn=
ueabi/crypt:/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nptl \
   /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egli=
bc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/iconv/iconvconfig \
     --prefix=3D/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image; \
fi
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/iconvdata'
make -j3 subdir=3Dassert -C assert ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/assert'
/usr/bin/install -c -m 644 assert.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/ass=
ert.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/assert'
make -j3 subdir=3Dctype -C ctype ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/ctype'
/usr/bin/install -c -m 644 ctype.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/ctyp=
e.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/ctype'
make -j3 subdir=3Dintl -C intl ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/intl'
/usr/bin/install -c -m 644 libintl.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/li=
bintl.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale
/usr/bin/install -c -m 644 locale.alias /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/l=
ocale/locale.alias
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/intl'
make -j3 subdir=3Dcatgets -C catgets ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/catgets'
/usr/bin/install -c -m 644 nl_types.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/n=
l_types.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/catgets/=
gencat /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/=
eglibc-2.16-r4+svnr19383/image/usr/bin/gencat.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/gencat.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/gencat
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/catgets'
make -j3 subdir=3Dmath -C math ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/math'
/usr/bin/install -c -m 644 math.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/math.=
h
/usr/bin/install -c -m 644 bits/mathcalls.h /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inc=
lude/bits/mathcalls.h
/usr/bin/install -c -m 644 ../bits/mathinline.h /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/include/bits/mathinline.h
/usr/bin/install -c -m 644 ../sysdeps/ieee754/bits/huge_val.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/bits/huge_val.h
/usr/bin/install -c -m 644 ../sysdeps/ieee754/bits/huge_valf.h /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/include/bits/huge_valf.h
/usr/bin/install -c -m 644 ../bits/huge_vall.h /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
include/bits/huge_vall.h
/usr/bin/install -c -m 644 ../sysdeps/ieee754/bits/inf.h /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/include/bits/inf.h
/usr/bin/install -c -m 644 ../sysdeps/ieee754/bits/nan.h /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/include/bits/nan.h
/usr/bin/install -c -m 644 ../ports/sysdeps/arm/fpu_control.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/fpu_control.h
/usr/bin/install -c -m 644 complex.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/co=
mplex.h
/usr/bin/install -c -m 644 bits/cmathcalls.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/cmathcalls.h
/usr/bin/install -c -m 644 fenv.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/fenv.=
h
/usr/bin/install -c -m 644 ../ports/sysdeps/arm/bits/fenv.h /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/include/bits/fenv.h
/usr/bin/install -c -m 644 ../bits/fenvinline.h /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/include/bits/fenvinline.h
/usr/bin/install -c -m 644 ../ports/sysdeps/arm/bits/mathdef.h /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/include/bits/mathdef.h
/usr/bin/install -c -m 644 tgmath.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/tgm=
ath.h
/usr/bin/install -c -m 644 bits/math-finite.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/math-finite.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../sysdeps/ieee754/ieee754.h /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/include/ieee754.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/math/lib=
m.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/image/lib/libm-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
ath/libieee.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libieee.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libm-2.16.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
lib/libm-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
ath/libm.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/libm.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
ath/libm_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libm_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibm.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/image/usr/lib/libm_pic.map
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libm.so.6
ln -s libm-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libm.so.6
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libm.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libm.so.6 /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/lib/libm.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libm.so.new /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/lib/libm.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/math'
make -j3 subdir=3Dsetjmp -C setjmp ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
/usr/bin/install -c -m 644 setjmp.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/set=
jmp.h
/usr/bin/install -c -m 644 ../ports/sysdeps/arm/bits/setjmp.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/bits/setjmp.h
/usr/bin/install -c -m 644 bits/setjmp2.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/bits/setjmp2.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make -j3 subdir=3Dsignal -C signal ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
/usr/bin/install -c -m 644 signal.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sig=
nal.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sys
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/signum.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/signum.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sigcontext.h /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/include/bits/sigcontext.h
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/sys
/usr/bin/install -c -m 644 sys/signal.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/signal.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sigaction.h /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/include/bits/sigaction.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sigset.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/sigset.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/siginfo.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/siginfo.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sigstack.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/bits/sigstack.h
/usr/bin/install -c -m 644 ../nptl/sysdeps/pthread/bits/sigthread.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/sigthread.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make -j3 subdir=3Dstdlib -C stdlib ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
/usr/bin/install -c -m 644 stdlib.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/std=
lib.h
/usr/bin/install -c -m 644 bits/stdlib.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/stdlib.h
/usr/bin/install -c -m 644 bits/stdlib-ldbl.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/stdlib-ldbl.h
/usr/bin/install -c -m 644 monetary.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/m=
onetary.h
/usr/bin/install -c -m 644 bits/monetary-ldbl.h /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/include/bits/monetary-ldbl.h
/usr/bin/install -c -m 644 ../sysdeps/generic/inttypes.h /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/usr/include/inttypes.h
/usr/bin/install -c -m 644 ../sysdeps/generic/stdint.h /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/include/stdint.h
/usr/bin/install -c -m 644 ../sysdeps/wordsize-32/bits/wordsize.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/bits/wordsize.h
/usr/bin/install -c -m 644 errno.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/errn=
o.h
/usr/bin/install -c -m 644 sys/errno.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/errno.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/errno.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/bits/errno.h
/usr/bin/install -c -m 644 ucontext.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/u=
context.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/sys/ucontex=
t.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egl=
ibc-2.16-r4+svnr19383/image/usr/include/sys/ucontext.h
/usr/bin/install -c -m 644 alloca.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/all=
oca.h
/usr/bin/install -c -m 644 fmtmsg.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/fmt=
msg.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make -j3 subdir=3Dstdio-common -C stdio-common ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdio-commo=
n'
/usr/bin/install -c -m 644 stdio_ext.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
stdio_ext.h
/usr/bin/install -c -m 644 printf.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/pri=
ntf.h
/usr/bin/install -c -m 644 bits/printf-ldbl.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/printf-ldbl.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/b=
its/stdio_lim.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/bits/stdio_lim.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdio-common=
'
make -j3 subdir=3Dlibio -C libio ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libio'
/usr/bin/install -c -m 644 stdio.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/stdi=
o.h
/usr/bin/install -c -m 644 libio.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/libi=
o.h
/usr/bin/install -c -m 644 ../sysdeps/gnu/_G_config.h /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/include/_G_config.h
/usr/bin/install -c -m 644 bits/stdio.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/bits/stdio.h
/usr/bin/install -c -m 644 ../nptl/sysdeps/pthread/bits/stdio-lock.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/stdio-lock.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sys_errlist.h /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/include/bits/sys_errlist.h
/usr/bin/install -c -m 644 bits/stdio2.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/stdio2.h
/usr/bin/install -c -m 644 bits/stdio-ldbl.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/stdio-ldbl.h
/usr/bin/install -c -m 644 bits/libio-ldbl.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/libio-ldbl.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libio'
make -j3 subdir=3Ddlfcn -C dlfcn ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dlfcn'
/usr/bin/install -c -m 644 ../bits/dlfcn.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/bits/dlfcn.h
/usr/bin/install -c -m 644 dlfcn.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/dlfc=
n.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/dlfcn/li=
bdl.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/=
eglibc-2.16-r4+svnr19383/image/lib/libdl-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/d=
lfcn/libdl.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libdl.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/d=
lfcn/libdl_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libdl_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libdl-2.16.so.new /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/lib/libdl-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibdl.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/libdl_pic.map
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libdl.so.2
ln -s libdl-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libdl.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libdl.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libdl.so.2 /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/lib/libdl.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libdl.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/lib/libdl.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dlfcn'
make -j3 subdir=3Dmalloc -C malloc ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/malloc'
/usr/bin/install -c -m 644 malloc.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/mal=
loc.h
/usr/bin/install -c -m 644 obstack.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/ob=
stack.h
/usr/bin/install -c -m 644 mcheck.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/mch=
eck.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/malloc/l=
ibmemusage.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/lib/libmemusage.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
alloc/libmcheck.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libmcheck.a
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/malloc/m=
trace /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/mtrace.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libmemusage.so.new /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/lib/libmemusage.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/mtrace.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/mtrace
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/malloc'
make -j3 subdir=3Dstring -C string ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
/usr/bin/install -c -m 644 string.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/str=
ing.h
/usr/bin/install -c -m 644 strings.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/st=
rings.h
/usr/bin/install -c -m 644 memory.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/mem=
ory.h
/usr/bin/install -c -m 644 endian.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/end=
ian.h
/usr/bin/install -c -m 644 ../ports/sysdeps/arm/bits/endian.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/bits/endian.h
/usr/bin/install -c -m 644 argz.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/argz.=
h
/usr/bin/install -c -m 644 envz.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/envz.=
h
/usr/bin/install -c -m 644 byteswap.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/b=
yteswap.h
/usr/bin/install -c -m 644 ../bits/byteswap.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/byteswap.h
/usr/bin/install -c -m 644 ../bits/byteswap-16.h /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/include/bits/byteswap-16.h
/usr/bin/install -c -m 644 ../bits/string.h /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inc=
lude/bits/string.h
/usr/bin/install -c -m 644 bits/string2.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/bits/string2.h
/usr/bin/install -c -m 644 bits/string3.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/bits/string3.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make -j3 subdir=3Dwcsmbs -C wcsmbs ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wcsmbs'
/usr/bin/install -c -m 644 wchar.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/wcha=
r.h
/usr/bin/install -c -m 644 ../bits/wchar.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/bits/wchar.h
/usr/bin/install -c -m 644 bits/wchar2.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/wchar2.h
/usr/bin/install -c -m 644 bits/wchar-ldbl.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/wchar-ldbl.h
/usr/bin/install -c -m 644 uchar.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/ucha=
r.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wcsmbs'
make -j3 subdir=3Dtimezone -C timezone ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/timezone'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/timezone=
/tzselect /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/bin/tzselect.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/tzselect.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/bin/tzselect
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/timezone=
/zic /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/image/usr/sbin/zic.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/timezone=
/zdump /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/=
eglibc-2.16-r4+svnr19383/image/usr/sbin/zdump.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/sbin/zdump.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/sbin/zdump
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/sbin/zic.new /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
sbin/zic
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/timezone'
make -j3 subdir=3Dtime -C time ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
/usr/bin/install -c -m 644 time.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/time.=
h
/usr/bin/install -c -m 644 sys/time.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/time.h
/usr/bin/install -c -m 644 sys/timeb.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/timeb.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/time.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/bits/time.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/timex.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/timex.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/timex.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/bits/timex.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make -j3 subdir=3Ddirent -C dirent ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
/usr/bin/install -c -m 644 dirent.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/dir=
ent.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/dirent.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/dirent.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make -j3 subdir=3Dgrp -C grp ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/grp'
/usr/bin/install -c -m 644 grp.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/grp.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/grp'
make -j3 subdir=3Dpwd -C pwd ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/pwd'
/usr/bin/install -c -m 644 pwd.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/pwd.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/pwd'
make -j3 subdir=3Dposix -C posix ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
/usr/bin/install -c -m 644 sys/utsname.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/sys/utsname.h
/usr/bin/install -c -m 644 sys/times.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/times.h
/usr/bin/install -c -m 644 sys/wait.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/wait.h
/usr/bin/install -c -m 644 sys/types.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/types.h
/usr/bin/install -c -m 644 unistd.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/uni=
std.h
/usr/bin/install -c -m 644 glob.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/glob.=
h
/usr/bin/install -c -m 644 regex.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rege=
x.h
/usr/bin/install -c -m 644 wordexp.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/wo=
rdexp.h
/usr/bin/install -c -m 644 fnmatch.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/fn=
match.h
/usr/bin/install -c -m 644 getopt.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/get=
opt.h
/usr/bin/install -c -m 644 ../bits/types.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/bits/types.h
/usr/bin/install -c -m 644 ../bits/typesizes.h /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
include/bits/typesizes.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/nptl/bits/p=
threadtypes.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/include/bits/pthreadtypes.h
/usr/bin/install -c -m 644 bits/posix1_lim.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/posix1_lim.h
/usr/bin/install -c -m 644 bits/posix2_lim.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/posix2_lim.h
/usr/bin/install -c -m 644 ../nptl/sysdeps/unix/sysv/linux/bits/posix_opt.h=
 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc=
-2.16-r4+svnr19383/image/usr/include/bits/posix_opt.h
/usr/bin/install -c -m 644 ../nptl/sysdeps/unix/sysv/linux/bits/local_lim.h=
 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc=
-2.16-r4+svnr19383/image/usr/include/bits/local_lim.h
/usr/bin/install -c -m 644 tar.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/tar.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/utsname.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/utsname.h
/usr/bin/install -c -m 644 ../bits/confname.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/confname.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/waitflags.h /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/include/bits/waitflags.h
/usr/bin/install -c -m 644 ../bits/waitstatus.h /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/include/bits/waitstatus.h
/usr/bin/install -c -m 644 sys/unistd.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/unistd.h
/usr/bin/install -c -m 644 sched.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sche=
d.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sched.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/bits/sched.h
/usr/bin/install -c -m 644 re_comp.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/re=
_comp.h
/usr/bin/install -c -m 644 wait.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/wait.=
h
/usr/bin/install -c -m 644 ../bits/environments.h /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/include/bits/environments.h
/usr/bin/install -c -m 644 cpio.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/cpio.=
h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/sysmacros.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/sys/sysmacros.h
/usr/bin/install -c -m 644 spawn.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/spaw=
n.h
/usr/bin/install -c -m 644 bits/unistd.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/unistd.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/initspin.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/bits/initspin.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/posix/ge=
tconf /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/getconf.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/getconf.new /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/bin/getconf
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/libexec/getconf
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/libexec
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/libexec/getconf
while read spec; do \
  ln -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/image/usr/bin/getconf /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/libexec/getconf/$spec.new || /usr/bin/install -c /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/bin/getconf /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/libexec/getconf/$spec.new; \
  mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/image/usr/libexec/getconf/$spec.new /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/libexec/getconf/$spec; \
done < /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/=
eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/posix/getconf.speclis=
t
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make -j3 subdir=3Dio -C io ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
/usr/bin/install -c -m 644 sys/stat.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/stat.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/stat.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/bits/stat.h
/usr/bin/install -c -m 644 sys/statfs.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/statfs.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/statfs.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/statfs.h
/usr/bin/install -c -m 644 sys/vfs.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/vfs.h
/usr/bin/install -c -m 644 sys/statvfs.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/sys/statvfs.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/statvfs.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/statvfs.h
/usr/bin/install -c -m 644 fcntl.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/fcnt=
l.h
/usr/bin/install -c -m 644 sys/fcntl.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/fcntl.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/bits/fcntl.=
h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/usr/include/bits/fcntl.h
/usr/bin/install -c -m 644 poll.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/poll.=
h
/usr/bin/install -c -m 644 sys/poll.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/poll.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/poll.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/bits/poll.h
/usr/bin/install -c -m 644 bits/fcntl2.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/fcntl2.h
/usr/bin/install -c -m 644 bits/poll2.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/bits/poll2.h
/usr/bin/install -c -m 644 utime.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/utim=
e.h
/usr/bin/install -c -m 644 ftw.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/ftw.h
/usr/bin/install -c -m 644 fts.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/fts.h
/usr/bin/install -c -m 644 sys/sendfile.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/sys/sendfile.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make -j3 subdir=3Dtermios -C termios ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/termios'
/usr/bin/install -c -m 644 termios.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/te=
rmios.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/termios.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/termios.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/ttydefaults.h /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/include/sys/ttydefaults.h
/usr/bin/install -c -m 644 sys/termios.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/sys/termios.h
/usr/bin/install -c -m 644 sys/ttychars.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/sys/ttychars.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/termio.h /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/include/termio.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/termios'
make -j3 subdir=3Dresource -C resource ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resource'
/usr/bin/install -c -m 644 sys/resource.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/sys/resource.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/resource.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/bits/resource.h
/usr/bin/install -c -m 644 sys/vlimit.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/vlimit.h
/usr/bin/install -c -m 644 sys/vtimes.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/vtimes.h
/usr/bin/install -c -m 644 ulimit.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/uli=
mit.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resource'
make -j3 subdir=3Dmisc -C misc ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
/usr/bin/install -c -m 644 sys/uio.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/uio.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/uio.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/bits/uio.h
/usr/bin/install -c -m 644 sys/ioctl.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/ioctl.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/ioctls.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/ioctls.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/ioctl-types.h /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/include/bits/ioctl-types.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/ptrace.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/sys/ptrace.h
/usr/bin/install -c -m 644 sys/file.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/file.h
/usr/bin/install -c -m 644 sys/dir.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/dir.h
/usr/bin/install -c -m 644 sys/cdefs.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/cdefs.h
/usr/bin/install -c -m 644 ar.h /mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/ar.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/a.out.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/a.out.h
/usr/bin/install -c -m 644 libgen.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/lib=
gen.h
/usr/bin/install -c -m 644 stab.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/stab.=
h
/usr/bin/install -c -m 644 bits/stab.def /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/stab.def
/usr/bin/install -c -m 644 sgtty.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sgtt=
y.h
/usr/bin/install -c -m 644 ttyent.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/tty=
ent.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/paths.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/paths.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/reboot.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/sys/reboot.h
/usr/bin/install -c -m 644 sys/mman.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/mman.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/param.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/param.h
/usr/bin/install -c -m 644 fstab.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/fsta=
b.h
/usr/bin/install -c -m 644 mntent.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/mnt=
ent.h
/usr/bin/install -c -m 644 search.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sea=
rch.h
/usr/bin/install -c -m 644 err.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/err.h
/usr/bin/install -c -m 644 error.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/erro=
r.h
/usr/bin/install -c -m 644 sys/queue.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/queue.h
/usr/bin/install -c -m 644 sysexits.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ysexits.h
/usr/bin/install -c -m 644 syscall.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
scall.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/syscall.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/sys/syscall.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/swap.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/sys/swap.h
/usr/bin/install -c -m 644 sys/select.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/select.h
/usr/bin/install -c -m 644 ustat.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/usta=
t.h
/usr/bin/install -c -m 644 sys/ustat.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/ustat.h
/usr/bin/install -c -m 644 ../bits/ustat.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/bits/ustat.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/sysinfo.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/sys/sysinfo.h
/usr/bin/install -c -m 644 regexp.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/reg=
exp.h
/usr/bin/install -c -m 644 ../bits/select.h /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inc=
lude/bits/select.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/bits/mman.h=
 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc=
-2.16-r4+svnr19383/image/usr/include/bits/mman.h
/usr/bin/install -c -m 644 sys/xattr.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
sys/xattr.h
/usr/bin/install -c -m 644 syslog.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sys=
log.h
/usr/bin/install -c -m 644 sys/syslog.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/syslog.h
/usr/bin/install -c -m 644 bits/syslog.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/bits/syslog.h
/usr/bin/install -c -m 644 bits/syslog-ldbl.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/syslog-ldbl.h
/usr/bin/install -c -m 644 ../bits/syslog-path.h /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/include/bits/syslog-path.h
/usr/bin/install -c -m 644 bits/error.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/bits/error.h
/usr/bin/install -c -m 644 bits/select2.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/bits/select2.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/bits/hwcap.=
h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/usr/include/bits/hwcap.h
/usr/bin/install -c -m 644 sys/auxv.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/auxv.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/sys/elf.h /=
mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2=
.16-r4+svnr19383/image/usr/include/sys/elf.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/sys/io.h /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/include/sys/io.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/mount.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/mount.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/acct.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/sys/acct.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/sysctl.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/sys/sysctl.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/klog.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/sys/klog.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/kdaemon.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/sys/kdaemon.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/sys/user.h =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/usr/include/sys/user.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/sys/procfs.=
h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/usr/include/sys/procfs.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/prctl.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/prctl.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/kd.h /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/include/sys/kd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/soundcard.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/sys/soundcard.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/vt.h /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/include/sys/vt.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/quota.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/quota.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/fsuid.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/fsuid.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/scsi
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/scsi
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/scsi
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/scsi
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/scsi/sg.h /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/include/scsi/sg.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/scsi/scsi.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/scsi/scsi.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/scsi/scsi_ioctl.h /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/include/scsi/scsi_ioctl.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/pci.h /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/include/sys/pci.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/ultrasound.h /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/include/sys/ultrasound.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/raw.h /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/include/sys/raw.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/personality.h /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/include/sys/personality.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/epoll.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/sys/epoll.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/a.out.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/bits/a.out.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/inotify.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/sys/inotify.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/signalfd.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/sys/signalfd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/eventfd.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/sys/eventfd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/timerfd.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/sys/timerfd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/sys/fanotify.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/sys/fanotify.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/eventfd.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/eventfd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/inotify.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/inotify.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/signalfd.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/bits/signalfd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/timerfd.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/bits/timerfd.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/epoll.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/bits/epoll.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/socket_type.h /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/include/bits/socket_type.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
isc/bits/syscall.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/bits/syscall.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sysctl.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/sysctl.h
/usr/bin/install -c -m 644 ../sysdeps/gnu/sys/mtio.h /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/include/sys/mtio.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
isc/libbsd-compat.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libbsd-compat.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/m=
isc/libg.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/libg.a
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make -j3 subdir=3Dsocket -C socket ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/socket'
/usr/bin/install -c -m 644 sys/socket.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/socket.h
/usr/bin/install -c -m 644 sys/un.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sys=
/un.h
/usr/bin/install -c -m 644 ../bits/sockaddr.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/sockaddr.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/socket.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/socket.h
/usr/bin/install -c -m 644 bits/socket2.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/bits/socket2.h
/usr/bin/install -c -m 644 ../sysdeps/generic/sys/socketvar.h /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/image/usr/include/sys/socketvar.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/net
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/net
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/net
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/net
mkdir: cannot create directory '/mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/net': F=
ile exists
/usr/bin/install -c -m 644 ../sysdeps/gnu/net/if.h /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/include/net/if.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/if_ppp.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/net/if_ppp.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/net
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/ppp-comp.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/net/ppp-comp.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/ppp_defs.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/net/ppp_defs.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/if_arp.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/net/if_arp.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/route.h /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/image/usr/include/net/route.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/ethernet.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/net/ethernet.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/if_slip.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/net/if_slip.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/if_packet.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/net/if_packet.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/net/if_shaper.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/net/if_shaper.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/socket'
make -j3 subdir=3Dsysvipc -C sysvipc ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sysvipc'
/usr/bin/install -c -m 644 sys/ipc.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/ipc.h
/usr/bin/install -c -m 644 sys/msg.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/msg.h
/usr/bin/install -c -m 644 sys/sem.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/sem.h
/usr/bin/install -c -m 644 sys/shm.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sy=
s/shm.h
/usr/bin/install -c -m 644 ../bits/ipctypes.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/ipctypes.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/ipc.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/bits/ipc.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/msq.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/bits/msq.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/sem.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/bits/sem.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/bits/shm.h =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/usr/include/bits/shm.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sysvipc'
make -j3 subdir=3Dgmon -C gmon ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
/usr/bin/install -c -m 644 sys/gmon.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/s=
ys/gmon.h
/usr/bin/install -c -m 644 sys/gmon_out.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/sys/gmon_out.h
/usr/bin/install -c -m 644 sys/profil.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/sys/profil.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make -j3 subdir=3Dgnulib -C gnulib ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gnulib'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gnulib'
make -j3 subdir=3Dwctype -C wctype ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wctype'
/usr/bin/install -c -m 644 wctype.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/wct=
ype.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/wctype'
make -j3 subdir=3Dmanual -C manual ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/manual'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/info
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/info
for file in /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/manual/libc.info=
*; do \
  /usr/bin/install -c -m 644 $file /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/info/;=
 \
done
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libc.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc_nonshared.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_nonshared.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_pic.a
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libc.so =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/lib/libc-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libc-2.16.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
lib/libc-2.16.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libc.so.6
ln -s libc-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libc.so.6
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/manual'
make -j3 subdir=3Dshadow -C shadow ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/shadow'
/usr/bin/install -c -m 644 shadow.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/sha=
dow.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/shadow'
make -j3 subdir=3Dgshadow -C gshadow ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gshadow'
/usr/bin/install -c -m 644 gshadow.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gs=
hadow.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gshadow'
make -j3 subdir=3Dpo -C po ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/po'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/de/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/sv/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/ja/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/sv
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/de
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/sv/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ja
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/de/LC_MESSAGES
/usr/bin/install -c -m 644 sv.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/s=
v/LC_MESSAGES/libc.mo || exit 0
/usr/bin/install -c -m 644 de.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/d=
e/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ja/LC_MESSAGES
/usr/bin/install -c -m 644 ja.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/j=
a/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/tr/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/tr
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/tr/LC_MESSAGES
/usr/bin/install -c -m 644 tr.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/t=
r/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/fr/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/vi/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/da/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/fr
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/vi
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/da
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/fr/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/vi/LC_MESSAGES
/usr/bin/install -c -m 644 fr.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/f=
r/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/da/LC_MESSAGES
/usr/bin/install -c -m 644 da.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/d=
a/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/ca/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/lt/LC_M=
ESSAGES
/usr/bin/install -c -m 644 vi.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/v=
i/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ca
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ca/LC_MESSAGES
/usr/bin/install -c -m 644 ca.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/c=
a/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/lt
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/lt/LC_MESSAGES
/usr/bin/install -c -m 644 lt.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/l=
t/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/it/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/rw/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/nb/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/rw
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/it
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/it/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/rw/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/nb
/usr/bin/install -c -m 644 rw.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/r=
w/LC_MESSAGES/libc.mo || exit 0
/usr/bin/install -c -m 644 it.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/i=
t/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/nb/LC_MESSAGES
/usr/bin/install -c -m 644 nb.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/n=
b/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/zh_TW/L=
C_MESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/be/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/hu/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/be
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/be/LC_MESSAGES
/usr/bin/install -c -m 644 be.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/b=
e/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/hu
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/hu/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/zh_TW
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/zh_TW/LC_MESSAGES
/usr/bin/install -c -m 644 hu.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/h=
u/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/es/LC_M=
ESSAGES
/usr/bin/install -c -m 644 zh_TW.mo /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/local=
e/zh_TW/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/hr/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/pl/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/es
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/es/LC_MESSAGES
/usr/bin/install -c -m 644 es.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/e=
s/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/hr
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/hr/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/pl
/usr/bin/install -c -m 644 hr.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/h=
r/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/pl/LC_MESSAGES
/usr/bin/install -c -m 644 pl.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/p=
l/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/en_GB/L=
C_MESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/bg/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/id/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/bg
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/bg/LC_MESSAGES
/usr/bin/install -c -m 644 bg.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/b=
g/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/en_GB
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/id
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/en_GB/LC_MESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/pt_BR/L=
C_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/id/LC_MESSAGES
/usr/bin/install -c -m 644 en_GB.mo /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/local=
e/en_GB/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/pt_BR
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/pt_BR/LC_MESSAGES
/usr/bin/install -c -m 644 pt_BR.mo /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/local=
e/pt_BR/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/gl/LC_M=
ESSAGES
/usr/bin/install -c -m 644 id.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/i=
d/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/fi/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/gl
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/gl/LC_MESSAGES
/usr/bin/install -c -m 644 gl.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/g=
l/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/fi
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/fi/LC_MESSAGES
/usr/bin/install -c -m 644 fi.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/f=
i/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/zh_CN/L=
C_MESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/cs/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/sk/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/cs
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/sk
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/cs/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/zh_CN
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/sk/LC_MESSAGES
/usr/bin/install -c -m 644 cs.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/c=
s/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/zh_CN/LC_MESSAGES
/usr/bin/install -c -m 644 sk.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/s=
k/LC_MESSAGES/libc.mo || exit 0
/usr/bin/install -c -m 644 zh_CN.mo /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/local=
e/zh_CN/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/ko/LC_M=
ESSAGES
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/ru/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ko
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/el/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ko/LC_MESSAGES
/usr/bin/install -c -m 644 ko.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/k=
o/LC_MESSAGES/libc.mo || exit 0
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ru
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/ru/LC_MESSAGES
/usr/bin/install -c -m 644 ru.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/r=
u/LC_MESSAGES/libc.mo || exit 0
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/nl/LC_M=
ESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/el
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/nl
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/nl/LC_MESSAGES
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/share/locale/el/LC_MESSAGES
/usr/bin/install -c -m 644 nl.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/n=
l/LC_MESSAGES/libc.mo || exit 0
/usr/bin/install -c -m 644 el.mo /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/share/locale/e=
l/LC_MESSAGES/libc.mo || exit 0
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/po'
make -j3 subdir=3Dargp -C argp ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/argp'
/usr/bin/install -c -m 644 argp.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/argp.=
h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/argp'
make -j3 subdir=3Dcrypt -C crypt ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/crypt'
/usr/bin/install -c -m 644 crypt.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/cryp=
t.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/crypt/li=
bcrypt.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/lib/libcrypt-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
rypt/libcrypt.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libcrypt.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/c=
rypt/libcrypt_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libcrypt_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libcrypt-2.16.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/lib/libcrypt-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibcrypt.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libcrypt_pic.map
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libcrypt.so.1
ln -s libcrypt-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-pok=
y-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libcrypt.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libcrypt.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libcrypt.so.1 /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/image/usr/lib/libcrypt.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libcrypt.so.new /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/lib/libcrypt.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/crypt'
make -j3 subdir=3Dnptl -C nptl ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
/usr/bin/install -c -m 644 ../nptl/sysdeps/pthread/pthread.h /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/usr/include/pthread.h
/usr/bin/install -c -m 644 semaphore.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
semaphore.h
/usr/bin/install -c -m 644 ../ports/sysdeps/unix/sysv/linux/arm/nptl/bits/s=
emaphore.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/include/bits/semaphore.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
ptl/libpthread_nonshared.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libpthread_nonsh=
ared.a
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nptl/lib=
pthread.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/lib/libpthread-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libpthread-2.16.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/lib/libpthread-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
ptl/libpthread.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libpthread.a
(echo '/* GNU ld script';\
 echo '   Use the shared library, but some functions are only in';\
 echo '   the static library, so try that secondarily.  */';\
 cat /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/format.lds; \
 echo 'GROUP ( /lib/libpthread.so.0' \
      '/usr/lib/libpthread_nonshared.a'\
      ')' \
) > /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egl=
ibc-2.16-r4+svnr19383/image/usr/lib/libpthread.so.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libpthread.so.0
ln -s libpthread-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-p=
oky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libpthread.so.0
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libpthread.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/libpthread.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make -j3 subdir=3Dresolv -C resolv ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resolv'
/usr/bin/install -c -m 644 resolv.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/res=
olv.h
/usr/bin/install -c -m 644 netdb.h /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netd=
b.h
/usr/bin/install -c -m 644 ../bits/netdb.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/bits/netdb.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/arpa
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/arpa
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/arpa
/usr/bin/install -c -m 644 arpa/nameser.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/arpa/nameser.h
/usr/bin/install -c -m 644 arpa/nameser_compat.h /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/include/arpa/nameser_compat.h
/usr/bin/install -c -m 644 sys/bitypes.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/sys/bitypes.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/resolv/l=
ibresolv.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/lib/libresolv-2.16.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/resolv/l=
ibnss_dns.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_dns-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libresolv-2.16.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/lib/libresolv-2.16.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_dns-2.16.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/lib/libnss_dns-2.16.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/resolv/l=
ibanl.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/lib/libanl-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libanl-2.16.so.new /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/lib/libanl-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
esolv/libresolv.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libresolv.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
esolv/libanl.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libanl.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
esolv/libresolv_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libresolv_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
esolv/libnss_dns_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-pok=
y-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_dns_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
esolv/libanl_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libanl_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibresolv.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libresolv_pic.map
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_dns.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_dns_pic.map
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibanl.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/libanl_pic.map
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libresolv.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_dns.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libanl.so.1
ln -s libresolv-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libresolv.so.2
ln -s libnss_dns-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-p=
oky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_dns.so.2
ln -s libanl-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libanl.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libanl.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libanl.so.1 /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/lib/libanl.so.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libresolv.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libresolv.so.2 /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/lib/libresolv.so.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_dns.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_dns.so.2 /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/lib/libnss_dns.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libresolv.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/libresolv.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_dns.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/libnss_dns.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libanl.so.new /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/lib/libanl.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/resolv'
make -j3 subdir=3Dnss -C nss ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nss'
/usr/bin/install -c -m 644 nss.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/nss.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nss/libn=
ss_files.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_files-2.16.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nss/libn=
ss_db.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/lib/libnss_db-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
ss/libnss_files_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_files_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_files-2.16.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/lib/libnss_files-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
ss/libnss_db_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_db_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_db-2.16.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/lib/libnss_db-2.16.so
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/var/db
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_files.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_files_pic.map
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/var
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_db.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_db_pic.map
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/var/db
/usr/bin/install -c -m 644 db-Makefile /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/var/db/Makef=
ile
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nss/gete=
nt /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egli=
bc-2.16-r4+svnr19383/image/usr/bin/getent.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nss/make=
db /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egli=
bc-2.16-r4+svnr19383/image/usr/bin/makedb.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/getent.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/getent
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/makedb.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/makedb
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_files.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_db.so.2
ln -s libnss_files-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_files.so.2
ln -s libnss_db-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_db.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_files.so.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_db.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_files.so.2 =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/usr/lib/libnss_files.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_db.so.2 /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/lib/libnss_db.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_db.so.new /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/lib/libnss_db.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_files.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/libnss_files.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nss'
make -j3 subdir=3Drt -C rt ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/rt'
/usr/bin/install -c -m 644 aio.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/aio.h
/usr/bin/install -c -m 644 mqueue.h /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/mqu=
eue.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/mqueue.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/bits/mqueue.h
/usr/bin/install -c -m 644 bits/mqueue2.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/bits/mqueue2.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/rt/librt=
.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egl=
ibc-2.16-r4+svnr19383/image/lib/librt-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
t/librt.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/librt.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/r=
t/librt_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/librt_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/librt-2.16.so.new /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/lib/librt-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibrt.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/usr/lib/librt_pic.map
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/librt.so.1
ln -s librt-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/librt.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/librt.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/librt.so.1 /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/lib/librt.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/librt.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/lib/librt.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/rt'
make -j3 subdir=3Dconform -C conform ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/conform'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/conform'
make -j3 subdir=3Ddebug -C debug ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/debug'
/usr/bin/install -c -m 644 execinfo.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/e=
xecinfo.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/debug/li=
bSegFault.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/lib/libSegFault.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/debug/li=
bpcprofile.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/lib/libpcprofile.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/debug/pc=
profiledump /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/bin/pcprofiledump.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libSegFault.so.new /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/lib/libSegFault.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/debug/xt=
race /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/image/usr/bin/xtrace.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libpcprofile.so.new /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/lib/libpcprofile.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/pcprofiledump.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/bin/pcprofiledump
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/debug/ca=
tchsegv /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/image/usr/bin/catchsegv.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/xtrace.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/xtrace
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/catchsegv.new /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/bin/catchsegv
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/debug'
make -j3 subdir=3Dlibidn -C libidn ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libidn'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libidn/l=
ibcidn.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/lib/libcidn-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibidn/libcidn_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libcidn_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibcidn.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/libcidn_pic.map
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libcidn-2.16.so.new /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/lib/libcidn-2.16.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libcidn.so.1
ln -s libcidn-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libcidn.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libcidn.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libcidn.so.1 /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/lib/libcidn.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libcidn.so.new /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/lib/libcidn.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/libidn'
make -j3 subdir=3Dnptl_db -C nptl_db ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl_db'
/usr/bin/install -c -m 644 thread_db.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
thread_db.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nptl_db/=
libthread_db.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libthread_db-1.0.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
ptl_db/libthread_db_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-=
poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libthread_db_pic.=
a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibthread_db.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libthread_db_pic.map
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libthread_db-1.0.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/lib/libthread_db-1.0.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libthread_db.so.1
ln -s libthread_db-1.0.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-=
poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libthread_db.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libthread_db.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libthread_db.so.1 =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/usr/lib/libthread_db.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libthread_db.so.new /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/image/usr/lib/libthread_db.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl_db'
make -j3 subdir=3Dinet -C inet ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/inet'
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netinet
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netinet
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netinet
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netinet
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netinet
mkdir: cannot create directory '/mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netinet=
': File exists
/usr/bin/install -c -m 644 netinet/ether.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/netinet/ether.h
/usr/bin/install -c -m 644 netinet/in.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/netinet/in.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netinet
/usr/bin/install -c -m 644 netinet/igmp.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/netinet/igmp.h
/usr/bin/install -c -m 644 ../sysdeps/gnu/netinet/tcp.h /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/include/netinet/tcp.h
/usr/bin/install -c -m 644 ../sysdeps/generic/netinet/in_systm.h /mnt/yocto=
/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+sv=
nr19383/image/usr/include/netinet/in_systm.h
/usr/bin/install -c -m 644 ../sysdeps/generic/netinet/ip.h /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/include/netinet/ip.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netinet/if_ether.h /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/include/netinet/if_ether.h
/usr/bin/install -c -m 644 arpa/telnet.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/arpa/telnet.h
/usr/bin/install -c -m 644 arpa/inet.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
arpa/inet.h
/usr/bin/install -c -m 644 arpa/ftp.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/a=
rpa/ftp.h
/usr/bin/install -c -m 644 arpa/tftp.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
arpa/tftp.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/protocols
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/protocols
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/protocols
/usr/bin/install -c -m 644 protocols/routed.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/protocols/routed.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/protocols
/usr/bin/install -c -m 644 protocols/talkd.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/protocols/talkd.h
/usr/bin/install -c -m 644 protocols/timed.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/protocols/timed.h
/usr/bin/install -c -m 644 protocols/rwhod.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/protocols/rwhod.h
/usr/bin/install -c -m 644 aliases.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/al=
iases.h
/usr/bin/install -c -m 644 ifaddrs.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/if=
addrs.h
/usr/bin/install -c -m 644 netinet/ip6.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/netinet/ip6.h
/usr/bin/install -c -m 644 netinet/icmp6.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/netinet/icmp6.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/bits/in.h /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/include/bits/in.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netinet/if_fddi.h /mn=
t/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.1=
6-r4+svnr19383/image/usr/include/netinet/if_fddi.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netinet/if_tr.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/netinet/if_tr.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netipx
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netash
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netax25
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netipx
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netipx/ipx.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/netipx/ipx.h
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netash
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netatalk
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netax25
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netatalk
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netash/ash.h /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/image/usr/include/netash/ash.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netax25/ax25.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/netax25/ax25.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netatalk/at.h /mnt/yo=
cto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4=
+svnr19383/image/usr/include/netatalk/at.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netrom
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netpacket
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netrose
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netrom
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netrose
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netrose/rose.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/netrose/rose.h
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netpacket
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netpacket/packet.h /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/include/netpacket/packet.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netrom/netrom.h /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/include/netrom/netrom.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/neteconet
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/netiucv
/usr/bin/install -c -m 644 ../sysdeps/gnu/netinet/udp.h /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/include/netinet/udp.h
/usr/bin/install -c -m 644 ../sysdeps/gnu/netinet/ip_icmp.h /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/include/netinet/ip_icmp.h
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/netiucv
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/neteconet
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/neteconet/ec.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/neteconet/ec.h
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/netiucv/iucv.h /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/include/netiucv/iucv.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/inet'
make -j3 subdir=3Dhesiod -C hesiod ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/hesiod'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/hesiod/l=
ibnss_hesiod.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_hesiod-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/h=
esiod/libnss_hesiod_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-=
poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_hesiod_pic=
.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_hesiod.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_hesiod_pic.map
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_hesiod-2.16.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/lib/libnss_hesiod-2.16.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_hesiod.so.2
ln -s libnss_hesiod-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_hesiod.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_hesiod.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_hesiod.so.2=
 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc=
-2.16-r4+svnr19383/image/usr/lib/libnss_hesiod.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_hesiod.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/libnss_hesiod.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/hesiod'
make -j3 subdir=3Dsunrpc -C sunrpc ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc'
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpc
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpc
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpc
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/rpc
/usr/bin/install -c -m 644 rpc/auth.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/r=
pc/auth.h
/usr/bin/install -c -m 644 rpc/auth_unix.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpc/auth_unix.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpc
/usr/bin/install -c -m 644 rpc/pmap_clnt.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpc/pmap_clnt.h
/usr/bin/install -c -m 644 rpc/pmap_prot.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpc/pmap_prot.h
/usr/bin/install -c -m 644 rpc/netdb.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
rpc/netdb.h
/usr/bin/install -c -m 644 rpc/clnt.h /mnt/yocto/poky.git/raspberry/tmp/wor=
k/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/r=
pc/clnt.h
/usr/bin/install -c -m 644 rpc/pmap_rmt.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpc/pmap_rmt.h
/usr/bin/install -c -m 644 rpc/rpc.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rp=
c/rpc.h
/usr/bin/install -c -m 644 rpc/rpc_msg.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/rpc/rpc_msg.h
/usr/bin/install -c -m 644 rpc/svc.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rp=
c/svc.h
/usr/bin/install -c -m 644 rpc/svc_auth.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpc/svc_auth.h
/usr/bin/install -c -m 644 rpc/types.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
rpc/types.h
/usr/bin/install -c -m 644 rpc/xdr.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rp=
c/xdr.h
/usr/bin/install -c -m 644 rpc/auth_des.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpc/auth_des.h
/usr/bin/install -c -m 644 rpc/des_crypt.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpc/des_crypt.h
/usr/bin/install -c -m 644 rpc/key_prot.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpc/key_prot.h
/usr/bin/install -c -m 644 rpc/rpc_des.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/rpc/rpc_des.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/rpcsvc
/usr/bin/install -c -m 644 rpcsvc/bootparam_prot.x /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
usr/include/rpcsvc/bootparam_prot.x
/usr/bin/install -c -m 644 rpcsvc/nlm_prot.x /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/nlm_prot.x
/usr/bin/install -c -m 644 rpcsvc/rstat.x /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpcsvc/rstat.x
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc
/usr/bin/install -c -m 644 rpcsvc/klm_prot.x /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/klm_prot.x
/usr/bin/install -c -m 644 rpcsvc/rex.x /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/rpcsvc/rex.x
/usr/bin/install -c -m 644 rpcsvc/sm_inter.x /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/sm_inter.x
/usr/bin/install -c -m 644 rpcsvc/mount.x /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpcsvc/mount.x
/usr/bin/install -c -m 644 rpcsvc/yppasswd.x /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/yppasswd.x
/usr/bin/install -c -m 644 rpcsvc/rusers.x /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpcsvc/rusers.x
/usr/bin/install -c -m 644 rpcsvc/spray.x /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpcsvc/spray.x
/usr/bin/install -c -m 644 rpcsvc/nfs_prot.x /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/nfs_prot.x
/usr/bin/install -c -m 644 rpcsvc/rquota.x /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpcsvc/rquota.x
/usr/bin/install -c -m 644 rpcsvc/key_prot.x /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/key_prot.x
/usr/bin/install -c -m 644 rpcsvc/bootparam.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/rpcsvc/bootparam.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/bootparam_prot.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-=
vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/bo=
otparam_prot.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/nlm_prot.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/nlm_prot=
.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/rstat.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/rstat.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/yppasswd.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/yppasswd=
.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/klm_prot.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/klm_prot=
.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/rex.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/rex.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/sm_inter.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/sm_inter=
.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/mount.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/mount.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/rusers.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/rusers.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/spray.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/spray.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/nfs_prot.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/nfs_prot=
.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/rquota.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/rquota.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/rpcsvc/key_prot.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/rpcsvc/key_prot=
.h
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/nfs
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/include/nfs
/usr/bin/install -c -m 644 ../sysdeps/unix/sysv/linux/nfs/nfs.h /mnt/yocto/=
poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svn=
r19383/image/usr/include/nfs/nfs.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/s=
unrpc/librpcsvc.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/librpcsvc.a
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/etc
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/etc
/usr/bin/install -c -m 644 etc.rpc /mnt/yocto/poky.git/raspberry/tmp/work/a=
rmv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/etc/rpc
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/sunrpc/r=
pcgen /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/rpcgen.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/rpcgen.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/bin/rpcgen
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc'
make -j3 subdir=3Dnis -C nis ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nis'
/usr/bin/install -c -m 644 rpcsvc/nis_callback.x /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/include/rpcsvc/nis_callback.x
/usr/bin/install -c -m 644 rpcsvc/yp.x /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
rpcsvc/yp.x
/usr/bin/install -c -m 644 rpcsvc/yp_prot.h /mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inc=
lude/rpcsvc/yp_prot.h
/usr/bin/install -c -m 644 rpcsvc/nis_callback.h /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/us=
r/include/rpcsvc/nis_callback.h
/usr/bin/install -c -m 644 rpcsvc/yp.h /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/=
rpcsvc/yp.h
/usr/bin/install -c -m 644 rpcsvc/ypupd.h /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/inclu=
de/rpcsvc/ypupd.h
/usr/bin/install -c -m 644 rpcsvc/nislib.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpcsvc/nislib.h
/usr/bin/install -c -m 644 rpcsvc/nis_tags.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/rpcsvc/nis_tags.h
/usr/bin/install -c -m 644 rpcsvc/ypclnt.h /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/incl=
ude/rpcsvc/ypclnt.h
/usr/bin/install -c -m 644 rpcsvc/nis.x /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/rpcsvc/nis.x
/usr/bin/install -c -m 644 rpcsvc/nis.h /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include=
/rpcsvc/nis.h
/usr/bin/install -c -m 644 rpcsvc/nis_object.x /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
include/rpcsvc/nis_object.x
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nis/libn=
sl.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnsl-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnsl-2.16.so.new /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/lib/libnsl-2.16.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nis/libn=
ss_nis.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/lib/libnss_nis-2.16.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nis/libn=
ss_nisplus.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_nisplus-2.16.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nis/libn=
ss_compat.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_compat-2.16.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_nis-2.16.so.new /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
image/lib/libnss_nis-2.16.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_nisplus-2.16.so.new /mnt/yocto/pok=
y.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19=
383/image/lib/libnss_nisplus-2.16.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_compat-2.16.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/lib/libnss_compat-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
is/libnsl.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnsl.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
is/libnsl_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnsl_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
is/libnss_nis_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_nis_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
is/libnss_nisplus_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_nisplus_pic.=
a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/n=
is/libnss_compat_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-pok=
y-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_compat_pic.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnsl.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnsl_pic.map
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_nis.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-g=
nueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_nis_pic.map
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_nisplus.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_nisplus_pic.map
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibnss_compat.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libnss_compat_pic.map
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnsl.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_nis.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_nisplus.so.2
ln -s libnsl-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnsl.so.1
ln -s libnss_nisplus-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_nisplus.so.=
2
ln -s libnss_nis-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-p=
oky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_nis.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libnss_compat.so.2
ln -s libnss_compat-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_compat.so.2
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnsl.so.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_nis.so.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_nisplus.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnsl.so.1 /mnt/y=
octo/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r=
4+svnr19383/image/usr/lib/libnsl.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_nis.so.2 /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/image/usr/lib/libnss_nis.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_nisplus.so.=
2 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/usr/lib/libnss_nisplus.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_nisplus.so.new /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/lib/libnss_nisplus.so
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_compat.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libnss_compat.so.2=
 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc=
-2.16-r4+svnr19383/image/usr/lib/libnss_compat.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnsl.so.new /mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image=
/usr/lib/libnsl.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_nis.so.new /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/i=
mage/usr/lib/libnss_nis.so
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libnss_compat.so.new /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/image/usr/lib/libnss_compat.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nis'
make -j3 subdir=3Dnscd -C nscd ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nscd'
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nscd/nsc=
d /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/usr/sbin/nscd.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/sbin/nscd.new /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/sbin/nscd
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nscd'
make -j3 subdir=3Dstreams -C streams ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/streams'
/usr/bin/install -c -m 644 stropts.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/st=
ropts.h
/usr/bin/install -c -m 644 sys/stropts.h /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/includ=
e/sys/stropts.h
/usr/bin/install -c -m 644 ../bits/stropts.h /mnt/yocto/poky.git/raspberry/=
tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/in=
clude/bits/stropts.h
/usr/bin/install -c -m 644 ../bits/xtitypes.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/xtitypes.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/streams'
make -j3 subdir=3Dlogin -C login ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/login'
/usr/bin/install -c -m 644 utmp.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/utmp.=
h
/usr/bin/install -c -m 644 ../sysdeps/gnu/bits/utmp.h /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/include/bits/utmp.h
/usr/bin/install -c -m 644 lastlog.h /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/la=
stlog.h
/usr/bin/install -c -m 644 pty.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/pty.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
/usr/bin/install -c -m 644 ../sysdeps/gnu/utmpx.h /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/include/utmpx.h
/usr/bin/install -c -m 644 ../sysdeps/gnu/bits/utmpx.h /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/im=
age/usr/include/bits/utmpx.h
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/login/li=
butil.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/image/lib/libutil-2.16.so.new
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ogin/libutil.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-=
gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libutil.a
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ogin/libutil_pic.a /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libutil_pic.a
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libutil-2.16.so.new /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/lib/libutil-2.16.so
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibutil.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/libutil_pic.map
/usr/bin/install -c -m 4755 -o root /mnt/yocto/poky.git/raspberry/tmp/work/=
armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-=
gnueabi/login/pt_chown /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-pok=
y-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/libexec/pt_chown
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libutil.so.1
ln -s libutil-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libutil.so.1
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libutil.so.new
/bin/sh ../scripts/rellns-sh /mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/libutil.so.1 /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/image/usr/lib/libutil.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libutil.so.new /mnt/yocto/poky.git/ra=
spberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/imag=
e/usr/lib/libutil.so
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/login'
make -j3 subdir=3Delf -C elf ..=3D../ subdir_install
make[2]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
/usr/bin/install -c -m 644 elf.h /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/elf.h
/usr/bin/install -c -m 644 ../bits/elfclass.h /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/i=
nclude/bits/elfclass.h
/usr/bin/install -c -m 644 link.h /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/link.=
h
/usr/bin/install -c -m 644 ../ports/sysdeps/arm/bits/link.h /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/image/usr/include/bits/link.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/g=
nu/option-groups.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-li=
nux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/option-groups.h
make -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/librtld.mk -f rt=
ld-Rules
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/ldd =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/usr/bin/ldd.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/sotr=
uss /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/egl=
ibc-2.16-r4+svnr19383/image/usr/bin/sotruss.new
make[3]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
make subdir=3Dcsu -C ../csu ..=3D../ objdir=3D/mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-p=
oky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D=
'rtld-check_fds.os rtld-errno.os rtld-divdi3.os rtld-sysdep.os'
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/ldd.new /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/b=
in/ldd
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/sotruss.new /mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/u=
sr/bin/sotruss
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/sbin
make subdir=3Ddirent -C ../dirent ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-closedir.os rtld-readdir.os rtld-rewinddir.os rtld-getdents.os =
rtld-fdopendir.os'
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/sbin
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/sln =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/sbin/sln.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/sbin/sln.new /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/sbin/sln
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/sbin
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/ldco=
nfig /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/image/sbin/ldconfig.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/sbin/ldconfig.new /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/sbi=
n/ldconfig
make subdir=3Dgmon -C ../gmon ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-profil.os rtld-prof-freq.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/gmon'
make subdir=3Dio -C ../io ..=3D../ objdir=3D/mnt/yocto/poky.git/raspberry/t=
mp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-pok=
y-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=3D'r=
tld-xstat64.os rtld-fxstat64.os rtld-lxstat64.os rtld-open.os rtld-close.os=
 rtld-read.os rtld-write.os rtld-lseek.os rtld-access.os rtld-fcntl.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/dirent'
make subdir=3Dmisc -C ../misc ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-getpagesize.os rtld-mmap.os rtld-munmap.os rtld-mprotect.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/csu'
make subdir=3Dnptl -C ../nptl ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-libc-lowlevellock.os rtld-libc-cancellation.os rtld-libc_multiple_=
threads.os rtld-forward.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/io'
make subdir=3Dposix -C ../posix ..=3D../ objdir=3D/mnt/yocto/poky.git/raspb=
erry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-a=
rm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-module=
s=3D'rtld-uname.os rtld-_exit.os rtld-getpid.os rtld-environ.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/misc'
make subdir=3Dsetjmp -C ../setjmp ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-setjmp.os rtld-__longjmp.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/setjmp'
make subdir=3Dsignal -C ../signal ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-sigaction.os rtld-sigrestorer.os rtld-raise.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/signal'
make subdir=3Dstdlib -C ../stdlib ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-exit.os rtld-cxa_atexit.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/posix'
make subdir=3Dstring -C ../string ..=3D../ objdir=3D/mnt/yocto/poky.git/ras=
pberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build=
-arm-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modu=
les=3D'rtld-strchr.os rtld-strcmp.os rtld-strcpy.os rtld-strlen.os rtld-str=
nlen.os rtld-memchr.os rtld-memcmp.os rtld-memmove.os rtld-memset.os rtld-m=
empcpy.os rtld-stpcpy.os rtld-memcpy.os rtld-wordcopy.os rtld-rawmemchr.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/stdlib'
make subdir=3Dtime -C ../time ..=3D../ objdir=3D/mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi -f Makefile -f ../elf/rtld-Rules rtld-all rtld-modules=
=3D'rtld-setitimer.os'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/string'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[4]: Nothing to be done for `rtld-all'.
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/time'
make[4]: Entering directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-v=
fp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make[4]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/nptl'
make[3]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/ld.s=
o /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/lib/ld-2.16.so.new
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libc.so =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/image/lib/libc-2.16.so.new
.././scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/audit
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/ld-2.16.so.new /mnt/yocto/poky.git/raspbe=
rry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/li=
b/ld-2.16.so
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/spro=
f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/image/usr/bin/sprof.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/libc-2.16.so.new /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/=
lib/libc-2.16.so
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/audit
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/sotr=
uss-lib.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/lib/audit/sotruss-lib.so.new
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/sprof.new /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr=
/bin/sprof
/usr/bin/install -c /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-l=
inux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/elf/pldd=
 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc=
-2.16-r4+svnr19383/image/usr/bin/pldd.new
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/lib/ld-linux.so.3
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/audit/sotruss-lib.so.new /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/image/usr/lib/audit/sotruss-lib.so
ln -s ld-2.16.so /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/image/lib/ld-linux.so.3
mv -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/bin/pldd.new /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/=
bin/pldd
make[2]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/elf'
(sed '/^@/d' include/stubs-prologue.h; LC_ALL=3DC sort /mnt/yocto/poky.git/=
raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/bu=
ild-arm-poky-linux-gnueabi/csu/stubs /mnt/yocto/poky.git/raspberry/tmp/work=
/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux=
-gnueabi/iconv/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-=
linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/locale/=
stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/localedata/stubs /mnt/=
yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-=
r4+svnr19383/build-arm-poky-linux-gnueabi/iconvdata/stubs /mnt/yocto/poky.g=
it/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383=
/build-arm-poky-linux-gnueabi/assert/stubs /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky=
-linux-gnueabi/ctype/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/i=
ntl/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/catgets/stubs /mnt=
/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16=
-r4+svnr19383/build-arm-poky-linux-gnueabi/math/stubs /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/bui=
ld-arm-poky-linux-gnueabi/setjmp/stubs /mnt/yocto/poky.git/raspberry/tmp/wo=
rk/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-lin=
ux-gnueabi/signal/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/stdl=
ib/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/stdio-common/stubs =
/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-=
2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libio/stubs /mnt/yocto/poky.=
git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1938=
3/build-arm-poky-linux-gnueabi/dlfcn/stubs /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky=
-linux-gnueabi/malloc/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/=
string/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/wcsmbs/stubs /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/build-arm-poky-linux-gnueabi/timezone/stubs /mnt/yocto/poky=
.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr193=
83/build-arm-poky-linux-gnueabi/time/stubs /mnt/yocto/poky.git/raspberry/tm=
p/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky=
-linux-gnueabi/dirent/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/=
grp/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnuea=
bi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/pwd/stubs /mnt/yoc=
to/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+=
svnr19383/build-arm-poky-linux-gnueabi/posix/stubs /mnt/yocto/poky.git/rasp=
berry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-=
arm-poky-linux-gnueabi/io/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnue=
abi/termios/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/resource/s=
tubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eg=
libc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/misc/stubs /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/build-arm-poky-linux-gnueabi/socket/stubs /mnt/yocto/poky.git/raspber=
ry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm=
-poky-linux-gnueabi/sysvipc/stubs /mnt/yocto/poky.git/raspberry/tmp/work/ar=
mv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gn=
ueabi/gmon/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/gnulib/stub=
s /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/wctype/stubs /mnt/yocto/po=
ky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr1=
9383/build-arm-poky-linux-gnueabi/manual/stubs /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-=
poky-linux-gnueabi/shadow/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnue=
abi/gshadow/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-lin=
ux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/po/stubs /=
mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2=
.16-r4+svnr19383/build-arm-poky-linux-gnueabi/argp/stubs /mnt/yocto/poky.gi=
t/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/=
build-arm-poky-linux-gnueabi/crypt/stubs /mnt/yocto/poky.git/raspberry/tmp/=
work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-l=
inux-gnueabi/nptl/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/reso=
lv/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueab=
i/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nss/stubs /mnt/yoct=
o/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+s=
vnr19383/build-arm-poky-linux-gnueabi/rt/stubs /mnt/yocto/poky.git/raspberr=
y/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-=
poky-linux-gnueabi/conform/stubs /mnt/yocto/poky.git/raspberry/tmp/work/arm=
v6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnu=
eabi/debug/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linu=
x-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/libidn/stub=
s /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglib=
c-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nptl_db/stubs /mnt/yocto/p=
oky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr=
19383/build-arm-poky-linux-gnueabi/inet/stubs /mnt/yocto/poky.git/raspberry=
/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-p=
oky-linux-gnueabi/hesiod/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6=
-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnuea=
bi/sunrpc/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux=
-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/nis/stubs /m=
nt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.=
16-r4+svnr19383/build-arm-poky-linux-gnueabi/nscd/stubs /mnt/yocto/poky.git=
/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/b=
uild-arm-poky-linux-gnueabi/streams/stubs /mnt/yocto/poky.git/raspberry/tmp=
/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-=
linux-gnueabi/login/stubs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-=
poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/el=
f/stubs) > /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/stubs.h
if test -r /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnue=
abi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/stubs-soft.h && cmp -s /=
mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2=
.16-r4+svnr19383/build-arm-poky-linux-gnueabi/stubs.h /mnt/yocto/poky.git/r=
aspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/ima=
ge/usr/include/gnu/stubs-soft.h; \
then echo 'stubs.h unchanged'; \
else /usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv=
6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnue=
abi/stubs.h /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnu=
eabi/eglibc-2.16-r4+svnr19383/image/usr/include/gnu/stubs-soft.h; fi
rm -f /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/stubs.h
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/l=
ibc.map /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi=
/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_pic.map
./scripts/mkinstalldirs /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-po=
ky-linux-gnueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_pic
mkdir /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gnueabi/e=
glibc-2.16-r4+svnr19383/image/usr/lib/libc_pic
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/e=
lf/soinit.os /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_pic/soinit.o
/usr/bin/install -c -m 644 /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp=
-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/build-arm-poky-linux-gnueabi/e=
lf/sofini.os /mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky-linux-gn=
ueabi/eglibc-2.16-r4+svnr19383/image/usr/lib/libc_pic/sofini.o
make[1]: Leaving directory `/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vf=
p-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc'
install: cannot stat '/mnt/yocto/poky.git/raspberry/tmp/work/armv6-vfp-poky=
-linux-gnueabi/eglibc-2.16-r4+svnr19383/eglibc-2_16/libc/sunrpc/rpcsvc/boot=
param_prot.h': No such file or directory
ERROR: Function failed: do_install (see /mnt/yocto/poky.git/raspberry/tmp/w=
ork/armv6-vfp-poky-linux-gnueabi/eglibc-2.16-r4+svnr19383/temp/log.do_insta=
ll.13591 for further information)

--------------060103080306000209070506--
