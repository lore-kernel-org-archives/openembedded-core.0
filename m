Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web12.4463.1621074783402865640
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 May 2021 03:33:03 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 560F438C1292
	for <openembedded-core@lists.openembedded.org>; Sat, 15 May 2021 10:33:02 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] glib-2.0: upgrading to 2.68.2 FAILED
Message-ID: <MADEUP.167F36ED41EC36AF.3509@lists.openembedded.org>
X-Groupsio-MsgNum: 151779
Content-Type: multipart/mixed; boundary="===============6480595424704348910=="

--===============6480595424704348910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *glib-2.0* to *2.68.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-glib-2.0-upgrade-2.68.1-2.68.2.patch
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

--===============6480595424704348910==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-glib-2.0-upgrade-2.68.1-2.68.2.patch"

From 2c1c8e3b6531cd3e4f5e69825f9cbf47e6e91f2a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Sat, 15 May 2021 03:48:05 +0000
Subject: [PATCH] glib-2.0: upgrade 2.68.1 -> 2.68.2

---
 .../glib-2.0/glib-2.0/relocate-modules.patch             | 6 +++---
 meta/recipes-core/glib-2.0/glib-2.0/run-ptest            | 9 ---------
 .../glib-2.0/{glib-2.0_2.68.1.bb => glib-2.0_2.68.2.bb}  | 4 ++--
 3 files changed, 5 insertions(+), 14 deletions(-)
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/run-ptest
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.68.1.bb => glib-2.0_2.68.2.bb} (94%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
index 7cf89c8718..00d4b57164 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
+++ b/meta/recipes-core/glib-2.0/glib-2.0/relocate-modules.patch
@@ -1,4 +1,4 @@
-From ff790dd7086e28896f8e7630135f756cc6f06c80 Mon Sep 17 00:00:00 2001
+From dbf7c0d0153519d7563059f6b84a691a5d3ed7ea Mon Sep 17 00:00:00 2001
 From: Ross Burton <ross.burton@intel.com>
 Date: Fri, 11 Mar 2016 15:35:55 +0000
 Subject: [PATCH] glib-2.0: relocate the GIO module directory for native builds
@@ -19,7 +19,7 @@ Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
  1 file changed, 11 insertions(+), 1 deletion(-)
 
 diff --git a/gio/giomodule.c b/gio/giomodule.c
-index ca1daf2..954a250 100644
+index a2909a8..1f4ab82 100644
 --- a/gio/giomodule.c
 +++ b/gio/giomodule.c
 @@ -51,6 +51,8 @@
@@ -31,7 +31,7 @@ index ca1daf2..954a250 100644
  #endif
  #include <glib/gstdio.h>
  
-@@ -1212,7 +1214,15 @@ get_gio_module_dir (void)
+@@ -1213,7 +1215,15 @@ get_gio_module_dir (void)
                                       NULL);
        g_free (install_dir);
  #else
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
diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
similarity index 94%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
index accc2cada2..8ef767e3fa 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.68.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb
@@ -5,7 +5,6 @@ PE = "1"
 SHRT_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 
 SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
-           file://run-ptest \
            file://0001-Fix-DATADIRNAME-on-uclibc-Linux.patch \
            file://Enable-more-tests-while-cross-compiling.patch \
            file://0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch \
@@ -17,10 +16,11 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
            file://0001-meson-Run-atomics-test-on-clang-as-well.patch \
            file://0001-gio-tests-resources.c-comment-out-a-build-host-only-.patch \
            file://0001-gio-tests-codegen.py-bump-timeout-to-100-seconds.patch \
+           file://relocate-modules.patch \
            "
 SRC_URI_append_class-native = " file://relocate-modules.patch"
 
-SRC_URI[sha256sum] = "241654b96bd36b88aaa12814efc4843b578e55d47440103727959ac346944333"
+SRC_URI[sha256sum] = "ecc7798a9cc034eabdfd7f246e6dd461cdbf1175fcc2e9867cc7da7b7309e0fb"
 
 # Find any meson cross files in FILESPATH that are relevant for the current
 # build (using siteinfo) and add them to EXTRA_OEMESON.
-- 
2.27.0


--===============6480595424704348910==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1459 entries from dependency cache.
Parsing recipes...done.
Parsing of 825 .bb files complete (824 cached, 1 parsed). 1459 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.51.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3+snapshot-a6cdab1d1a4cc3efdaed8d05485e7cec5eebf79f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:a6cdab1d1a4cc3efdaed8d05485e7cec5eebf79f"
workspace            = "master:ed2e3b739a7e0e8daad665fed01342d60674d6b7"

Initialising tasks...done.
Sstate summary: Wanted 201 Local 178 Network 0 Missed 23 Current 519 (88% match, 96% complete)
Removing 5 stale sstate objects for arch core2-32...done.
Removing 2 stale sstate objects for arch x86_64...done.
Removing 3 stale sstate objects for arch qemux86...done.
NOTE: Executing Tasks
NOTE: Running setscene task 532 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 533 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 558 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.6.bb:do_package_setscene)
NOTE: Running setscene task 670 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 714 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 887 of 2269 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_fetch)
NOTE: Running task 889 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_fetch)
NOTE: Running task 1024 of 2269 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_write_config)
NOTE: Running task 1027 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_write_config)
NOTE: Running task 1106 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_fetch)
NOTE: Running task 1192 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_fetch)
NOTE: Running task 1193 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_fetch: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_fetch: Started
NOTE: Running task 1327 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_unpack)
NOTE: recipe systemd-1_247.6-r0: task do_package_setscene: Started
NOTE: Running task 1336 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_fetch: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Started
NOTE: Running task 1404 of 2269 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_unpack)
NOTE: Running task 1405 of 2269 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_write_config: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_write_config: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_fetch: Succeeded
NOTE: Running task 1464 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_write_config: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_fetch: Succeeded
NOTE: Running task 1465 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_unpack)
NOTE: recipe shared-mime-info-2.1-r0: task do_fetch: Succeeded
NOTE: Running task 1466 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_unpack: Succeeded
NOTE: Running task 1467 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_patch)
NOTE: recipe dbus-1.12.20-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 719 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_unpack: Succeeded
NOTE: Running task 1472 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Started
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Started
NOTE: recipe libtool-cross-2.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 720 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_patch: Succeeded
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_unpack: Succeeded
NOTE: Running task 1474 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_patch)
NOTE: recipe shared-mime-info-2.1-r0: task do_unpack: Succeeded
NOTE: Running task 1475 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_patch)
NOTE: recipe libtool-cross-2.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_unpack: Succeeded
NOTE: Running task 2176 of 2269 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_patch)
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_patch: Succeeded
NOTE: Running task 2177 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 2178 of 2269 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_populate_lic)
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_populate_lic: Succeeded
NOTE: recipe glib-2.0-1_2.68.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe systemd-1_247.6-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
ERROR: glib-2.0-native-1_2.68.2-r0 do_patch: Command Error: 'quilt --quiltrc /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.68.2-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
stdout: Patch relocate-modules.patch is already applied; check your series file

stderr: 
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/x86_64-linux/glib-2.0-native/1_2.68.2-r0/temp/log.do_patch.2652306
NOTE: recipe glib-2.0-native-1_2.68.2-r0: task do_patch: Failed
ERROR: Task (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_patch) failed with exit code '1'
NOTE: Tasks Summary: Attempted 2215 tasks of which 2194 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.68.2.bb:do_patch
Summary: There was 1 ERROR message shown, returning a non-zero exit code.

--===============6480595424704348910==--
