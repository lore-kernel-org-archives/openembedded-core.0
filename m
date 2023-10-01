Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D481E776F5
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 18:13:19 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.64726.1696183990210813827
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Oct 2023 11:13:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=O+cBdeBt;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=qZlE4qPJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018aec71bd2b-6472331e-0b60-4142-8521-ac66c0c387e2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6huqEZ6Jor2YSQdVuxzfHW6h8a1pkRfhipJ7pBdXr5E=;
	b=O+cBdeBtwwwjLZ7rFi+AktnX6upd3b8kEct+UpvafH80e6TKIbFRij92yHwsdwLF
	M2w5Xw4spcpvuCAASdr91GSKtyoQrj4RDV3Xy/11zBVzqBTZrq5glSvm8nQ7RdyrmBN
	jYQb6cFMEPDXEXjKDJUtRhanGYVA0nvBGe/7ncNg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1696183991;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6huqEZ6Jor2YSQdVuxzfHW6h8a1pkRfhipJ7pBdXr5E=;
	b=qZlE4qPJRs4J9g654QQge+H3LxG+kI8cOiss7ysQFcTdVyzMK4/MfwVmi5uQ28/b
	MRI2ISSGIc1l83mQlUiWczIna7hVtSYKR4VBbciakmtF7OBMrCbyKlBIaY+pHUgnaHA
	vXIGfFiJ6aZQ5zY1xw6CoRxruUBvX6QKYlRBU9tQ=
Content-Type: multipart/mixed; boundary="===============2637712333647873582=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] virglrenderer: upgrading to 1.0.0 FAILED
Message-ID: <0101018aec71bd2b-6472331e-0b60-4142-8521-ac66c0c387e2-000000@us-west-2.amazonses.com>
Date: Sun, 1 Oct 2023 18:13:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Oct 2023 18:13:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188565

--===============2637712333647873582==
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
From 9ff16611130fb4aebdf0321cb72a1399c041bee1 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Oct 2023 16:01:39 +0000
Subject: [PATCH] virglrenderer: upgrade 0.10.4 -> 1.0.0

---
 ...1-meson.build-use-python3-directly-for-python.patch | 10 +++++-----
 ...{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename meta/recipes-graphics/virglrenderer/{virglrenderer_0.10.4.bb => virglrenderer_1.0.0.bb} (94%)

diff --git a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
index 8230ba588b..55a6b9aabe 100644
--- a/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
+++ b/meta/recipes-graphics/virglrenderer/virglrenderer/0001-meson.build-use-python3-directly-for-python.patch
@@ -1,4 +1,4 @@
-From c853c9e5c44f1b23a15a7ba629ee02f7d8ec23a0 Mon Sep 17 00:00:00 2001
+From e4afe87bd337c19f5f9c1209021ce8c404808223 Mon Sep 17 00:00:00 2001
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


--===============2637712333647873582==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1843 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.2+snapshot-ddb075c8e6c310d0cc256a2d310ed99a9c877f19"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ddb075c8e6c310d0cc256a2d310ed99a9c877f19"
workspace            = "master:ab127e266ecd9f1cf6606d77fe1482d5e23abc52"

Initialising tasks...done.
Sstate summary: Wanted 187 Local 177 Mirrors 0 Missed 10 Current 451 (94% match, 98% complete)
NOTE: Executing Tasks
NOTE: Running setscene task 458 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 489 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_create_spdx_setscene)
NOTE: Running task 1045 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_recipe_qa)
NOTE: Running task 1052 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_write_config)
NOTE: recipe mesa-2_23.1.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_recipe_qa: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_23.1.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 490 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_create_spdx_setscene)
NOTE: Running setscene task 493 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.0.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1102 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_fetch)
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.0.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.3.261.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 511 of 638 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.0.0-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.116-r0: task do_create_spdx_setscene: Succeeded
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
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1260 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1308 of 1774 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_populate_lic)
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
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.116.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.8.bb:do_populate_sysroot', '/home/pokybuild/yoc
 to-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.261.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.261.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/p
 ython3_3.11.5.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'libepoxy', 'mesa', 'vulkan-headers', 'vulkan-loader', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'expat', 'libxxf86vm', 'libx11', 'xrandr', 'wayland', 'libxdamage', 'wayland-protocols', 'libxshmfence', 'libxext', 'xorgproto', 'libxfixes', 'zlib', 'linux-libc-headers', 'libtool-native', 'python3-build-native', 'python3-installer-native', 'python3-setuptools-native', 'python3-wheel-native', 'attr-native', 'libxrandr', 'libxcb', 'zstd-native', 'flex-native', 'libmpc-native', 'texinfo-dummy-native', 'gnu-config-native', 'gmp-native', 'binutils-cross-i686', 'xz-native', 'zlib-native', 'mpfr-native', 'libffi-native', 'expat-native', 'libtirpc-native', 'bzip2-native', 'gdbm-native', 'libnsl2-native', 'util-linux-libuuid-native', 'ncurses-native', 'libedit-native', 'openssl-native', 'sqlite3-native', 'l
 ibgcc', 'glib-2.0-native', 'libpthread-stubs', 'libpciaccess', 're2c-native', 'util-macros', 'xtrans', 'libxrender', 'libffi', 'libxml2', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'python3-flit-core-native', 'gettext-minimal-native', 'xcb-proto', 'libxdmcp', 'libxau', 'm4-native', 'cmake-native', 'perl-native', 'util-linux-native', 'gettext-native', 'libpcre2-native', 'python3', 'unzip-native', 'make-native', 'libcap-ng-native', 'openssl', 'bzip2', 'sqlite3', 'xz', 'libxcrypt', 'opkg-utils', 'libnsl2', 'ncurses', 'libtirpc', 'libedit', 'gdbm', 'util-linux-libuuid']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddrm-msm-experimental=false -Dminigbm_allocation=false -Drender-server=false -Dtests=false -Dvideo=false -Dvenus-experimental=true -Dvenus-validate=false...
| The Meson build system
| Version: 1.2.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/git
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/build
| Build type: cross build
| 
| ../git/meson.build:24:0: ERROR: Unknown options: "venus-experimental"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.255872:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.255872, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.255872, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.255872, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.255872, line 186
NOTE: recipe virglrenderer-1.0.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1764 tasks of which 1754 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: virglrenderer-1.0.0-r0 do_configure: meson failed
ERROR: virglrenderer-1.0.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/run.do_configure.255872', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/virglrenderer/1.0.0/temp/log.do_configure.255872
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/virglrenderer/virglrenderer_1.0.0.bb:do_configure) failed with exit code '1'

--===============2637712333647873582==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-virglrenderer-upgrade-0.10.4-1.0.0.patch"

RnJvbSA5ZmYxNjYxMTEzMGZiNGFlYmRmMDMyMWNiNzJhMTM5OWMwNDFiZWUxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBPY3QgMjAyMyAxNjowMTozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHZp
cmdscmVuZGVyZXI6IHVwZ3JhZGUgMC4xMC40IC0+IDEuMC4wCgotLS0KIC4uLjEtbWVzb24uYnVp
bGQtdXNlLXB5dGhvbjMtZGlyZWN0bHktZm9yLXB5dGhvbi5wYXRjaCB8IDEwICsrKysrLS0tLS0K
IC4uLnt2aXJnbHJlbmRlcmVyXzAuMTAuNC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMC4wLmJifSB8
ICA0ICsrLS0KIDIgZmlsZXMgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygt
KQogcmVuYW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3t2aXJnbHJlbmRl
cmVyXzAuMTAuNC5iYiA9PiB2aXJnbHJlbmRlcmVyXzEuMC4wLmJifSAoOTQlKQoKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVyL3ZpcmdscmVuZGVyZXIvMDAw
MS1tZXNvbi5idWlsZC11c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29u
LmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5LWZvci1weXRob24ucGF0Y2gKaW5kZXggODIzMGJh
NTg4Yi4uNTVhNmI5YWFiZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3Zpcmds
cmVuZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVj
dGx5LWZvci1weXRob24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlci8wMDAxLW1lc29uLmJ1aWxkLXVzZS1weXRob24zLWRpcmVjdGx5
LWZvci1weXRob24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGM4NTNjOWU1YzQ0ZjFiMjNh
MTVhN2JhNjI5ZWUwMmY3ZDhlYzIzYTAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGU0
YWZlODdiZDMzN2MxOWY1ZjljMTIwOTAyMWNlOGM0MDQ4MDgyMjMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IE1vbiwgNiBKYW4gMjAyMCAxMjo0NDo0MiArMDEwMAogU3ViamVjdDogW1BBVENIXSBt
ZXNvbi5idWlsZDogdXNlICdweXRob24zJyBkaXJlY3RseSBmb3IgcHl0aG9uCkBAIC0xNCwxNSAr
MTQsMTUgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxkCi1pbmRleCAxM2Q5NWJi
Li5iMjQxZWIyIDEwMDY0NAoraW5kZXggZGU2ZDE2YjUuLjc5Y2VkYmY2IDEwMDY0NAogLS0tIGEv
bWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCi1AQCAtNjQsNyArNjQsNyBAQCBmbGFncyA9
IFsKK0BAIC02OCw3ICs2OCw3IEBAIGZsYWdzID0gWwogIAogIGFkZF9wcm9qZWN0X2FyZ3VtZW50
cyhjYy5nZXRfc3VwcG9ydGVkX2FyZ3VtZW50cyhmbGFncyksIGxhbmd1YWdlIDogJ2MnKQogIAog
LXByb2dfcHl0aG9uID0gaW1wb3J0KCdweXRob24nKS5maW5kX2luc3RhbGxhdGlvbigncHl0aG9u
MycpCiArcHJvZ19weXRob24gPSAncHl0aG9uMycKICAKLSBsaWJkcm1fZGVwID0gZGVwZW5kZW5j
eSgnbGliZHJtJywgdmVyc2lvbiA6ICc+PTIuNC41MCcpCi0gdGhyZWFkX2RlcCA9IGRlcGVuZGVu
Y3koJ3RocmVhZHMnKQorIG5vdF9mb3VuZCA9IGRlcGVuZGVuY3koJycsIHJlcXVpcmVkOiBmYWxz
ZSkKKyBsaWJkcm1fZGVwID0gZGVwZW5kZW5jeSgnbGliZHJtJywgdmVyc2lvbiA6ICc+PTIuNC41
MCcsIHJlcXVpcmVkOiBnZXRfb3B0aW9uKCdkcm0nKS5lbmFibGVkKCkgb3IgZ2V0X29wdGlvbign
dmVudXMnKSkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy92aXJnbHJlbmRlcmVy
L3ZpcmdscmVuZGVyZXJfMC4xMC40LmJiIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVu
ZGVyZXIvdmlyZ2xyZW5kZXJlcl8xLjAuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzAu
MTAuNC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL3ZpcmdscmVuZGVyZXIvdmly
Z2xyZW5kZXJlcl8xLjAuMC5iYgppbmRleCBmNzZlN2NiMWI5Li43YWYwZTljOGVlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJlbmRlcmVyXzAu
MTAuNC5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvdmlyZ2xyZW5kZXJlci92aXJnbHJl
bmRlcmVyXzEuMC4wLmJiCkBAIC05LDggKzksOCBAQCBMSUNFTlNFID0gIk1JVCIKIExJQ19GSUxF
U19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PWM4MWMwOGVlZWZkOTQxOGZjYThmODgzMDlh
NzZkYjEwIgogCiBERVBFTkRTID0gImxpYmRybSBsaWJlcG94eSB2aXJ0dWFsL2VnbCB2aXJ0dWFs
L2xpYmdibSIKLVNSQ1JFViA9ICI4OGI5ZmUzYmZjNjRiMjNhNzAxZTQ4NzUwMDZkYmMwZTc2OWYx
NGY2IgotU1JDX1VSSSA9ICJnaXQ6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3Zpcmds
cmVuZGVyZXIuZ2l0O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHMgXAorU1JDUkVWID0gIjlj
OWQ1NWVjYmU1MDJlMGQ3MWVlOTk1Mjk3MDllZmNjYTY5YWFjNDIiCitTUkNfVVJJID0gImdpdDov
L2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvdmlyZ2wvdmlyZ2xyZW5kZXJlci5naXQ7YnJhbmNoPW1h
aW47cHJvdG9jb2w9aHR0cHMgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1tZXNvbi5idWlsZC11
c2UtcHl0aG9uMy1kaXJlY3RseS1mb3ItcHl0aG9uLnBhdGNoIFwKICAgICAgICAgICAgIgogCi0t
IAoyLjM5LjIKCg==

--===============2637712333647873582==--

