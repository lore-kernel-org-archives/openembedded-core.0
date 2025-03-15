Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 397FBC369BB
	for <webhook@archiver.kernel.org>; Sat, 15 Mar 2025 14:18:43 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.10369.1742048307222181788
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Mar 2025 07:18:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=IiaewRmU;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RgJn7cDS;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101959a2bc61a-a071f649-fdcf-4ea9-a8da-2aa68926f47f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1742048315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=LY6B4koZ/wJQ0FwdBxYhTrBCPX0JH630inE/8FJbZyw=;
	b=IiaewRmUhRCMSXCKr67RhNCdUoXU2cxNGOfgBKC4AL5h4epvOeT2UrPNEOFHiI2h
	w2bBWyiJs2O0QHx6kuApgB8LKoBVROBA6mVP0Q1ixYIVsNkPb6Pp0dthUdKhQf84rEb
	TP9C576h/630OoKp1FRGyZm2pOXpvFzB5eYVTUdg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1742048315;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=LY6B4koZ/wJQ0FwdBxYhTrBCPX0JH630inE/8FJbZyw=;
	b=RgJn7cDS7RRqX4rdH/LiBBBfhh1zD5QgtcwRr5hDd82SjdqO9hXA3I50vhVdOken
	PYyfqOiJaKRgNI8PwoB14pitMG241JdwDUzx6750eUUEHQq+goO4xGyFoUrlpv6tVjw
	PsiJ50rCZSPoGaGi86EhkKoS5SvDlajFNb1jEQEI=
Content-Type: multipart/mixed; boundary="===============7031529140667163923=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.26.0 FAILED
Message-ID: <010101959a2bc61a-a071f649-fdcf-4ea9-a8da-2aa68926f47f-000000@us-west-2.amazonses.com>
Date: Sat, 15 Mar 2025 14:18:34 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.03.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Mar 2025 14:18:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/212959

--===============7031529140667163923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gst-devtools* to *1.26.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gst-devtools-upgrade-1.24.12-1.26.0.patch
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
From 253809990b5c45f3d8f2b42ab26dabb6c1210330 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Mar 2025 13:32:51 +0000
Subject: [PATCH] gst-devtools: upgrade 1.24.12 -> 1.26.0

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index b596f2ef9c..b5bfc9874e 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 67809420230cd4fcc63069f78efdc90c7b4c4ee1 Mon Sep 17 00:00:00 2001
+From b3fea4a29c22208df833372436b53e658a4d345a Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sun, 9 Sep 2018 17:38:10 -0700
 Subject: [PATCH] connect has a different signature on musl
diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
similarity index 95%
rename from meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
rename to meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
index 157cdc6bbb..ca802510d4 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools_1.24.12.bb
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-devtools/gst-devtools-${PV}
            file://0001-connect-has-a-different-signature-on-musl.patch \
            "
 
-SRC_URI[sha256sum] = "4ef3dd12e5827068d6db7ad01876d1216a80717116c24a0d5b3b57fd7e3c3478"
+SRC_URI[sha256sum] = "eff33d7dc292bb074a2788ea887b6283398ffdefafa49fb7d08efe6658a65648"
 
 DEPENDS = "json-glib glib-2.0 glib-2.0-native gstreamer1.0 gstreamer1.0-plugins-base"
 RRECOMMENDS:${PN} = "git"
-- 
2.44.1


--===============7031529140667163923==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1884 entries from dependency cache.
Parsing recipes...done.
Parsing of 923 .bb files complete (922 cached, 1 parsed). 1884 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.9.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0090a6f9bc4ca9189b1bceac85294d52e8bae07a"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 368 Local 356 Mirrors 0 Missed 12 Current 576 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2321 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_recipe_qa)
NOTE: Running task 2435 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_write_config)
NOTE: recipe gst-devtools-1.26.0-r0: task do_recipe_qa: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_write_config: Succeeded
NOTE: recipe gst-devtools-1.26.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2587 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_fetch)
NOTE: recipe gst-devtools-1.26.0-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 2588 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_unpack)
NOTE: Running task 2589 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.26.0-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_unpack: Succeeded
NOTE: Running task 2590 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_patch)
NOTE: Running task 2591 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_collect_spdx_deps)
NOTE: recipe gst-devtools-1.26.0-r0: task do_patch: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gst-devtools-1.26.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gst-devtools-1.26.0-r0: task do_patch: Succeeded
NOTE: Running task 2592 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 2593 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_populate_lic)
NOTE: recipe gst-devtools-1.26.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_populate_lic: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_populate_lic: Succeeded
NOTE: recipe gst-devtools-1.26.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 2594 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_configure)
NOTE: recipe gst-devtools-1.26.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.
 0-plugins-base_1.24.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.82.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_popul
 ate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.82.0.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['openssl', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'libxcrypt', 'libxml2', 'ncurses', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'bzip2', 'libnsl2', 'libtirpc', 'libpam', 'texinfo-dummy-native', 'xz', 'gobject-introspection', 'json-glib', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'harfbuzz', 'libjpeg-turbo', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxrandr', 'libxrender', 'libxshmfence', 'libxv', 'libxxf86vm', 'pixman', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'linux-libc-headers', 'alsa-lib
 ', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libtheora', 'libvorbis', 'bash-completion', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libffi', 'libpcre2', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'unzip-native', 'xz-native', 'zstd-native', 'gobject-introspection-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libffi-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Ddoc=disabled -Ddebug_viewer=disabled -Dtests=disabled -Dvalidate=enabled -Dnls=enabled -Dcairo=disabled...
| The Meson build system
| Version: 1.7.0
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/gst-devtools-1.26.0
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/build
| Build type: cross build
| Project name: gst-devtools
| Project version: 1.26.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/recipe-sysroot ld.bfd 2.44
| C compiler for the build machine: gcc (gcc 13.3.0 "gcc (GCC) 13.3.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240716
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Compiler for C supports link arguments -Wl,-z,nodelete: YES
| Compiler for C supports arguments -fvisibility=hidden: YES
| Compiler for C supports arguments -fno-strict-aliasing: YES
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Dependency gstreamer-1.0 found: NO. Found 1.24.12 but need: '>= 1.26.0'
| Found CMake: NO
| Run-time dependency gstreamer-1.0 found: NO (tried pkgconfig and cmake)
| Looking for a fallback subproject for the dependency gstreamer-1.0
| 
| ../gst-devtools-1.26.0/meson.build:81:10: ERROR: Neither a subproject directory nor a gstreamer.wrap file was found.
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.1317652:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.1317652, line 176
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.1317652, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.1317652, line 154
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.1317652, line 189
NOTE: recipe gst-devtools-1.26.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2594 tasks of which 2584 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315133234.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250315133234.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/log.do_configure.1317652
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gst-devtools-1.26.0-r0 do_configure: meson failed
ERROR: gst-devtools-1.26.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.1317652' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/log.do_configure.1317652
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_configure) failed with exit code '1'

--===============7031529140667163923==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.24.12-1.26.0.patch"

RnJvbSAyNTM4MDk5OTBiNWM0NWYzZDhmMmI0MmFiMjZkYWJiNmMxMjEwMzMwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTWFyIDIwMjUgMTM6MzI6NTEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3QtZGV2dG9vbHM6IHVwZ3JhZGUgMS4yNC4xMiAtPiAxLjI2LjAKCi0tLQogLi4uLzAwMDEtY29u
bmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0Y2ggICAgICAgIHwgMiAr
LQogLi4uL3tnc3QtZGV2dG9vbHNfMS4yNC4xMi5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yNi4wLmJi
fSAgICAgICAgIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3Qt
ZGV2dG9vbHNfMS4yNC4xMi5iYiA9PiBnc3QtZGV2dG9vbHNfMS4yNi4wLmJifSAoOTUlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMv
MDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCBiL21l
dGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHMvMDAwMS1jb25uZWN0
LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaAppbmRleCBiNTk2ZjJlZjlj
Li5iNWJmYzk4NzRlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9u
LW11c2wucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1k
ZXZ0b29scy8wMDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2NzgwOTQyMDIzMGNkNGZjYzYzMDY5Zjc4ZWZkYzkw
YzdiNGM0ZWUxIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBiM2ZlYTRhMjljMjIyMDhk
ZjgzMzM3MjQzNmI1M2U2NThhNGQzNDVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
S2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFN1biwgOSBTZXAgMjAxOCAxNzoz
ODoxMCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjb25uZWN0IGhhcyBhIGRpZmZlcmVudCBzaWdu
YXR1cmUgb24gbXVzbApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVh
bWVyL2dzdC1kZXZ0b29sc18xLjI0LjEyLmJiIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0
cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI2LjAuYmIKc2ltaWxhcml0eSBpbmRleCA5NSUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18xLjI0
LjEyLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRl
dnRvb2xzXzEuMjYuMC5iYgppbmRleCAxNTdjZGM2YmJiLi5jYTgwMjUxMGQ0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjQuMTIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29sc18x
LjI2LjAuYmIKQEAgLTEyLDcgKzEyLDcgQEAgU1JDX1VSSSA9ICJodHRwczovL2dzdHJlYW1lci5m
cmVlZGVza3RvcC5vcmcvc3JjL2dzdC1kZXZ0b29scy9nc3QtZGV2dG9vbHMtJHtQVn0KICAgICAg
ICAgICAgZmlsZTovLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11
c2wucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI0ZWYzZGQx
MmU1ODI3MDY4ZDZkYjdhZDAxODc2ZDEyMTZhODA3MTcxMTZjMjRhMGQ1YjNiNTdmZDdlM2MzNDc4
IgorU1JDX1VSSVtzaGEyNTZzdW1dID0gImVmZjMzZDdkYzI5MmJiMDc0YTI3ODhlYTg4N2I2Mjgz
Mzk4ZmZkZWZhZmE0OWZiN2QwOGVmZTY2NThhNjU2NDgiCiAKIERFUEVORFMgPSAianNvbi1nbGli
IGdsaWItMi4wIGdsaWItMi4wLW5hdGl2ZSBnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdp
bnMtYmFzZSIKIFJSRUNPTU1FTkRTOiR7UE59ID0gImdpdCIKLS0gCjIuNDQuMQoK

--===============7031529140667163923==--

