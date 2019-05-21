Return-Path: <pn@denx.de>
X-Greylist: delayed 543 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 May 2019 09:03:49 UTC
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id 9FCEA7D674
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2019 09:03:49 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 457V2G6Mcyz1rJgl;
	Tue, 21 May 2019 10:54:46 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 457V2G67Hgz1qql1;
	Tue, 21 May 2019 10:54:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id 6hGIhvBqubol; Tue, 21 May 2019 10:54:45 +0200 (CEST)
X-Auth-Info: bf4QDpx1/YIWPqXPHGztSE8fYh5vHvrQ/AsmX+N8psk=
Received: from antares.denx.de (unknown [62.91.23.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Tue, 21 May 2019 10:54:45 +0200 (CEST)
To: openembedded-core@lists.openembedded.org
From: Parthiban Nallathambi <pn@denx.de>
Message-ID: <6fb3f28f-fa50-ba0e-34ff-a3a0787b8518@denx.de>
Date: Tue, 21 May 2019 10:54:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
Cc: pn@denx.de
Subject: Fedora 30: Yocto support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 May 2019 09:03:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello All,

I am trying to compile yocto for my Raspberry PI 0 under Fedora 30. But
the compilation fails with GLIBC dependency. Please find the logs below.

Any hints/clues to fix this would be helpful. Thanks.

**Logs:**
| 
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/build/Bootstrap.cmk/cmake: 
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6: 
version `GLIBCXX_3.4.26' not found (required by 
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/build/Bootstrap.cmk/cmake)
| ---------------------------------------------
| Error when bootstrapping CMake:
| Problem while running initial CMake
| ---------------------------------------------
| WARNING: 
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/temp/run.do_configure.3874946:1 
exit 11 from 
'/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/cmake-3.14.1/configure 
--verbose 
--prefix=/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/recipe-sysroot-native/usr 
--parallel=8 -- 
-DCMAKE_LIBRARY_PATH=/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/recipe-sysroot-native/usr/lib 
-DBUILD_CursesDialog=1 -DCMAKE_USE_SYSTEM_LIBRARIES=1 
-DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 
-DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 
-DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 
-DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 -DHAVE_SYS_ACL_H=0'
| ERROR: Function failed: do_configure (log file is located at 
/work/rpi/zero/tmp/work/x86_64-linux/cmake-native/3.14.1-r0/temp/log.do_configure.3874946)
ERROR: Task 
(/work/rpi/poky/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb:do_configure) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 1367 tasks of which 710 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
 
/work/rpi/poky/meta/recipes-devtools/cmake/cmake-native_3.14.1.bb:do_configure
Summary: There was 1 WARNING message shown.
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

**GLIBC Version details**:
$ l 
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
-rwxr-xr-x 1 pn pn 1.5M Mar 18 13:47 
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25
$
$ file 
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25 

/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25: 
ELF 64-bit LSB shared object, x86-64, version 1 (GNU/Linux), dynamically 
linked, BuildID[sha1]=d0e848faaac570e8ceca884083b6e09e23cb9e2b, stripped
$
$
$ ldd 
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25 

         linux-vdso.so.1 (0x00007fffc3901000)
         libm.so.6 => /lib64/libm.so.6 (0x00007f341ea84000)
         libc.so.6 => /lib64/libc.so.6 (0x00007f341e8be000)
         /lib64/ld-linux-x86-64.so.2 (0x00007f341edad000)
         libgcc_s.so.1 => /lib64/libgcc_s.so.1 (0x00007f341e8a4000)
$ strings 
/work/rpi/zero/tmp/sysroots-uninative/x86_64-linux/usr/lib/libstdc++.so.6.0.25 
| grep GLIBC
GLIBCXX_3.4
GLIBCXX_3.4.1
GLIBCXX_3.4.2
GLIBCXX_3.4.3
GLIBCXX_3.4.4
GLIBCXX_3.4.5
GLIBCXX_3.4.6
GLIBCXX_3.4.7
GLIBCXX_3.4.8
GLIBCXX_3.4.9
GLIBCXX_3.4.10
GLIBCXX_3.4.11
GLIBCXX_3.4.12
GLIBCXX_3.4.13
GLIBCXX_3.4.14
GLIBCXX_3.4.15
GLIBCXX_3.4.16
GLIBCXX_3.4.17
GLIBCXX_3.4.18
GLIBCXX_3.4.19
GLIBCXX_3.4.20
GLIBCXX_3.4.21
GLIBCXX_3.4.22
GLIBCXX_3.4.23
GLIBCXX_3.4.24
GLIBCXX_3.4.25
GLIBC_2.2.5
GLIBC_2.3
GLIBC_2.14
GLIBC_2.18
GLIBC_2.16
GLIBC_2.17
GLIBC_2.3.2
GLIBCXX_DEBUG_MESSAGE_LENGTH
$ l /usr/lib/libstdc++.so.6*
lrwxrwxrwx 1 root root   19 May  3 16:11 /usr/lib/libstdc++.so.6 -> 
libstdc++.so.6.0.26
-rwxr-xr-x 1 root root 2.0M May  3 16:18 /usr/lib/libstdc++.so.6.0.26

-- 
Thanks,
Parthiban N

DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-22 Fax: (+49)-8142-66989-80 Email: pn@denx.de

