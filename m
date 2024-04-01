Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36958CD13AB
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:03:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.44633.1711994600755626104
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:03:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=GZB8I6Hl;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=cWK4g7Er;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101018e9ad48441-5eb6c0dc-a6f2-4c00-b2c9-bc9d37c60449-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+AzNSg/L2cnDr7oPafr+tCZMiVUBXJa+r08tiFhDUy4=;
	b=GZB8I6Hl/cvc02kQmdwY5eScMu99s/+qEBWLmPch4XyRpOCUfzMuj20l4vn2n4Bm
	Clx7qdtz3YKSxJVwBCsD3qWLDqC2kAaz8H8UdRhdvgwDw1eoHtbmUn38Podz6tPHvTS
	3vQwfNDqgrSP4hlK5Lhwjv7/mao2jsRfgrQijjA0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711994602;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+AzNSg/L2cnDr7oPafr+tCZMiVUBXJa+r08tiFhDUy4=;
	b=cWK4g7ErvE8CDL9G0l/kb2g+T6krn/0DyotPT17lFQwP52cmWp3tnuYgtOyyPxHV
	BMoQnKGS4WLgCxISJqzoHJKNirWeH+X1Rp2ZihZ8Mv6OKLA/2ww7wvBJr81J6MP6T1x
	s79FJpe5QPKJ/IRarxXWOSg6uozK2cU6Z9jvPMEQ=
Content-Type: multipart/mixed; boundary="===============5752541304165111862=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] libva: upgrading to 2.21.0 FAILED
Message-ID: <0101018e9ad48441-5eb6c0dc-a6f2-4c00-b2c9-bc9d37c60449-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:03:22 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:03:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197784

--===============5752541304165111862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *libva* to *2.21.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-libva-upgrade-2.20.0-2.21.0.patch
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
From c4415a11203e7a01dc4c1d00587c07dd37e2d882 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 13:04:22 +0000
Subject: [PATCH] libva: upgrade 2.20.0 -> 2.21.0

---
 meta/recipes-graphics/libva/libva.inc                           | 2 +-
 .../recipes-graphics/libva/{libva_2.20.0.bb => libva_2.21.0.bb} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/libva/{libva_2.20.0.bb => libva_2.21.0.bb} (100%)

diff --git a/meta/recipes-graphics/libva/libva.inc b/meta/recipes-graphics/libva/libva.inc
index 486291bced..af40d8cbba 100644
--- a/meta/recipes-graphics/libva/libva.inc
+++ b/meta/recipes-graphics/libva/libva.inc
@@ -18,7 +18,7 @@ LICENSE = "MIT"
 
 SRC_URI = "${GITHUB_BASE_URI}/download/${PV}/libva-${PV}.tar.bz2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2e48940f94acb0af582e5ef03537800f"
-SRC_URI[sha256sum] = "f72bdb4f48dfe71ad01f1cbefe069672a2c949a6abd51cf3c4d4784210badc49"
+SRC_URI[sha256sum] = "9dc1a84373b656434e6a8f3ac7522bc1c959cc3434aea89d2c02092986d87016"
 
 S = "${WORKDIR}/libva-${PV}"
 
diff --git a/meta/recipes-graphics/libva/libva_2.20.0.bb b/meta/recipes-graphics/libva/libva_2.21.0.bb
similarity index 100%
rename from meta/recipes-graphics/libva/libva_2.20.0.bb
rename to meta/recipes-graphics/libva/libva_2.21.0.bb
-- 
2.42.0


--===============5752541304165111862==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-libva-upgrade-2.20.0-2.21.0.patch"

RnJvbSBjNDQxNWExMTIwM2U3YTAxZGM0YzFkMDA1ODdjMDdkZDM3ZTJkODgyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxMzowNDoyMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGxp
YnZhOiB1cGdyYWRlIDIuMjAuMCAtPiAyLjIxLjAKCi0tLQogbWV0YS9yZWNpcGVzLWdyYXBoaWNz
L2xpYnZhL2xpYnZhLmluYyAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMiArLQogLi4uL3Jl
Y2lwZXMtZ3JhcGhpY3MvbGlidmEve2xpYnZhXzIuMjAuMC5iYiA9PiBsaWJ2YV8yLjIxLjAuYmJ9
IHwgMAogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS97bGlidmFfMi4yMC4wLmJiID0+IGxpYnZh
XzIuMjEuMC5iYn0gKDEwMCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdyYXBoaWNzL2xp
YnZhL2xpYnZhLmluYyBiL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YS5pbmMKaW5k
ZXggNDg2MjkxYmNlZC4uYWY0MGQ4Y2JiYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdyYXBo
aWNzL2xpYnZhL2xpYnZhLmluYworKysgYi9tZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGli
dmEuaW5jCkBAIC0xOCw3ICsxOCw3IEBAIExJQ0VOU0UgPSAiTUlUIgogCiBTUkNfVVJJID0gIiR7
R0lUSFVCX0JBU0VfVVJJfS9kb3dubG9hZC8ke1BWfS9saWJ2YS0ke1BWfS50YXIuYnoyIgogTElD
X0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9MmU0ODk0MGY5NGFjYjBhZjU4MmU1
ZWYwMzUzNzgwMGYiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiZjcyYmRiNGY0OGRmZTcxYWQwMWYx
Y2JlZmUwNjk2NzJhMmM5NDlhNmFiZDUxY2YzYzRkNDc4NDIxMGJhZGM0OSIKK1NSQ19VUklbc2hh
MjU2c3VtXSA9ICI5ZGMxYTg0MzczYjY1NjQzNGU2YThmM2FjNzUyMmJjMWM5NTljYzM0MzRhZWE4
OWQyYzAyMDkyOTg2ZDg3MDE2IgogCiBTID0gIiR7V09SS0RJUn0vbGlidmEtJHtQVn0iCiAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1ncmFwaGljcy9saWJ2YS9saWJ2YV8yLjIwLjAuYmIgYi9t
ZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4yMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggMTAwJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4y
MC4wLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ3JhcGhpY3MvbGlidmEvbGlidmFfMi4yMS4w
LmJiCi0tIAoyLjQyLjAKCg==

--===============5752541304165111862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1877 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (919 cached, 2 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.7.3"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-e47e1434e618338ebf4629dfa705552951ff6802"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:e47e1434e618338ebf4629dfa705552951ff6802"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 264 Local 252 Mirrors 0 Missed 12 Current 441 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1711 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_recipe_qa)
NOTE: Running task 1882 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_write_config)
NOTE: recipe libva-2.21.0-r0: task do_recipe_qa: Started
NOTE: recipe libva-2.21.0-r0: task do_write_config: Started
NOTE: recipe libva-2.21.0-r0: task do_write_config: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 1983 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_fetch)
NOTE: recipe libva-2.21.0-r0: task do_fetch: Started
NOTE: recipe libva-2.21.0-r0: task do_fetch: Succeeded
NOTE: Running task 1984 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_unpack)
NOTE: Running task 1985 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libva-2.21.0-r0: task do_unpack: Started
NOTE: recipe libva-2.21.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libva-2.21.0-r0: task do_unpack: Succeeded
NOTE: Running task 1986 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_patch)
NOTE: Running task 1987 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_collect_spdx_deps)
NOTE: recipe libva-2.21.0-r0: task do_patch: Started
NOTE: recipe libva-2.21.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libva-2.21.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_patch: Succeeded
NOTE: Running task 1988 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 1989 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_populate_lic)
NOTE: recipe libva-2.21.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libva-2.21.0-r0: task do_populate_lic: Started
NOTE: recipe libva-2.21.0-r0: task do_populate_lic: Succeeded
NOTE: recipe libva-2.21.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1990 of 2002 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_configure)
NOTE: recipe libva-2.21.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.120.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa_24.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.7.bb:do_populate_sysroot', '
 /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/
 auh/build/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'texinfo-dummy-native', 'xz', 'libdrm', 'mesa', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libpciaccess', 'libpthread-stubs', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxrandr', 'libxrender', 'libxshmfence', 'libxxf86vm', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'gdbm', 'libffi', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libed
 it-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'wayland-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dwith_glx=yes -Dwith_wayland=yes -Dwith_x11=yes...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/libva-2.21.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/build
| Build type: cross build
| Project name: libva
| Project version: 2.21.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.41.0.20230926
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Library dl found: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libdrm found: YES 2.4.120
| Run-time dependency x11 found: YES 1.8.7
| Run-time dependency xext found: YES 1.3.6
| Run-time dependency xfixes found: YES 6.0.1
| Run-time dependency x11-xcb found: YES 1.8.7
| Run-time dependency xcb found: YES 1.16
| Run-time dependency xcb-dri3 found: YES 1.16
| Run-time dependency gl found: YES 24.0.2
| Run-time dependency wayland-client found: YES 1.22.0
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Build-time dependency wayland-scanner found: YES 1.22.0
| Program /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/wayland-scanner found: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/bin/wayland-scanner)
| Checking for function "secure_getenv" : YES
| Configuring va_version.h using configuration
| Checking if "-Wl,--version-script" : links: YES
| Program doxygen found: NO
| 
| ../libva-2.21.0/meson.build:161:6: ERROR: Program './autogen.sh' not found or not executable
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.1201541:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.1201541, line 170
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.1201541, line 159
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.1201541, line 148
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.1201541, line 183
NOTE: recipe libva-2.21.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 1990 tasks of which 1980 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401130401.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401130401.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: libva-2.21.0-r0 do_configure: meson failed
ERROR: libva-2.21.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/run.do_configure.1201541', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/libva/2.21.0/temp/log.do_configure.1201541
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libva/libva_2.21.0.bb:do_configure) failed with exit code '1'

--===============5752541304165111862==--

