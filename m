Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.1352.1618510602014049993
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Apr 2021 11:16:42 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: auh.yoctoproject.org, ip: 198.145.29.25, mailfrom: auh@auh.yoctoproject.org)
Received: from centos8-ty-2.yocto.io (unknown [172.29.10.62])
	by mail.yoctoproject.org (Postfix) with ESMTP id 1BB1938C124A
	for <openembedded-core@lists.openembedded.org>; Thu, 15 Apr 2021 18:16:40 +0000 (UTC)
MIME-Version: 1.0
From: auh@auh.yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] harfbuzz: upgrading to 2.8.0 SUCCEEDED
Message-ID: <MADEUP.16761AD1449E4038.12681@lists.openembedded.org>
X-Groupsio-MsgNum: 150550
Content-Type: multipart/mixed; boundary="===============7244399968044016481=="

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *harfbuzz* to *2.8.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-harfbuzz-upgrade-2.7.4-2.8.0.patch
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

--===============7244399968044016481==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Disposition: attachment;
 filename="0001-harfbuzz-upgrade-2.7.4-2.8.0.patch"

From 438cd7dc9d144bcf8a6db7fa1a3098835102cbc6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@auh.yoctoproject.org>
Date: Thu, 15 Apr 2021 12:33:37 +0000
Subject: [PATCH] harfbuzz: upgrade 2.7.4 -> 2.8.0

---
 .../harfbuzz/{harfbuzz_2.7.4.bb => harfbuzz_2.8.0.bb}           | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_2.7.4.bb => harfbuzz_2.8.0.bb} (95%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
similarity index 95%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
index b08f60255e..6e3fed7357 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_2.7.4.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb
@@ -12,7 +12,7 @@ UPSTREAM_CHECK_REGEX = "harfbuzz-(?P<pver>\d+(\.\d+)+).tar"
 
 SRC_URI = "https://github.com/${BPN}/${BPN}/releases/download/${PV}/${BPN}-${PV}.tar.xz \
            "
-SRC_URI[sha256sum] = "6ad11d653347bd25d8317589df4e431a2de372c0cf9be3543368e07ec23bb8e7"
+SRC_URI[sha256sum] = "a1079fd021adaf5683351f34587a255975cc3bcadba31246ae40ebebb95ecd42"
 
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection
 
-- 
2.27.0


--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1162587 to 1279382 (+10%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz.so.0.20704.0 /usr/lib/libharfbuzz-gobject.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.20704.0 to libharfbuzz-gobject.so.0.20800.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.20704.0 to libharfbuzz-icu.so.0.20800.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.20704.0 to libharfbuzz.so.0.20800.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.20704.0 to libharfbuzz-subset.so.0.20800.0
  /usr/lib/libharfbuzz-gobject.so.0.20704.0 moved to /usr/lib/libharfbuzz-gobject.so.0.20800.0
  /usr/lib/libharfbuzz-icu.so.0.20704.0 moved to /usr/lib/libharfbuzz-icu.so.0.20800.0
  /usr/lib/libharfbuzz.so.0.20704.0 moved to /usr/lib/libharfbuzz.so.0.20800.0
  /usr/lib/libharfbuzz-subset.so.0.20704.0 moved to /usr/lib/libharfbuzz-subset.so.0.20800.0

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1440 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (813 cached, 1 parsed). 1438 targets, 31 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d1f0c35dd578af4739550409a4e0f3718bd2d83"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 108 Network 0 Missed 7 Current 661 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 731 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 732 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 774 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: Running task 1772 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_fetch)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Started
NOTE: Running task 2031 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_write_config)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Succeeded
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: Running task 2081 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_unpack)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2423 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_patch)
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2430 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic unihash changed to da190183fd88d544bbde40e3af470464d3466b5e3a838077791a372dcd8ca240
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2431 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_compile)
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_install)
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package)
NOTE: Running task 2435 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2437 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_write_rpm)
NOTE: Running task 2438 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_qa)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2439 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2439 tasks of which 2423 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 6 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 66 skipped, 0 masked, 0 errors.
Removing 2 recipes from the ppc7400 sysroot...done.
Removing 2 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d1f0c35dd578af4739550409a4e0f3718bd2d83"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 108 Network 0 Missed 7 Current 661 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 731 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 732 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 774 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: Running task 1772 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_fetch)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Started
NOTE: Running task 2032 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Succeeded
NOTE: Running task 2047 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_unpack)
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Succeeded
NOTE: Running task 2394 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_patch)
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2430 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic unihash changed to da190183fd88d544bbde40e3af470464d3466b5e3a838077791a372dcd8ca240
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2431 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_compile)
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_install)
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package)
NOTE: Running task 2435 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2437 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_write_rpm)
NOTE: Running task 2438 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_qa)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2439 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2439 tasks of which 2423 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 41 skipped, 0 masked, 0 errors.
Removing 110 recipes from the core2-32 sysroot...done.
Removing 115 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d1f0c35dd578af4739550409a4e0f3718bd2d83"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 579 Local 571 Network 0 Missed 8 Current 208 (98% match, 98% complete)
Removing 4 stale sstate objects for arch x86_64_i686...done.
NOTE: Executing Tasks
NOTE: Running setscene task 209 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 210 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 211 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 212 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 213 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 214 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 215 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 216 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 217 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 218 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 219 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 220 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 221 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 222 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 223 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 224 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 225 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 226 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 227 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 228 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 229 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 231 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 232 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 233 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 234 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 235 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 237 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 238 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 240 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 242 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 243 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 244 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 245 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 246 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 247 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 248 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 249 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 250 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 251 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 252 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 253 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 254 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 255 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 256 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 257 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 258 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 259 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 260 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 261 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 262 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 263 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 264 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 265 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 266 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 267 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 268 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_package_write_rpm_setscene)
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 269 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 270 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 271 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 272 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 273 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-test-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 274 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_package_write_rpm_setscene)
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 275 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus-test_1.12.20.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 276 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/init-system-helpers_1.60.bb:do_packagedata_setscene)
NOTE: recipe kbd-2.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 277 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 278 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 280 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 281 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 282 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_package_write_rpm_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 283 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 284 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_package_write_rpm_setscene)
NOTE: recipe systemd-serialgetty-1.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 285 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 286 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 287 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_package_write_rpm_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 294 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 295 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe coreutils-8.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 297 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_package_write_rpm_setscene)
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 299 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 300 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 301 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 302 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 303 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_package_write_rpm_setscene)
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libgcc-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 304 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_package_write_rpm_setscene)
NOTE: recipe btrfs-tools-5.10.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 305 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 306 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_package_write_rpm_setscene)
NOTE: recipe e2fsprogs-1.46.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe make-4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 307 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 308 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 309 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe m4-1.4.18-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 310 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/iproute2/iproute2_5.11.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 311 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/socat/socat_1.7.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 312 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/btrfs-tools/btrfs-tools_5.10.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 313 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bc/bc_1.07.1.bb:do_packagedata_setscene)
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 314 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/m4/m4_1.4.18.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 315 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/liberror-perl_0.17029.bb:do_packagedata_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 316 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_package_write_rpm_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe grep-3.6-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 317 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/findutils/findutils_4.8.0.bb:do_packagedata_setscene)
NOTE: recipe libmnl-1.0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 318 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_package_write_rpm_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gawk-5.1.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 319 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 320 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 321 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 322 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_package_write_rpm_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 323 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_package_write_rpm_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 324 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/kbd/kbd_2.4.0.bb:do_packagedata_setscene)
NOTE: recipe sed-4.8-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-securetty-4.6-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 325 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-compat-units.bb:do_packagedata_setscene)
NOTE: Running setscene task 326 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-conf_247.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 327 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd-serialgetty.bb:do_packagedata_setscene)
NOTE: Running setscene task 328 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/grep/grep_3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 329 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/mdadm/mdadm_4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 330 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-securetty_4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 331 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 332 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 333 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 334 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_package_write_rpm_setscene)
NOTE: recipe libpam-1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mesa-2_21.0.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe tcp-wrappers-7.6-r10: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe which-2.21-r3: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 335 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/procps/procps_3.3.17.bb:do_packagedata_setscene)
NOTE: recipe python3-3.9.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 336 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/which/which_2.21.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.66.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 337 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_package_write_rpm_setscene)
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 338 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_package_write_rpm_setscene)
NOTE: recipe binutils-2.36.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 339 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tar/tar_1.34.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe dbus-test-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 340 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 341 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 342 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 343 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 344 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 345 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_setscene)
NOTE: Running setscene task 346 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_package_write_rpm_setscene)
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Started
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 347 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 350 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 351 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 352 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 353 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_package_write_rpm_setscene)
NOTE: recipe init-system-helpers-1.60-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 356 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils_2.36.bb:do_packagedata_setscene)
NOTE: Running setscene task 357 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/sed/sed_4.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 358 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 360 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 361 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 362 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 363 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 364 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_package_write_rpm_setscene)
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Started
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 365 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 366 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 367 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_package_write_rpm_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Started
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 368 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_package_write_rpm_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Started
NOTE: Running setscene task 369 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 370 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 371 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 372 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 373 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_package_write_rpm_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe socat-1.7.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe btrfs-tools-5.10.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bc-1.07.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Started
NOTE: recipe iproute2-5.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-compat-units-1.0-r29: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Started
NOTE: recipe liberror-perl-0.17029-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe m4-1.4.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe shadow-securetty-4.6-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe systemd-conf-247.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe systemd-serialgetty-1.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 387 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/elfutils/elfutils_0.183.bb:do_packagedata_setscene)
NOTE: Running setscene task 396 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/iptables/iptables_1.8.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 398 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libmnl/libmnl_1.0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 402 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/tcp-wrappers/tcp-wrappers_7.6.bb:do_packagedata_setscene)
NOTE: recipe kmod-28-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe mdadm-4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 407 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_8.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 408 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.46.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 409 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/perl/perl_5.32.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 410 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/gawk/gawk_5.1.0.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.19-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 411 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bash/bash_5.1.bb:do_packagedata_setscene)
NOTE: recipe which-2.21-r3: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 412 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/diffutils/diffutils_3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 415 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2018.1.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r5: task do_packagedata_setscene: Succeeded
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Started
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 419 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 420 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 421 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 422 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 423 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 424 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 425 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 426 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: recipe findutils-4.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kbd-2.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe procps-3.3.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Started
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 431 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/make/make_4.3.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 435 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.66.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 436 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 437 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 438 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/lzo/lzo_2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 439 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb:do_packagedata_setscene)
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 440 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 441 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_packagedata_setscene)
NOTE: recipe grep-3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe binutils-2.36.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.0.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 446 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/bison/bison_3.7.5.bb:do_packagedata_setscene)
NOTE: recipe tcp-wrappers-7.6-r10: task do_packagedata_setscene: Succeeded
NOTE: recipe tar-1.34-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libmnl-1.0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 809 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_fetch)
NOTE: recipe gnome-desktop-testing-2018.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sed-4.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Started
NOTE: Running task 936 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_write_config)
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.183-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 459 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.13.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 461 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 463 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 466 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 467 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 468 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/argp-standalone/argp-standalone_1.3.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.66.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Started
NOTE: recipe e2fsprogs-1.46.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 475 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.40.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 476 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/depmodwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running task 1056 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_unpack)
NOTE: recipe gawk-5.1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.1+gitAUTOINC+cce0edb428-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Started
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Succeeded
NOTE: recipe coreutils-8.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe icu-68.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 483 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.2.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.13.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 486 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_68.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzo-2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Started
NOTE: recipe mesa-2_21.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 490 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: Running setscene task 491 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 492 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 493 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 494 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_packagedata_setscene)
NOTE: recipe iptables-1.8.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe diffutils-3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe depmodwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_21.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 499 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 500 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_21.0.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 501 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 502 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 503 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 504 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.40.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe make-4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.10.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 508 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.10.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 512 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.10.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 513 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bison-3.7.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_21.0.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-68.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe mesa-2_21.0.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Started
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe shared-mime-info-2.1-r0: task do_packagedata_setscene: Succeeded
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: Running setscene task 520 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_populate_sysroot_setscene)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe gmp-6.2.1-r0: task do_packagedata_setscene: Succeeded
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe xrandr-1_1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 526 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 528 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 529 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 530 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 531 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 532 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe freetype-2.10.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 534 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 535 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 540 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 541 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 542 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.37.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_5.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 544 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_5.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpng-1.6.37-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 546 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 548 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 549 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 550 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 552 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxfixes-1_5.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpciaccess-0.16-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxext-1_1.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 554 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 556 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_patch)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 558 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_packagedata_setscene)
NOTE: Running setscene task 559 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 560 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.66.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 561 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_packagedata_setscene)
NOTE: Running setscene task 562 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 1188 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1189 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic)
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Started
NOTE: recipe glib-2.0-1_2.66.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic unihash changed to da190183fd88d544bbde40e3af470464d3466b5e3a838077791a372dcd8ca240
NOTE: recipe dbus-1.12.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dbus-1.12.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 564 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.12.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 565 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 566 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 568 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 569 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 570 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 572 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre_8.44.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.12.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre-8.44-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 574 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 575 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 576 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 578 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.7.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libx11-1_1.7.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe systemd-1_247.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 580 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 581 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 582 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 584 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 585 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/systemd/systemd_247.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 586 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 587 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 588 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 589 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 590 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 591 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 592 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 593 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 594 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_packagedata_setscene)
NOTE: Running setscene task 595 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.0.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 597 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.0.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 598 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 599 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe systemd-1_247.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.0.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 601 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.5.29.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 605 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 606 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 607 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 608 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 609 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.0.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 610 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-28-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 613 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.48-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.48.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r89: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 617 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 619 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.5.29-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 621 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.2.53.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 622 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 623 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.4.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 625 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.4.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxkbcommon-1.0.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.48-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 627 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 628 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 629 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 630 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 631 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.19.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.2.53-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.32.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.4.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 634 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/db/db_5.3.28.bb:do_packagedata_setscene)
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 638 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 639 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 640 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 641 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 642 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 643 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 644 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 645 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 648 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux/linux-yocto_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.19.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 650 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 652 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.32.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxcb-1.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.9.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.9.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 655 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 656 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.32-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.2.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-yocto-5.10.25+gitAUTOINC+031f6c76e4_cf5b0320cf-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 658 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.2.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe db-1_5.3.28-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 662 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 664 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 666 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 667 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 668 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 669 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 670 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.9.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 672 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.14.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.2.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.14.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2020.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 674 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2020.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.19.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 676 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.19.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 678 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_packagedata_setscene)
NOTE: Running setscene task 679 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 680 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 681 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 682 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 683 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 684 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_packagedata_setscene)
NOTE: Running setscene task 685 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 686 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2020.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.19.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 688 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 695 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 698 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 699 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.9.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 700 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 703 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 704 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 705 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.9.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libnsl2-1.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 707 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 708 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 709 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gdbm-1.19-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 710 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 711 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 712 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.19.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 713 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sqlite3-3_3.35.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 714 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.35.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-1.1.1k-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 715 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_1.1.1k.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libnsl2-1.3.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xz-5.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libffi-3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe sqlite3-3_3.35.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdbm-1.19-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 716 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 718 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 720 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 721 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 722 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 723 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 724 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 725 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 726 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 727 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 728 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-1.1.1k-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtirpc-1.3.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.36.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 732 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 734 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-libuuid-2.36.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ncurses-6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 736 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 737 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 738 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_populate_sysroot_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 740 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 742 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 743 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 744 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe opkg-utils-0.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 746 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.4.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe opkg-utils-0.4.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpam-1.5.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flex-2.6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/flex/flex_2.6.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe cracklib-2.9.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 750 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 751 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 754 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flex-2.6.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe cracklib-2.9.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 756 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.11.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 757 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 758 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.11-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-runtime-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 761 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 762 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 764 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-runtime-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 765 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 766 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 768 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 769 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 770 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 771 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 772 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 773 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.2+gitAUTOINC+e5d2823631-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 780 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 781 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 783 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_10.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gcc-cross-i686-10.2.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe linux-libc-headers-5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 787 of 787 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.36.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-cross-i686-2.36.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2194 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2452 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2453 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_compile)
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2454 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_install)
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 2455 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package)
NOTE: Running task 2456 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Succeeded
NOTE: Running task 2457 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2458 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_write_rpm)
NOTE: Running task 2459 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_qa)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2460 of 2460 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2460 tasks of which 2444 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 7 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 58 skipped, 0 masked, 0 errors.
Removing 2 recipes from the mips32r2 sysroot...done.
Removing 2 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d1f0c35dd578af4739550409a4e0f3718bd2d83"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 108 Network 0 Missed 7 Current 661 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 731 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 732 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 774 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: Running task 1772 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_fetch)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: Running task 2031 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_write_config)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Started
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Succeeded
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: Running task 2095 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_unpack)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2423 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_patch)
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2430 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic unihash changed to da190183fd88d544bbde40e3af470464d3466b5e3a838077791a372dcd8ca240
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2431 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_compile)
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_install)
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package)
NOTE: Running task 2435 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2437 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_write_rpm)
NOTE: Running task 2438 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_qa)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2439 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2439 tasks of which 2423 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 814 .bb files complete (0 cached, 814 parsed). 1438 targets, 49 skipped, 0 masked, 0 errors.
Removing 2 recipes from the armv7vet2hf-neon sysroot...done.
Removing 2 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "1.50.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "3.3"
TUNE_FEATURES        = "arm armv7ve vfp thumb neon callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:4d1f0c35dd578af4739550409a4e0f3718bd2d83"
workspace            = "master:ddc9e2fd33abe6a0de7b4e0dacdb6f530ee99871"

Initialising tasks...done.
Sstate summary: Wanted 115 Local 108 Network 0 Missed 7 Current 661 (93% match, 99% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 731 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 732 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 774 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1772 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_fetch)
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Started
NOTE: Running task 2031 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_write_config)
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_fetch: Succeeded
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-src went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: Running task 2118 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_unpack)
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dbg went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-tests went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-drivers went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-radeon went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-nouveau went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-omap went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-intel went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-exynos went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-kms went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-freedreno went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-amdgpu went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-etnaviv went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-staticdev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-dev went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Started
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-doc went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm-locale went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
ERROR: libdrm-2.4.104-r0 do_packagedata_setscene: QA Issue: Package version for package libdrm went backwards which would break package feeds (from 0:2.4.105-r0 to 0:2.4.104-r0) [version-going-backwards]
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.104-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 776 of 776 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.104.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.104-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2423 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_unpack: Succeeded
NOTE: Running task 2428 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_patch)
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_patch: Succeeded
NOTE: Running task 2429 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2430 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic)
NOTE: recipe harfbuzz-2.8.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_lic unihash changed to da190183fd88d544bbde40e3af470464d3466b5e3a838077791a372dcd8ca240
NOTE: recipe harfbuzz-2.8.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2431 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_configure)
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_configure: Succeeded
NOTE: Running task 2432 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_compile)
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_compile: Succeeded
NOTE: Running task 2433 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_install)
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_install: Succeeded
NOTE: Running task 2434 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package)
NOTE: Running task 2435 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_populate_sysroot)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package: Succeeded
NOTE: Running task 2436 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_packagedata)
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_packagedata: Succeeded
NOTE: Running task 2437 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_write_rpm)
NOTE: Running task 2438 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_package_qa)
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Started
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_qa: Succeeded
NOTE: recipe harfbuzz-2.8.0-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 2439 of 2439 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_2.8.0.bb:do_build)
NOTE: Tasks Summary: Attempted 2439 tasks of which 2423 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: There were 18 ERROR messages shown, returning a non-zero exit code.

--===============7244399968044016481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-bin: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PKGSIZE changed from 35450684 to 35472344 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dbg: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PKGSIZE changed from 1162587 to 1279382 (+10%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-dev: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-doc: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu-dev: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-icu: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-locale: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PKGSIZE changed from 3564904 to 3578099 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-src: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-staticdev: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PKGSIZE changed from 779591 to 795975 (+2%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz-subset: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PKGSIZE changed from 1241360 to 1242324 (+0%)
packages/core2-32-poky-linux/harfbuzz/harfbuzz: FILELIST: removed "/usr/lib/libharfbuzz-gobject.so.0.20704.0 /usr/lib/libharfbuzz.so.0.20704.0", added "/usr/lib/libharfbuzz.so.0.20800.0 /usr/lib/libharfbuzz-gobject.so.0.20800.0"
packages/core2-32-poky-linux/harfbuzz/harfbuzz: PV changed from "2.7.4" to "2.8.0"
packages/core2-32-poky-linux/harfbuzz: PKGV changed from 2.7.4 [default] to 2.8.0 [default]
packages/core2-32-poky-linux/harfbuzz: SRC_URI changed from "https://github.com/harfbuzz/harfbuzz/releases/download/2.7.4/harfbuzz-2.7.4.tar.xz" to "https://github.com/harfbuzz/harfbuzz/releases/download/2.8.0/harfbuzz-2.8.0.tar.xz"
packages/core2-32-poky-linux/harfbuzz: PV changed from "2.7.4" to "2.8.0"
Changes to packages/core2-32-poky-linux/harfbuzz (sysroot):
  /usr/lib/libharfbuzz-gobject.so.0 changed symlink target from libharfbuzz-gobject.so.0.20704.0 to libharfbuzz-gobject.so.0.20800.0
  /usr/lib/libharfbuzz-icu.so.0 changed symlink target from libharfbuzz-icu.so.0.20704.0 to libharfbuzz-icu.so.0.20800.0
  /usr/lib/libharfbuzz.so.0 changed symlink target from libharfbuzz.so.0.20704.0 to libharfbuzz.so.0.20800.0
  /usr/lib/libharfbuzz-subset.so.0 changed symlink target from libharfbuzz-subset.so.0.20704.0 to libharfbuzz-subset.so.0.20800.0
  /usr/lib/libharfbuzz-gobject.so.0.20704.0 moved to /usr/lib/libharfbuzz-gobject.so.0.20800.0
  /usr/lib/libharfbuzz-icu.so.0.20704.0 moved to /usr/lib/libharfbuzz-icu.so.0.20800.0
  /usr/lib/libharfbuzz.so.0.20704.0 moved to /usr/lib/libharfbuzz.so.0.20800.0
  /usr/lib/libharfbuzz-subset.so.0.20704.0 moved to /usr/lib/libharfbuzz-subset.so.0.20800.0

--===============7244399968044016481==--
