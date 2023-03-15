Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2882C77B76
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 15:55:31 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web10.12307.1678895728218987916
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 08:55:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=eBakGo5T;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010186e5fbc118-aafc625e-4a32-447f-bbc1-4a325a1bbf90-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=3XSyMKEhSPNhBptEO+sedfoVYBsuuYdS+Z9u+S4IihA=;
	b=eBakGo5TEyZuxnqrH2cIazAJ0LrcXkXD+Ujkl1H9yzp9Acnm5d4Nnq2bdYt+g2LQ
	G64NdjiOQS2/o+hmSI+k02aac1r13sPtcxgYe2wJcegFM9mKbHCoOD0+hTit2KOivi6
	dzFeO4eURXrL+k6Ku/nvivHiYbSAlfDhuH9g90+g=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1678895727;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=3XSyMKEhSPNhBptEO+sedfoVYBsuuYdS+Z9u+S4IihA=;
	b=qVCZqUL5yINDjRZp5YSlF8CphjEXrzucBvVPB+LeK+tohTenA4hSglwlOwHsWwbM
	hwdkYyKaQyXetsRDzdtp+kSbbjo2NEeq/8KrhkdvPVwTvIOr0nMl/JR1ZIKzRx6Y6qy
	hyy6RN3mPDKTakUjo9Xnb9hgZNSdJL/emyyoMmXc=
Content-Type: multipart/mixed; boundary="===============4833872641392714889=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.17.0 FAILED
Message-ID: <01010186e5fbc118-aafc625e-4a32-447f-bbc1-4a325a1bbf90-000000@us-west-2.amazonses.com>
Date: Wed, 15 Mar 2023 15:55:26 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.03.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 15:55:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178627

--===============4833872641392714889==
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
--===============4833872641392714889==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.16.0-2.17.0.patch"

RnJvbSA3YjdjYzA0ODAwZmU0ZTEwNzg2ZjQzYjQ3NmQwMWUyNDI5NTA0YTk4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTWFyIDIwMjMgMTE6NDc6MTMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBs
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
MC5iYgotLSAKMi4zOS4yCgo=

--===============4833872641392714889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1790 entries from dependency cache.
Parsing recipes...done.
Parsing of 896 .bb files complete (894 cached, 2 parsed). 1790 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-ed9096d47d9f3fad77bac1e0670f19905526562b"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:ed9096d47d9f3fad77bac1e0670f19905526562b"
workspace            = "master:37b5d544d34c9caaf70def0a29dfb0cf896dc1b7"

Initialising tasks...done.
Sstate summary: Wanted 110 Local 103 Mirrors 0 Missed 7 Current 266 (93% match, 98% complete)
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
NOTE: recipe libva-2.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.17.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.17.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1373 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure)
NOTE: recipe libva-2.17.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto
 -worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sys
 root', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'mesa', 'wayland', 'libx11', 'libxext', 'libxfixes', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'wayland-native', 'linux-libc-headers', 'texinfo-dummy-native', 'xz-native', 'gmp-native', 'zstd-native', 'flex-native', 'gnu-config-native', 'binutils-cross-i686', 'libmpc-native', 'zlib-native', 'libtool-native', 'mpfr-native', 'xorgproto', 'vulkan-headers', 'vulkan-loader', 'libxshmfence', 'expat', 'wayland-protocols', 'xrandr', 'zlib', 'libxxf86vm', 'libxdamage', 're2c-native', 'attr-native', 'python3-setuptools-native', 'python3-build-native', 'python3-wheel-native', 'python3-installer-native', 'libpciaccess', 'libpthread-stubs', 'util-macros', 'libxml2-native', 'expat-native', 'libffi-native', 'libxcb', 'xtrans', 'autoconf-archive', 'openssl-native', 'util-linux-libuuid-native', 'ncurses-native',
  'libtirpc-native', 'libnsl2-native', 'gdbm-native', 'readline-native', 'sqlite3-native', 'bzip2-native', 'libxml2', 'libffi', 'glib-2.0-native', 'libgcc', 'gettext-minimal-native', 'm4-native', 'libxrandr', 'libxrender', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'python3-flit-core-native', 'cmake-native', 'libxau', 'libxdmcp', 'xcb-proto', 'perl-native', 'python3', 'gettext-native', 'util-linux-native', 'libpcre2-native', 'unzip-native', 'make-native', 'ncurses', 'sqlite3', 'opkg-utils', 'gdbm', 'xz', 'libxcrypt', 'libtirpc', 'libnsl2', 'bzip2', 'readline', 'openssl', 'util-linux-libuuid', 'libcap-ng-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dwith_glx=yes -Dwith_wayland=yes -Dwith_x11=yes...
| The Meson build system
| Version: 1.0.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/libva-2.17.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/build
| Build type: cross build
| Project name: libva
| Project version: 2.17.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.981625:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.981625, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.981625, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.981625, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.981625, line 186
NOTE: recipe libva-2.17.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1373 tasks of which 1365 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libva-2.17.0-r0 do_configure: meson failed
ERROR: libva-2.17.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.981625', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/log.do_configure.981625
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure) failed with exit code '1'

--===============4833872641392714889==--

