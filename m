Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81A73E6529C
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:13:10 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29183.1769951561014824633
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=WALY/XUz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=g4gT0vEv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019c1955ca8c-e4cb92b9-ceda-4b26-a5c8-c03b7dcd41ff-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=cos63fKbxqkCGPSqHWmC6GOK4PuImHAMqbIe2gr/kX4=;
	b=WALY/XUzGMDT/E4jG38/WUDpfqEQKLHfa854g70Bg6JVrp8RMUf+QJhl7duityrX
	PQ8Z+NlTO4k4XbvLG5nLQcUKAzk36J0rnjd6+e7jAvpc5ag3uj78KdPJS03maVQJ8G8
	/q5kMgH4lVjYJbUyIzZoVEJkcWzZDj7x3eJMKKP0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951578;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=cos63fKbxqkCGPSqHWmC6GOK4PuImHAMqbIe2gr/kX4=;
	b=g4gT0vEvBAwTj2dAjnQnxv+e+w2+eLVKporRLfHnbD1dxb0q3aih9IyRYm1csM0y
	DOzfp0yzDWOnvkcsVcnaPHmYVNypp96DJ5ON+zS/KKFkzHqG7Xt/Ll6QAEWiQlFErCo
	aIH3culhYp3ECkvObtuW6pU0ZFN8UQCg9NZOFS9c=
Content-Type: multipart/mixed; boundary="===============6105620539361116884=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.28.0 FAILED
Message-ID: <0101019c1955ca8c-e4cb92b9-ceda-4b26-a5c8-c03b7dcd41ff-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:58 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:13:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230317

--===============6105620539361116884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.28.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.26.9-1.28.0.patch
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
From 8c2386cc2ed91898a67c3d2f68affdf78d1f7876 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 12:26:16 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.26.9 -> 1.28.0

---
 ...streamer1.0-libav_1.26.9.bb => gstreamer1.0-libav_1.28.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.26.9.bb => gstreamer1.0-libav_1.28.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
index a652dbba33..70dfe3206d 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.9.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "08a8e944fc61ef26df515784a089c8ac41765304a5d55b98199835b28a98dbdf"
+SRC_URI[sha256sum] = "e3c93db7da2da3b2374ccc2e7394316f9192460abdea81651652791d46ccb8fb"
 
 S = "${UNPACKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============6105620539361116884==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.3.99+snapshot-80d131b21371622b211634995d274e572d09b66c"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:80d131b21371622b211634995d274e572d09b66c"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 293 Local 281 Mirrors 0 Missed 12 Current 869 (95% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2848 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_recipe_qa)
NOTE: Running task 2972 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3191 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_fetch: Succeeded
NOTE: Running task 3192 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_unpack)
NOTE: Running task 3193 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_unpack: Succeeded
NOTE: Running task 3194 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_patch)
NOTE: Running task 3195 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_patch: Succeeded
NOTE: Running task 3196 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3197 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3198 of 3210 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_populate_lic: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/ffmpeg/ffmpeg_8.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot', '/srv/pokybuild/yoct
 o-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot', 
 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm', 'cmake-native', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'texinfo-dummy-native', 'xz', 'zstd', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'lib
 xv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'ffmpeg', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'gmp', 'gnutls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libmicrohttpd', 'libpcre2', 'libseccomp', 'libunistring', 'nettle', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native',
  'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Ddoc=disabled ...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/sources/gst-libav-1.28.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/build
| Build type: cross build
| Project name: gst-libav
| Project version: 1.28.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/recipe-sysroot ld.bfd 2.45.1.20251126
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libavcodec found: YES 62.11.100
| Run-time dependency libavfilter found: YES 11.4.100
| Run-time dependency libavformat found: YES 62.3.100
| Run-time dependency libavutil found: YES 60.8.100
| Checking if "libav is provided by FFmpeg" with dependencies libavcodec, libavfilter, libavformat, libavutil compiles: YES
| Has header "unistd.h" : YES
| Dependency gstreamer-1.0 found: NO. Found 1.26.9 but need: '>= 1.28.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-libav-1.28.0/meson.build:88:10: ERROR: Attempted to resolve subproject without subprojects directory present.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| CMake binary for host machine is not cached
| CMake binary missing from cross or native file, or env var undefined.
| Default target is not allowed for cross use
| Found CMake: NO
| CMake binary for machine host machine not found. Giving up.
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| ERROR: Subproject gstreamer is buildable: NO
| 
| ../sources/gst-libav-1.28.0/meson.build:88:10: ERROR: Attempted to resolve subproject without subprojects directory present.
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/run.do_configure.1051337:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/run.do_configure.1051337, line 171
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/run.do_configure.1051337, line 160
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/run.do_configure.1051337, line 147
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/run.do_configure.1051337, line 184
NOTE: recipe gstreamer1.0-libav-1.28.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3198 tasks of which 3188 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201122553.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201122553.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/log.do_configure.1051337
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-libav-1.28.0-r0 do_configure: meson setup failed
ERROR: gstreamer1.0-libav-1.28.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/run.do_configure.1051337' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/gstreamer1.0-libav/1.28.0/temp/log.do_configure.1051337
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.28.0.bb:do_configure) failed with exit code '1'

--===============6105620539361116884==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.26.9-1.28.0.patch"

RnJvbSA4YzIzODZjYzJlZDkxODk4YTY3YzNkMmY2OGFmZmRmNzhkMWY3ODc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMjoyNjoxNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI2LjkgLT4gMS4yOC4wCgotLS0KIC4uLnN0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yOC4wLmJifSB8
IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVu
YW1lIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci97Z3N0cmVhbWVyMS4wLWxpYmF2
XzEuMjYuOS5iYiA9PiBnc3RyZWFtZXIxLjAtbGliYXZfMS4yOC4wLmJifSAoOTElKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGli
YXZfMS4yNi45LmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1l
cjEuMC1saWJhdl8xLjI4LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI2Ljku
YmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtbGliYXZfMS4yOC4wLmJiCmluZGV4IGE2NTJkYmJhMzMuLjcwZGZlMzIwNmQgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtbGliYXZf
MS4yNi45LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFt
ZXIxLjAtbGliYXZfMS4yOC4wLmJiCkBAIC0xMiw3ICsxMiw3IEBAIExJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTY5MzMzZGFhMDQ0Y2I3N2U0ODZjYzM2MTI5ZjdhNzcwIFwK
ICAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWxpYmF2L2dzdC1saWJhdi0ke1BWfS50YXIueHoiCi1TUkNf
VVJJW3NoYTI1NnN1bV0gPSAiMDhhOGU5NDRmYzYxZWYyNmRmNTE1Nzg0YTA4OWM4YWM0MTc2NTMw
NGE1ZDU1Yjk4MTk5ODM1YjI4YTk4ZGJkZiIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlM2M5M2Ri
N2RhMmRhM2IyMzc0Y2NjMmU3Mzk0MzE2ZjkxOTI0NjBhYmRlYTgxNjUxNjUyNzkxZDQ2Y2NiOGZi
IgogCiBTID0gIiR7VU5QQUNLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============6105620539361116884==--

