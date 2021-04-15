Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web09.1332.1618510600781248064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 7D05138C1136
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:38 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] bluez5: upgrading to 5.58 FAILED
Message-ID: <MADEUP.16761AD10CA43C0E.6349@lists.openembedded.org>
X-Groupsio-MsgNum: 150533
Content-Type: multipart/mixed; boundary="===============8434556755730948778=="

--===============8434556755730948778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *bluez5* to *5.58* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-bluez5-upgrade-5.56-5.58.patch
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

--===============8434556755730948778==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-bluez5-upgrade-5.56-5.58.patch"

From 69382414833a8f7fa455a07435111435e5244dae Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 02:57:35 +0000
Subject: [PATCH] bluez5: upgrade 5.56 -> 5.58

---
 .../bluez5/{bluez5_5.56.bb => bluez5_5.58.bb}                  | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.56.bb => bluez5_5.58.bb} (91%)

diff --git a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
similarity index 91%
rename from meta/recipes-connectivity/bluez5/bluez5_5.56.bb
rename to meta/recipes-connectivity/bluez5/bluez5_5.58.bb
index 676cb2dbb2..186a621c44 100644
--- a/meta/recipes-connectivity/bluez5/bluez5_5.56.bb
+++ b/meta/recipes-connectivity/bluez5/bluez5_5.58.bb
@@ -1,7 +1,6 @@
 require bluez5.inc
 
-SRC_URI[md5sum] = "e6c51b2aefa7c56ff072819a78611fa5"
-SRC_URI[sha256sum] = "59c4dba9fc8aae2a6a5f8f12f19bc1b0c2dc27355c7ca3123eed3fe6bd7d0b9d"
+SRC_URI[sha256sum] = "c8065e75a5eb67236849ef68a354b1700540305a8c88ef0a0fd6288f19daf1f1"
 
 # noinst programs in Makefile.tools that are conditional on READLINE
 # support
-- 
2.27.0


--===============8434556755730948778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

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
meta-yocto-bsp       = "tmp-auh-upgrades:78dedcdc5accd9ad052021cf43ac2c430d769d95"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 158 Local 150 Network 0 Missed 8 Current 638 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1444 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_fetch)
NOTE: recipe bluez5-5.58-r0: task do_fetch: Started
NOTE: recipe bluez5-5.58-r0: task do_fetch: Succeeded
NOTE: Running task 1866 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_unpack)
NOTE: Running task 1867 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.58-r0: task do_unpack: Started
NOTE: recipe bluez5-5.58-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bluez5-5.58-r0: task do_unpack: Succeeded
NOTE: Running task 2486 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_patch)
NOTE: recipe bluez5-5.58-r0: task do_patch: Started
NOTE: recipe bluez5-5.58-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.58-r0: task do_patch: Succeeded
NOTE: Running task 2487 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_deploy_source_date_epoch)
NOTE: Running task 2488 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_populate_lic)
NOTE: recipe bluez5-5.58-r0: task do_populate_lic: Started
NOTE: recipe bluez5-5.58-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.58-r0: task do_populate_lic: Succeeded
NOTE: recipe bluez5-5.58-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2489 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_configure)
NOTE: recipe bluez5-5.58-r0: task do_configure: Started
NOTE: recipe bluez5-5.58-r0: task do_configure: Succeeded
NOTE: Running task 2490 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.58-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.58-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2491 of 2500 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_compile)
NOTE: recipe bluez5-5.58-r0: task do_compile: Started
ERROR: bluez5-5.58-r0 do_compile: oe_runmake failed
ERROR: bluez5-5.58-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666' failed with exit code 1:
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/bluetooth.h lib/bluetooth/bluetooth.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hci.h lib/bluetooth/hci.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hci_lib.h lib/bluetooth/hci_lib.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sco.h lib/bluetooth/sco.h
/home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
for f in  ; do \
	if [ ! -f $f ] ; then \
		ln -s -t ell -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/build/../bluez-5.58/../ell/$f ; \
	fi \
done > ell/shared
/bin/bash: line 4: ell/shared: No such file or directory
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/l2cap.h lib/bluetooth/l2cap.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sdp.h lib/bluetooth/sdp.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sdp_lib.h lib/bluetooth/sdp_lib.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/rfcomm.h lib/bluetooth/rfcomm.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/bnep.h lib/bluetooth/bnep.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/cmtp.h lib/bluetooth/cmtp.h
ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hidp.h lib/bluetooth/hidp.h
make: *** [Makefile:11636: ell/shared] Error 1
make: *** Waiting for unfinished jobs....
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666:195 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 195
	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 176
	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 165
	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 160
	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 155
	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 199

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: die, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 56
	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 65
	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/autotools.bbclass, line 235
	#5: do_compile, autogenerated, line 2
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/log.do_compile.296666
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/bluetooth.h lib/bluetooth/bluetooth.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hci.h lib/bluetooth/hci.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hci_lib.h lib/bluetooth/hci_lib.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sco.h lib/bluetooth/sco.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| for f in  ; do \
| 	if [ ! -f $f ] ; then \
| 		ln -s -t ell -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/build/../bluez-5.58/../ell/$f ; \
| 	fi \
| done > ell/shared
| /bin/bash: line 4: ell/shared: No such file or directory
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/l2cap.h lib/bluetooth/l2cap.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sdp.h lib/bluetooth/sdp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sdp_lib.h lib/bluetooth/sdp_lib.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/rfcomm.h lib/bluetooth/rfcomm.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/bnep.h lib/bluetooth/bnep.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/cmtp.h lib/bluetooth/cmtp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hidp.h lib/bluetooth/hidp.h
| make: *** [Makefile:11636: ell/shared] Error 1
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666:195 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 195
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 176
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 165
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 160
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 155
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 199
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666' failed with exit code 1:
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/bluetooth.h lib/bluetooth/bluetooth.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hci.h lib/bluetooth/hci.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hci_lib.h lib/bluetooth/hci_lib.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sco.h lib/bluetooth/sco.h
| /home/pokybuild/yocto-worker/auh/build/build/build/tmp/hosttools/mkdir -p lib/bluetooth
| for f in  ; do \
| 	if [ ! -f $f ] ; then \
| 		ln -s -t ell -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/build/../bluez-5.58/../ell/$f ; \
| 	fi \
| done > ell/shared
| /bin/bash: line 4: ell/shared: No such file or directory
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/l2cap.h lib/bluetooth/l2cap.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sdp.h lib/bluetooth/sdp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/sdp_lib.h lib/bluetooth/sdp_lib.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/rfcomm.h lib/bluetooth/rfcomm.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/bnep.h lib/bluetooth/bnep.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/cmtp.h lib/bluetooth/cmtp.h
| ln -s -f /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/bluez-5.58/lib/hidp.h lib/bluetooth/hidp.h
| make: *** [Makefile:11636: ell/shared] Error 1
| make: *** Waiting for unfinished jobs....
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666:195 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 195
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 176
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 165
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 160
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 155
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/bluez5/5.58-r0/temp/run.do_compile.296666, line 199
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 56
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 65
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/autotools.bbclass, line 235
| 	#5: do_compile, autogenerated, line 2
NOTE: recipe bluez5-5.58-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2491 tasks of which 2482 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.58.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============8434556755730948778==--
