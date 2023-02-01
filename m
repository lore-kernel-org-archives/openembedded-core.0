Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACF2AC76196
	for <webhook@archiver.kernel.org>; Wed,  1 Feb 2023 17:34:24 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.30350.1675272853813908292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Feb 2023 09:34:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=aFQTIxcB;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 010101860e0b24a3-9da15bd2-aab5-47b5-9719-c49c0f3e4345-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=15yH1VKdVcIerp3uXnegy6hwQYXuZ1TftWE+lvlMueI=;
	b=aFQTIxcB20H72CRdzRilevm2UsEGkPrZK/z4SylKKYEJIA/pKpAg+6Uo/gPolzUy
	JlRe4LhtHHwNazmRpFLa+1vJ/Pa+5xsBuxpasCz1IXLPyZ0WHnup6JgOQkUmVmbCIfa
	GsjXIdNt3rmjxw4QYb21XK/vo9bIB0CV36w9EGUA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1675272856;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=15yH1VKdVcIerp3uXnegy6hwQYXuZ1TftWE+lvlMueI=;
	b=jQcGTam8CUuyKLa0Xs8QNU/lrKm9MXUfDb2aKTF8wuT0fM75xs8YrtT/ljKmA2K6
	1UaYmYkrLSjHzp06hJdiDGiQDf4fytOQnK7HUAkqdQRLGD9cmOY7gj18hrJGMOkLxbU
	jvBSvfjt10n2nV1vtsQDu/U9m+g/syNezceTkoLs=
Content-Type: multipart/mixed; boundary="===============8449070813717656293=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.17.0 FAILED
Message-ID: <010101860e0b24a3-9da15bd2-aab5-47b5-9719-c49c0f3e4345-000000@us-west-2.amazonses.com>
Date: Wed, 1 Feb 2023 17:34:16 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Feb 2023 17:34:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176617

--===============8449070813717656293==
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
--===============8449070813717656293==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.16.0-2.17.0.patch"

RnJvbSBlM2IyZjIxODJjNGZkMjUyN2I1MjM0OTBjMDcwMmJiNTg0N2M4YTM2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBGZWIgMjAyMyAxNToxMjoyNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnZhOiB1cGdyYWRlIDIuMTYuMCAtPiAyLjE3LjAKCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2xpYnZhL2xpYnZhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMTYuMC5iYiA9PiBsaWJ2YV8yLjE3LjAuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS97bGlidmFfMi4xNi4wLmJiID0+IGxpYnZh
XzIuMTcuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xp
YnZhL2xpYnZhLmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKaW5k
ZXggMGYxNmRhY2M5OC4uOWE3NDM1NGIzOSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2xpYnZhL2xpYnZhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGli
dmEuaW5jCkBAIC0xOCw3ICsxOCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9saWJ2YS0ke1BWfS50YXIuYnoyIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmU0ODk0MGY5NGFjYjBhZjU4MmU1
ZWYwMzUzNzgwMGYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMTE1ZmFjYTBkYjJjNDE3YTM3ZGE0
OTgzMDg3MGUyNjA0NTBmYTEzMDY2ZjVlMjRlMjUyYTIwYzM2ZDkyMGExYyIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICJmM2U1ZWIyN2MzMDVlMDVhOWJiNjI3MDNkMTkxNWExMjczMDFjYzBjNGY5ZjIw
OTAyNTc2NzQzMjIzMGM0ZWFjIgogCiBTID0gIiR7V09SS0RJUn0vbGlidmEtJHtQVn0iCiAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjE2LjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xNy4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4x
Ni4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4xNy4w
LmJiCi0tIAoyLjM3LjMKCg==

--===============8449070813717656293==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.7" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1697 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (896 cached, 2 parsed). 1697 targets, 41 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.1"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8dc15513bd17f8188312aee3dc33f57db8a00c74"
workspace            = "master:da95831d91b1265ecaee5bbfaeb1caaa2c290838"

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
NOTE: recipe libva-2.17.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.17.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.17.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.17.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1373 of 1381 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure)
NOTE: recipe libva-2.17.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.114.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_22.3.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot', '/home/pokybuild/yocto
 -worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.0.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sys
 root', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.21.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libdrm', 'mesa', 'wayland', 'libx11', 'libxext', 'libxfixes', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'wayland-native', 'zlib-native', 'xz-native', 'glib-2.0-native', 'libpciaccess', 'libpthread-stubs', 'xorgproto', 'util-macros', 'libxml2', 'libffi', 'expat', 'libtool-native', 'gdbm-native', 'openssl-native', 'util-linux-libuuid-native', 'sqlite3-native', 'ncurses-native', 'libnsl2-native', 'readline-native', 'bzip2-native', 'libtirpc-native', 'libffi-native', 'binutils-cross-i686', 'gmp-native', 'mpfr-native', 'linux-libc-headers', 'gnu-config-native', 'flex-native', 'zstd-native', 'texinfo-dummy-native', 'libmpc-native', 're2c-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-build-native', 'attr-native', 'libxcb', 'xtrans', 'autoconf-archive', 'libgc
 c', 'vulkan-loader', 'zlib', 'libxxf86vm', 'libxshmfence', 'vulkan-headers', 'wayland-protocols', 'xrandr', 'libxdamage', 'expat-native', 'libxml2-native', 'gettext-minimal-native', 'util-linux-native', 'gettext-native', 'libpcre2-native', 'python3', 'perl-native', 'm4-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'xcb-proto', 'libxau', 'libxdmcp', 'libxrandr', 'libxrender', 'cmake-native', 'libcap-ng-native', 'sqlite3', 'bzip2', 'opkg-utils', 'ncurses', 'libnsl2', 'libtirpc', 'xz', 'util-linux-libuuid', 'readline', 'gdbm', 'openssl', 'libxcrypt', 'make-native', 'unzip-native']
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
| Run-time dependency libdrm found: YES 2.4.114
| Run-time dependency x11 found: YES 1.8.3
| Run-time dependency xext found: YES 1.3.5
| Run-time dependency xfixes found: YES 6.0.0
| Run-time dependency x11-xcb found: YES 1.8.3
| Run-time dependency xcb found: YES 1.15
| Run-time dependency xcb-dri3 found: YES 1.15
| Run-time dependency gl found: YES 22.3.3
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.3992705:173 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.3992705, line 173
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.3992705, line 162
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.3992705, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.3992705, line 186
NOTE: recipe libva-2.17.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1373 tasks of which 1365 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libva-2.17.0-r0 do_configure: meson failed
ERROR: libva-2.17.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/run.do_configure.3992705', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/libva/2.17.0-r0/temp/log.do_configure.3992705
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libva/libva_2.17.0.bb:do_configure) failed with exit code '1'

--===============8449070813717656293==--

