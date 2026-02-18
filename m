Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3369DC531F3
	for <webhook@archiver.kernel.org>; Wed, 18 Feb 2026 18:42:01 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1416.1771440097377364361
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Feb 2026 10:41:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GotREEql;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=NdFdyRoX;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c720f046c-a9968197-c13d-49d2-ab96-adb913f97344-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1771440112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Acw/D5S9mWLC5bKnIsGJx2L7dpjIGJEIcpPNPQG1X/g=;
	b=GotREEqlwvRRAQiWXjiORdYAdwiCaZfxgfFPEIG5T93Tw1t7ao/JDd4YBiMwvZuZ
	N/u8JMEo8SoCQHaM9ftQjHzT4lT7hrEg/YsL3EiGxi9gPG+nYrjWmNjS76HD3fQGq7H
	zNvgOBGrbl7EMnPoeFhwkkwh9jg7C5aWvL+QKJ9w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1771440112;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Acw/D5S9mWLC5bKnIsGJx2L7dpjIGJEIcpPNPQG1X/g=;
	b=NdFdyRoX+GBvlgXfeXoPlyUgKjvh1bqXMBGHoDufiW7kVEwoIDgQKw6kMSe+NxnQ
	QYnOInfO9JQM6Gr5XgkR/SSoHOxeTyTcTjFNQmiYfJW6UwZyv8fiNtFWDSuye17KHo6
	AK8HUNLGm/cwg7PE5/r5kAgrkIWLeEhGXP1f6HJw=
Content-Type: multipart/mixed; boundary="===============1874758802121891654=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-python: upgrading to 1.28.0 FAILED
Message-ID: <0101019c720f046c-a9968197-c13d-49d2-ab96-adb913f97344-000000@us-west-2.amazonses.com>
Date: Wed, 18 Feb 2026 18:41:52 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.18-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 Feb 2026 18:42:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/231394

--===============1874758802121891654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.28.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.26.9-1.28.0.patch
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
From 457e06f65b25a5599ef27aa2233e44c57978e920 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 18 Feb 2026 16:04:26 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.26.9 -> 1.28.0

---
 ...reamer1.0-python_1.26.9.bb => gstreamer1.0-python_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.9.bb => gstreamer1.0-python_1.28.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
index 57ddf0bbba..7169b853c3 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "21a51d35fd973af1186795d3d9d696f321584aeb09ab4d176b59f26e842b8849"
+SRC_URI[sha256sum] = "9eba882a413cf06bf0575e635f73c0a2d01f3abdf76e18f804a90f3ff6a0aa2d"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============1874758802121891654==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1952 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-ab21a826cba105c93af9f97f033cde8139d1c9d6"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:ab21a826cba105c93af9f97f033cde8139d1c9d6"
meta-yocto-bsp       
meta-poky            = "master:2486ce2889062500e39446bc07c7d21120a0345e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 398 Local 386 Mirrors 0 Missed 12 Current 1066 (96% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1439 of 1464 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3474 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_fetch)
NOTE: Running task 3676 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 3900 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_unpack)
NOTE: Running task 3901 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 4016 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_patch)
NOTE: Running task 4017 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 4018 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4019 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_populate_lic: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_deploy_source_date_epoch unihash changed to 07396d2e5a61ed23fe8b872f88c001f5ceba7c5d634b16ce3ad6ccc094d1a1cb
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_populate_lic unihash changed to 09b341a93037cc25321b95faaa8d92a72ad835f5c4a35feacc17f247da2f58ef
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Setscene tasks completed
NOTE: Setscene tasks completed
NOTE: Running task 4020 of 4032 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/
 build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysr
 oot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-pycairo', 'python3-pygobject', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gobject-introspection', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrand
 r', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'libvorbis', 'sbc', 'libwebp', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'nettle', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'm
 ake-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Dplugin=enabled -Dlibpython-dir=/usr/lib ...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/sources/gst-python-1.28.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/build
| Build type: cross build
| Project name: gst-python
| Project version: 1.28.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/recipe-sysroot ld.bfd 2.45.1.20251126
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO
| 
| ../sources/gst-python-1.28.0/meson.build:19:10: ERROR: Dependency lookup for gstreamer-1.0 with method 'pkgconfig' failed: Invalid version, need 'gstreamer-1.0' ['>= 1.28.0'] found '1.26.9'.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Dependency lookup for gstreamer-1.0 with method 'pkgconfig' failed: Invalid version, need 'gstreamer-1.0' ['>= 1.28.0'] found '1.26.9'.
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| Dependency lookup for gstreamer-1.0 with method 'cmake' failed: CMake binary for machine host machine not found. Giving up.
| Run-time dependency gstreamer-1.0 found: NO
| 
| ../sources/gst-python-1.28.0/meson.build:19:10: ERROR: Dependency lookup for gstreamer-1.0 with method 'pkgconfig' failed: Invalid version, need 'gstreamer-1.0' ['>= 1.28.0'] found '1.26.9'.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/run.do_configure.1710083:185 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/run.do_configure.1710083, line 185
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/run.do_configure.1710083, line 166
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/run.do_configure.1710083, line 153
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/run.do_configure.1710083, line 198
NOTE: recipe gstreamer1.0-python-1.28.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4020 tasks of which 4011 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218160410.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260218160410.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/log.do_configure.1710083
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-python-1.28.0-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-python-1.28.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/run.do_configure.1710083' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-python/1.28.0/temp/log.do_configure.1710083
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.28.0.bb:do_configure) failed with exit code '1'

--===============1874758802121891654==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.26.9-1.28.0.patch"

RnJvbSA0NTdlMDZmNjViMjVhNTU5OWVmMjdhYTIyMzNlNDRjNTc5NzhlOTIwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTggRmViIDIwMjYgMTY6MDQ6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjYuOSAtPiAxLjI4LjAKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjI2LjkuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjAuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguMC5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI2LjkuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yNi45LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI4LjAuYmIKaW5kZXggNTdkZGYwYmJiYS4uNzE2OWI4NTNjMyAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjguMC5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiMjFhNTFkMzVmZDk3M2FmMTE4Njc5NWQz
ZDlkNjk2ZjMyMTU4NGFlYjA5YWI0ZDE3NmI1OWYyNmU4NDJiODg0OSIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI5ZWJhODgyYTQxM2NmMDZiZjA1NzVlNjM1ZjczYzBhMmQwMWYzYWJkZjc2ZTE4Zjgw
NGE5MGYzZmY2YTBhYTJkIgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIK
IFJERVBFTkRTOiR7UE59ICs9ICJnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZSBweXRob24zLXB5Z29iamVjdCIKLS0gCjIuNDcuMQoK

--===============1874758802121891654==--

