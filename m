Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6FCC6FD20
	for <webhook@archiver.kernel.org>; Thu, 16 Feb 2023 00:46:45 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.10298.1676508397983342317
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Feb 2023 16:46:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=ElUCZ12e;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101018657affe8e-fe3c1510-95c5-4304-9f9e-738bc834a4a2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=L0G/v7h3V1aOkSA/DFXQJTET/hGBwXQ8Nawqq63APfM=;
	b=ElUCZ12e8kf1oxEHAi8Kg7IqL1Q8d2m7Kz7jr0F6hvEqrD9Ji+efu0kIBJ7vfuyR
	fsfHju6nbJhchQTgCY2eK2wdWiwFbnL/bDU1G8WqDDn5r1sw5LDbIrKpwz1Li2BFmwg
	oJdNt4yFOJNAcD7HgtRRmlRdOmpiKpQ7Ihed3o3I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1676508397;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=L0G/v7h3V1aOkSA/DFXQJTET/hGBwXQ8Nawqq63APfM=;
	b=HYV41HVpBhdp9bPHo3fkjkHKwczcGkqmbjHjKsy8GZCB0WRpQf65+LyNv2L/ACEM
	4b7VYRNbRubC5mUbl8UMq/3P4xrzGwPQbQGegbTy2Ef9a1PEUsfBV89S/Ey5s2nCAJX
	TnPuTsbpHn0mEHSLrW/4GWGyCMpQF2fM3lp+8LsA=
Content-Type: multipart/mixed; boundary="===============5868259893601297735=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.17.0 FAILED
Message-ID: <0101018657affe8e-fe3c1510-95c5-4304-9f9e-738bc834a4a2-000000@us-west-2.amazonses.com>
Date: Thu, 16 Feb 2023 00:46:37 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.16-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 16 Feb 2023 00:46:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177252

--===============5868259893601297735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.17.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.16.0-2.17.0.patch
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
--===============5868259893601297735==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.16.0-2.17.0.patch"

RnJvbSAzZDE1YTNjZGUwYzQ5NWNmZGU3ZGZhMDI0OGU4ZWYwYTRlNzYzNDk3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgRmViIDIwMjMgMjA6NTI6MDQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
aWJ2YTogdXBncmFkZSAyLjE2LjAgLT4gMi4xNy4wCgotLS0KIG1ldGEvcmVjaXBlcy1ncmFwaGlj
cy9saWJ2YS9saWJ2YS5pbmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDIgKy0KIC4uLi9y
ZWNpcGVzLWdyYXBoaWNzL2xpYnZhL3tsaWJ2YV8yLjE2LjAuYmIgPT4gbGlidmFfMi4xNy4wLmJi
fSB8IDAKIDIgZmlsZXMgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTYuMC5iYiA9PiBsaWJ2
YV8yLjE3LjAuYmJ9ICgxMDAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9s
aWJ2YS9saWJ2YS5pbmMgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmEuaW5jCmlu
ZGV4IDBmMTZkYWNjOTguLjlhNzQzNTRiMzkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1ncmFw
aGljcy9saWJ2YS9saWJ2YS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xp
YnZhLmluYwpAQCAtMTgsNyArMTgsNyBAQCBMSUNFTlNFID0gIk1JVCIKIAogU1JDX1VSSSA9ICIk
e0dJVEhVQl9CQVNFX1VSSX0vZG93bmxvYWQvJHtQVn0vbGlidmEtJHtQVn0udGFyLmJ6MiIKIExJ
Q19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7bWQ1PTJlNDg5NDBmOTRhY2IwYWY1ODJl
NWVmMDM1Mzc4MDBmIgotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjExNWZhY2EwZGIyYzQxN2EzN2Rh
NDk4MzA4NzBlMjYwNDUwZmExMzA2NmY1ZTI0ZTI1MmEyMGMzNmQ5MjBhMWMiCitTUkNfVVJJW3No
YTI1NnN1bV0gPSAiZjNlNWViMjdjMzA1ZTA1YTliYjYyNzAzZDE5MTVhMTI3MzAxY2MwYzRmOWYy
MDkwMjU3Njc0MzIyMzBjNGVhYyIKIAogUyA9ICIke1dPUktESVJ9L2xpYnZhLSR7UFZ9IgogCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xNi4wLmJiIGIv
bWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTcuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDEwMCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIu
MTYuMC5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xpYnZhL2xpYnZhXzIuMTcu
MC5iYgotLSAKMi4zNy4zCgo=

--===============5868259893601297735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1693 entries from dependency cache.
Parsing recipes...done.
Parsing of 895 .bb files complete (893 cached, 2 parsed). 1693 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.2.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-39d0f2ce9815f675d43a1bcab299f7fbd37cd8d5"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:39d0f2ce9815f675d43a1bcab299f7fbd37cd8d5"
workspace            = "master:44311c454d0b0856f58cfa6fa60669903b2ba3af"

Initialising tasks...done.
Sstate summary: Wanted 109 Local 102 Mirrors 0 Missed 7 Current 267 (93% match, 98% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1233 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_fetch)
NOTE: Running task 1359 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_write_config)
NOTE: recipe libva-2.17.0-r0: task do_fetch: Started
NOTE: recipe libva-2.17.0-r0: task do_fetch: Succeeded
NOTE: recipe libva-2.17.0-r0: task do_write_config: Started
NOTE: Running task 1368 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_unpack)
NOTE: Running task 1369 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.17.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.17.0-r0: task do_unpack: Started
NOTE: recipe libva-2.17.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1370 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_patch)
NOTE: recipe libva-2.17.0-r0: task do_patch: Started
NOTE: recipe libva-2.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1371 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1372 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_populate_lic)
NOTE: recipe libva-2.17.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.17.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.17.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1373 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure)
NOTE: recipe libva-2.17.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto
 -worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sys
 root', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'mesa', 'wayland', 'libx11', 'libxext', 'libxfixes', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'wayland-native', 'libxml2-native', 'xz-native', 'expat-native', 'libffi-native', 'attr-native', 'libtool-native', 'util-macros', 'xorgproto', 'openssl-native', 'util-linux-libuuid-native', 'libtirpc-native', 'ncurses-native', 'sqlite3-native', 'zlib-native', 'gdbm-native', 'readline-native', 'libnsl2-native', 'bzip2-native', 'python3-build-native', 'python3-wheel-native', 'python3-installer-native', 'python3-setuptools-native', 'flex-native', 'gnu-config-native', 'texinfo-dummy-native', 'gmp-native', 'libmpc-native', 'linux-libc-headers', 'binutils-cross-i686', 'zstd-native', 'mpfr-native', 'libxml2', 'expat', 'libffi', 'libpthread-stubs', 'libpciaccess', 'libxcb', 'autoconf-archive', 'xtrans', 'glib-
 2.0-native', 'libgcc', 'libxxf86vm', 'vulkan-loader', 'vulkan-headers', 'libxdamage', 'zlib', 'xrandr', 'libxshmfence', 'wayland-protocols', 're2c-native', 'gettext-minimal-native', 'cmake-native', 'perl-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'python3-flit-core-native', 'm4-native', 'python3', 'xcb-proto', 'libxau', 'libxdmcp', 'libpcre2-native', 'gettext-native', 'util-linux-native', 'libxrandr', 'libxrender', 'make-native', 'unzip-native', 'libxcrypt', 'sqlite3', 'readline', 'bzip2', 'libtirpc', 'gdbm', 'util-linux-libuuid', 'libnsl2', 'ncurses', 'xz', 'opkg-utils', 'openssl', 'libcap-ng-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dwith_glx=yes -Dwith_wayland=yes -Dwith_x11=yes...
| The Meson build system
| Version: 1.0.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/libva-2.17.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/build
| Build type: cross build
| Project name: libva
| Project version: 2.17.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.39.0.20220819
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Library dl found: YES
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency libdrm found: YES 2.4.115
| Run-time dependency x11 found: YES 1.8.4
| Run-time dependency xext found: YES 1.3.5
| Run-time dependency xfixes found: YES 6.0.0
| Run-time dependency x11-xcb found: YES 1.8.4
| Run-time dependency xcb found: YES 1.15
| Run-time dependency xcb-dri3 found: YES 1.15
| Run-time dependency gl found: YES 22.3.5
| Run-time dependency wayland-client found: YES 1.21.0
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot-native/usr/bin/pkg-config-native (0.29.2)
| Build-time dependency wayland-scanner found: YES 1.21.0
| Program /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/wayland-scanner found: YES (/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/wayland-scanner)
| Configuring va_version.h using configuration
| Checking if "-Wl,--version-script" : links: YES
| 
| ../libva-2.17.0/va/meson.build:70:0: ERROR: File libva.def does not exist.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.956927:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.956927, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.956927, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.956927, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.956927, line 186
NOTE: recipe libva-2.17.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1373 tasks of which 1365 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libva-2.17.0-r0 do_configure: meson failed
ERROR: libva-2.17.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.956927', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/log.do_configure.956927
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure) failed with exit code '1'

--===============5868259893601297735==--

