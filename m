Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EC05C54F3A
	for <webhook@archiver.kernel.org>; Fri, 15 Mar 2024 17:00:17 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.1245.1710522012291215033
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Mar 2024 10:00:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VthieFSu;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=QPaWQtGw;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018e430ea030-8e5fc18f-55e5-42b6-9c36-b15425a3353e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=+e91olByyWfBUgz33JVPxxhHYKLHOJJCNIC7veGfobU=;
	b=VthieFSuPMSalZksDkFyaksCXSBf83zj9VQghjYt1LZKaNceWeegoE13BT6646nv
	A7uUf9ueihF/W1J3FaeTWRIPuJt/vfZ5X6dO/bKdpSGLYXLRN2Hn7xUO/ALKr4gN2gv
	/XTfKVHX5J9xPlcJYjb74m1G1wdqb79WrB2VK6Mo=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1710522015;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=+e91olByyWfBUgz33JVPxxhHYKLHOJJCNIC7veGfobU=;
	b=QPaWQtGwKoPXovOs2uf51W9ADwVCG+Lx0ib9f2xEPqAnkRasUgRKZPXhqNt+eDwu
	e6o0kbBrANJDKuKUeTtZXUJ8QHXXpiy628XZ+WlXX9usnSCr/EG9T6p3lxvUZoBThIv
	4C/nw4IbKQMQEq4gY0I9CqmY1vtgjO5x21S8yhqk=
Content-Type: multipart/mixed; boundary="===============3730935596487867453=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gstreamer1.0-rtsp-server: upgrading to 1.24.0 FAILED
Message-ID: <0101018e430ea030-8e5fc18f-55e5-42b6-9c36-b15425a3353e-000000@us-west-2.amazonses.com>
Date: Fri, 15 Mar 2024 17:00:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.03.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Mar 2024 17:00:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197233

--===============3730935596487867453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gstreamer1.0-rtsp-server* to *1.24.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gstreamer1.0-rtsp-server-upgrade-1.22.10-1.24.0.patch
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
From edb2c47e6362d2f85df15f1bdda848e78aea6fd9 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Mar 2024 14:48:57 +0000
Subject: [PATCH] gstreamer1.0-rtsp-server: upgrade 1.22.10 -> 1.24.0

---
 ...tsp-server_1.22.10.bb => gstreamer1.0-rtsp-server_1.24.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.10.bb => gstreamer1.0-rtsp-server_1.24.0.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb
index 0e910e3dc4..b3566db2fc 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.22.10.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb
@@ -10,7 +10,7 @@ PNREAL = "gst-rtsp-server"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "60eb4f80b5a7ca929c21a61d50be9813a3413787959a5875de56a8ad5ca25f35"
+SRC_URI[sha256sum] = "5b0fa6b12ba95b1d336a4b274cbe19e982aa3e6819f1d97bfd8e0102b103ed9b"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.42.0


--===============3730935596487867453==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1878 entries from dependency cache.
Parsing recipes...done.
Parsing of 922 .bb files complete (921 cached, 1 parsed). 1877 targets, 35 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "4.3+snapshot-1fe214336946de112ed986835f3091f3cae86fd3"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1fe214336946de112ed986835f3091f3cae86fd3"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 333 Local 321 Mirrors 0 Missed 12 Current 582 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2294 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_recipe_qa)
NOTE: Running task 2397 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_write_config)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2520 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 2521 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_unpack)
NOTE: Running task 2522 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 2523 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_patch)
NOTE: Running task 2524 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 2525 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2526 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_populate_lic)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_populate_lic: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2527 of 2539 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_configure)
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.39.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.2.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.78.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.10.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-work
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
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/gst-rtsp-server-1.24.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/build
| Build type: cross build
| Project name: gst-rtsp-server
| Project version: 1.24.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/recipe-sysroot ld.bfd 2.42.0.20240216
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
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO found 1.22.10 but need: '>= 1.24.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-rtsp-server-1.24.0/meson.build:139:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/run.do_configure.238533:175 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/run.do_configure.238533, line 175
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/run.do_configure.238533, line 164
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/run.do_configure.238533, line 153
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/run.do_configure.238533, line 188
NOTE: recipe gstreamer1.0-rtsp-server-1.24.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2527 tasks of which 2517 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315144833.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240315144833.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-rtsp-server-1.24.0-r0 do_configure: meson failed
ERROR: gstreamer1.0-rtsp-server-1.24.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/run.do_configure.238533', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gstreamer1.0-rtsp-server/1.24.0/temp/log.do_configure.238533
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.24.0.bb:do_configure) failed with exit code '1'

--===============3730935596487867453==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-rtsp-server-upgrade-1.22.10-1.24.0.patch"

RnJvbSBlZGIyYzQ3ZTYzNjJkMmY4NWRmMTVmMWJkZGE4NDhlNzhhZWE2ZmQ5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgTWFyIDIwMjQgMTQ6NDg6NTcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXI6IHVwZ3JhZGUgMS4yMi4xMCAtPiAxLjI0LjAKCi0tLQog
Li4udHNwLXNlcnZlcl8xLjIyLjEwLmJiID0+IGdzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjI0
LjAuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIx
LjAtcnRzcC1zZXJ2ZXJfMS4yMi4xMC5iYiA9PiBnc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4y
NC4wLmJifSAoOTAlKQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJl
YW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4xMC5iYiBiL21ldGEvcmVjaXBlcy1t
dWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yNC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTAlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dz
dHJlYW1lci9nc3RyZWFtZXIxLjAtcnRzcC1zZXJ2ZXJfMS4yMi4xMC5iYgpyZW5hbWUgdG8gbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8x
LjI0LjAuYmIKaW5kZXggMGU5MTBlM2RjNC4uYjM1NjZkYjJmYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1ydHNwLXNlcnZlcl8xLjIy
LjEwLmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3RyZWFtZXIx
LjAtcnRzcC1zZXJ2ZXJfMS4yNC4wLmJiCkBAIC0xMCw3ICsxMCw3IEBAIFBOUkVBTCA9ICJnc3Qt
cnRzcC1zZXJ2ZXIiCiAKIFNSQ19VUkkgPSAiaHR0cHM6Ly9nc3RyZWFtZXIuZnJlZWRlc2t0b3Au
b3JnL3NyYy8ke1BOUkVBTH0vJHtQTlJFQUx9LSR7UFZ9LnRhci54eiIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gIjYwZWI0ZjgwYjVhN2NhOTI5YzIxYTYxZDUwYmU5ODEzYTM0MTM3ODc5NTlhNTg3
NWRlNTZhOGFkNWNhMjVmMzUiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiNWIwZmE2YjEyYmE5NWIx
ZDMzNmE0YjI3NGNiZTE5ZTk4MmFhM2U2ODE5ZjFkOTdiZmQ4ZTAxMDJiMTAzZWQ5YiIKIAogUyA9
ICIke1dPUktESVJ9LyR7UE5SRUFMfS0ke1BWfSIKIAotLSAKMi40Mi4wCgo=

--===============3730935596487867453==--

