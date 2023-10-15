Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49F28CDB48E
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web11.102716.1697399115354406953
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=Ok7sqnmV;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=HA6X+bso;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.193, mailfrom: 0101018b34df0ec7-afd38e1b-0b10-443c-a712-27ca5847d958-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Vf8cq6gPYnA8Vhm6po72hGMRiBQHpUWPNrQoeRpg+mE=;
	b=Ok7sqnmVpTgfvQEQbtTomlQQWIHMYozak2vXrvC56j44xk/GbICxdgdLJpRKQrxO
	aB/jzRDHL6m4jiLfXlOKs5q7S6S/1GOJ3T60t23oCS+S1E/UIxTHshjVWcsRdezVciI
	Z876SeHrO863fFQKIpZy1HQsmTPyWtV8bA164Zm8=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Vf8cq6gPYnA8Vhm6po72hGMRiBQHpUWPNrQoeRpg+mE=;
	b=HA6X+bso8aavH2LVJAtL/4Z4rJWBLIttSGzecu5XDrJiQ7LqebCTUzHQfIvwgHgP
	8wyT4uyl6mH7zzCz5QjSLEq1gcQ+ADnIdb1gp8uCvddPpYP2PeifvX2PoNHtUOji/RQ
	bQ3eSYfYIXcT8bCpvluNhq1HG5VX7a5lhkm7uFsY=
Content-Type: multipart/mixed; boundary="===============7765787117761703749=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.0.0 FAILED
Message-ID: <0101018b34df0ec7-afd38e1b-0b10-443c-a712-27ca5847d958-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189234

--===============7765787117761703749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *virglrenderer* to *1.0.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-virglrenderer-upgrade-0.10.4-1.0.0.patch
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
From fa4d04e4c587d8a307d1e928c3be671c220dd314 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 17:41:58 +0000
Subject: [PATCH] virglrenderer: upgrade 0.10.4 -> 1.0.0

---
 ...1-meson.build-use-python3-directly-for-python.patch | 10 +++++-----
 ...{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} (94%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 8230ba588b..f22ae6b231 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From c853c9e5c44f1b23a15a7ba629ee02f7d8ec23a0 Mon Sep 17 00:00:00 2001
+From 59d80b9238d231fed5fcdb107429a1df16f72fdd Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 6 Jan 2020 12:44:42 +0100
 Subject: [PATCH] meson.build: use 'python3' directly for python
@@ -14,15 +14,15 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/meson.build b/meson.build
-index 13d95bb..b241eb2 100644
+index de6d16b5..79cedbf6 100644
 --- a/meson.build
 +++ b/meson.build
-@@ -64,7 +64,7 @@ flags = [
+@@ -68,7 +68,7 @@ flags = [
  
  add_project_arguments(cc.get_supported_arguments(flags), language : 'c')
  
 -prog_python = import('python').find_installation('python3')
 +prog_python = 'python3'
  
- libdrm_dep = dependency('libdrm', version : '>=2.4.50')
- thread_dep = dependency('threads')
+ not_found = dependency('', required: false)
+ libdrm_dep = dependency('libdrm', version : '>=2.4.50', required: get_option('drm').enabled() or get_option('venus'))
diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
similarity index 94%
rename from meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
rename to meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
index f76e7cb1b9..7af0e9c8ee 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer_0.10.4.bb
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb
@@ -9,8 +9,8 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c81c08eeefd9418fca8f88309a76db10"
 
 DEPENDS = "libdrm libepoxy virtual/egl virtual/libgbm"
-SRCREV = "88b9fe3bfc64b23a701e4875006dbc0e769f14f6"
-SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=master;protocol=https \
+SRCREV = "9c9d55ecbe502e0d71ee99529709efcca69aac42"
+SRC_URI = "git://gitlab.freedesktop.org/virgl/virglrenderer.git;branch=main;protocol=https \
            file://0001-meson.build-use-python3-directly-for-python.patch \
            "
 
-- 
2.39.2


--===============7765787117761703749==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-87c69b14ac24dc7289893ca56ed9f8b827b75497"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:87c69b14ac24dc7289893ca56ed9f8b827b75497"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 190 Local 180 Mirrors 0 Missed 10 Current 448 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 455 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_create_spdx_setscene)
NOTE: Running task 1045 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_recipe_qa)
NOTE: Running task 1052 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_write_config)
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_write_config: Started
NOTE: recipe mesa-2_23.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.0.0-r0: task do_write_config: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1102 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_fetch: Succeeded
NOTE: Running task 1245 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_unpack)
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_unpack: Started
NOTE: recipe vulkan-headers-1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 613 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 619 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_unpack: Succeeded
NOTE: Running task 1253 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_patch)
NOTE: recipe glibc-2.38+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 626 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 628 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe virglrenderer-1.0.0-r0: task do_patch: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_patch: Succeeded
NOTE: Running task 1260 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1261 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_populate_lic)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_populate_lic: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_populate_lic: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 638 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1742 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 1763 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.0.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1764 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure)
NOTE: recipe virglrenderer-1.0.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.2.1.bb:do_populate_sysroot', '/home/pokybuild/yoc
 to-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/p
 ython3_3.11.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'zlib-native', 'xz-native', 'glib-2.0-native', 'attr-native', 'libtool-native', 'libx11', 'libxcb', 'wayland', 'libxrandr', 'libgcc', 'linux-libc-headers', 'mpfr-native', 'gmp-native', 'flex-native', 'zstd-native', 'gnu-config-native', 'binutils-cross-i686', 'texinfo-dummy-native', 'libmpc-native', 'libxdamage', 'libxext', 'xorgproto', 'wayland-protocols', 'libxshmfence', 'expat', 'xrandr', 'zlib', 'libxfixes', 'libxxf86vm', 'libffi-native', 'gdbm-native', 'bzip2-native', 'libtirpc-native', 'util-linux-libuuid-native', 'libedit-native', 'ncurses-native', 'sqlite3-native', 'libnsl2-native', 'openssl-native', 'expat-native', 'python3-installer-native', 'python3-wheel-native', 'python3-build-native', 'p
 ython3-setuptools-native', 'libpciaccess', 'libpthread-stubs', 're2c-native', 'gettext-minimal-native', 'libpcre2-native', 'util-linux-native', 'gettext-native', 'xtrans', 'util-macros', 'libxdmcp', 'xcb-proto', 'libxau', 'libffi', 'libxml2', 'libxrender', 'm4-native', 'perl-native', 'cmake-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'libcap-ng-native', 'python3', 'make-native', 'unzip-native', 'libxcrypt', 'opkg-utils', 'bzip2', 'libtirpc', 'libnsl2', 'libedit', 'openssl', 'ncurses', 'gdbm', 'sqlite3', 'xz', 'util-linux-libuuid']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddrm-msm-experimental=false -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus-experimental=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/build
| Build type: cross build
| 
| ../git/meson.build:24:0: ERROR: Unknown options: "venus-experimental"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.798052:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.798052, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.798052, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.798052, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.798052, line 186
NOTE: recipe virglrenderer-1.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1764 tasks of which 1754 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.0.0-r0 do_configure: meson failed
ERROR: virglrenderer-1.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.798052', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/log.do_configure.798052
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure) failed with exit code '1'

--===============7765787117761703749==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-0.10.4-1.0.0.patch"

RnJvbSBmYTRkMDRlNGM1ODdkOGEzMDdkMWU5MjhjM2JlNjcxYzIyMGRkMzE0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTc6NDE6NTggKzAwMDAKU3ViamVjdDogW1BBVENIXSB2
aXJnbHJlbmRlcmVyOiB1cGdyYWRlIDAuMTAuNCAtPiAxLjAuMAoKLS0tCiAuLi4xLW1lc29uLmJ1
aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2ggfCAxMCArKysrKy0tLS0t
CiAuLi57dmlyZ2xyZW5kZXJlcl8wLjEwLjQuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjAuMC5iYn0g
fCAgNCArKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci97dmlyZ2xyZW5k
ZXJlcl8wLjEwLjQuYmIgPT4gdmlyZ2xyZW5kZXJlcl8xLjAuMC5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyLzAw
MDEtbWVzb24uYnVpbGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNv
bi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoCmluZGV4IDgyMzBi
YTU4OGIuLmYyMmFlNmIyMzEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJn
bHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJl
Y3RseS1mb3ItcHl0aG9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJl
bmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAwMS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3Rs
eS1mb3ItcHl0aG9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBjODUzYzllNWM0NGYxYjIz
YTE1YTdiYTYyOWVlMDJmN2Q4ZWMyM2EwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA1
OWQ4MGI5MjM4ZDIzMWZlZDVmY2RiMTA3NDI5YTFkZjE2ZjcyZmRkIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+
CiBEYXRlOiBNb24sIDYgSmFuIDIwMjAgMTI6NDQ6NDIgKzAxMDAKIFN1YmplY3Q6IFtQQVRDSF0g
bWVzb24uYnVpbGQ6IHVzZSAncHl0aG9uMycgZGlyZWN0bHkgZm9yIHB5dGhvbgpAQCAtMTQsMTUg
KzE0LDE1IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5A
Z21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigt
KQogCiBkaWZmIC0tZ2l0IGEvbWVzb24uYnVpbGQgYi9tZXNvbi5idWlsZAotaW5kZXggMTNkOTVi
Yi4uYjI0MWViMiAxMDA2NDQKK2luZGV4IGRlNmQxNmI1Li43OWNlZGJmNiAxMDA2NDQKIC0tLSBh
L21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAotQEAgLTY0LDcgKzY0LDcgQEAgZmxhZ3Mg
PSBbCitAQCAtNjgsNyArNjgsNyBAQCBmbGFncyA9IFsKICAKICBhZGRfcHJvamVjdF9hcmd1bWVu
dHMoY2MuZ2V0X3N1cHBvcnRlZF9hcmd1bWVudHMoZmxhZ3MpLCBsYW5ndWFnZSA6ICdjJykKICAK
IC1wcm9nX3B5dGhvbiA9IGltcG9ydCgncHl0aG9uJykuZmluZF9pbnN0YWxsYXRpb24oJ3B5dGhv
bjMnKQogK3Byb2dfcHl0aG9uID0gJ3B5dGhvbjMnCiAgCi0gbGliZHJtX2RlcCA9IGRlcGVuZGVu
Y3koJ2xpYmRybScsIHZlcnNpb24gOiAnPj0yLjQuNTAnKQotIHRocmVhZF9kZXAgPSBkZXBlbmRl
bmN5KCd0aHJlYWRzJykKKyBub3RfZm91bmQgPSBkZXBlbmRlbmN5KCcnLCByZXF1aXJlZDogZmFs
c2UpCisgbGliZHJtX2RlcCA9IGRlcGVuZGVuY3koJ2xpYmRybScsIHZlcnNpb24gOiAnPj0yLjQu
NTAnLCByZXF1aXJlZDogZ2V0X29wdGlvbignZHJtJykuZW5hYmxlZCgpIG9yIGdldF9vcHRpb24o
J3ZlbnVzJykpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJl
ci92aXJnbHJlbmRlcmVyXzAuMTAuNC5iYiBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJl
bmRlcmVyL3ZpcmdscmVuZGVyZXJfMS4wLjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8w
LjEwLjQuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3Zp
cmdscmVuZGVyZXJfMS4wLjAuYmIKaW5kZXggZjc2ZTdjYjFiOS4uN2FmMGU5YzhlZSAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlcl8w
LjEwLjQuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xy
ZW5kZXJlcl8xLjAuMC5iYgpAQCAtOSw4ICs5LDggQEAgTElDRU5TRSA9ICJNSVQiCiBMSUNfRklM
RVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HO21kNT1jODFjMDhlZWVmZDk0MThmY2E4Zjg4MzA5
YTc2ZGIxMCIKIAogREVQRU5EUyA9ICJsaWJkcm0gbGliZXBveHkgdmlydHVhbC9lZ2wgdmlydHVh
bC9saWJnYm0iCi1TUkNSRVYgPSAiODhiOWZlM2JmYzY0YjIzYTcwMWU0ODc1MDA2ZGJjMGU3Njlm
MTRmNiIKLVNSQ19VUkkgPSAiZ2l0Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy92aXJnbC92aXJn
bHJlbmRlcmVyLmdpdDticmFuY2g9bWFzdGVyO3Byb3RvY29sPWh0dHBzIFwKK1NSQ1JFViA9ICI5
YzlkNTVlY2JlNTAyZTBkNzFlZTk5NTI5NzA5ZWZjY2E2OWFhYzQyIgorU1JDX1VSSSA9ICJnaXQ6
Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVuZGVyZXIuZ2l0O2JyYW5jaD1t
YWluO3Byb3RvY29sPWh0dHBzIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtbWVzb24uYnVpbGQt
dXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCBcCiAgICAgICAgICAgICIKIAot
LSAKMi4zOS4yCgo=

--===============7765787117761703749==--

