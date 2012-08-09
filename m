Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1SzJTF-0001ZD-Qe
	for openembedded-core@lists.openembedded.org;
	Thu, 09 Aug 2012 05:31:55 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q793Jmbp003953
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 8 Aug 2012 20:19:48 -0700 (PDT)
Received: from [128.224.162.182] (128.224.162.182) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 8 Aug 2012 20:19:48 -0700
Message-ID: <50232C52.8040201@windriver.com>
Date: Thu, 9 Aug 2012 11:19:46 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <cover.1344341416.git.wenzong.fan@windriver.com>	<38e3b88585fd93495837f9f071887989a080ccd6.1344341416.git.wenzong.fan@windriver.com>
	<4B47D650-7569-4396-825C-92CB04489F87@dominion.thruhere.net>
	<502202B0.3060005@windriver.com>
	<359FE728-11F8-46F1-A134-B3A34F895EC6@dominion.thruhere.net>
In-Reply-To: <359FE728-11F8-46F1-A134-B3A34F895EC6@dominion.thruhere.net>
Cc: Zhenfeng.Zhao@windriver.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sysfsutils: install libs to base_libdir
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
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
X-List-Received-Date: Thu, 09 Aug 2012 03:31:55 -0000
X-Groupsio-MsgNum: 27220
Content-Type: multipart/mixed; boundary="------------030707010002030702090408"

--------------030707010002030702090408
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/08/2012 04:44 PM, Koen Kooi wrote:
>
> Op 8 aug. 2012, om 08:09 heeft wenzong fan<wenzong.fan@windriver.com>  het volgende geschreven:
>
>> On 08/07/2012 08:23 PM, Koen Kooi wrote:
>>>
>>> Op 7 aug. 2012, om 14:14 heeft wenzong.fan@windriver.com het volgende geschreven:
>>>
>>>> From: Wenzong Fan<wenzong.fan@windriver.com>
>>>>
>>>> Fix the warning form pcmciautils building:
>>>>
>>>> "WARNING: QA Issue: pcmciautils: /sbin/pccardctl, installed in the
>>>> base_prefix, requires a shared library under exec_prefix (/usr):
>>>> libsysfs.so.2 =>   /usr/lib/libsysfs.so.2"
>>>>
>>>> Just refer to Debian/Ubuntu distributions, install sysfsutils libs
>>>> to "/lib*" instead of "/usr/lib*".
>>>>
>>>> [YOCTO #2907]
>>>>
>>>> Signed-off-by: Wenzong Fan<wenzong.fan@windriver.com>
>>>> ---
>>>> meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb |    4 +++-
>>>> 1 file changed, 3 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>> index 3e4fdda..f01d19b 100644
>>>> --- a/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>> +++ b/meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb
>>>> @@ -8,7 +8,7 @@ LICENSE_libsysfs = "LGPLv2.1"
>>>> LIC_FILES_CHKSUM = "file://COPYING;md5=3d06403ea54c7574a9e581c6478cc393 \
>>>>                      file://cmd/GPL;md5=d41d4e2e1e108554e0388ea4aecd8d27 \
>>>>                      file://lib/LGPL;md5=b75d069791103ffe1c0d6435deeff72e"
>>>> -PR = "r3"
>>>> +PR = "r4"
>>>>
>>>> SRC_URI = "${SOURCEFORGE_MIRROR}/linux-diag/sysfsutils-${PV}.tar.gz \
>>>> 	  file://sysfsutils-2.0.0-class-dup.patch \
>>>> @@ -24,3 +24,5 @@ PACKAGES =+ "libsysfs libsysfs-dev libsysfs-staticdev"
>>>> FILES_libsysfs = "${libdir}/lib*${SOLIBS}"
>>>> FILES_libsysfs-dev = "${libdir}/lib*${SOLIBSDEV} ${includedir}"
>>>> FILES_libsysfs-staticdev = "${libdir}/lib*.a"
>>>
>>> Ahem! ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Yep, this works but looks confused, do you mean the 'export libdir' 
should be put ahead of FILES_lib*?

 From the build logs, only change is $libdir: '/usr/lib -> /lib', 
details please refer to attached file.

Thanks
Wenzong

>>>
>>>> +
>>>> +export libdir = "${base_libdir}"
>>>
>>> And can you post the buildhistory diff to see if anything else moved when it shouldn't have e.g. package config files?
>>
>> I make a diff to the build dir, only the location of 'lib/' was moved:
>
> Please post the buildhistory diff, that is much more informative. And you haven't responded to the FILES_lib* oversight.

--------------030707010002030702090408
Content-Type: text/x-diff; name="buildhistory.diff"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory.diff"

--- sysfsutils-2.1.0-r4.old/temp/log.do_configure	2012-08-08 13:59:37.769845883 +0800
+++ sysfsutils-2.1.0-r4.new/temp/log.do_configure	2012-08-07 20:04:56.334984465 +0800
@@ -33,7 +33,7 @@
 test/Makefile.am:9: library has 'testlibsysfs' as canonical name (possible typo)
 autoreconf: running: gnu-configize
 autoreconf: Leaving directory `.'
-NOTE: Running /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/configure  --build=x86_64-linux 		  --host=i586-poky-linux 		  --target=i586-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/usr/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86  
+NOTE: Running /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/configure  --build=x86_64-linux 		  --host=i586-poky-linux 		  --target=i586-poky-linux 		  --prefix=/usr 		  --exec_prefix=/usr 		  --bindir=/usr/bin 		  --sbindir=/usr/sbin 		  --libexecdir=/usr/libexec 		  --datadir=/usr/share 		  --sysconfdir=/etc 		  --sharedstatedir=/com 		  --localstatedir=/var 		  --libdir=/lib 		  --includedir=/usr/include 		  --oldincludedir=/usr/include 		  --infodir=/usr/share/info 		  --mandir=/usr/share/man 		  --disable-silent-rules 		  --disable-dependency-tracking 		  --with-libtool-sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86  
 configure: WARNING: unrecognized options: --disable-silent-rules
 configure: loading site script /buildarea/wfan/poky/meta/site/endian-little
 configure: loading site script /buildarea/wfan/poky/meta/site/ix86-common
--- sysfsutils-2.1.0-r4.old/temp/log.do_compile	2012-08-08 13:59:42.017845808 +0800
+++ sysfsutils-2.1.0-r4.new/temp/log.do_compile	2012-08-07 20:05:01.662984371 +0800
@@ -31,7 +31,7 @@
 ../i586-poky-linux-libtool  --tag=CC   --mode=compile i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I.. -I../include   -Wall -W -Wstrict-prototypes  -O2 -pipe -g -feliminate-unused-debug-types -c -o libsysfs_la-sysfs_module.lo `test -f 'sysfs_module.c' || echo './'`sysfs_module.c
 i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I.. -I../include -Wall -W -Wstrict-prototypes -O2 -pipe -g -feliminate-unused-debug-types -c sysfs_module.c  -fPIC -DPIC -o .libs/libsysfs_la-sysfs_module.o
 i586-poky-linux-libtool: compile:  i586-poky-linux-gcc -m32 -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -DHAVE_CONFIG_H -I. -I.. -I../include -Wall -W -Wstrict-prototypes -O2 -pipe -g -feliminate-unused-debug-types -c sysfs_module.c -o libsysfs_la-sysfs_module.o >/dev/null 2>&1
-../i586-poky-linux-libtool --tag=CC   --mode=link i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -Wall -W -Wstrict-prototypes  -O2 -pipe -g -feliminate-unused-debug-types -version-info 2:1:0 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libsysfs.la -rpath /usr/lib libsysfs_la-sysfs_utils.lo libsysfs_la-sysfs_attr.lo libsysfs_la-sysfs_class.lo libsysfs_la-dlist.lo libsysfs_la-sysfs_device.lo libsysfs_la-sysfs_driver.lo libsysfs_la-sysfs_bus.lo libsysfs_la-sysfs_module.lo  
+../i586-poky-linux-libtool --tag=CC   --mode=link i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -Wall -W -Wstrict-prototypes  -O2 -pipe -g -feliminate-unused-debug-types -version-info 2:1:0 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -o libsysfs.la -rpath /lib libsysfs_la-sysfs_utils.lo libsysfs_la-sysfs_attr.lo libsysfs_la-sysfs_class.lo libsysfs_la-dlist.lo libsysfs_la-sysfs_device.lo libsysfs_la-sysfs_driver.lo libsysfs_la-sysfs_bus.lo libsysfs_la-sysfs_module.lo  
 i586-poky-linux-libtool: link: i586-poky-linux-gcc  -m32   -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -shared  -fPIC -DPIC  .libs/libsysfs_la-sysfs_utils.o .libs/libsysfs_la-sysfs_attr.o .libs/libsysfs_la-sysfs_class.o .libs/libsysfs_la-dlist.o .libs/libsysfs_la-sysfs_device.o .libs/libsysfs_la-sysfs_driver.o .libs/libsysfs_la-sysfs_bus.o .libs/libsysfs_la-sysfs_module.o    -m32 -march=i586 --sysroot=/buildarea/wfan/qt4-native-4.8.1/tmp/sysroots/qemux86 -O2 -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed   -Wl,-soname -Wl,libsysfs.so.2 -o .libs/libsysfs.so.2.0.1
 i586-poky-linux-libtool: link: (cd ".libs" && rm -f "libsysfs.so.2" && ln -s "libsysfs.so.2.0.1" "libsysfs.so.2")
 i586-poky-linux-libtool: link: (cd ".libs" && rm -f "libsysfs.so" && ln -s "libsysfs.so.2.0.1" "libsysfs.so")
--- sysfsutils-2.1.0-r4.old/temp/log.do_install	2012-08-08 13:59:42.713845796 +0800
+++ sysfsutils-2.1.0-r4.new/temp/log.do_install	2012-08-07 20:05:02.906984349 +0800
@@ -4,16 +4,16 @@
 Making install in lib
 make[1]: Entering directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/lib'
 make[2]: Entering directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/lib'
- /bin/mkdir -p '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib'
- ../i586-poky-linux-libtool   --mode=install /usr/bin/install -c   libsysfs.la '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib'
-i586-poky-linux-libtool: install: /usr/bin/install -c .libs/libsysfs.so.2.0.1 /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib/libsysfs.so.2.0.1
-i586-poky-linux-libtool: install: (cd /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib && { ln -s -f libsysfs.so.2.0.1 libsysfs.so.2 || { rm -f libsysfs.so.2 && ln -s libsysfs.so.2.0.1 libsysfs.so.2; }; })
-i586-poky-linux-libtool: install: (cd /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib && { ln -s -f libsysfs.so.2.0.1 libsysfs.so || { rm -f libsysfs.so && ln -s libsysfs.so.2.0.1 libsysfs.so; }; })
-i586-poky-linux-libtool: install: /usr/bin/install -c .libs/libsysfs.lai /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib/libsysfs.la
-i586-poky-linux-libtool: install: /usr/bin/install -c .libs/libsysfs.a /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib/libsysfs.a
-i586-poky-linux-libtool: install: chmod 644 /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib/libsysfs.a
-i586-poky-linux-libtool: install: i586-poky-linux-ranlib /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/lib/libsysfs.a
-i586-poky-linux-libtool: install: warning: remember to run `i586-poky-linux-libtool --finish /usr/lib'
+ /bin/mkdir -p '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib'
+ ../i586-poky-linux-libtool   --mode=install /usr/bin/install -c   libsysfs.la '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib'
+i586-poky-linux-libtool: install: /usr/bin/install -c .libs/libsysfs.so.2.0.1 /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib/libsysfs.so.2.0.1
+i586-poky-linux-libtool: install: (cd /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib && { ln -s -f libsysfs.so.2.0.1 libsysfs.so.2 || { rm -f libsysfs.so.2 && ln -s libsysfs.so.2.0.1 libsysfs.so.2; }; })
+i586-poky-linux-libtool: install: (cd /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib && { ln -s -f libsysfs.so.2.0.1 libsysfs.so || { rm -f libsysfs.so && ln -s libsysfs.so.2.0.1 libsysfs.so; }; })
+i586-poky-linux-libtool: install: /usr/bin/install -c .libs/libsysfs.lai /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib/libsysfs.la
+i586-poky-linux-libtool: install: /usr/bin/install -c .libs/libsysfs.a /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib/libsysfs.a
+i586-poky-linux-libtool: install: chmod 644 /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib/libsysfs.a
+i586-poky-linux-libtool: install: i586-poky-linux-ranlib /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/lib/libsysfs.a
+i586-poky-linux-libtool: install: warning: remember to run `i586-poky-linux-libtool --finish /lib'
 make[2]: Nothing to be done for `install-data-am'.
 make[2]: Leaving directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/lib'
 make[1]: Leaving directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/lib'
@@ -22,7 +22,7 @@
 make[2]: Entering directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/cmd'
  /bin/mkdir -p '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin'
   ../i586-poky-linux-libtool   --mode=install /usr/bin/install -c systool '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin'
-i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/usr/lib'
+i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/lib'
 i586-poky-linux-libtool: install: /usr/bin/install -c .libs/systool /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin/systool
 make[2]: Nothing to be done for `install-data-am'.
 make[2]: Leaving directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/cmd'
@@ -34,13 +34,13 @@
 make[3]: Entering directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/test'
  /bin/mkdir -p '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin'
   ../i586-poky-linux-libtool   --mode=install /usr/bin/install -c dlist_test get_device get_driver get_module '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin'
-i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/usr/lib'
+i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/lib'
 i586-poky-linux-libtool: install: /usr/bin/install -c .libs/dlist_test /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin/dlist_test
-i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/usr/lib'
+i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/lib'
 i586-poky-linux-libtool: install: /usr/bin/install -c .libs/get_device /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin/get_device
-i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/usr/lib'
+i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/lib'
 i586-poky-linux-libtool: install: /usr/bin/install -c .libs/get_driver /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin/get_driver
-i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/usr/lib'
+i586-poky-linux-libtool: install: warning: `../lib/libsysfs.la' has not been installed in `/lib'
 i586-poky-linux-libtool: install: /usr/bin/install -c .libs/get_module /buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/image/usr/bin/get_module
 make[3]: Nothing to be done for `install-data-am'.
 make[3]: Leaving directory `/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/sysfsutils-2.1.0/test'
--- sysfsutils-2.1.0-r4.old/temp/log.do_package	2012-08-08 13:59:46.921845721 +0800
+++ sysfsutils-2.1.0-r4.new/temp/log.do_package	2012-08-07 20:05:14.494984144 +0800
@@ -9,12 +9,12 @@
 DEBUG: No locale files in this package
 DEBUG: Python function package_do_split_locales finished
 DEBUG: Executing python function split_and_strip_files
-DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note --strip-unneeded '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/usr/lib/libsysfs.so.2.0.1'
 DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/usr/bin/get_driver'
 DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/usr/bin/dlist_test'
 DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/usr/bin/get_module'
 DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/usr/bin/get_device'
 DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/usr/bin/systool'
+DEBUG: runstrip: 'i586-poky-linux-strip' --remove-section=.comment --remove-section=.note --strip-unneeded '/buildarea/wfan/qt4-native-4.8.1/tmp/work/i586-poky-linux/sysfsutils-2.1.0-r4/package/lib/libsysfs.so.2.0.1'
 DEBUG: Python function split_and_strip_files finished
 DEBUG: Executing python function fixup_perms
 DEBUG: Python function fixup_perms finished
@@ -32,7 +32,7 @@
 DEBUG: LIBNAMES: pkg libsysfs libs 1 bins 0 sonames ['libsysfs.so.2']
 DEBUG: Python function debian_package_name_hook finished
 DEBUG: Python function package_name_hook finished
-DEBUG: libsysfs-dev contains dangling link /usr/lib/libsysfs.so.2.0.1
+DEBUG: libsysfs-dev contains dangling link /lib/libsysfs.so.2.0.1
 DEBUG: target found in libsysfs
 DEBUG: Python function populate_packages finished
 DEBUG: Executing python function package_do_filedeps

--------------030707010002030702090408--
