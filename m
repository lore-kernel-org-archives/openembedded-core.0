Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web11.1352.1618510602014049993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id DD82338C11D7
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] powertop: upgrading to 2.14 FAILED
Message-ID: <MADEUP.16761AD17298485A.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150571
Content-Type: multipart/mixed; boundary="===============5345881113852253652=="

--===============5345881113852253652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *powertop* to *2.14* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-powertop-upgrade-2.13-2.14.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

--===============5345881113852253652==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-powertop-upgrade-2.13-2.14.patch"

From 71baa12927f082d76d981b441d7afcedc31c687f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 15:19:05 +0000
Subject: [PATCH] powertop: upgrade 2.13 -> 2.14

---
 .../powertop/{powertop_2.13.bb => powertop_2.14.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/powertop/{powertop_2.13.bb => powertop_2.14.bb} (95%)

diff --git a/meta/recipes-kernel/powertop/powertop_2.13.bb b/meta/recipes-kernel/powertop/powertop_2.14.bb
similarity index 95%
rename from meta/recipes-kernel/powertop/powertop_2.13.bb
rename to meta/recipes-kernel/powertop/powertop_2.14.bb
index 8c7e78fd94..ee7897c1a8 100644
--- a/meta/recipes-kernel/powertop/powertop_2.13.bb
+++ b/meta/recipes-kernel/powertop/powertop_2.14.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=12f884d2ae1ff87c09e5b7ccc2c4ca7e"
 SRC_URI = "git://github.com/fenrus75/powertop;protocol=https \
     file://0001-wakeup_xxx.h-include-limits.h.patch \
 "
-SRCREV = "184cee06b2d64679bae5f806fe0a218827fdde99"
+SRCREV = "52f022f9bbe6e060fba11701d657a8d9762702ba"
 
 S = "${WORKDIR}/git"
 
-- 
2.27.0


--===============5345881113852253652==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

NOTE: Reconnecting to bitbake server...
NOTE: Previous bitbake instance shutting down?, waiting to retry...
NOTE: Retrying server connection (#1)...
Loading cache...done.
Loaded 1438 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:9bbe157abb79fb8ff99ce45e8aba3246ac6d2991"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 180 Local 172 Network 0 Missed 8 Current 503 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1562 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_fetch)
NOTE: recipe powertop-2.14-r0: task do_fetch: Started
NOTE: recipe powertop-2.14-r0: task do_fetch: Succeeded
NOTE: Running task 2160 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_unpack)
NOTE: Running task 2161 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe powertop-2.14-r0: task do_unpack: Started
NOTE: recipe powertop-2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe powertop-2.14-r0: task do_unpack: Succeeded
NOTE: Running task 2162 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_patch)
NOTE: recipe powertop-2.14-r0: task do_patch: Started
NOTE: recipe powertop-2.14-r0: task do_patch: Succeeded
NOTE: Running task 2163 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_deploy_source_date_epoch)
NOTE: Running task 2164 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_populate_lic)
NOTE: recipe powertop-2.14-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe powertop-2.14-r0: task do_populate_lic: Started
NOTE: recipe powertop-2.14-r0: task do_populate_lic: Succeeded
NOTE: recipe powertop-2.14-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe powertop-2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2165 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_configure)
NOTE: recipe powertop-2.14-r0: task do_configure: Started
NOTE: recipe powertop-2.14-r0: task do_configure: Succeeded
NOTE: Running task 2166 of 2173 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_compile)
NOTE: recipe powertop-2.14-r0: task do_compile: Started
ERROR: powertop-2.14-r0 do_compile: oe_runmake failed
ERROR: powertop-2.14-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454' failed with exit code 1:
make  all-recursive
make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build'
Making all in traceevent
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/traceevent'
../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o event-parse.lo ../../git/traceevent/event-parse.c
../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o parse-filter.lo ../../git/traceevent/parse-filter.c
../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o parse-utils.lo ../../git/traceevent/parse-utils.c
../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/buil
 d/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o trace-seq.lo ../../git/traceevent/trace-seq.c
i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../gi
 t/traceevent/event-parse.c  -fPIC -DPIC -o .libs/event-parse.o
i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../gi
 t/traceevent/parse-filter.c  -fPIC -DPIC -o .libs/parse-filter.o
i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../gi
 t/traceevent/parse-utils.c  -fPIC -DPIC -o .libs/parse-utils.o
i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../gi
 t/traceevent/trace-seq.c  -fPIC -DPIC -o .libs/trace-seq.o
../i686-poky-linux-libtool  --tag=CC   --mode=link i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/
 recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o libtraceevnet.la  event-parse.lo parse-filter.lo parse-utils.lo trace-seq.lo  
i686-poky-linux-libtool: link: i686-poky-linux-gcc-ar cru .libs/libtraceevnet.a .libs/event-parse.o .libs/parse-filter.o .libs/parse-utils.o .libs/trace-seq.o 
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
i686-poky-linux-libtool: link: i686-poky-linux-gcc-ranlib .libs/libtraceevnet.a
i686-poky-linux-libtool: link: ( cd ".libs" && rm -f "libtraceevnet.la" && ln -s "../libtraceevnet.la" "libtraceevnet.la" )
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/traceevent'
Making all in src
make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
/bin/bash ../../git/src/csstoh.sh ../../git/src/powertop.css css.h
make  all-am
make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-devlist.o `test -f 'devlist.cpp' || echo '../../git/src/'`devlist.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-display.o `test -f 'display.cpp' || echo '../../git/src/'`display.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-lib.o `test -f 'lib.cpp' || echo '../../git/src/'`lib.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-main.o `test -f 'main.cpp' || echo '../../git/src/'`main.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o calibrate/powertop-calibrate.o `test -f 'calibrate/calibrate.cpp' || echo '../../git/src/'`calibrate/calibrate.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-abstract_cpu.o `test -f 'cpu/abstract_cpu.cpp' || echo '../../git/src/'`cpu/abstract_cpu.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu.o `test -f 'cpu/cpu.cpp' || echo '../../git/src/'`cpu/cpu.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_core.o `test -f 'cpu/cpu_core.cpp' || echo '../../git/src/'`cpu/cpu_core.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_linux.o `test -f 'cpu/cpu_linux.cpp' || echo '../../git/src/'`cpu/cpu_linux.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_package.o `test -f 'cpu/cpu_package.cpp' || echo '../../git/src/'`cpu/cpu_package.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_rapl_device.o `test -f 'cpu/cpu_rapl_device.cpp' || echo '../../git/src/'`cpu/cpu_rapl_device.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpudevice.o `test -f 'cpu/cpudevice.cpp' || echo '../../git/src/'`cpu/cpudevice.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-dram_rapl_device.o `test -f 'cpu/dram_rapl_device.cpp' || echo '../../git/src/'`cpu/dram_rapl_device.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-intel_cpus.o `test -f 'cpu/intel_cpus.cpp' || echo '../../git/src/'`cpu/intel_cpus.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-intel_gpu.o `test -f 'cpu/intel_gpu.cpp' || echo '../../git/src/'`cpu/intel_gpu.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/rapl/powertop-rapl_interface.o `test -f 'cpu/rapl/rapl_interface.cpp' || echo '../../git/src/'`cpu/rapl/rapl_interface.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-ahci.o `test -f 'devices/ahci.cpp' || echo '../../git/src/'`devices/ahci.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-alsa.o `test -f 'devices/alsa.cpp' || echo '../../git/src/'`devices/alsa.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-backlight.o `test -f 'devices/backlight.cpp' || echo '../../git/src/'`devices/backlight.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-devfreq.o `test -f 'devices/devfreq.cpp' || echo '../../git/src/'`devices/devfreq.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-device.o `test -f 'devices/device.cpp' || echo '../../git/src/'`devices/device.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-gpu_rapl_device.o `test -f 'devices/gpu_rapl_device.cpp' || echo '../../git/src/'`devices/gpu_rapl_device.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-i915-gpu.o `test -f 'devices/i915-gpu.cpp' || echo '../../git/src/'`devices/i915-gpu.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-network.o `test -f 'devices/network.cpp' || echo '../../git/src/'`devices/network.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-rfkill.o `test -f 'devices/rfkill.cpp' || echo '../../git/src/'`devices/rfkill.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-runtime_pm.o `test -f 'devices/runtime_pm.cpp' || echo '../../git/src/'`devices/runtime_pm.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-thinkpad-fan.o `test -f 'devices/thinkpad-fan.cpp' || echo '../../git/src/'`devices/thinkpad-fan.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-thinkpad-light.o `test -f 'devices/thinkpad-light.cpp' || echo '../../git/src/'`devices/thinkpad-light.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-usb.o `test -f 'devices/usb.cpp' || echo '../../git/src/'`devices/usb.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-acpi.o `test -f 'measurement/acpi.cpp' || echo '../../git/src/'`measurement/acpi.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-extech.o `test -f 'measurement/extech.cpp' || echo '../../git/src/'`measurement/extech.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-measurement.o `test -f 'measurement/measurement.cpp' || echo '../../git/src/'`measurement/measurement.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-sysfs.o `test -f 'measurement/sysfs.cpp' || echo '../../git/src/'`measurement/sysfs.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-opal-sensors.o `test -f 'measurement/opal-sensors.cpp' || echo '../../git/src/'`measurement/opal-sensors.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-learn.o `test -f 'parameters/learn.cpp' || echo '../../git/src/'`parameters/learn.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-parameters.o `test -f 'parameters/parameters.cpp' || echo '../../git/src/'`parameters/parameters.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-persistent.o `test -f 'parameters/persistent.cpp' || echo '../../git/src/'`parameters/persistent.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o perf/powertop-perf.o `test -f 'perf/perf.cpp' || echo '../../git/src/'`perf/perf.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o perf/powertop-perf_bundle.o `test -f 'perf/perf_bundle.cpp' || echo '../../git/src/'`perf/perf_bundle.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-do_process.o `test -f 'process/do_process.cpp' || echo '../../git/src/'`process/do_process.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-interrupt.o `test -f 'process/interrupt.cpp' || echo '../../git/src/'`process/interrupt.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-powerconsumer.o `test -f 'process/powerconsumer.cpp' || echo '../../git/src/'`process/powerconsumer.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-process.o `test -f 'process/process.cpp' || echo '../../git/src/'`process/process.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-processdevice.o `test -f 'process/processdevice.cpp' || echo '../../git/src/'`process/processdevice.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-timer.o `test -f 'process/timer.cpp' || echo '../../git/src/'`process/timer.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-work.o `test -f 'process/work.cpp' || echo '../../git/src/'`process/work.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-data-html.o `test -f 'report/report-data-html.cpp' || echo '../../git/src/'`report/report-data-html.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-base.o `test -f 'report/report-formatter-base.cpp' || echo '../../git/src/'`report/report-formatter-base.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-csv.o `test -f 'report/report-formatter-csv.cpp' || echo '../../git/src/'`report/report-formatter-csv.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-html.o `test -f 'report/report-formatter-html.cpp' || echo '../../git/src/'`report/report-formatter-html.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-maker.o `test -f 'report/report-maker.cpp' || echo '../../git/src/'`report/report-maker.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report.o `test -f 'report/report.cpp' || echo '../../git/src/'`report/report.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-bluetooth.o `test -f 'tuning/bluetooth.cpp' || echo '../../git/src/'`tuning/bluetooth.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-ethernet.o `test -f 'tuning/ethernet.cpp' || echo '../../git/src/'`tuning/ethernet.cpp
i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/buil
 d/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o tuning/powertop-iw.o `test -f 'tuning/iw.c' || echo '../../git/src/'`tuning/iw.c
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-runtime.o `test -f 'tuning/runtime.cpp' || echo '../../git/src/'`tuning/runtime.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tunable.o `test -f 'tuning/tunable.cpp' || echo '../../git/src/'`tuning/tunable.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
                 from ../../git/src/measurement/../lib.h:31,
                 from ../../git/src/measurement/sysfs.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
    inlined from 'sysfs_power_meter::sysfs_power_meter(const char*)' at ../../git/src/measurement/sysfs.cpp:36:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
                 from ../../git/src/measurement/../lib.h:31,
                 from ../../git/src/measurement/opal-sensors.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'opal_sensors_power_meter::opal_sensors_power_meter(const char*)' at ../../git/src/measurement/opal-sensors.cpp:34:9:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuning.o `test -f 'tuning/tuning.cpp' || echo '../../git/src/'`tuning/tuning.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningsysfs.o `test -f 'tuning/tuningsysfs.cpp' || echo '../../git/src/'`tuning/tuningsysfs.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningusb.o `test -f 'tuning/tuningusb.cpp' || echo '../../git/src/'`tuning/tuningusb.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/process/interrupt.cpp:26:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
    inlined from 'interrupt::interrupt(const char*, int)' at ../../git/src/process/interrupt.cpp:52:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningi2c.o `test -f 'tuning/tuningi2c.cpp' || echo '../../git/src/'`tuning/tuningi2c.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-wifi.o `test -f 'tuning/wifi.cpp' || echo '../../git/src/'`tuning/wifi.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/measurement/acpi.cpp:29:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
    inlined from 'acpi_power_meter::acpi_power_meter(const char*)' at ../../git/src/measurement/acpi.cpp:42:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup.o `test -f 'wakeup/wakeup.cpp' || echo '../../git/src/'`wakeup/wakeup.cpp
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-waketab.o `test -f 'wakeup/waketab.cpp' || echo '../../git/src/'`wakeup/waketab.cpp
../../git/src/parameters/parameters.cpp: In function 'int global_power_valid()':
../../git/src/parameters/parameters.cpp:443:40: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'std::vector<double>::size_type' {aka 'unsigned int'} [-Wformat=]
  443 |   printf("To show power estimates do %ld measurement(s) connected to battery only\n",
      |                                      ~~^
      |                                        |
      |                                        long int
      |                                      %d
  444 |    (3 * all_parameters.parameters.size()) - past_results.size());
      |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
      |                                           |
      |                                           std::vector<double>::size_type {aka unsigned int}
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup_ethernet.o `test -f 'wakeup/wakeup_ethernet.cpp' || echo '../../git/src/'`wakeup/wakeup_ethernet.cpp
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/measurement/extech.cpp:40:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
    inlined from 'extech_power_meter::extech_power_meter(const char*)' at ../../git/src/measurement/extech.cpp:272:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                    
   -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup_usb.o `test -f 'wakeup/wakeup_usb.cpp' || echo '../../git/src/'`wakeup/wakeup_usb.cpp
../../git/src/devices/backlight.cpp: In member function 'virtual double backlight::power_usage(result_bundle*, parameter_bundle*)':
../../git/src/devices/backlight.cpp:217:25: warning: '-power' directive writing 6 bytes into a region of size between 1 and 4096 [-Wformat-overflow=]
  217 |   sprintf(powername, "%s-power", name);
      |                         ^~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/backlight.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:34: note: '__builtin___sprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
   38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   39 |       __glibc_objsize (__s), __fmt,
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   40 |       __va_arg_pack ());
      |       ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/cpu/cpudevice.cpp:28:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/cpu/../lib.h:78:9,
    inlined from 'cpudevice::cpudevice(const char*, const char*, abstract_cpu*)' at ../../git/src/cpu/cpudevice.cpp:35:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/cpu/../lib.h:78:9,
    inlined from 'cpudevice::cpudevice(const char*, const char*, abstract_cpu*)' at ../../git/src/cpu/cpudevice.cpp:36:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
                 from ../../git/src/tuning/../lib.h:31,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/ethernet.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'ethernet_tunable::ethernet_tunable(const char*)' at ../../git/src/tuning/ethernet.cpp:53:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/backlight.cpp:38:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'backlight::backlight(const char*, const char*)' at ../../git/src/devices/backlight.cpp:49:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/alsa.cpp: In member function 'virtual const char* alsa::human_name()':
../../git/src/devices/alsa.cpp:205:43: warning: ' (' directive output may be truncated writing 2 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  205 |   snprintf(temp_buf, sizeof(temp_buf), "%s (%s)", humanname, guilty);
      |                                           ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/alsa.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 4 and 8194 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/rfkill.h:31,
                 from ../../git/src/devices/rfkill.cpp:38:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'rfkill::rfkill(char*, char*)' at ../../git/src/devices/rfkill.cpp:53:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/backlight.cpp: In member function 'virtual void backlight::end_measurement()':
../../git/src/devices/backlight.cpp:125:42: warning: '/actual_brightness' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  125 |  snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/backlight.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/backlight.cpp:140:44: warning: '-power' directive output may be truncated writing 6 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  140 |  snprintf(powername, sizeof(powername), "%s-power", name);
      |                                            ^~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/backlight.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/alsa.h:30,
                 from ../../git/src/devices/alsa.cpp:35:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'alsa::alsa(const char*, const char*)' at ../../git/src/devices/alsa.cpp:54:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/runtime_pm.h:31,
                 from ../../git/src/devices/runtime_pm.cpp:25:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'runtime_pmdevice::runtime_pmdevice(const char*, const char*)' at ../../git/src/devices/runtime_pm.cpp:43:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'runtime_pmdevice::runtime_pmdevice(const char*, const char*)' at ../../git/src/devices/runtime_pm.cpp:45:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/rfkill.cpp: In member function 'virtual void rfkill::end_measurement()':
../../git/src/devices/rfkill.cpp:103:42: warning: '/hard' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  103 |  snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
      |                                          ^~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/rfkill.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/rfkill.cpp:109:42: warning: '/soft' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  109 |  snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
      |                                          ^~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/rfkill.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'void runtime_pmdevice::set_human_name(char*)' at ../../git/src/devices/runtime_pm.cpp:144:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/runtime_pm.cpp: In member function 'virtual void runtime_pmdevice::start_measurement()':
../../git/src/devices/runtime_pm.cpp:69:42: warning: '/power/runtime_suspended_time' directive output may be truncated writing 29 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   69 |  snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/runtime_pm.h:31,
                 from ../../git/src/devices/runtime_pm.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 30 and 4125 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/runtime_pm.cpp:76:42: warning: '/power/runtime_active_time' directive output may be truncated writing 26 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   76 |  snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/runtime_pm.h:31,
                 from ../../git/src/devices/runtime_pm.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:47:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:49:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:50:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/rfkill.cpp: In member function 'virtual void rfkill::start_measurement()':
../../git/src/devices/rfkill.cpp:83:42: warning: '/hard' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   83 |  snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
      |                                          ^~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/rfkill.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/rfkill.cpp:90:42: warning: '/soft' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   90 |  snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
      |                                          ^~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/rfkill.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/alsa.cpp: In member function 'virtual void alsa::start_measurement()':
../../git/src/devices/alsa.cpp:89:42: warning: '/power_off_acct' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   89 |  snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/alsa.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/alsa.cpp:96:43: warning: '/power_on_acct' directive output may be truncated writing 14 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   96 |   snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
      |                                           ^~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/alsa.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 15 and 4110 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/backlight.cpp: In member function 'virtual void backlight::start_measurement()':
../../git/src/devices/backlight.cpp:61:42: warning: '/max_brightness' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   61 |  snprintf(filename, sizeof(filename), "%s/max_brightness", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/backlight.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/backlight.cpp:68:42: warning: '/actual_brightness' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   68 |  snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/backlight.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/process/timer.cpp:29:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
    inlined from 'timer::timer(long unsigned int)' at ../../git/src/process/timer.cpp:64:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/alsa.cpp: In member function 'virtual void alsa::end_measurement()':
../../git/src/devices/alsa.cpp:115:42: warning: '/power_off_acct' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  115 |  snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/alsa.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/alsa.cpp:122:43: warning: '/power_on_acct' directive output may be truncated writing 14 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  122 |   snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
      |                                           ^~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/alsa.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 15 and 4110 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/runtime_pm.cpp: In member function 'virtual void runtime_pmdevice::end_measurement()':
../../git/src/devices/runtime_pm.cpp:89:42: warning: '/power/runtime_suspended_time' directive output may be truncated writing 29 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   89 |  snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/runtime_pm.h:31,
                 from ../../git/src/devices/runtime_pm.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 30 and 4125 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/runtime_pm.cpp:96:42: warning: '/power/runtime_active_time' directive output may be truncated writing 26 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
   96 |  snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/runtime_pm.h:31,
                 from ../../git/src/devices/runtime_pm.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/ahci.h:32,
                 from ../../git/src/devices/ahci.cpp:39:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'ahci::ahci(char*, char*)' at ../../git/src/devices/ahci.cpp:130:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/ahci.cpp: In constructor 'ahci::ahci(char*, char*)':
../../git/src/devices/ahci.cpp:139:38: warning: '-active' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  139 |  snprintf(buffer, sizeof(buffer), "%s-active", name);
      |                                      ^~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:142:38: warning: '-partial' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  142 |  snprintf(buffer, sizeof(buffer), "%s-partial", name);
      |                                      ^~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:145:38: warning: '-slumber' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  145 |  snprintf(buffer, sizeof(buffer), "%s-slumber", name);
      |                                      ^~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:148:38: warning: '-devslp' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  148 |  snprintf(buffer, sizeof(buffer), "%s-devslp", name);
      |                                      ^~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:54:43: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
   54 |  snprintf(pathname, sizeof(pathname), "%s/%s", path, target);
      |                                           ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:68:36: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
   68 |   snprintf(line, sizeof(line), "%s/%s/model", pathname, dirent->d_name);
      |                                    ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4358 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/device.cpp: In member function 'void device::register_sysfs_path(const char*)':
../../git/src/devices/device.cpp:75:45: warning: '/device' directive output may be truncated writing 7 bytes into a region of size between 1 and 4097 [-Wformat-truncation=]
   75 |   snprintf(test_path, sizeof(test_path), "%s/device", current_path);
      |                                             ^~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from ../../git/src/devices/device.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4104 bytes into a destination of size 4097
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/usb.cpp: In member function 'virtual void usbdevice::start_measurement()':
../../git/src/devices/usb.cpp:129:42: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  129 |  snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/usb.cpp:136:42: warning: '/power/connected_duration' directive output may be truncated writing 25 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  136 |  snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
                 from ../../git/src/tuning/../lib.h:31,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tunable.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:38:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:39:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:40:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:41:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:49:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:50:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:51:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/process/work.cpp:29:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
    inlined from 'work::work(long unsigned int)' at ../../git/src/process/work.cpp:41:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/usb.cpp: In member function 'virtual void usbdevice::end_measurement()':
../../git/src/devices/usb.cpp:149:42: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  149 |  snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/usb.cpp:156:42: warning: '/power/connected_duration' directive output may be truncated writing 25 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  156 |  snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/devfreq.h:29,
                 from ../../git/src/devices/devfreq.cpp:35:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'devfreq::devfreq(const char*)' at ../../git/src/devices/devfreq.cpp:48:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/ahci.cpp: In member function 'virtual void ahci::end_measurement()':
../../git/src/devices/ahci.cpp:206:43: warning: '/ahci_alpm_active' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  206 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:212:43: warning: '/ahci_alpm_partial' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  212 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:218:43: warning: '/ahci_alpm_slumber' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  218 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:224:43: warning: '/ahci_alpm_devslp' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  224 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:248:44: warning: '-active' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  248 |  snprintf(powername, sizeof(powername), "%s-active", name);
      |                                            ^~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:255:44: warning: '-partial' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  255 |  snprintf(powername, sizeof(powername), "%s-partial", name);
      |                                            ^~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:262:44: warning: '-slumber' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  262 |  snprintf(powername, sizeof(powername), "%s-slumber", name);
      |                                            ^~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:269:44: warning: '-devslp' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  269 |  snprintf(powername, sizeof(powername), "%s-devslp", name);
      |                                            ^~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/process/process.cpp:29:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 16]' at ../../git/src/process/../lib.h:78:9,
    inlined from 'process::process(const char*, int, int)' at ../../git/src/process/process.cpp:94:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 16 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'process::process(const char*, int, int)' at ../../git/src/process/process.cpp:147:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' output may be truncated copying between 0 and 255 bytes from a string of length 4096 [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/devices/usb.cpp: In function 'void create_all_usb_devices_callback(const char*)':
../../git/src/devices/usb.cpp:226:48: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  226 |  snprintf(device_name, sizeof(device_name), "%s/power/active_duration", filename);
      |                                                ^~~~~~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/usb.cpp:230:48: warning: '/idVendor' directive output may be truncated writing 9 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  230 |  snprintf(device_name, sizeof(device_name), "%s/idVendor", filename);
      |                                                ^~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 10 and 4105 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/usb.cpp:235:48: warning: '/idProduct' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  235 |  snprintf(device_name, sizeof(device_name), "%s/idProduct", filename);
      |                                                ^~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/devices/../parameters/parameters.h:31,
                 from ../../git/src/devices/usb.h:31,
                 from ../../git/src/devices/usb.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
    inlined from 'timer::timer(long unsigned int)' at ../../git/src/process/timer.cpp:64:11,
    inlined from 'timer* find_create_timer(uint64_t)' at ../../git/src/process/timer.cpp:139:30:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/tuning/runtime.cpp: In constructor 'runtime_tunable::runtime_tunable(const char*, const char*, const char*, const char*)':
../../git/src/tuning/runtime.cpp:86:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
   86 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", runtime_path);
      |                                                             ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/runtime.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/runtime.cpp:87:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
   87 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", runtime_path);
      |                                                         ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/runtime.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp: In member function 'virtual void ahci::start_measurement()':
../../git/src/devices/ahci.cpp:164:42: warning: '/ahci_alpm_active' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  164 |  snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
      |                                          ^~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:171:43: warning: '/ahci_alpm_partial' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  171 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:178:43: warning: '/ahci_alpm_slumber' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  178 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/devices/ahci.cpp:184:43: warning: '/ahci_alpm_devslp' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
  184 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
      |                                           ^~~~~~~~~~~~~~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
                 from ../../git/src/devices/ahci.cpp:25:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
                 from ../../git/src/tuning/../lib.h:31,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningsysfs.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)' at ../../git/src/tuning/tuningsysfs.cpp:47:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)' at ../../git/src/tuning/tuningsysfs.cpp:48:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/tuning/tuningsysfs.cpp: In constructor 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)':
../../git/src/tuning/tuningsysfs.cpp:50:52: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4090 [-Wformat-truncation=]
   50 |  snprintf(toggle_good, sizeof(toggle_good), "echo '%s' > '%s';", target_value, sysfs_path);
      |                                                    ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningsysfs.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 14 and 8204 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/tuningsysfs.cpp:51:50: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4090 [-Wformat-truncation=]
   51 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo '%s' > '%s';", bad_value, sysfs_path);
      |                                                  ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningsysfs.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 14 and 8204 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/devices/../parameters/parameters.h:33,
                 from ../../git/src/devices/network.h:32,
                 from ../../git/src/devices/network.cpp:42:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'network::network(const char*, const char*)' at ../../git/src/devices/network.cpp:144:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/wakeup/wakeup.cpp:26:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:39:18:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:40:18:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:41:18:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:48:18:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:49:18:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:50:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/cpu/abstract_cpu.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/cpu/../lib.h:78:9,
    inlined from 'void abstract_cpu::insert_cstate(const char*, const char*, uint64_t, uint64_t, int, int)' at ../../git/src/cpu/abstract_cpu.cpp:205:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/tuning/runtime.cpp: In function 'void add_runtime_tunables(const char*)':
../../git/src/tuning/runtime.cpp:166:65: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size between 3822 and 4077 [-Wformat-truncation=]
  166 |    snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/%s/power/control", bus, entry->d_name, port);
      |                                                                 ^~                                     ~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/runtime.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output 34 or more bytes (assuming 4384) into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/runtime.cpp:171:65: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size between 3822 and 4077 [-Wformat-truncation=]
  171 |    snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/%s", bus, entry->d_name, port);
      |                                                                 ^~                       ~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/runtime.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output 20 or more bytes (assuming 4370) into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/runtime.cpp:191:53: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4085 [-Wformat-truncation=]
  191 |    snprintf(filename, sizeof(filename), "/sys/block/%s/device", port);
      |                                                     ^~          ~~~~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/runtime.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/devices/../parameters/../lib.h:78:9,
    inlined from 'devfreq::devfreq(const char*)' at ../../git/src/devices/devfreq.cpp:48:11,
    inlined from 'void devfreq_dev_callback(const char*)' at ../../git/src/devices/devfreq.cpp:225:54:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/wakeup/wakeup_ethernet.cpp:31:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'ethernet_wakeup::ethernet_wakeup(const char*, const char*)' at ../../git/src/wakeup/wakeup_ethernet.cpp:50:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/wakeup/wakeup_ethernet.cpp: In constructor 'ethernet_wakeup::ethernet_wakeup(const char*, const char*)':
../../git/src/wakeup/wakeup_ethernet.cpp:53:68: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4078 [-Wformat-truncation=]
   53 |  snprintf(toggle_enable, sizeof(toggle_enable), "echo 'enabled' > '%s';", eth_path);
      |                                                                    ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from ../../git/src/wakeup/wakeup_ethernet.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/wakeup/wakeup_ethernet.cpp:54:71: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4077 [-Wformat-truncation=]
   54 |  snprintf(toggle_disable, sizeof(toggle_disable), "echo 'disabled' > '%s';", eth_path);
      |                                                                       ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from ../../git/src/wakeup/wakeup_ethernet.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/tuningi2c.cpp: In constructor 'i2c_tunable::i2c_tunable(const char*, const char*, bool)':
../../git/src/tuning/tuningi2c.cpp:61:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
   61 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", i2c_path);
      |                                                             ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningi2c.cpp:21:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/tuningi2c.cpp:62:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
   62 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", i2c_path);
      |                                                         ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningi2c.cpp:21:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
                 from ../../git/src/tuning/../lib.h:31,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/wifi.cpp:27:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
    inlined from 'wifi_tunable::wifi_tunable(const char*)' at ../../git/src/tuning/wifi.cpp:47:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/tuning/wifi.cpp: In constructor 'wifi_tunable::wifi_tunable(const char*)':
../../git/src/tuning/wifi.cpp:50:53: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4089 [-Wformat-truncation=]
   50 |  snprintf(toggle_good, sizeof(toggle_good), "iw dev %s set power_save on", iface);
      |                                                     ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/wifi.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/wifi.cpp:51:51: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4089 [-Wformat-truncation=]
   51 |  snprintf(toggle_bad, sizeof(toggle_bad), "iw dev %s set power_save off", iface);
      |                                                   ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/wifi.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/tuningusb.cpp: In constructor 'usb_tunable::usb_tunable(const char*, const char*)':
../../git/src/tuning/tuningusb.cpp:77:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
   77 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", usb_path);
      |                                                             ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningusb.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/tuning/tuningusb.cpp:78:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
   78 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", usb_path);
      |                                                         ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
                 from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
                 from ../../git/src/tuning/../lib.h:58,
                 from ../../git/src/tuning/tunable.h:30,
                 from ../../git/src/tuning/tuningusb.cpp:27:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
                 from ../../git/src/wakeup/wakeup_usb.cpp:31:
In function 'char* strncpy(char*, const char*, size_t)',
    inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
    inlined from 'usb_wakeup::usb_wakeup(const char*, const char*)' at ../../git/src/wakeup/wakeup_usb.cpp:50:11:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
   95 |   return __builtin___strncpy_chk (__dest, __src, __len,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
   96 |       __glibc_objsize (__dest));
      |       ~~~~~~~~~~~~~~~~~~~~~~~~~   
../../git/src/wakeup/wakeup_usb.cpp: In constructor 'usb_wakeup::usb_wakeup(const char*, const char*)':
../../git/src/wakeup/wakeup_usb.cpp:53:68: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4078 [-Wformat-truncation=]
   53 |  snprintf(toggle_enable, sizeof(toggle_enable), "echo 'enabled' > '%s';", usb_path);
      |                                                                    ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from ../../git/src/wakeup/wakeup_usb.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../../git/src/wakeup/wakeup_usb.cpp:54:71: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4077 [-Wformat-truncation=]
   54 |  snprintf(toggle_disable, sizeof(toggle_disable), "echo 'disabled' > '%s';", usb_path);
      |                                                                       ^~
In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
                 from ../../git/src/wakeup/wakeup_usb.cpp:29:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
   71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
      |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   72 |        __glibc_objsize (__s), __fmt,
      |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   73 |        __va_arg_pack ());
      |        ~~~~~~~~~~~~~~~~~           
../i686-poky-linux-libtool  --tag=CXX   --mode=link i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/poky
 build/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -lnl-genl-3 -lnl-3   -lncurses -ltinfo -lpci   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o powertop powertop-devlist.o powertop-display.o powertop-lib.o powertop-main.o calibrate/powertop-calibrate.o cpu/powertop-abstract_cpu.o cpu/powertop-cpu.o cpu/powertop-cpu_core.o cpu/powertop-cpu_linux.o cpu/powertop-cpu_package.o cpu/powertop-cpu_rapl_device.o cpu/powertop-cpudevice.o cpu/powertop-dram_rapl_device.o cpu/powertop-intel_cpus.o cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o devices/powertop-ahci.o devices/powertop-alsa.o devices/powertop-backlight.o devices/powertop-devfreq.o devices/powertop-device.o devices/powertop-gpu_rapl_device.o devices/powertop-i9
 15-gpu.o devices/powertop-network.o devices/powertop-rfkill.o devices/powertop-runtime_pm.o devices/powertop-thinkpad-fan.o devices/powertop-thinkpad-light.o devices/powertop-usb.o measurement/powertop-acpi.o measurement/powertop-extech.o measurement/powertop-measurement.o measurement/powertop-sysfs.o measurement/powertop-opal-sensors.o parameters/powertop-learn.o parameters/powertop-parameters.o parameters/powertop-persistent.o perf/powertop-perf.o perf/powertop-perf_bundle.o process/powertop-do_process.o process/powertop-interrupt.o process/powertop-powerconsumer.o process/powertop-process.o process/powertop-processdevice.o process/powertop-timer.o process/powertop-work.o report/powertop-report-data-html.o report/powertop-report-formatter-base.o report/powertop-report-formatter-csv.o report/powertop-report-formatter-html.o report/powertop-report-maker.o report/powertop-report.o tuning/powertop-bluetooth.o tuning/powertop-ethernet.o tuning/powertop-iw.o tuning/powertop-runtime.o tu
 ning/powertop-tunable.o tuning/powertop-tuning.o tuning/powertop-tuningsysfs.o tuning/powertop-tuningusb.o tuning/powertop-tuningi2c.o tuning/powertop-wifi.o wakeup/powertop-wakeup.o wakeup/powertop-waketab.o wakeup/powertop-wakeup_ethernet.o wakeup/powertop-wakeup_usb.o  ../traceevent/libtraceevnet.la 
i686-poky-linux-libtool: link: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linu
 x/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z -Wl,relro -Wl,-z -Wl,now -o powertop powertop-devlist.o powertop-display.o powertop-lib.o powertop-main.o calibrate/powertop-calibrate.o cpu/powertop-abstract_cpu.o cpu/powertop-cpu.o cpu/powertop-cpu_core.o cpu/powertop-cpu_linux.o cpu/powertop-cpu_package.o cpu/powertop-cpu_rapl_device.o cpu/powertop-cpudevice.o cpu/powertop-dram_rapl_device.o cpu/powertop-intel_cpus.o cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o devices/powertop-ahci.o devices/powertop-alsa.o devices/powertop-backlight.o devices/powertop-devfreq.o devices/powertop-device.o devices/powertop-gpu_rapl_device.o devices/powertop-i915-gpu.o devices/powertop-network.o devices/powertop-rfkill.o devices/powertop-runtime_pm.o devices/powertop-thinkpad-fan.o d
 evices/powertop-thinkpad-light.o devices/powertop-usb.o measurement/powertop-acpi.o measurement/powertop-extech.o measurement/powertop-measurement.o measurement/powertop-sysfs.o measurement/powertop-opal-sensors.o parameters/powertop-learn.o parameters/powertop-parameters.o parameters/powertop-persistent.o perf/powertop-perf.o perf/powertop-perf_bundle.o process/powertop-do_process.o process/powertop-interrupt.o process/powertop-powerconsumer.o process/powertop-process.o process/powertop-processdevice.o process/powertop-timer.o process/powertop-work.o report/powertop-report-data-html.o report/powertop-report-formatter-base.o report/powertop-report-formatter-csv.o report/powertop-report-formatter-html.o report/powertop-report-maker.o report/powertop-report.o tuning/powertop-bluetooth.o tuning/powertop-ethernet.o tuning/powertop-iw.o tuning/powertop-runtime.o tuning/powertop-tunable.o tuning/powertop-tuning.o tuning/powertop-tuningsysfs.o tuning/powertop-tuningusb.o tuning/powertop-tu
 ningi2c.o tuning/powertop-wifi.o wakeup/powertop-wakeup.o wakeup/powertop-waketab.o wakeup/powertop-wakeup_ethernet.o wakeup/powertop-wakeup_usb.o  -lnl-genl-3 -lnl-3 -lncurses -ltinfo -lpci ../traceevent/.libs/libtraceevnet.a
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ld: powertop-main.o: undefined reference to symbol 'pthread_join@@GLIBC_2.0'
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ld: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/lib/libpthread.so.0: error adding symbols: DSO missing from command line
collect2: error: ld returned 1 exit status
make[3]: *** [Makefile:918: powertop] Error 1
make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
make[2]: *** [Makefile:641: all] Error 2
make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
make[1]: *** [Makefile:445: all-recursive] Error 1
make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build'
make: *** [Makefile:375: all] Error 2
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454:196 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 196
	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 177
	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 166
	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 161
	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 156
	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 200

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: die, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 56
	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 65
	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/autotools.bbclass, line 235
	#5: do_compile, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/log.do_compile.1579454
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build'
| Making all in traceevent
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/traceevent'
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o event-parse.lo ../../git/traceevent/event-parse.c
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o parse-filter.lo ../../git/traceevent/parse-filter.c
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o parse-utils.lo ../../git/traceevent/parse-utils.c
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o trace-seq.lo ../../git/traceevent/trace-seq.c
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/event-parse.c  -fPIC -DPIC -o .libs/event-parse.o
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/parse-filter.c  -fPIC -DPIC -o .libs/parse-filter.o
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/parse-utils.c  -fPIC -DPIC -o .libs/parse-utils.o
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/trace-seq.c  -fPIC -DPIC -o .libs/trace-seq.o
| ../i686-poky-linux-libtool  --tag=CC   --mode=link i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r
 0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o libtraceevnet.la  event-parse.lo parse-filter.lo parse-utils.lo trace-seq.lo
| i686-poky-linux-libtool: link: i686-poky-linux-gcc-ar cru .libs/libtraceevnet.a .libs/event-parse.o .libs/parse-filter.o .libs/parse-utils.o .libs/trace-seq.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
| i686-poky-linux-libtool: link: i686-poky-linux-gcc-ranlib .libs/libtraceevnet.a
| i686-poky-linux-libtool: link: ( cd ".libs" && rm -f "libtraceevnet.la" && ln -s "../libtraceevnet.la" "libtraceevnet.la" )
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/traceevent'
| Making all in src
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| /bin/bash ../../git/src/csstoh.sh ../../git/src/powertop.css css.h
| make  all-am
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-devlist.o `test -f 'devlist.cpp' || echo '../../git/src/'`devlist.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-display.o `test -f 'display.cpp' || echo '../../git/src/'`display.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-lib.o `test -f 'lib.cpp' || echo '../../git/src/'`lib.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-main.o `test -f 'main.cpp' || echo '../../git/src/'`main.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o calibrate/powertop-calibrate.o `test -f 'calibrate/calibrate.cpp' || echo '../../git/src/'`calibrate/calibrate.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-abstract_cpu.o `test -f 'cpu/abstract_cpu.cpp' || echo '../../git/src/'`cpu/abstract_cpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu.o `test -f 'cpu/cpu.cpp' || echo '../../git/src/'`cpu/cpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_core.o `test -f 'cpu/cpu_core.cpp' || echo '../../git/src/'`cpu/cpu_core.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_linux.o `test -f 'cpu/cpu_linux.cpp' || echo '../../git/src/'`cpu/cpu_linux.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_package.o `test -f 'cpu/cpu_package.cpp' || echo '../../git/src/'`cpu/cpu_package.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_rapl_device.o `test -f 'cpu/cpu_rapl_device.cpp' || echo '../../git/src/'`cpu/cpu_rapl_device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpudevice.o `test -f 'cpu/cpudevice.cpp' || echo '../../git/src/'`cpu/cpudevice.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-dram_rapl_device.o `test -f 'cpu/dram_rapl_device.cpp' || echo '../../git/src/'`cpu/dram_rapl_device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-intel_cpus.o `test -f 'cpu/intel_cpus.cpp' || echo '../../git/src/'`cpu/intel_cpus.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-intel_gpu.o `test -f 'cpu/intel_gpu.cpp' || echo '../../git/src/'`cpu/intel_gpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/rapl/powertop-rapl_interface.o `test -f 'cpu/rapl/rapl_interface.cpp' || echo '../../git/src/'`cpu/rapl/rapl_interface.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-ahci.o `test -f 'devices/ahci.cpp' || echo '../../git/src/'`devices/ahci.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-alsa.o `test -f 'devices/alsa.cpp' || echo '../../git/src/'`devices/alsa.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-backlight.o `test -f 'devices/backlight.cpp' || echo '../../git/src/'`devices/backlight.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-devfreq.o `test -f 'devices/devfreq.cpp' || echo '../../git/src/'`devices/devfreq.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-device.o `test -f 'devices/device.cpp' || echo '../../git/src/'`devices/device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-gpu_rapl_device.o `test -f 'devices/gpu_rapl_device.cpp' || echo '../../git/src/'`devices/gpu_rapl_device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-i915-gpu.o `test -f 'devices/i915-gpu.cpp' || echo '../../git/src/'`devices/i915-gpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-network.o `test -f 'devices/network.cpp' || echo '../../git/src/'`devices/network.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-rfkill.o `test -f 'devices/rfkill.cpp' || echo '../../git/src/'`devices/rfkill.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-runtime_pm.o `test -f 'devices/runtime_pm.cpp' || echo '../../git/src/'`devices/runtime_pm.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-thinkpad-fan.o `test -f 'devices/thinkpad-fan.cpp' || echo '../../git/src/'`devices/thinkpad-fan.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-thinkpad-light.o `test -f 'devices/thinkpad-light.cpp' || echo '../../git/src/'`devices/thinkpad-light.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-usb.o `test -f 'devices/usb.cpp' || echo '../../git/src/'`devices/usb.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-acpi.o `test -f 'measurement/acpi.cpp' || echo '../../git/src/'`measurement/acpi.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-extech.o `test -f 'measurement/extech.cpp' || echo '../../git/src/'`measurement/extech.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-measurement.o `test -f 'measurement/measurement.cpp' || echo '../../git/src/'`measurement/measurement.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-sysfs.o `test -f 'measurement/sysfs.cpp' || echo '../../git/src/'`measurement/sysfs.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-opal-sensors.o `test -f 'measurement/opal-sensors.cpp' || echo '../../git/src/'`measurement/opal-sensors.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-learn.o `test -f 'parameters/learn.cpp' || echo '../../git/src/'`parameters/learn.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-parameters.o `test -f 'parameters/parameters.cpp' || echo '../../git/src/'`parameters/parameters.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-persistent.o `test -f 'parameters/persistent.cpp' || echo '../../git/src/'`parameters/persistent.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o perf/powertop-perf.o `test -f 'perf/perf.cpp' || echo '../../git/src/'`perf/perf.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o perf/powertop-perf_bundle.o `test -f 'perf/perf_bundle.cpp' || echo '../../git/src/'`perf/perf_bundle.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-do_process.o `test -f 'process/do_process.cpp' || echo '../../git/src/'`process/do_process.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-interrupt.o `test -f 'process/interrupt.cpp' || echo '../../git/src/'`process/interrupt.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-powerconsumer.o `test -f 'process/powerconsumer.cpp' || echo '../../git/src/'`process/powerconsumer.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-process.o `test -f 'process/process.cpp' || echo '../../git/src/'`process/process.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-processdevice.o `test -f 'process/processdevice.cpp' || echo '../../git/src/'`process/processdevice.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-timer.o `test -f 'process/timer.cpp' || echo '../../git/src/'`process/timer.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-work.o `test -f 'process/work.cpp' || echo '../../git/src/'`process/work.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-data-html.o `test -f 'report/report-data-html.cpp' || echo '../../git/src/'`report/report-data-html.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-base.o `test -f 'report/report-formatter-base.cpp' || echo '../../git/src/'`report/report-formatter-base.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-csv.o `test -f 'report/report-formatter-csv.cpp' || echo '../../git/src/'`report/report-formatter-csv.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-html.o `test -f 'report/report-formatter-html.cpp' || echo '../../git/src/'`report/report-formatter-html.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-maker.o `test -f 'report/report-maker.cpp' || echo '../../git/src/'`report/report-maker.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report.o `test -f 'report/report.cpp' || echo '../../git/src/'`report/report.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-bluetooth.o `test -f 'tuning/bluetooth.cpp' || echo '../../git/src/'`tuning/bluetooth.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-ethernet.o `test -f 'tuning/ethernet.cpp' || echo '../../git/src/'`tuning/ethernet.cpp
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/bu
 ild/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o tuning/powertop-iw.o `test -f 'tuning/iw.c' || echo '../../git/src/'`tuning/iw.c
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-runtime.o `test -f 'tuning/runtime.cpp' || echo '../../git/src/'`tuning/runtime.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tunable.o `test -f 'tuning/tunable.cpp' || echo '../../git/src/'`tuning/tunable.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/measurement/../lib.h:31,
|                  from ../../git/src/measurement/sysfs.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
|     inlined from 'sysfs_power_meter::sysfs_power_meter(const char*)' at ../../git/src/measurement/sysfs.cpp:36:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/measurement/../lib.h:31,
|                  from ../../git/src/measurement/opal-sensors.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'opal_sensors_power_meter::opal_sensors_power_meter(const char*)' at ../../git/src/measurement/opal-sensors.cpp:34:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuning.o `test -f 'tuning/tuning.cpp' || echo '../../git/src/'`tuning/tuning.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningsysfs.o `test -f 'tuning/tuningsysfs.cpp' || echo '../../git/src/'`tuning/tuningsysfs.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningusb.o `test -f 'tuning/tuningusb.cpp' || echo '../../git/src/'`tuning/tuningusb.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/interrupt.cpp:26:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'interrupt::interrupt(const char*, int)' at ../../git/src/process/interrupt.cpp:52:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningi2c.o `test -f 'tuning/tuningi2c.cpp' || echo '../../git/src/'`tuning/tuningi2c.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-wifi.o `test -f 'tuning/wifi.cpp' || echo '../../git/src/'`tuning/wifi.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/measurement/acpi.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
|     inlined from 'acpi_power_meter::acpi_power_meter(const char*)' at ../../git/src/measurement/acpi.cpp:42:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup.o `test -f 'wakeup/wakeup.cpp' || echo '../../git/src/'`wakeup/wakeup.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-waketab.o `test -f 'wakeup/waketab.cpp' || echo '../../git/src/'`wakeup/waketab.cpp
| ../../git/src/parameters/parameters.cpp: In function 'int global_power_valid()':
| ../../git/src/parameters/parameters.cpp:443:40: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'std::vector<double>::size_type' {aka 'unsigned int'} [-Wformat=]
|   443 |   printf("To show power estimates do %ld measurement(s) connected to battery only\n",
|       |                                      ~~^
|       |                                        |
|       |                                        long int
|       |                                      %d
|   444 |    (3 * all_parameters.parameters.size()) - past_results.size());
|       |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           |
|       |                                           std::vector<double>::size_type {aka unsigned int}
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup_ethernet.o `test -f 'wakeup/wakeup_ethernet.cpp' || echo '../../git/src/'`wakeup/wakeup_ethernet.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/measurement/extech.cpp:40:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
|     inlined from 'extech_power_meter::extech_power_meter(const char*)' at ../../git/src/measurement/extech.cpp:272:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup_usb.o `test -f 'wakeup/wakeup_usb.cpp' || echo '../../git/src/'`wakeup/wakeup_usb.cpp
| ../../git/src/devices/backlight.cpp: In member function 'virtual double backlight::power_usage(result_bundle*, parameter_bundle*)':
| ../../git/src/devices/backlight.cpp:217:25: warning: '-power' directive writing 6 bytes into a region of size between 1 and 4096 [-Wformat-overflow=]
|   217 |   sprintf(powername, "%s-power", name);
|       |                         ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:34: note: '__builtin___sprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |       __glibc_objsize (__s), __fmt,
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |       __va_arg_pack ());
|       |       ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/cpu/cpudevice.cpp:28:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/cpu/../lib.h:78:9,
|     inlined from 'cpudevice::cpudevice(const char*, const char*, abstract_cpu*)' at ../../git/src/cpu/cpudevice.cpp:35:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/cpu/../lib.h:78:9,
|     inlined from 'cpudevice::cpudevice(const char*, const char*, abstract_cpu*)' at ../../git/src/cpu/cpudevice.cpp:36:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/ethernet.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'ethernet_tunable::ethernet_tunable(const char*)' at ../../git/src/tuning/ethernet.cpp:53:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/backlight.cpp:38:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'backlight::backlight(const char*, const char*)' at ../../git/src/devices/backlight.cpp:49:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp: In member function 'virtual const char* alsa::human_name()':
| ../../git/src/devices/alsa.cpp:205:43: warning: ' (' directive output may be truncated writing 2 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   205 |   snprintf(temp_buf, sizeof(temp_buf), "%s (%s)", humanname, guilty);
|       |                                           ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 4 and 8194 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/rfkill.h:31,
|                  from ../../git/src/devices/rfkill.cpp:38:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'rfkill::rfkill(char*, char*)' at ../../git/src/devices/rfkill.cpp:53:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp: In member function 'virtual void backlight::end_measurement()':
| ../../git/src/devices/backlight.cpp:125:42: warning: '/actual_brightness' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   125 |  snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp:140:44: warning: '-power' directive output may be truncated writing 6 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   140 |  snprintf(powername, sizeof(powername), "%s-power", name);
|       |                                            ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/alsa.h:30,
|                  from ../../git/src/devices/alsa.cpp:35:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'alsa::alsa(const char*, const char*)' at ../../git/src/devices/alsa.cpp:54:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'runtime_pmdevice::runtime_pmdevice(const char*, const char*)' at ../../git/src/devices/runtime_pm.cpp:43:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'runtime_pmdevice::runtime_pmdevice(const char*, const char*)' at ../../git/src/devices/runtime_pm.cpp:45:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp: In member function 'virtual void rfkill::end_measurement()':
| ../../git/src/devices/rfkill.cpp:103:42: warning: '/hard' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   103 |  snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp:109:42: warning: '/soft' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   109 |  snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'void runtime_pmdevice::set_human_name(char*)' at ../../git/src/devices/runtime_pm.cpp:144:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp: In member function 'virtual void runtime_pmdevice::start_measurement()':
| ../../git/src/devices/runtime_pm.cpp:69:42: warning: '/power/runtime_suspended_time' directive output may be truncated writing 29 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    69 |  snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 30 and 4125 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp:76:42: warning: '/power/runtime_active_time' directive output may be truncated writing 26 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    76 |  snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:47:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:49:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp: In member function 'virtual void rfkill::start_measurement()':
| ../../git/src/devices/rfkill.cpp:83:42: warning: '/hard' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    83 |  snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp:90:42: warning: '/soft' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    90 |  snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp: In member function 'virtual void alsa::start_measurement()':
| ../../git/src/devices/alsa.cpp:89:42: warning: '/power_off_acct' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    89 |  snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp:96:43: warning: '/power_on_acct' directive output may be truncated writing 14 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    96 |   snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 15 and 4110 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp: In member function 'virtual void backlight::start_measurement()':
| ../../git/src/devices/backlight.cpp:61:42: warning: '/max_brightness' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    61 |  snprintf(filename, sizeof(filename), "%s/max_brightness", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp:68:42: warning: '/actual_brightness' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    68 |  snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/timer.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'timer::timer(long unsigned int)' at ../../git/src/process/timer.cpp:64:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp: In member function 'virtual void alsa::end_measurement()':
| ../../git/src/devices/alsa.cpp:115:42: warning: '/power_off_acct' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   115 |  snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp:122:43: warning: '/power_on_acct' directive output may be truncated writing 14 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   122 |   snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 15 and 4110 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp: In member function 'virtual void runtime_pmdevice::end_measurement()':
| ../../git/src/devices/runtime_pm.cpp:89:42: warning: '/power/runtime_suspended_time' directive output may be truncated writing 29 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    89 |  snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 30 and 4125 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp:96:42: warning: '/power/runtime_active_time' directive output may be truncated writing 26 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    96 |  snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/ahci.h:32,
|                  from ../../git/src/devices/ahci.cpp:39:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'ahci::ahci(char*, char*)' at ../../git/src/devices/ahci.cpp:130:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp: In constructor 'ahci::ahci(char*, char*)':
| ../../git/src/devices/ahci.cpp:139:38: warning: '-active' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   139 |  snprintf(buffer, sizeof(buffer), "%s-active", name);
|       |                                      ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:142:38: warning: '-partial' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   142 |  snprintf(buffer, sizeof(buffer), "%s-partial", name);
|       |                                      ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:145:38: warning: '-slumber' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   145 |  snprintf(buffer, sizeof(buffer), "%s-slumber", name);
|       |                                      ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:148:38: warning: '-devslp' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   148 |  snprintf(buffer, sizeof(buffer), "%s-devslp", name);
|       |                                      ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:54:43: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|    54 |  snprintf(pathname, sizeof(pathname), "%s/%s", path, target);
|       |                                           ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:68:36: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|    68 |   snprintf(line, sizeof(line), "%s/%s/model", pathname, dirent->d_name);
|       |                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4358 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/device.cpp: In member function 'void device::register_sysfs_path(const char*)':
| ../../git/src/devices/device.cpp:75:45: warning: '/device' directive output may be truncated writing 7 bytes into a region of size between 1 and 4097 [-Wformat-truncation=]
|    75 |   snprintf(test_path, sizeof(test_path), "%s/device", current_path);
|       |                                             ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/devices/device.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4104 bytes into a destination of size 4097
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp: In member function 'virtual void usbdevice::start_measurement()':
| ../../git/src/devices/usb.cpp:129:42: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   129 |  snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:136:42: warning: '/power/connected_duration' directive output may be truncated writing 25 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   136 |  snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tunable.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:38:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:39:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:40:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:41:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:49:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:51:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/work.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'work::work(long unsigned int)' at ../../git/src/process/work.cpp:41:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp: In member function 'virtual void usbdevice::end_measurement()':
| ../../git/src/devices/usb.cpp:149:42: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   149 |  snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:156:42: warning: '/power/connected_duration' directive output may be truncated writing 25 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   156 |  snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/devfreq.h:29,
|                  from ../../git/src/devices/devfreq.cpp:35:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'devfreq::devfreq(const char*)' at ../../git/src/devices/devfreq.cpp:48:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp: In member function 'virtual void ahci::end_measurement()':
| ../../git/src/devices/ahci.cpp:206:43: warning: '/ahci_alpm_active' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   206 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:212:43: warning: '/ahci_alpm_partial' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   212 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:218:43: warning: '/ahci_alpm_slumber' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   218 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:224:43: warning: '/ahci_alpm_devslp' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   224 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:248:44: warning: '-active' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   248 |  snprintf(powername, sizeof(powername), "%s-active", name);
|       |                                            ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:255:44: warning: '-partial' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   255 |  snprintf(powername, sizeof(powername), "%s-partial", name);
|       |                                            ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:262:44: warning: '-slumber' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   262 |  snprintf(powername, sizeof(powername), "%s-slumber", name);
|       |                                            ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:269:44: warning: '-devslp' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   269 |  snprintf(powername, sizeof(powername), "%s-devslp", name);
|       |                                            ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/process.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 16]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'process::process(const char*, int, int)' at ../../git/src/process/process.cpp:94:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 16 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'process::process(const char*, int, int)' at ../../git/src/process/process.cpp:147:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' output may be truncated copying between 0 and 255 bytes from a string of length 4096 [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp: In function 'void create_all_usb_devices_callback(const char*)':
| ../../git/src/devices/usb.cpp:226:48: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   226 |  snprintf(device_name, sizeof(device_name), "%s/power/active_duration", filename);
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:230:48: warning: '/idVendor' directive output may be truncated writing 9 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   230 |  snprintf(device_name, sizeof(device_name), "%s/idVendor", filename);
|       |                                                ^~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 10 and 4105 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:235:48: warning: '/idProduct' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   235 |  snprintf(device_name, sizeof(device_name), "%s/idProduct", filename);
|       |                                                ^~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'timer::timer(long unsigned int)' at ../../git/src/process/timer.cpp:64:11,
|     inlined from 'timer* find_create_timer(uint64_t)' at ../../git/src/process/timer.cpp:139:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp: In constructor 'runtime_tunable::runtime_tunable(const char*, const char*, const char*, const char*)':
| ../../git/src/tuning/runtime.cpp:86:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
|    86 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", runtime_path);
|       |                                                             ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp:87:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
|    87 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", runtime_path);
|       |                                                         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp: In member function 'virtual void ahci::start_measurement()':
| ../../git/src/devices/ahci.cpp:164:42: warning: '/ahci_alpm_active' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   164 |  snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:171:43: warning: '/ahci_alpm_partial' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   171 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:178:43: warning: '/ahci_alpm_slumber' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   178 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:184:43: warning: '/ahci_alpm_devslp' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   184 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningsysfs.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)' at ../../git/src/tuning/tuningsysfs.cpp:47:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)' at ../../git/src/tuning/tuningsysfs.cpp:48:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningsysfs.cpp: In constructor 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)':
| ../../git/src/tuning/tuningsysfs.cpp:50:52: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4090 [-Wformat-truncation=]
|    50 |  snprintf(toggle_good, sizeof(toggle_good), "echo '%s' > '%s';", target_value, sysfs_path);
|       |                                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningsysfs.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 14 and 8204 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningsysfs.cpp:51:50: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4090 [-Wformat-truncation=]
|    51 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo '%s' > '%s';", bad_value, sysfs_path);
|       |                                                  ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningsysfs.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 14 and 8204 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/network.h:32,
|                  from ../../git/src/devices/network.cpp:42:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'network::network(const char*, const char*)' at ../../git/src/devices/network.cpp:144:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/wakeup/wakeup.cpp:26:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:39:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:40:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:41:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:48:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:49:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/cpu/abstract_cpu.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/cpu/../lib.h:78:9,
|     inlined from 'void abstract_cpu::insert_cstate(const char*, const char*, uint64_t, uint64_t, int, int)' at ../../git/src/cpu/abstract_cpu.cpp:205:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp: In function 'void add_runtime_tunables(const char*)':
| ../../git/src/tuning/runtime.cpp:166:65: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size between 3822 and 4077 [-Wformat-truncation=]
|   166 |    snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/%s/power/control", bus, entry->d_name, port);
|       |                                                                 ^~                                     ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output 34 or more bytes (assuming 4384) into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp:171:65: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size between 3822 and 4077 [-Wformat-truncation=]
|   171 |    snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/%s", bus, entry->d_name, port);
|       |                                                                 ^~                       ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output 20 or more bytes (assuming 4370) into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp:191:53: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4085 [-Wformat-truncation=]
|   191 |    snprintf(filename, sizeof(filename), "/sys/block/%s/device", port);
|       |                                                     ^~          ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'devfreq::devfreq(const char*)' at ../../git/src/devices/devfreq.cpp:48:11,
|     inlined from 'void devfreq_dev_callback(const char*)' at ../../git/src/devices/devfreq.cpp:225:54:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/wakeup/wakeup_ethernet.cpp:31:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'ethernet_wakeup::ethernet_wakeup(const char*, const char*)' at ../../git/src/wakeup/wakeup_ethernet.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_ethernet.cpp: In constructor 'ethernet_wakeup::ethernet_wakeup(const char*, const char*)':
| ../../git/src/wakeup/wakeup_ethernet.cpp:53:68: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4078 [-Wformat-truncation=]
|    53 |  snprintf(toggle_enable, sizeof(toggle_enable), "echo 'enabled' > '%s';", eth_path);
|       |                                                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_ethernet.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_ethernet.cpp:54:71: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4077 [-Wformat-truncation=]
|    54 |  snprintf(toggle_disable, sizeof(toggle_disable), "echo 'disabled' > '%s';", eth_path);
|       |                                                                       ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_ethernet.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningi2c.cpp: In constructor 'i2c_tunable::i2c_tunable(const char*, const char*, bool)':
| ../../git/src/tuning/tuningi2c.cpp:61:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
|    61 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", i2c_path);
|       |                                                             ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningi2c.cpp:21:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningi2c.cpp:62:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
|    62 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", i2c_path);
|       |                                                         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningi2c.cpp:21:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/wifi.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'wifi_tunable::wifi_tunable(const char*)' at ../../git/src/tuning/wifi.cpp:47:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/wifi.cpp: In constructor 'wifi_tunable::wifi_tunable(const char*)':
| ../../git/src/tuning/wifi.cpp:50:53: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4089 [-Wformat-truncation=]
|    50 |  snprintf(toggle_good, sizeof(toggle_good), "iw dev %s set power_save on", iface);
|       |                                                     ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/wifi.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/wifi.cpp:51:51: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4089 [-Wformat-truncation=]
|    51 |  snprintf(toggle_bad, sizeof(toggle_bad), "iw dev %s set power_save off", iface);
|       |                                                   ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/wifi.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningusb.cpp: In constructor 'usb_tunable::usb_tunable(const char*, const char*)':
| ../../git/src/tuning/tuningusb.cpp:77:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
|    77 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", usb_path);
|       |                                                             ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningusb.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningusb.cpp:78:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
|    78 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", usb_path);
|       |                                                         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningusb.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/wakeup/wakeup_usb.cpp:31:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'usb_wakeup::usb_wakeup(const char*, const char*)' at ../../git/src/wakeup/wakeup_usb.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_usb.cpp: In constructor 'usb_wakeup::usb_wakeup(const char*, const char*)':
| ../../git/src/wakeup/wakeup_usb.cpp:53:68: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4078 [-Wformat-truncation=]
|    53 |  snprintf(toggle_enable, sizeof(toggle_enable), "echo 'enabled' > '%s';", usb_path);
|       |                                                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_usb.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_usb.cpp:54:71: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4077 [-Wformat-truncation=]
|    54 |  snprintf(toggle_disable, sizeof(toggle_disable), "echo 'disabled' > '%s';", usb_path);
|       |                                                                       ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_usb.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../i686-poky-linux-libtool  --tag=CXX   --mode=link i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -lnl-genl-3 -lnl-3   -lncurses -ltinfo -lpci   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o powertop powertop-devlist.o powertop-display.o powertop-lib.o powertop-main.o calibrate/powertop-calibrate.o cpu/powertop-abstract_cpu.o cpu/powertop-cpu.o cpu/powertop-cpu_core.o cpu/powertop-cpu_linux.o cpu/powertop-cpu_package.o cpu/powertop-cpu_rapl_device.o cpu/powertop-cpudevice.o cpu/powertop-dram_rapl_device.o cpu/powertop-intel_cpus.o cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o devices/powertop-ahci.o devices/powertop-alsa.o devices/powertop-backlight.o devices/powertop-devfreq.o devices/powertop-device.o devices/powertop-gpu_rapl_device.o devices/powertop-
 i915-gpu.o devices/powertop-network.o devices/powertop-rfkill.o devices/powertop-runtime_pm.o devices/powertop-thinkpad-fan.o devices/powertop-thinkpad-light.o devices/powertop-usb.o measurement/powertop-acpi.o measurement/powertop-extech.o measurement/powertop-measurement.o measurement/powertop-sysfs.o measurement/powertop-opal-sensors.o parameters/powertop-learn.o parameters/powertop-parameters.o parameters/powertop-persistent.o perf/powertop-perf.o perf/powertop-perf_bundle.o process/powertop-do_process.o process/powertop-interrupt.o process/powertop-powerconsumer.o process/powertop-process.o process/powertop-processdevice.o process/powertop-timer.o process/powertop-work.o report/powertop-report-data-html.o report/powertop-report-formatter-base.o report/powertop-report-formatter-csv.o report/powertop-report-formatter-html.o report/powertop-report-maker.o report/powertop-report.o tuning/powertop-bluetooth.o tuning/powertop-ethernet.o tuning/powertop-iw.o tuning/powertop-runtime.o 
 tuning/powertop-tunable.o tuning/powertop-tuning.o tuning/powertop-tuningsysfs.o tuning/powertop-tuningusb.o tuning/powertop-tuningi2c.o tuning/powertop-wifi.o wakeup/powertop-wakeup.o wakeup/powertop-waketab.o wakeup/powertop-wakeup_ethernet.o wakeup/powertop-wakeup_usb.o  ../traceevent/libtraceevnet.la
| i686-poky-linux-libtool: link: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z -Wl,relro -Wl,-z -Wl,now -o powertop powertop-devlist.o powertop-display.o powertop-lib.o powertop-main.o calibrate/powertop-calibrate.o cpu/powertop-abstract_cpu.o cpu/powertop-cpu.o cpu/powertop-cpu_core.o cpu/powertop-cpu_linux.o cpu/powertop-cpu_package.o cpu/powertop-cpu_rapl_device.o cpu/powertop-cpudevice.o cpu/powertop-dram_rapl_device.o cpu/powertop-intel_cpus.o cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o devices/powertop-ahci.o devices/powertop-alsa.o devices/powertop-backlight.o devices/powertop-devfreq.o devices/powertop-device.o devices/powertop-gpu_rapl_device.o devices/powertop-i915-gpu.o devices/powertop-network.o devices/powertop-rfkill.o devices/powertop-runtime_pm.o devices/powertop-thinkpad-fan.o
  devices/powertop-thinkpad-light.o devices/powertop-usb.o measurement/powertop-acpi.o measurement/powertop-extech.o measurement/powertop-measurement.o measurement/powertop-sysfs.o measurement/powertop-opal-sensors.o parameters/powertop-learn.o parameters/powertop-parameters.o parameters/powertop-persistent.o perf/powertop-perf.o perf/powertop-perf_bundle.o process/powertop-do_process.o process/powertop-interrupt.o process/powertop-powerconsumer.o process/powertop-process.o process/powertop-processdevice.o process/powertop-timer.o process/powertop-work.o report/powertop-report-data-html.o report/powertop-report-formatter-base.o report/powertop-report-formatter-csv.o report/powertop-report-formatter-html.o report/powertop-report-maker.o report/powertop-report.o tuning/powertop-bluetooth.o tuning/powertop-ethernet.o tuning/powertop-iw.o tuning/powertop-runtime.o tuning/powertop-tunable.o tuning/powertop-tuning.o tuning/powertop-tuningsysfs.o tuning/powertop-tuningusb.o tuning/powertop-
 tuningi2c.o tuning/powertop-wifi.o wakeup/powertop-wakeup.o wakeup/powertop-waketab.o wakeup/powertop-wakeup_ethernet.o wakeup/powertop-wakeup_usb.o  -lnl-genl-3 -lnl-3 -lncurses -ltinfo -lpci ../traceevent/.libs/libtraceevnet.a
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ld: powertop-main.o: undefined reference to symbol 'pthread_join@@GLIBC_2.0'
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ld: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/lib/libpthread.so.0: error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make[3]: *** [Makefile:918: powertop] Error 1
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| make[2]: *** [Makefile:641: all] Error 2
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| make[1]: *** [Makefile:445: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build'
| make: *** [Makefile:375: all] Error 2
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454:196 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 196
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 177
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 166
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 161
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 156
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 200
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454' failed with exit code 1:
| make  all-recursive
| make[1]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build'
| Making all in traceevent
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/traceevent'
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o event-parse.lo ../../git/traceevent/event-parse.c
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o parse-filter.lo ../../git/traceevent/parse-filter.c
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o parse-utils.lo ../../git/traceevent/parse-utils.c
| ../i686-poky-linux-libtool  --tag=CC   --mode=compile i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I..     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/bu
 ild/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o trace-seq.lo ../../git/traceevent/trace-seq.c
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/event-parse.c  -fPIC -DPIC -o .libs/event-parse.o
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/parse-filter.c  -fPIC -DPIC -o .libs/parse-filter.o
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/parse-utils.c  -fPIC -DPIC -o .libs/parse-utils.o
| i686-poky-linux-libtool: compile:  i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/traceevent -I.. -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -c ../../
 git/traceevent/trace-seq.c  -fPIC -DPIC -o .libs/trace-seq.o
| ../i686-poky-linux-libtool  --tag=CC   --mode=link i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot  -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r
 0/recipe-sysroot-native=   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o libtraceevnet.la  event-parse.lo parse-filter.lo parse-utils.lo trace-seq.lo
| i686-poky-linux-libtool: link: i686-poky-linux-gcc-ar cru .libs/libtraceevnet.a .libs/event-parse.o .libs/parse-filter.o .libs/parse-utils.o .libs/trace-seq.o
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ar: `u' modifier ignored since `D' is the default (see `U')
| i686-poky-linux-libtool: link: i686-poky-linux-gcc-ranlib .libs/libtraceevnet.a
| i686-poky-linux-libtool: link: ( cd ".libs" && rm -f "libtraceevnet.la" && ln -s "../libtraceevnet.la" "libtraceevnet.la" )
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/traceevent'
| Making all in src
| make[2]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| /bin/bash ../../git/src/csstoh.sh ../../git/src/powertop.css css.h
| make  all-am
| make[3]: Entering directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-devlist.o `test -f 'devlist.cpp' || echo '../../git/src/'`devlist.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-display.o `test -f 'display.cpp' || echo '../../git/src/'`display.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-lib.o `test -f 'lib.cpp' || echo '../../git/src/'`lib.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o powertop-main.o `test -f 'main.cpp' || echo '../../git/src/'`main.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o calibrate/powertop-calibrate.o `test -f 'calibrate/calibrate.cpp' || echo '../../git/src/'`calibrate/calibrate.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-abstract_cpu.o `test -f 'cpu/abstract_cpu.cpp' || echo '../../git/src/'`cpu/abstract_cpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu.o `test -f 'cpu/cpu.cpp' || echo '../../git/src/'`cpu/cpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_core.o `test -f 'cpu/cpu_core.cpp' || echo '../../git/src/'`cpu/cpu_core.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_linux.o `test -f 'cpu/cpu_linux.cpp' || echo '../../git/src/'`cpu/cpu_linux.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_package.o `test -f 'cpu/cpu_package.cpp' || echo '../../git/src/'`cpu/cpu_package.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpu_rapl_device.o `test -f 'cpu/cpu_rapl_device.cpp' || echo '../../git/src/'`cpu/cpu_rapl_device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-cpudevice.o `test -f 'cpu/cpudevice.cpp' || echo '../../git/src/'`cpu/cpudevice.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-dram_rapl_device.o `test -f 'cpu/dram_rapl_device.cpp' || echo '../../git/src/'`cpu/dram_rapl_device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-intel_cpus.o `test -f 'cpu/intel_cpus.cpp' || echo '../../git/src/'`cpu/intel_cpus.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/powertop-intel_gpu.o `test -f 'cpu/intel_gpu.cpp' || echo '../../git/src/'`cpu/intel_gpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o cpu/rapl/powertop-rapl_interface.o `test -f 'cpu/rapl/rapl_interface.cpp' || echo '../../git/src/'`cpu/rapl/rapl_interface.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-ahci.o `test -f 'devices/ahci.cpp' || echo '../../git/src/'`devices/ahci.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-alsa.o `test -f 'devices/alsa.cpp' || echo '../../git/src/'`devices/alsa.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-backlight.o `test -f 'devices/backlight.cpp' || echo '../../git/src/'`devices/backlight.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-devfreq.o `test -f 'devices/devfreq.cpp' || echo '../../git/src/'`devices/devfreq.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-device.o `test -f 'devices/device.cpp' || echo '../../git/src/'`devices/device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-gpu_rapl_device.o `test -f 'devices/gpu_rapl_device.cpp' || echo '../../git/src/'`devices/gpu_rapl_device.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-i915-gpu.o `test -f 'devices/i915-gpu.cpp' || echo '../../git/src/'`devices/i915-gpu.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-network.o `test -f 'devices/network.cpp' || echo '../../git/src/'`devices/network.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-rfkill.o `test -f 'devices/rfkill.cpp' || echo '../../git/src/'`devices/rfkill.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-runtime_pm.o `test -f 'devices/runtime_pm.cpp' || echo '../../git/src/'`devices/runtime_pm.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-thinkpad-fan.o `test -f 'devices/thinkpad-fan.cpp' || echo '../../git/src/'`devices/thinkpad-fan.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-thinkpad-light.o `test -f 'devices/thinkpad-light.cpp' || echo '../../git/src/'`devices/thinkpad-light.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o devices/powertop-usb.o `test -f 'devices/usb.cpp' || echo '../../git/src/'`devices/usb.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-acpi.o `test -f 'measurement/acpi.cpp' || echo '../../git/src/'`measurement/acpi.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-extech.o `test -f 'measurement/extech.cpp' || echo '../../git/src/'`measurement/extech.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-measurement.o `test -f 'measurement/measurement.cpp' || echo '../../git/src/'`measurement/measurement.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-sysfs.o `test -f 'measurement/sysfs.cpp' || echo '../../git/src/'`measurement/sysfs.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o measurement/powertop-opal-sensors.o `test -f 'measurement/opal-sensors.cpp' || echo '../../git/src/'`measurement/opal-sensors.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-learn.o `test -f 'parameters/learn.cpp' || echo '../../git/src/'`parameters/learn.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-parameters.o `test -f 'parameters/parameters.cpp' || echo '../../git/src/'`parameters/parameters.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o parameters/powertop-persistent.o `test -f 'parameters/persistent.cpp' || echo '../../git/src/'`parameters/persistent.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o perf/powertop-perf.o `test -f 'perf/perf.cpp' || echo '../../git/src/'`perf/perf.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o perf/powertop-perf_bundle.o `test -f 'perf/perf_bundle.cpp' || echo '../../git/src/'`perf/perf_bundle.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-do_process.o `test -f 'process/do_process.cpp' || echo '../../git/src/'`process/do_process.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-interrupt.o `test -f 'process/interrupt.cpp' || echo '../../git/src/'`process/interrupt.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-powerconsumer.o `test -f 'process/powerconsumer.cpp' || echo '../../git/src/'`process/powerconsumer.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-process.o `test -f 'process/process.cpp' || echo '../../git/src/'`process/process.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-processdevice.o `test -f 'process/processdevice.cpp' || echo '../../git/src/'`process/processdevice.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-timer.o `test -f 'process/timer.cpp' || echo '../../git/src/'`process/timer.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o process/powertop-work.o `test -f 'process/work.cpp' || echo '../../git/src/'`process/work.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-data-html.o `test -f 'report/report-data-html.cpp' || echo '../../git/src/'`report/report-data-html.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-base.o `test -f 'report/report-formatter-base.cpp' || echo '../../git/src/'`report/report-formatter-base.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-csv.o `test -f 'report/report-formatter-csv.cpp' || echo '../../git/src/'`report/report-formatter-csv.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-formatter-html.o `test -f 'report/report-formatter-html.cpp' || echo '../../git/src/'`report/report-formatter-html.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report-maker.o `test -f 'report/report-maker.cpp' || echo '../../git/src/'`report/report-maker.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o report/powertop-report.o `test -f 'report/report.cpp' || echo '../../git/src/'`report/report.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-bluetooth.o `test -f 'tuning/bluetooth.cpp' || echo '../../git/src/'`tuning/bluetooth.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-ethernet.o `test -f 'tuning/ethernet.cpp' || echo '../../git/src/'`tuning/ethernet.cpp
| i686-poky-linux-gcc  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600     -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/bu
 ild/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -c -o tuning/powertop-iw.o `test -f 'tuning/iw.c' || echo '../../git/src/'`tuning/iw.c
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-runtime.o `test -f 'tuning/runtime.cpp' || echo '../../git/src/'`tuning/runtime.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tunable.o `test -f 'tuning/tunable.cpp' || echo '../../git/src/'`tuning/tunable.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/measurement/../lib.h:31,
|                  from ../../git/src/measurement/sysfs.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
|     inlined from 'sysfs_power_meter::sysfs_power_meter(const char*)' at ../../git/src/measurement/sysfs.cpp:36:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/measurement/../lib.h:31,
|                  from ../../git/src/measurement/opal-sensors.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'opal_sensors_power_meter::opal_sensors_power_meter(const char*)' at ../../git/src/measurement/opal-sensors.cpp:34:9:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuning.o `test -f 'tuning/tuning.cpp' || echo '../../git/src/'`tuning/tuning.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningsysfs.o `test -f 'tuning/tuningsysfs.cpp' || echo '../../git/src/'`tuning/tuningsysfs.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningusb.o `test -f 'tuning/tuningusb.cpp' || echo '../../git/src/'`tuning/tuningusb.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/interrupt.cpp:26:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'interrupt::interrupt(const char*, int)' at ../../git/src/process/interrupt.cpp:52:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-tuningi2c.o `test -f 'tuning/tuningi2c.cpp' || echo '../../git/src/'`tuning/tuningi2c.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o tuning/powertop-wifi.o `test -f 'tuning/wifi.cpp' || echo '../../git/src/'`tuning/wifi.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/measurement/acpi.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
|     inlined from 'acpi_power_meter::acpi_power_meter(const char*)' at ../../git/src/measurement/acpi.cpp:42:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup.o `test -f 'wakeup/wakeup.cpp' || echo '../../git/src/'`wakeup/wakeup.cpp
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-waketab.o `test -f 'wakeup/waketab.cpp' || echo '../../git/src/'`wakeup/waketab.cpp
| ../../git/src/parameters/parameters.cpp: In function 'int global_power_valid()':
| ../../git/src/parameters/parameters.cpp:443:40: warning: format '%ld' expects argument of type 'long int', but argument 2 has type 'std::vector<double>::size_type' {aka 'unsigned int'} [-Wformat=]
|   443 |   printf("To show power estimates do %ld measurement(s) connected to battery only\n",
|       |                                      ~~^
|       |                                        |
|       |                                        long int
|       |                                      %d
|   444 |    (3 * all_parameters.parameters.size()) - past_results.size());
|       |    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|       |                                           |
|       |                                           std::vector<double>::size_type {aka unsigned int}
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup_ethernet.o `test -f 'wakeup/wakeup_ethernet.cpp' || echo '../../git/src/'`wakeup/wakeup_ethernet.cpp
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/measurement/extech.cpp:40:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 256]' at ../../git/src/measurement/../lib.h:78:9,
|     inlined from 'extech_power_meter::extech_power_meter(const char*)' at ../../git/src/measurement/extech.cpp:272:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 256 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -DHAVE_CONFIG_H -I. -I../../git/src -I..  -DLOCALEDIR=\"/usr/share/locale\"  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3  -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600    -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                  
     -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -c -o wakeup/powertop-wakeup_usb.o `test -f 'wakeup/wakeup_usb.cpp' || echo '../../git/src/'`wakeup/wakeup_usb.cpp
| ../../git/src/devices/backlight.cpp: In member function 'virtual double backlight::power_usage(result_bundle*, parameter_bundle*)':
| ../../git/src/devices/backlight.cpp:217:25: warning: '-power' directive writing 6 bytes into a region of size between 1 and 4096 [-Wformat-overflow=]
|   217 |   sprintf(powername, "%s-power", name);
|       |                         ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:38:34: note: '__builtin___sprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
|    38 |   return __builtin___sprintf_chk (__s, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    39 |       __glibc_objsize (__s), __fmt,
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    40 |       __va_arg_pack ());
|       |       ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/cpu/cpudevice.cpp:28:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/cpu/../lib.h:78:9,
|     inlined from 'cpudevice::cpudevice(const char*, const char*, abstract_cpu*)' at ../../git/src/cpu/cpudevice.cpp:35:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/cpu/../lib.h:78:9,
|     inlined from 'cpudevice::cpudevice(const char*, const char*, abstract_cpu*)' at ../../git/src/cpu/cpudevice.cpp:36:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/ethernet.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'ethernet_tunable::ethernet_tunable(const char*)' at ../../git/src/tuning/ethernet.cpp:53:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/backlight.cpp:38:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'backlight::backlight(const char*, const char*)' at ../../git/src/devices/backlight.cpp:49:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp: In member function 'virtual const char* alsa::human_name()':
| ../../git/src/devices/alsa.cpp:205:43: warning: ' (' directive output may be truncated writing 2 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   205 |   snprintf(temp_buf, sizeof(temp_buf), "%s (%s)", humanname, guilty);
|       |                                           ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 4 and 8194 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/rfkill.h:31,
|                  from ../../git/src/devices/rfkill.cpp:38:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'rfkill::rfkill(char*, char*)' at ../../git/src/devices/rfkill.cpp:53:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp: In member function 'virtual void backlight::end_measurement()':
| ../../git/src/devices/backlight.cpp:125:42: warning: '/actual_brightness' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   125 |  snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp:140:44: warning: '-power' directive output may be truncated writing 6 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   140 |  snprintf(powername, sizeof(powername), "%s-power", name);
|       |                                            ^~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 7 and 4102 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/alsa.h:30,
|                  from ../../git/src/devices/alsa.cpp:35:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'alsa::alsa(const char*, const char*)' at ../../git/src/devices/alsa.cpp:54:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'runtime_pmdevice::runtime_pmdevice(const char*, const char*)' at ../../git/src/devices/runtime_pm.cpp:43:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'runtime_pmdevice::runtime_pmdevice(const char*, const char*)' at ../../git/src/devices/runtime_pm.cpp:45:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp: In member function 'virtual void rfkill::end_measurement()':
| ../../git/src/devices/rfkill.cpp:103:42: warning: '/hard' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   103 |  snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp:109:42: warning: '/soft' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   109 |  snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'void runtime_pmdevice::set_human_name(char*)' at ../../git/src/devices/runtime_pm.cpp:144:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp: In member function 'virtual void runtime_pmdevice::start_measurement()':
| ../../git/src/devices/runtime_pm.cpp:69:42: warning: '/power/runtime_suspended_time' directive output may be truncated writing 29 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    69 |  snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 30 and 4125 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp:76:42: warning: '/power/runtime_active_time' directive output may be truncated writing 26 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    76 |  snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:47:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:49:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'usbdevice::usbdevice(const char*, const char*, const char*)' at ../../git/src/devices/usb.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp: In member function 'virtual void rfkill::start_measurement()':
| ../../git/src/devices/rfkill.cpp:83:42: warning: '/hard' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    83 |  snprintf(filename, sizeof(filename), "%s/hard", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/rfkill.cpp:90:42: warning: '/soft' directive output may be truncated writing 5 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    90 |  snprintf(filename, sizeof(filename), "%s/soft", sysfs_path);
|       |                                          ^~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/rfkill.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp: In member function 'virtual void alsa::start_measurement()':
| ../../git/src/devices/alsa.cpp:89:42: warning: '/power_off_acct' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    89 |  snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp:96:43: warning: '/power_on_acct' directive output may be truncated writing 14 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    96 |   snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 15 and 4110 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp: In member function 'virtual void backlight::start_measurement()':
| ../../git/src/devices/backlight.cpp:61:42: warning: '/max_brightness' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    61 |  snprintf(filename, sizeof(filename), "%s/max_brightness", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/backlight.cpp:68:42: warning: '/actual_brightness' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    68 |  snprintf(filename, sizeof(filename), "%s/actual_brightness", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/backlight.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/timer.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'timer::timer(long unsigned int)' at ../../git/src/process/timer.cpp:64:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp: In member function 'virtual void alsa::end_measurement()':
| ../../git/src/devices/alsa.cpp:115:42: warning: '/power_off_acct' directive output may be truncated writing 15 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   115 |  snprintf(filename, sizeof(filename), "%s/power_off_acct", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/alsa.cpp:122:43: warning: '/power_on_acct' directive output may be truncated writing 14 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   122 |   snprintf(filename, sizeof(filename), "%s/power_on_acct", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/alsa.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 15 and 4110 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp: In member function 'virtual void runtime_pmdevice::end_measurement()':
| ../../git/src/devices/runtime_pm.cpp:89:42: warning: '/power/runtime_suspended_time' directive output may be truncated writing 29 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    89 |  snprintf(filename, sizeof(filename), "%s/power/runtime_suspended_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 30 and 4125 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/runtime_pm.cpp:96:42: warning: '/power/runtime_active_time' directive output may be truncated writing 26 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|    96 |  snprintf(filename, sizeof(filename), "%s/power/runtime_active_time", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/runtime_pm.h:31,
|                  from ../../git/src/devices/runtime_pm.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/ahci.h:32,
|                  from ../../git/src/devices/ahci.cpp:39:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'ahci::ahci(char*, char*)' at ../../git/src/devices/ahci.cpp:130:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp: In constructor 'ahci::ahci(char*, char*)':
| ../../git/src/devices/ahci.cpp:139:38: warning: '-active' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   139 |  snprintf(buffer, sizeof(buffer), "%s-active", name);
|       |                                      ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:142:38: warning: '-partial' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   142 |  snprintf(buffer, sizeof(buffer), "%s-partial", name);
|       |                                      ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:145:38: warning: '-slumber' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   145 |  snprintf(buffer, sizeof(buffer), "%s-slumber", name);
|       |                                      ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:148:38: warning: '-devslp' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   148 |  snprintf(buffer, sizeof(buffer), "%s-devslp", name);
|       |                                      ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:54:43: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|    54 |  snprintf(pathname, sizeof(pathname), "%s/%s", path, target);
|       |                                           ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 2 and 4352 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:68:36: warning: '%s' directive output may be truncated writing up to 255 bytes into a region of size between 0 and 4095 [-Wformat-truncation=]
|    68 |   snprintf(line, sizeof(line), "%s/%s/model", pathname, dirent->d_name);
|       |                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4358 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/device.cpp: In member function 'void device::register_sysfs_path(const char*)':
| ../../git/src/devices/device.cpp:75:45: warning: '/device' directive output may be truncated writing 7 bytes into a region of size between 1 and 4097 [-Wformat-truncation=]
|    75 |   snprintf(test_path, sizeof(test_path), "%s/device", current_path);
|       |                                             ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/devices/device.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4104 bytes into a destination of size 4097
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp: In member function 'virtual void usbdevice::start_measurement()':
| ../../git/src/devices/usb.cpp:129:42: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   129 |  snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:136:42: warning: '/power/connected_duration' directive output may be truncated writing 25 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   136 |  snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tunable.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:38:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:39:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:40:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable(const char*, double, const char*, const char*, const char*)' at ../../git/src/tuning/tunable.cpp:41:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:49:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'tunable::tunable()' at ../../git/src/tuning/tunable.cpp:51:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/work.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'work::work(long unsigned int)' at ../../git/src/process/work.cpp:41:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp: In member function 'virtual void usbdevice::end_measurement()':
| ../../git/src/devices/usb.cpp:149:42: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   149 |  snprintf(fullpath, sizeof(fullpath), "%s/power/active_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:156:42: warning: '/power/connected_duration' directive output may be truncated writing 25 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   156 |  snprintf(fullpath, sizeof(fullpath), "%s/power/connected_duration", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/devfreq.h:29,
|                  from ../../git/src/devices/devfreq.cpp:35:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'devfreq::devfreq(const char*)' at ../../git/src/devices/devfreq.cpp:48:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp: In member function 'virtual void ahci::end_measurement()':
| ../../git/src/devices/ahci.cpp:206:43: warning: '/ahci_alpm_active' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   206 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:212:43: warning: '/ahci_alpm_partial' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   212 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:218:43: warning: '/ahci_alpm_slumber' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   218 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:224:43: warning: '/ahci_alpm_devslp' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   224 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:248:44: warning: '-active' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   248 |  snprintf(powername, sizeof(powername), "%s-active", name);
|       |                                            ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:255:44: warning: '-partial' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   255 |  snprintf(powername, sizeof(powername), "%s-partial", name);
|       |                                            ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:262:44: warning: '-slumber' directive output may be truncated writing 8 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   262 |  snprintf(powername, sizeof(powername), "%s-slumber", name);
|       |                                            ^~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 9 and 4104 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:269:44: warning: '-devslp' directive output may be truncated writing 7 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   269 |  snprintf(powername, sizeof(powername), "%s-devslp", name);
|       |                                            ^~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 8 and 4103 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/process/process.cpp:29:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 16]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'process::process(const char*, int, int)' at ../../git/src/process/process.cpp:94:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 16 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'process::process(const char*, int, int)' at ../../git/src/process/process.cpp:147:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' output may be truncated copying between 0 and 255 bytes from a string of length 4096 [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp: In function 'void create_all_usb_devices_callback(const char*)':
| ../../git/src/devices/usb.cpp:226:48: warning: '/power/active_duration' directive output may be truncated writing 22 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   226 |  snprintf(device_name, sizeof(device_name), "%s/power/active_duration", filename);
|       |                                                ^~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 23 and 4118 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:230:48: warning: '/idVendor' directive output may be truncated writing 9 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   230 |  snprintf(device_name, sizeof(device_name), "%s/idVendor", filename);
|       |                                                ^~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 10 and 4105 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/usb.cpp:235:48: warning: '/idProduct' directive output may be truncated writing 10 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   235 |  snprintf(device_name, sizeof(device_name), "%s/idProduct", filename);
|       |                                                ^~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/devices/../parameters/parameters.h:31,
|                  from ../../git/src/devices/usb.h:31,
|                  from ../../git/src/devices/usb.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 11 and 4106 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/process/../lib.h:78:9,
|     inlined from 'timer::timer(long unsigned int)' at ../../git/src/process/timer.cpp:64:11,
|     inlined from 'timer* find_create_timer(uint64_t)' at ../../git/src/process/timer.cpp:139:30:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp: In constructor 'runtime_tunable::runtime_tunable(const char*, const char*, const char*, const char*)':
| ../../git/src/tuning/runtime.cpp:86:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
|    86 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", runtime_path);
|       |                                                             ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp:87:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
|    87 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", runtime_path);
|       |                                                         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp: In member function 'virtual void ahci::start_measurement()':
| ../../git/src/devices/ahci.cpp:164:42: warning: '/ahci_alpm_active' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   164 |  snprintf(filename, sizeof(filename), "%s/ahci_alpm_active", sysfs_path);
|       |                                          ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:171:43: warning: '/ahci_alpm_partial' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   171 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_partial", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:178:43: warning: '/ahci_alpm_slumber' directive output may be truncated writing 18 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   178 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_slumber", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/devices/ahci.cpp:184:43: warning: '/ahci_alpm_devslp' directive output may be truncated writing 17 bytes into a region of size between 1 and 4096 [-Wformat-truncation=]
|   184 |   snprintf(filename, sizeof(filename), "%s/ahci_alpm_devslp", sysfs_path);
|       |                                           ^~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/locale_classes.h:40,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/ios_base.h:41,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ios:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ostream:38,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/iostream:39,
|                  from ../../git/src/devices/ahci.cpp:25:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningsysfs.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)' at ../../git/src/tuning/tuningsysfs.cpp:47:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)' at ../../git/src/tuning/tuningsysfs.cpp:48:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningsysfs.cpp: In constructor 'sysfs_tunable::sysfs_tunable(const char*, const char*, const char*)':
| ../../git/src/tuning/tuningsysfs.cpp:50:52: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4090 [-Wformat-truncation=]
|    50 |  snprintf(toggle_good, sizeof(toggle_good), "echo '%s' > '%s';", target_value, sysfs_path);
|       |                                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningsysfs.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 14 and 8204 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningsysfs.cpp:51:50: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4090 [-Wformat-truncation=]
|    51 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo '%s' > '%s';", bad_value, sysfs_path);
|       |                                                  ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningsysfs.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 14 and 8204 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/devices/../parameters/parameters.h:33,
|                  from ../../git/src/devices/network.h:32,
|                  from ../../git/src/devices/network.cpp:42:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'network::network(const char*, const char*)' at ../../git/src/devices/network.cpp:144:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/wakeup/wakeup.cpp:26:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:39:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:40:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup(const char*, double, const char*, const char*)' at ../../git/src/wakeup/wakeup.cpp:41:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:48:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:49:18:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'wakeup::wakeup()' at ../../git/src/wakeup/wakeup.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/cpu/abstract_cpu.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 32]' at ../../git/src/cpu/../lib.h:78:9,
|     inlined from 'void abstract_cpu::insert_cstate(const char*, const char*, uint64_t, uint64_t, int, int)' at ../../git/src/cpu/abstract_cpu.cpp:205:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 32 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp: In function 'void add_runtime_tunables(const char*)':
| ../../git/src/tuning/runtime.cpp:166:65: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size between 3822 and 4077 [-Wformat-truncation=]
|   166 |    snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/%s/power/control", bus, entry->d_name, port);
|       |                                                                 ^~                                     ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output 34 or more bytes (assuming 4384) into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp:171:65: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size between 3822 and 4077 [-Wformat-truncation=]
|   171 |    snprintf(filename, sizeof(filename), "/sys/bus/%s/devices/%s/%s", bus, entry->d_name, port);
|       |                                                                 ^~                       ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output 20 or more bytes (assuming 4370) into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/runtime.cpp:191:53: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4085 [-Wformat-truncation=]
|   191 |    snprintf(filename, sizeof(filename), "/sys/block/%s/device", port);
|       |                                                     ^~          ~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/runtime.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 19 and 4114 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 128]' at ../../git/src/devices/../parameters/../lib.h:78:9,
|     inlined from 'devfreq::devfreq(const char*)' at ../../git/src/devices/devfreq.cpp:48:11,
|     inlined from 'void devfreq_dev_callback(const char*)' at ../../git/src/devices/devfreq.cpp:225:54:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 128 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/wakeup/wakeup_ethernet.cpp:31:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'ethernet_wakeup::ethernet_wakeup(const char*, const char*)' at ../../git/src/wakeup/wakeup_ethernet.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_ethernet.cpp: In constructor 'ethernet_wakeup::ethernet_wakeup(const char*, const char*)':
| ../../git/src/wakeup/wakeup_ethernet.cpp:53:68: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4078 [-Wformat-truncation=]
|    53 |  snprintf(toggle_enable, sizeof(toggle_enable), "echo 'enabled' > '%s';", eth_path);
|       |                                                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_ethernet.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_ethernet.cpp:54:71: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4077 [-Wformat-truncation=]
|    54 |  snprintf(toggle_disable, sizeof(toggle_disable), "echo 'disabled' > '%s';", eth_path);
|       |                                                                       ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_ethernet.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningi2c.cpp: In constructor 'i2c_tunable::i2c_tunable(const char*, const char*, bool)':
| ../../git/src/tuning/tuningi2c.cpp:61:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
|    61 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", i2c_path);
|       |                                                             ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningi2c.cpp:21:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningi2c.cpp:62:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
|    62 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", i2c_path);
|       |                                                         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningi2c.cpp:21:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstring:42,
|                  from ../../git/src/tuning/../lib.h:31,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/wifi.cpp:27:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/tuning/../lib.h:78:9,
|     inlined from 'wifi_tunable::wifi_tunable(const char*)' at ../../git/src/tuning/wifi.cpp:47:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/wifi.cpp: In constructor 'wifi_tunable::wifi_tunable(const char*)':
| ../../git/src/tuning/wifi.cpp:50:53: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4089 [-Wformat-truncation=]
|    50 |  snprintf(toggle_good, sizeof(toggle_good), "iw dev %s set power_save on", iface);
|       |                                                     ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/wifi.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 26 and 4121 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/wifi.cpp:51:51: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4089 [-Wformat-truncation=]
|    51 |  snprintf(toggle_bad, sizeof(toggle_bad), "iw dev %s set power_save off", iface);
|       |                                                   ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/wifi.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 27 and 4122 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningusb.cpp: In constructor 'usb_tunable::usb_tunable(const char*, const char*)':
| ../../git/src/tuning/tuningusb.cpp:77:61: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4081 [-Wformat-truncation=]
|    77 |  snprintf(toggle_good, sizeof(toggle_good), "echo 'auto' > '%s';", usb_path);
|       |                                                             ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningusb.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 18 and 4113 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/tuning/tuningusb.cpp:78:57: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4083 [-Wformat-truncation=]
|    78 |  snprintf(toggle_bad, sizeof(toggle_bad), "echo 'on' > '%s';", usb_path);
|       |                                                         ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/cstdio:42,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/ext/string_conversions.h:43,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/bits/basic_string.h:6535,
|                  from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/c++/10.2.0/string:55,
|                  from ../../git/src/tuning/../lib.h:58,
|                  from ../../git/src/tuning/tunable.h:30,
|                  from ../../git/src/tuning/tuningusb.cpp:27:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 16 and 4111 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/string.h:519,
|                  from ../../git/src/wakeup/wakeup_usb.cpp:31:
| In function 'char* strncpy(char*, const char*, size_t)',
|     inlined from 'void pt_strcpy(char (&)[N], const char*) [with unsigned int N = 4096]' at ../../git/src/wakeup/../lib.h:78:9,
|     inlined from 'usb_wakeup::usb_wakeup(const char*, const char*)' at ../../git/src/wakeup/wakeup_usb.cpp:50:11:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/string_fortified.h:95:34: warning: 'char* __builtin_strncpy(char*, const char*, unsigned int)' specified bound 4096 equals destination size [-Wstringop-truncation]
|    95 |   return __builtin___strncpy_chk (__dest, __src, __len,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~
|    96 |       __glibc_objsize (__dest));
|       |       ~~~~~~~~~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_usb.cpp: In constructor 'usb_wakeup::usb_wakeup(const char*, const char*)':
| ../../git/src/wakeup/wakeup_usb.cpp:53:68: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4078 [-Wformat-truncation=]
|    53 |  snprintf(toggle_enable, sizeof(toggle_enable), "echo 'enabled' > '%s';", usb_path);
|       |                                                                    ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_usb.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 21 and 4116 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../../git/src/wakeup/wakeup_usb.cpp:54:71: warning: '%s' directive output may be truncated writing up to 4095 bytes into a region of size 4077 [-Wformat-truncation=]
|    54 |  snprintf(toggle_disable, sizeof(toggle_disable), "echo 'disabled' > '%s';", usb_path);
|       |                                                                       ^~
| In file included from /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/stdio.h:866,
|                  from ../../git/src/wakeup/wakeup_usb.cpp:29:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/bits/stdio2.h:71:35: note: '__builtin___snprintf_chk' output between 22 and 4117 bytes into a destination of size 4096
|    71 |   return __builtin___snprintf_chk (__s, __n, __USE_FORTIFY_LEVEL - 1,
|       |          ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    72 |        __glibc_objsize (__s), __fmt,
|       |        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    73 |        __va_arg_pack ());
|       |        ~~~~~~~~~~~~~~~~~
| ../i686-poky-linux-libtool  --tag=CXX   --mode=link i686-poky-linux-g++  -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector  -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600   -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0                      -fdebug-prefix-map=/home/po
 kybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot=                      -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native=  -fvisibility-inlines-hidden -lnl-genl-3 -lnl-3   -lncurses -ltinfo -lpci   -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z,relro,-z,now -o powertop powertop-devlist.o powertop-display.o powertop-lib.o powertop-main.o calibrate/powertop-calibrate.o cpu/powertop-abstract_cpu.o cpu/powertop-cpu.o cpu/powertop-cpu_core.o cpu/powertop-cpu_linux.o cpu/powertop-cpu_package.o cpu/powertop-cpu_rapl_device.o cpu/powertop-cpudevice.o cpu/powertop-dram_rapl_device.o cpu/powertop-intel_cpus.o cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o devices/powertop-ahci.o devices/powertop-alsa.o devices/powertop-backlight.o devices/powertop-devfreq.o devices/powertop-device.o devices/powertop-gpu_rapl_device.o devices/powertop-
 i915-gpu.o devices/powertop-network.o devices/powertop-rfkill.o devices/powertop-runtime_pm.o devices/powertop-thinkpad-fan.o devices/powertop-thinkpad-light.o devices/powertop-usb.o measurement/powertop-acpi.o measurement/powertop-extech.o measurement/powertop-measurement.o measurement/powertop-sysfs.o measurement/powertop-opal-sensors.o parameters/powertop-learn.o parameters/powertop-parameters.o parameters/powertop-persistent.o perf/powertop-perf.o perf/powertop-perf_bundle.o process/powertop-do_process.o process/powertop-interrupt.o process/powertop-powerconsumer.o process/powertop-process.o process/powertop-processdevice.o process/powertop-timer.o process/powertop-work.o report/powertop-report-data-html.o report/powertop-report-formatter-base.o report/powertop-report-formatter-csv.o report/powertop-report-formatter-html.o report/powertop-report-maker.o report/powertop-report.o tuning/powertop-bluetooth.o tuning/powertop-ethernet.o tuning/powertop-iw.o tuning/powertop-runtime.o 
 tuning/powertop-tunable.o tuning/powertop-tuning.o tuning/powertop-tuningsysfs.o tuning/powertop-tuningusb.o tuning/powertop-tuningi2c.o tuning/powertop-wifi.o wakeup/powertop-wakeup.o wakeup/powertop-waketab.o wakeup/powertop-wakeup_ethernet.o wakeup/powertop-wakeup_usb.o  ../traceevent/libtraceevnet.la
| i686-poky-linux-libtool: link: i686-poky-linux-g++ -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot -Wall -Wformat -Wshadow -fno-omit-frame-pointer -fstack-protector -I/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/usr/include/libnl3 -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -O2 -pipe -g -feliminate-unused-debug-types -fmacro-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0=/usr/src/debug/powertop/2.14-r0 -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-li
 nux/powertop/2.14-r0/recipe-sysroot= -fdebug-prefix-map=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native= -fvisibility-inlines-hidden -Wl,-O1 -Wl,--hash-style=gnu -Wl,--as-needed -Wl,-z -Wl,relro -Wl,-z -Wl,now -o powertop powertop-devlist.o powertop-display.o powertop-lib.o powertop-main.o calibrate/powertop-calibrate.o cpu/powertop-abstract_cpu.o cpu/powertop-cpu.o cpu/powertop-cpu_core.o cpu/powertop-cpu_linux.o cpu/powertop-cpu_package.o cpu/powertop-cpu_rapl_device.o cpu/powertop-cpudevice.o cpu/powertop-dram_rapl_device.o cpu/powertop-intel_cpus.o cpu/powertop-intel_gpu.o cpu/rapl/powertop-rapl_interface.o devices/powertop-ahci.o devices/powertop-alsa.o devices/powertop-backlight.o devices/powertop-devfreq.o devices/powertop-device.o devices/powertop-gpu_rapl_device.o devices/powertop-i915-gpu.o devices/powertop-network.o devices/powertop-rfkill.o devices/powertop-runtime_pm.o devices/powertop-thinkpad-fan.o
  devices/powertop-thinkpad-light.o devices/powertop-usb.o measurement/powertop-acpi.o measurement/powertop-extech.o measurement/powertop-measurement.o measurement/powertop-sysfs.o measurement/powertop-opal-sensors.o parameters/powertop-learn.o parameters/powertop-parameters.o parameters/powertop-persistent.o perf/powertop-perf.o perf/powertop-perf_bundle.o process/powertop-do_process.o process/powertop-interrupt.o process/powertop-powerconsumer.o process/powertop-process.o process/powertop-processdevice.o process/powertop-timer.o process/powertop-work.o report/powertop-report-data-html.o report/powertop-report-formatter-base.o report/powertop-report-formatter-csv.o report/powertop-report-formatter-html.o report/powertop-report-maker.o report/powertop-report.o tuning/powertop-bluetooth.o tuning/powertop-ethernet.o tuning/powertop-iw.o tuning/powertop-runtime.o tuning/powertop-tunable.o tuning/powertop-tuning.o tuning/powertop-tuningsysfs.o tuning/powertop-tuningusb.o tuning/powertop-
 tuningi2c.o tuning/powertop-wifi.o wakeup/powertop-wakeup.o wakeup/powertop-waketab.o wakeup/powertop-wakeup_ethernet.o wakeup/powertop-wakeup_usb.o  -lnl-genl-3 -lnl-3 -lncurses -ltinfo -lpci ../traceevent/.libs/libtraceevnet.a
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ld: powertop-main.o: undefined reference to symbol 'pthread_join@@GLIBC_2.0'
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot-native/usr/bin/i686-poky-linux/../../libexec/i686-poky-linux/gcc/i686-poky-linux/10.2.0/ld: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/recipe-sysroot/lib/libpthread.so.0: error adding symbols: DSO missing from command line
| collect2: error: ld returned 1 exit status
| make[3]: *** [Makefile:918: powertop] Error 1
| make[3]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| make[2]: *** [Makefile:641: all] Error 2
| make[2]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build/src'
| make[1]: *** [Makefile:445: all-recursive] Error 1
| make[1]: Leaving directory '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/build'
| make: *** [Makefile:375: all] Error 2
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454:196 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 196
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 177
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 166
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 161
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 156
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/powertop/2.14-r0/temp/run.do_compile.1579454, line 200
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 56
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 65
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/autotools.bbclass, line 235
| 	#5: do_compile, autogenerated, line 2
NOTE: recipe powertop-2.14-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2166 tasks of which 2158 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/powertop/powertop_2.14.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============5345881113852253652==--
