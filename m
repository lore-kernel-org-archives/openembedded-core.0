Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web08.5109.1613463848181404407
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Feb 2021 00:24:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from [172.29.10.113] (unknown [172.29.10.113])
	by mail.yoctoproject.org (Postfix) with ESMTP id 4A98B38C112E
	for <openembedded-core@lists.openembedded.org>; Tue, 16 Feb 2021 08:24:07 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.66.7 FAILED
Message-ID: <MADEUP.16642CD2504316F8.7752@lists.openembedded.org>
X-Groupsio-MsgNum: 148088
Content-Type: multipart/mixed; boundary="===============6753180632079547595=="

--===============6753180632079547595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.66.7* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.66.4-2.66.7.patch
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

--===============6753180632079547595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1425 entries from dependency cache.
Parsing recipes...done.
Parsing of 809 .bb files complete (808 cached, 1 parsed). 1425 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.49.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.2+snapshot-8656105cb5c16cbf95c8d49202ad23f4bb15933f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8656105cb5c16cbf95c8d49202ad23f4bb15933f"
workspace            = "master:6b24d3fc583a87fb4284ce00256e8069345c9f3a"

Initialising tasks...done.
Sstate summary: Wanted 27 Found 5 Missed 22 Current 625 (18% match, 96% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1029 of 2090 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: Running task 1031 of 2090 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_fetch)
NOTE: Running task 1241 of 2090 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: Running task 1247 of 2090 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: Running task 1598 of 2090 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_fetch: Succeeded
NOTE: Running task 1666 of 2090 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_unpack)
NOTE: Running task 1667 of 2090 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_write_config: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 2033 of 2090 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_unpack: Succeeded
NOTE: Running task 2034 of 2090 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_patch: Succeeded
NOTE: Running task 2035 of 2090 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 2036 of 2090 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_lic: Succeeded
ERROR: glib-2.0-native-1_2.66.7-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.66.7-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.66.7-r0/temp/log.do_patch.41358
NOTE: recipe glib-2.0-native-1_2.66.7-r0: task do_patch: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2036 tasks of which 2025 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_patch
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6753180632079547595==
Content-Type: text/x-diff; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.66.4-2.66.7.patch"

From 7631d76220d71fdbd754ae7f976a4b713497a2e3 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Mon, 15 Feb 2021 17:31:35 +0000
Subject: [PATCH] glib-2.0: upgrade 2.66.4 -> 2.66.7

---
 .../glib-2.0/glib-2.0/relocate-modules.patch             | 2 +-
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest            | 9 ---------
 .../glib-2.0/{glib-2.0_2.66.4.bb => glib-2.0_2.66.7.bb}  | 4 ++--
 3 files changed, 3 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.66.4.bb => glib-2.0_2.66.7.bb} (94%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 4cbcc29a50..b2ec8844de 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From 011c9f024b6475d31e7d5432a38d00fb67eaea40 Mon Sep 17 00:00:00 2001
+From f70e4ba589b77172a1bbe21713dfe973571fea56 Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
diff --git a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest b/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
deleted file mode 100644
index 7a231b514b..0000000000
--- a/meta/recipes-core/glib-2.0/glib-2.0/run-ptest
+++ /dev/null
@@ -1,9 +0,0 @@
-#! /bin/sh
-
-set -eux
-if id -u glib2-test; then
-   userdel glib2-test
-fi
-useradd glib2-test
-su glib2-test -c 'gnome-desktop-testing-runner glib'
-userdel glib2-test
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
similarity index 94%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
index 5e1c0f2d33..470ef03632 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.66.4.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb
@@ -5,7 +5,6 @@ PE = "1"
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://run-ptest \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
@@ -18,11 +17,12 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
            file://0001-tests-codegen.py-removing-unecessary-print-statement.patch \
+           file://relocate-modules.patch \
            "
 
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "97df8670e32f9fd4f7392b0980e661dd625012015d58350da1e58e343f4af984"
+SRC_URI[sha256sum] = "09f158769f6f26b31074e15b1ac80ec39b13b53102dfae66cfe826fb2cc65502"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.17.1


--===============6753180632079547595==--
