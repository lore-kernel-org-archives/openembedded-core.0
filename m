Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81639C369CF
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.18068.1743511411437193722
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=W8sCTZOE;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Um3FzYgn;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010195f160d909-a5b1b2dc-2cbf-4817-9e51-997f559afb52-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=n9NgeJr6rbVC6QYQ9drEplqY/ORYBzhAjdwmpeauKfA=;
	b=W8sCTZOERu+VC8F0iCk5IXRZDNUhquB0wdZRCzjF9o4RCmnSDtnFTwCbqP5lWoj7
	sDvNWqNdaGUmsN/zO95bBrQWSeEiWS21of8QNJIgb6YXvDvkbY4WmgSlXQyPncwF1Fx
	Gk0INso9/VdLs8bxJlhpgUculjT9hPLi+FMnBU2M=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=n9NgeJr6rbVC6QYQ9drEplqY/ORYBzhAjdwmpeauKfA=;
	b=Um3FzYgngzyJhtfCE/ViA5ItjckapzRiRO7EiIip7IlvmS6FW5TIZ5QE4OufsTlk
	5CGexq4rcU8smi5xghVZEDI5g46ROKMrYgTdaKsbe7x6BZ7THkMRR652cQWNDHkUrGt
	PP2VPMnvf8cWJvH+ZuCXF+NXZ3eiANhtDexNGoks=
Content-Type: multipart/mixed; boundary="===============4669266853403125179=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-libav: upgrading to 1.26.0 FAILED
Message-ID: <01010195f160d909-a5b1b2dc-2cbf-4817-9e51-997f559afb52-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214110

--===============4669266853403125179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-libav* to *1.26.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-libav-upgrade-1.24.12-1.26.0.patch
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
From f08e2e32d45b557b9465f40113a889b1ddd40a0b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 11:55:32 +0000
Subject: [PATCH] gstreamer1.0-libav: upgrade 1.24.12 -> 1.26.0

---
 ...treamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.26.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.24.12.bb => gstreamer1.0-libav_1.26.0.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
index 77c10da39e..a2d35f8a93 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "ef72c1c70a17b3c0bb283d16d09aba496d3401c927dcf5392a8a7866d9336379"
+SRC_URI[sha256sum] = "707a8b687ff5fddcee5b02415e2ec9b71b4ac44d0b7aec3b477364ceecbf1ecf"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.47.1


--===============4669266853403125179==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1886 entries from dependency cache.
Parsing recipes...done.
Parsing of 924 .bb files complete (923 cached, 1 parsed). 1886 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:77d5d50f9c18c4c6b163503a827116eb4483887f"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 340 Local 330 Mirrors 0 Missed 10 Current 568 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 590 of 908 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_populate_lic_setscene)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 908 of 908 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2276 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_fetch)
NOTE: Running task 2368 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 2443 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_unpack)
NOTE: Running task 2444 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 2495 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_patch)
NOTE: Running task 2496 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_patch: Succeeded
NOTE: Running task 2497 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_deploy_source_date_epoch unihash changed to 85394a4b8d1abd47e2ce69b17bcc4ea47a7d31e6da2e7728384a5eec90ce1d56
NOTE: Setscene tasks completed
NOTE: Running task 2499 of 2511 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_configure)
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/ffmpeg/ffmpeg_7.1.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.24.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/
 meson/meson_1.7.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'ffmpeg', 
 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dtests=disabled -Ddoc=disabled ...
| The Meson build system
| Version: 1.7.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/gst-libav-1.26.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/build
| Build type: cross build
| Project name: gst-libav
| Project version: 1.26.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/recipe-sysroot ld.bfd 2.44
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency libavfilter found: YES 10.4.100
| Run-time dependency libavformat found: YES 61.7.100
| Run-time dependency libavcodec found: YES 61.19.101
| Run-time dependency libavutil found: YES 59.39.100
| Checking if "libav is provided by FFmpeg" with dependencies libavfilter, libavformat, libavcodec, libavutil compiles: YES
| Has header "unistd.h" : YES
| Dependency gstreamer-1.0 found: NO. Found 1.24.12 but need: '>= 1.26.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-libav-1.26.0/meson.build:91:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/run.do_configure.2394938:170 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/run.do_configure.2394938, line 170
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/run.do_configure.2394938, line 159
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/run.do_configure.2394938, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/run.do_configure.2394938, line 183
NOTE: recipe gstreamer1.0-libav-1.26.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2499 tasks of which 2491 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401115516.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401115516.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/log.do_configure.2394938
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-libav-1.26.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-libav-1.26.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/run.do_configure.2394938' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-libav/1.26.0/temp/log.do_configure.2394938
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.26.0.bb:do_configure) failed with exit code '1'

--===============4669266853403125179==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-libav-upgrade-1.24.12-1.26.0.patch"

RnJvbSBmMDhlMmUzMmQ0NWI1NTdiOTQ2NWY0MDExM2E4ODliMWRkZDQwYTBiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMTo1NTozMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1saWJhdjogdXBncmFkZSAxLjI0LjEyIC0+IDEuMjYuMAoKLS0tCiAuLi50cmVh
bWVyMS4wLWxpYmF2XzEuMjQuMTIuYmIgPT4gZ3N0cmVhbWVyMS4wLWxpYmF2XzEuMjYuMC5iYn0g
fCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJl
bmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEuMC1saWJh
dl8xLjI0LjEyLmJiID0+IGdzdHJlYW1lcjEuMC1saWJhdl8xLjI2LjAuYmJ9ICg5MSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1s
aWJhdl8xLjI0LjEyLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJl
YW1lcjEuMC1saWJhdl8xLjI2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1saWJhdl8xLjI0
LjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVh
bWVyMS4wLWxpYmF2XzEuMjYuMC5iYgppbmRleCA3N2MxMGRhMzllLi5hMmQzNWY4YTkzIDEwMDY0
NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLWxp
YmF2XzEuMjQuMTIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dz
dHJlYW1lcjEuMC1saWJhdl8xLjI2LjAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgTElDX0ZJTEVTX0NI
S1NVTSA9ICJmaWxlOi8vQ09QWUlORzttZDU9NjkzMzNkYWEwNDRjYjc3ZTQ4NmNjMzYxMjlmN2E3
NzAgXAogICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFt
ZXIuZnJlZWRlc2t0b3Aub3JnL3NyYy9nc3QtbGliYXYvZ3N0LWxpYmF2LSR7UFZ9LnRhci54eiIK
LVNSQ19VUklbc2hhMjU2c3VtXSA9ICJlZjcyYzFjNzBhMTdiM2MwYmIyODNkMTZkMDlhYmE0OTZk
MzQwMWM5MjdkY2Y1MzkyYThhNzg2NmQ5MzM2Mzc5IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjcw
N2E4YjY4N2ZmNWZkZGNlZTViMDI0MTVlMmVjOWI3MWI0YWM0NGQwYjdhZWMzYjQ3NzM2NGNlZWNi
ZjFlY2YiCiAKIFMgPSAiJHtXT1JLRElSfS9nc3QtbGliYXYtJHtQVn0iCiAKLS0gCjIuNDcuMQoK

--===============4669266853403125179==--

