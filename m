Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7206C35FFD
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:17 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.115410.1726410842280068937
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=FcrEJufY;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=XCO66C5v;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010191f61adcba-fa45f3e6-c4e5-43ab-bb2d-43cacf64bb25-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=zwWiNE/td9XN7ubELNanA3aidhlQ3vrH9PxcPoJ495c=;
	b=FcrEJufYX4tNWr3N+NQ5opV5sr1siiucLp1sXRXDzObdLUdIiizteU6pgBCOEDCl
	OLY4vRHFPIxRlnJOv7LiAW+tGqRd0yzQsd0TRqwh9CK3PTWGeHshzFIjHgy3DE5mijM
	HfhyLLXRwh76PL0rg9kx0VZMOP1PYOt1SzzfoG4E=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=zwWiNE/td9XN7ubELNanA3aidhlQ3vrH9PxcPoJ495c=;
	b=XCO66C5vshfZZHDgPrrY0GhZ4H2+vSzcNGcfMwd9Zr+GUviG+wi+Fz1+Co9K9soV
	V9MHCODwQy0UEhhNZQyNFR6rmgq12BG1IeiOcmDw9xQbxWMvriCa1aFE3AhFIDjBK1F
	NQlKv8fmc0sf/YvniXpneJpU1yuqekNi4bDkY4vA=
Content-Type: multipart/mixed; boundary="===============4209480896420551168=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.1.0 FAILED
Message-ID: <01010191f61adcba-fa45f3e6-c4e5-43ab-bb2d-43cacf64bb25-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204579

--===============4209480896420551168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *virglrenderer* to *1.1.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-1.0.1-1.1.0.patch
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

-- >8 --
From 2d01d2d5d91b5266160ac93563084847d0734340 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 12:04:43 +0000
Subject: [PATCH] virglrenderer: upgrade 1.0.1 -> 1.1.0

---
 ...001-meson.build-use-python3-directly-for-python.patch | 9 ++++-----
 .../{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb}   | 2 +-
 2 files changed, 5 insertions(+), 6 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_1.0.1.bb => virglrenderer_1.1.0.bb} (96%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 3e12495970..62e7357e4f 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From dec8cca59124d7f8796b54902482ceb295a71b51 Mon Sep 17 00:00:00 2001
+From b02dcf84b09460e199c689f63e51396b9f861016 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -8,16 +8,15 @@ its configuration).
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  meson.build | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 9f91ff2f..2391f89d 100644
+index 10be099e..3bb6eec7 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -74,7 +74,7 @@ flags = [
+@@ -77,7 +77,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
@@ -25,4 +24,4 @@ index 9f91ff2f..2391f89d 100644
 +prog_python = 'python3'
  
  not_found = dependency('', required: false)
- libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
+ gbm_dep = not_found
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
similarity index 96%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
index 0501b0c59c..dd72149295 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.1.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb
@@ -9,7 +9,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "690680e5f0f952e22424fca1538c1b24457a0868"
+SRCREV = "1aeaf5e10a9c89096e96d09599aa419d5c50712f"
 SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
-- 
2.44.0


--===============4209480896420551168==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1869 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.0+snapshot-8bcab744344e63ba74a019fc8fdac22881812409"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:8bcab744344e63ba74a019fc8fdac22881812409"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 271 Local 259 Mirrors 0 Missed 12 Current 416 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 427 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running task 1100 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_recipe_qa)
NOTE: Running task 1103 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_write_config)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 527 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1151 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_fetch)
NOTE: recipe mesa-2_24.0.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 528 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_create_spdx_setscene)
NOTE: Running setscene task 531 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 552 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.123-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 1358 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.3.290.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 656 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 662 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-2.40+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 669 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 1374 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_patch)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 675 of 687 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_patch: Succeeded
NOTE: Running task 1466 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1467 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_populate_lic)
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_populate_lic: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-x86_64-14.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1879 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1928 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.1.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1929 of 1941 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure)
NOTE: recipe virglrenderer-1.1.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroo
 t', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 
 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddrm-msm-experimental=false -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.5.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/build
| Build type: cross build
| 
| ../git/meson.build:24:0: ERROR: Unknown options: "drm-msm-experimental"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.2981370:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.2981370, line 170
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.2981370, line 159
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.2981370, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.2981370, line 183
NOTE: recipe virglrenderer-1.1.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1929 tasks of which 1919 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915120425.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915120425.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/log.do_configure.2981370
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.1.0-r0 do_configure: meson failed
ERROR: virglrenderer-1.1.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/run.do_configure.2981370' failed with exit code 1
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/virglrenderer/1.1.0/temp/log.do_configure.2981370
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.0.bb:do_configure) failed with exit code '1'

--===============4209480896420551168==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-1.0.1-1.1.0.patch"

RnJvbSAyZDAxZDJkNWQ5MWI1MjY2MTYwYWM5MzU2MzA4NDg0N2QwNzM0MzQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTI6MDQ6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDEuMC4xIC0+IDEuMS4wCgotLS0KIC4uLjAwMS1tZXNvbi5i
dWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIHwgOSArKysrLS0tLS0K
IC4uLi97dmlyZ2xyZW5kZXJlcl8xLjAuMS5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMS4wLmJifSAg
IHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0p
CiByZW5hbWUgbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIve3ZpcmdscmVuZGVy
ZXJfMS4wLjEuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjEuMC5iYn0gKDk2JSkKCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAwMDEt
bWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5i
dWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCmluZGV4IDNlMTI0OTU5
NzAuLjYyZTczNTdlNGYgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJl
bmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3Rs
eS1mb3ItcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRl
cmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1m
b3ItcHl0aG9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBkZWM4Y2NhNTkxMjRkN2Y4Nzk2
YjU0OTAyNDgyY2ViMjk1YTcxYjUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiMDJk
Y2Y4NGIwOTQ2MGUxOTljNjg5ZjYzZTUxMzk2YjlmODYxMDE2IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBNb24sIDYgSmFuIDIwMjAgMTI6NDQ6NDIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0gbWVz
b24uYnVpbGQ6IHVzZSAncHl0aG9uMycgZGlyZWN0bHkgZm9yIHB5dGhvbgpAQCAtOCwxNiArOCwx
NSBAQCBpdHMgY29uZmlndXJhdGlvbikuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxh
bGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBtZXNvbi5idWlsZCB8IDIgKy0KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L21lc29uLmJ1aWxkIGIvbWVzb24uYnVpbGQKLWluZGV4IDlmOTFmZjJmLi4yMzkxZjg5ZCAxMDA2
NDQKK2luZGV4IDEwYmUwOTllLi4zYmI2ZWVjNyAxMDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiAr
KysgYi9tZXNvbi5idWlsZAotQEAgLTc0LDcgKzc0LDcgQEAgZmxhZ3MgPSBbCitAQCAtNzcsNyAr
NzcsNyBAQCBmbGFncyA9IFsKICAKICBhZGRfcHJvamVjdF9hcmd1bWVudHMoY2MuZ2V0X3N1cHBv
cnRlZF9hcmd1bWVudHMoZmxhZ3MpLCBsYW5ndWFnZSA6ICdjJykKICAKQEAgLTI1LDQgKzI0LDQg
QEAgaW5kZXggOWY5MWZmMmYuLjIzOTFmODlkIDEwMDY0NAogK3Byb2dfcHl0aG9uID0gJ3B5dGhv
bjMnCiAgCiAgbm90X2ZvdW5kID0gZGVwZW5kZW5jeSgnJywgcmVxdWlyZWQ6IGZhbHNlKQotIGxp
YmRybV9kZXAgPSBkZXBlbmRlbmN5KCdsaWJkcm0nLCB2ZXJzaW9uIDogJz49Mi40LjUwJywgcmVx
dWlyZWQ6IGdldF9vcHRpb24oJ2RybScpLmVuYWJsZWQoKSBvciBnZXRfb3B0aW9uKCd2ZW51cycp
KQorIGdibV9kZXAgPSBub3RfZm91bmQKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGlj
cy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4wLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ3Jh
cGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzEuMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggOTYlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zp
cmdscmVuZGVyZXJfMS4wLjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJn
bHJlbmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4xLjAuYmIKaW5kZXggMDUwMWIwYzU5Yy4uZGQ3MjE0
OTI5NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlcl8xLjAuMS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5k
ZXJlci92aXJnbHJlbmRlcmVyXzEuMS4wLmJiCkBAIC05LDcgKzksNyBAQCBMSUNFTlNFID0gIk1J
VCIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQx
OGZjYThmODgzMDlhNzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFs
L2VnbCB2aXJ0dWFsL2xpYmdibSIKLVNSQ1JFViA9ICI2OTA2ODBlNWYwZjk1MmUyMjQyNGZjYTE1
MzhjMWIyNDQ1N2EwODY4IgorU1JDUkVWID0gIjFhZWFmNWUxMGE5Yzg5MDk2ZTk2ZDA5NTk5YWE0
MTlkNWM1MDcxMmYiCiBTUkNfVVJJID0gImdpdDovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmly
Z2wvdmlyZ2xyZW5kZXJlci5naXQ7YnJhbmNoPW1haW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0
aG9uLnBhdGNoIFwKICAgICAgICAgICAgIgotLSAKMi40NC4wCgo=

--===============4209480896420551168==--

