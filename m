Received: from mail.yoctoproject.org (mail.yoctoproject.org [])
 by mx.groups.io with SMTP id smtpd.web08.1305.1618510599615473954
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: <nil>, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id EDE7138C11FD
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:39 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Ross Burton <ross.burton@arm.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libgudev: upgrading to 236 FAILED
Message-ID: <MADEUP.16761AD15C660706.25572@lists.openembedded.org>
X-Groupsio-MsgNum: 150559
Content-Type: multipart/mixed; boundary="===============3118219031737814382=="

--===============3118219031737814382==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libgudev* to *236* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libgudev-upgrade-234-236.patch
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

--===============3118219031737814382==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-libgudev-upgrade-234-236.patch"

From 464fbd11b16a52164c35e91043d2c818d3adbfca Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 12:14:58 +0000
Subject: [PATCH] libgudev: upgrade 234 -> 236

---
 .../recipes-gnome/libgudev/{libgudev_234.bb => libgudev_236.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/libgudev/{libgudev_234.bb => libgudev_236.bb} (88%)

diff --git a/meta/recipes-gnome/libgudev/libgudev_234.bb b/meta/recipes-gnome/libgudev/libgudev_236.bb
similarity index 88%
rename from meta/recipes-gnome/libgudev/libgudev_234.bb
rename to meta/recipes-gnome/libgudev/libgudev_236.bb
index 9cea36df5b..07eee0614e 100644
--- a/meta/recipes-gnome/libgudev/libgudev_234.bb
+++ b/meta/recipes-gnome/libgudev/libgudev_236.bb
@@ -5,7 +5,7 @@ other programming languages, such as Javascript, because of GObject \
 introspection support."
 HOMEPAGE = "https://wiki.gnome.org/Projects/libgudev"
 BUGTRACKER = "https://gitlab.gnome.org/GNOME/libgudev/issues"
-SRC_URI[archive.sha256sum] = "1baeacacf0db42fa073ad5183d1decce9317857416a2b0f82ce3370d711a2e37"
+SRC_URI[archive.sha256sum] = "e50369d06d594bae615eb7aeb787de304ebaad07a26d1043cef8e9c7ab7c9524"
 
 DEPENDS = "glib-2.0 udev"
 
-- 
2.27.0


--===============3118219031737814382==
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
meta-yocto-bsp       = "tmp-auh-upgrades:ec57a5a45495368be1e9b4153c75212f97d82e75"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 168 Local 160 Network 0 Missed 8 Current 511 (95% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 678 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 1178 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_fetch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Started
NOTE: recipe libgudev-236-r0: task do_fetch: Succeeded
NOTE: Running task 1482 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_unpack)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 679 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgudev-236-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgudev-236-r0: task do_unpack: Succeeded
NOTE: Running task 1483 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libgudev-236-r0: task do_patch: Started
NOTE: recipe libgudev-236-r0: task do_patch: Succeeded
NOTE: Running task 1969 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_deploy_source_date_epoch)
NOTE: Running task 1970 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2166 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_populate_lic)
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-236-r0: task do_populate_lic: Started
NOTE: recipe libgudev-236-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-236-r0: task do_populate_lic: Succeeded
NOTE: recipe libgudev-236-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2167 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_configure)
NOTE: recipe libgudev-236-r0: task do_configure: Started
NOTE: recipe libgudev-236-r0: task do_configure: Succeeded
NOTE: Running task 2168 of 2175 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile)
NOTE: recipe libgudev-236-r0: task do_compile: Started
ERROR: libgudev-236-r0 do_compile: oe_runmake failed
ERROR: libgudev-236-r0 do_compile: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495' failed with exit code 1:
make: *** No targets specified and no makefile found.  Stop.
WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495:233 exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script): 
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 233
	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 214
	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 203
	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 198
	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 193
	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 237

Backtrace (metadata-relative locations):
	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
	#2: die, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 56
	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 65
	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/autotools.bbclass, line 235
	#5: do_compile, autogenerated, line 32
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/log.do_compile.2745495
Log data follows:
| DEBUG: Executing python function autotools_aclocals
| DEBUG: SITE files ['endian-little', 'bit-32', 'ix86-common', 'common-linux', 'common-glibc', 'i686-linux', 'common']
| DEBUG: Python function autotools_aclocals finished
| DEBUG: Executing shell function do_compile
| NOTE: make -j 56
| make: *** No targets specified and no makefile found.  Stop.
| ERROR: oe_runmake failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495:233 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 233
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 214
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 203
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 198
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 193
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 237
| ERROR: Execution of '/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495' failed with exit code 1:
| make: *** No targets specified and no makefile found.  Stop.
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495:233 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 233
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 214
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 203
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 198
| 	#5: do_compile, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 193
| 	#6: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libgudev/236-r0/temp/run.do_compile.2745495, line 237
| 
| Backtrace (metadata-relative locations):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/logging.bbclass, line 72
| 	#2: die, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 56
| 	#3: oe_runmake, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/base.bbclass, line 65
| 	#4: autotools_do_compile, /home/pokybuild/yocto-worker/auh/build/build/poky/meta/classes/autotools.bbclass, line 235
| 	#5: do_compile, autogenerated, line 32
NOTE: recipe libgudev-236-r0: task do_compile: Failed
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2168 tasks of which 2160 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_236.bb:do_compile
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

--===============3118219031737814382==--
