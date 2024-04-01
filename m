Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC00ACD12A2
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 18:11:14 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.web11.44907.1711995071706097291
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 11:11:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=DTzJhcj9;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=ZzN3C6vf;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101018e9adbaa85-bfad5efc-d479-43c3-b9e7-f1db2f87536a-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=DvpngqkjHk/9rl4agCr4CIN2zlvL4FIzIHLQ9lkR7UA=;
	b=DTzJhcj9VpX4u4c/gA1+mymcZnPACatxZ8IsCsngFkBnDdetxQVqndBPkjMmhAVT
	nXlB6J1Tfb0T7Zj1Z18g1WydxkP24BH0VdX0Hyey8HXJ2TCue2Lnj1eTbTEuflIFy1j
	Xb2kkSQSWqpVtXlVT9z9kTohisozuHmhQGi2xhH4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1711995071;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=DvpngqkjHk/9rl4agCr4CIN2zlvL4FIzIHLQ9lkR7UA=;
	b=ZzN3C6vfwup5EAPKFOHQk3JCWG5vCaVx08BcaCLiYNEYa2E78QvuVsWEmUHTeQHH
	QeBZESFIFnpgHTUnWkEe55HYHmVrCWwcw2T7lKyhxkQBV1Uv8QwFB6G5MoR32Y3g7yA
	9VAhe4TxoaOPZzQzyDSSDM75NgHy0n2euXBVP/Lk=
Content-Type: multipart/mixed; boundary="===============5150092728511648242=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.24.1 FAILED
Message-ID: <0101018e9adbaa85-bfad5efc-d479-43c3-b9e7-f1db2f87536a-000000@us-west-2.amazonses.com>
Date: Mon, 1 Apr 2024 18:11:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.04.01-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 18:11:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197835

--===============5150092728511648242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.24.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.22.11-1.24.1.patch
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
From 9eea829013dde2d7ce481016cf5ba7672d400c7a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 1 Apr 2024 16:00:54 +0000
Subject: [PATCH] gstreamer1.0-rtsp-server: upgrade 1.22.11 -> 1.24.1

---
 ...tsp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.24.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.11.bb => gstreamer1.0-rtsp-server_1.24.1.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb
index 554ed9ec8f..cf1ff70bbd 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.11.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "ec49d474750a6ff6729c85b448abc607fb6840b21717ad7abc967e2adbf07a24"
+SRC_URI[sha256sum] = "ab436a2ec9c3c58fbfd3c5b1736419891bb5315d136d7c72c58479f2807008e6"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.42.0


--===============5150092728511648242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1875 entries from dependency cache.
Parsing recipes...done.
Parsing of 921 .bb files complete (920 cached, 1 parsed). 1874 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-b97be9268425a415c640fcc9aa3cbbb1ff393909"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:b97be9268425a415c640fcc9aa3cbbb1ff393909"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 333 Local 321 Mirrors 0 Missed 12 Current 582 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2294 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_recipe_qa)
NOTE: Running task 2397 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_write_config)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2520 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_fetch: Succeeded
NOTE: Running task 2521 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_unpack)
NOTE: Running task 2522 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_unpack: Succeeded
NOTE: Running task 2523 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_patch)
NOTE: Running task 2524 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_patch: Succeeded
NOTE: Running task 2525 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2526 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2527 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_configure)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.11.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-work
 er/auh/build/meta/recipes-devtools/meson/meson_1.3.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'cracklib', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib', 'gstreamer1.0-plugin
 s-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libcap-ng-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-n
 ative']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Ddoc=disabled -Dexamples=disabled -Dtests=disabled ...
| The Meson build system
| Version: 1.3.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/gst-rtsp-server-1.24.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/build
| Build type: cross build
| Project name: gst-rtsp-server
| Project version: 1.24.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/recipe-sysroot ld.bfd 2.42.0.20240216
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.41.0.20230926
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports link arguments -Wl,-Bsymbolic-functions: YES
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Message: Disabling GLib cast checks
| Compiler for C supports arguments -Wmissing-declarations: YES
| Compiler for C supports arguments -Wmissing-prototypes: YES
| Compiler for C supports arguments -Wredundant-decls: YES
| Compiler for C supports arguments -Wundef: YES
| Compiler for C supports arguments -Wwrite-strings: YES
| Compiler for C supports arguments -Wformat: YES
| Compiler for C supports arguments -Wformat-nonliteral: YES
| Compiler for C supports arguments -Wformat-security: YES
| Compiler for C supports arguments -Wold-style-definition: YES
| Compiler for C supports arguments -Waggregate-return: YES
| Compiler for C supports arguments -Winit-self: YES
| Compiler for C supports arguments -Wmissing-include-dirs: YES
| Compiler for C supports arguments -Waddress: YES
| Compiler for C supports arguments -Wno-multichar: YES
| Compiler for C supports arguments -Wvla: YES
| Compiler for C supports arguments -Wpointer-arith: YES
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO found 1.22.11 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-rtsp-server-1.24.1/meson.build:139:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/run.do_configure.2677301:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/run.do_configure.2677301, line 175
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/run.do_configure.2677301, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/run.do_configure.2677301, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/run.do_configure.2677301, line 188
NOTE: recipe gstreamer1.0-rtsp-server-1.24.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2527 tasks of which 2517 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401160032.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240401160032.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-rtsp-server-1.24.1-r0 do_configure: meson failed
ERROR: gstreamer1.0-rtsp-server-1.24.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/run.do_configure.2677301', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.1/temp/log.do_configure.2677301
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.1.bb:do_configure) failed with exit code '1'

--===============5150092728511648242==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.22.11-1.24.1.patch"

RnJvbSA5ZWVhODI5MDEzZGRlMmQ3Y2U0ODEwMTZjZjViYTc2NzJkNDAwYzdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBBcHIgMjAyNCAxNjowMDo1NCArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dHJlYW1lcjEuMC1ydHNwLXNlcnZlcjogdXBncmFkZSAxLjIyLjExIC0+IDEuMjQuMQoKLS0tCiAu
Li50c3Atc2VydmVyXzEuMjIuMTEuYmIgPT4gZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjQu
MS5iYn0gfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24o
LSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjIyLjExLmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0
LjEuYmJ9ICg5MCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjExLmJiIGIvbWV0YS9yZWNpcGVzLW11
bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0LjEuYmIKc2lt
aWxhcml0eSBpbmRleCA5MCUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIyLjExLmJiCnJlbmFtZSB0byBtZXRh
L3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEu
MjQuMS5iYgppbmRleCA1NTRlZDllYzhmLi5jZjFmZjcwYmJkIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4wLXJ0c3Atc2VydmVyXzEuMjIu
MTEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1ydHNwLXNlcnZlcl8xLjI0LjEuYmIKQEAgLTEwLDcgKzEwLDcgQEAgUE5SRUFMID0gImdzdC1y
dHNwLXNlcnZlciIKIAogU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5mcmVlZGVza3RvcC5v
cmcvc3JjLyR7UE5SRUFMfS8ke1BOUkVBTH0tJHtQVn0udGFyLnh6IgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZWM0OWQ0NzQ3NTBhNmZmNjcyOWM4NWI0NDhhYmM2MDdmYjY4NDBiMjE3MTdhZDdh
YmM5NjdlMmFkYmYwN2EyNCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJhYjQzNmEyZWM5YzNjNThm
YmZkM2M1YjE3MzY0MTk4OTFiYjUzMTVkMTM2ZDdjNzJjNTg0NzlmMjgwNzAwOGU2IgogCiBTID0g
IiR7V09SS0RJUn0vJHtQTlJFQUx9LSR7UFZ9IgogCi0tIAoyLjQyLjAKCg==

--===============5150092728511648242==--

