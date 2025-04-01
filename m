Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84705C369D0
	for <webhook@archiver.kernel.org>; Tue,  1 Apr 2025 12:43:35 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web10.18042.1743511391543488936
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Apr 2025 05:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=Uc2UA1Vz;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=GDJzzGeT;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 01010195f160d8be-f5469c03-9757-40dd-b700-9ba014ca1df4-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=xX/nvvdv6W37I2UMXLdrdLgG2oqJHQrhG/XTxo8WqzE=;
	b=Uc2UA1Vz1mWQlFjWw789dpA8+Mhh2wDtEBSt8y8sn6JAtm0NA2GefqVLhcKEWZCq
	CXgb35lK4To5bbIpj3beyBJQz11Y5L0IKZ+QXGc1/wtWlmunMMMdNWNajoswkhULs31
	fyi9fZXDaH85NFmhpV1FTVS/miEFTOSkn7yb+DwQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1743511411;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=xX/nvvdv6W37I2UMXLdrdLgG2oqJHQrhG/XTxo8WqzE=;
	b=GDJzzGeTtWx04+TyNeyktKDnFyLULJHk8NFRq5JYhk+zo0hA9BcRwQeloTk3BDGg
	+TYfxPWir73UnfnrqBbX9luWruSPfFZChS869Om9DXIocoIf1HN/W/sQvSTBQgMTAt1
	Bw0ViBw5jMnuA4PMMdYC/1hpLV8IFGGD0OkJIFwI=
Content-Type: multipart/mixed; boundary="===============0714492762982892715=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Anuj Mittal <anuj.mittal@intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gst-devtools: upgrading to 1.26.0 FAILED
Message-ID: <01010195f160d8be-f5469c03-9757-40dd-b700-9ba014ca1df4-000000@us-west-2.amazonses.com>
Date: Tue, 1 Apr 2025 12:43:30 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.04.01-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Apr 2025 12:43:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/214109

--===============0714492762982892715==
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
From 43b8ec811876f036ffebf4c9c12d5e6ba5e00440 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 1 Apr 2025 11:52:29 +0000
Subject: [PATCH] gst-devtools: upgrade 1.24.12 -> 1.26.0

---
 .../0001-connect-has-a-different-signature-on-musl.patch        | 2 +-
 .../{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb}         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.24.12.bb => gst-devtools_1.26.0.bb} (95%)

diff --git a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
index b596f2ef9c..0b7bc4ee82 100644
--- a/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
+++ b/meta/recipes-multimedia/gstreamer/gst-devtools/0001-connect-has-a-different-signature-on-musl.patch
@@ -1,4 +1,4 @@
-From 67809420230cd4fcc63069f78efdc90c7b4c4ee1 Mon Sep 17 00:00:00 2001
+From a2c20b170ac07911c4c83e5117682a3aa43bc89e Mon Sep 17 00:00:00 2001
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
2.47.1


--===============0714492762982892715==
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
workspace            = "tmp-auh-upgrades:c814871070de2f1311ec942acd6939e2bdb67f46"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 371 Local 360 Mirrors 0 Missed 11 Current 573 (97% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 883 of 944 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_recipe_qa_setscene)
NOTE: recipe gst-devtools-1.26.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2322 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_fetch)
NOTE: Running task 2436 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_write_config)
NOTE: recipe gst-devtools-1.26.0-r0: task do_fetch: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_fetch: Succeeded
NOTE: Running task 2500 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_unpack)
NOTE: Running task 2501 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gst-devtools-1.26.0-r0: task do_write_config: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_unpack: Started
NOTE: recipe gst-devtools-1.26.0-r0: task do_write_config: Succeeded
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
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_populate_lic unihash changed to 713891e375d3b6e436a2ac2e1fd3fcdbd016dd010859a44a0b43688f18046dc1
NOTE: recipe gst-devtools-1.26.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_deploy_source_date_epoch unihash changed to 5f873aaa1a4a707500b476b8a5508f58fe37015a4c7eb613d3d1ed480841c2c8
NOTE: Setscene tasks completed
NOTE: Running task 2594 of 2606 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_configure)
NOTE: recipe gst-devtools-1.26.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.10.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.
 0-plugins-base_1.24.12.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.24.12.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.23.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.84.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.7.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_popul
 ate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.4.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot']
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
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.2375159:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.2375159, line 176
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.2375159, line 165
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.2375159, line 154
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.2375159, line 189
NOTE: recipe gst-devtools-1.26.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2594 tasks of which 2585 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401115213.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250401115213.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/log.do_configure.2375159
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gst-devtools-1.26.0-r0 do_configure: meson failed
ERROR: gst-devtools-1.26.0-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/run.do_configure.2375159' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gst-devtools/1.26.0/temp/log.do_configure.2375159
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/gstreamer/gst-devtools_1.26.0.bb:do_configure) failed with exit code '1'

--===============0714492762982892715==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gst-devtools-upgrade-1.24.12-1.26.0.patch"

RnJvbSA0M2I4ZWM4MTE4NzZmMDM2ZmZlYmY0YzljMTJkNWU2YmE1ZTAwNDQwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMSBBcHIgMjAyNSAxMTo1MjoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGdz
dC1kZXZ0b29sczogdXBncmFkZSAxLjI0LjEyIC0+IDEuMjYuMAoKLS0tCiAuLi4vMDAwMS1jb25u
ZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVzbC5wYXRjaCAgICAgICAgfCAyICst
CiAuLi4ve2dzdC1kZXZ0b29sc18xLjI0LjEyLmJiID0+IGdzdC1kZXZ0b29sc18xLjI2LjAuYmJ9
ICAgICAgICAgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIve2dzdC1k
ZXZ0b29sc18xLjI0LjEyLmJiID0+IGdzdC1kZXZ0b29sc18xLjI2LjAuYmJ9ICg5NSUpCgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29scy8w
MDAxLWNvbm5lY3QtaGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdC1kZXZ0b29scy8wMDAxLWNvbm5lY3Qt
aGFzLWEtZGlmZmVyZW50LXNpZ25hdHVyZS1vbi1tdXNsLnBhdGNoCmluZGV4IGI1OTZmMmVmOWMu
LjBiN2JjNGVlODIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3QtZGV2dG9vbHMvMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24t
bXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRl
dnRvb2xzLzAwMDEtY29ubmVjdC1oYXMtYS1kaWZmZXJlbnQtc2lnbmF0dXJlLW9uLW11c2wucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDY3ODA5NDIwMjMwY2Q0ZmNjNjMwNjlmNzhlZmRjOTBj
N2I0YzRlZTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGEyYzIwYjE3MGFjMDc5MTFj
NGM4M2U1MTE3NjgyYTNhYTQzYmM4OWUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBL
aGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU3VuLCA5IFNlcCAyMDE4IDE3OjM4
OjEwIC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbm5lY3QgaGFzIGEgZGlmZmVyZW50IHNpZ25h
dHVyZSBvbiBtdXNsCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFt
ZXIvZ3N0LWRldnRvb2xzXzEuMjQuMTIuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3Ry
ZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjYuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDk1JQpyZW5hbWUg
ZnJvbSBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEuMjQu
MTIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2
dG9vbHNfMS4yNi4wLmJiCmluZGV4IDE1N2NkYzZiYmIuLmNhODAyNTEwZDQgMTAwNjQ0Ci0tLSBh
L21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1lci9nc3QtZGV2dG9vbHNfMS4yNC4xMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0LWRldnRvb2xzXzEu
MjYuMC5iYgpAQCAtMTIsNyArMTIsNyBAQCBTUkNfVVJJID0gImh0dHBzOi8vZ3N0cmVhbWVyLmZy
ZWVkZXNrdG9wLm9yZy9zcmMvZ3N0LWRldnRvb2xzL2dzdC1kZXZ0b29scy0ke1BWfQogICAgICAg
ICAgICBmaWxlOi8vMDAwMS1jb25uZWN0LWhhcy1hLWRpZmZlcmVudC1zaWduYXR1cmUtb24tbXVz
bC5wYXRjaCBcCiAgICAgICAgICAgICIKIAotU1JDX1VSSVtzaGEyNTZzdW1dID0gIjRlZjNkZDEy
ZTU4MjcwNjhkNmRiN2FkMDE4NzZkMTIxNmE4MDcxNzExNmMyNGEwZDViM2I1N2ZkN2UzYzM0Nzgi
CitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZWZmMzNkN2RjMjkyYmIwNzRhMjc4OGVhODg3YjYyODMz
OThmZmRlZmFmYTQ5ZmI3ZDA4ZWZlNjY1OGE2NTY0OCIKIAogREVQRU5EUyA9ICJqc29uLWdsaWIg
Z2xpYi0yLjAgZ2xpYi0yLjAtbmF0aXZlIGdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAtcGx1Z2lu
cy1iYXNlIgogUlJFQ09NTUVORFM6JHtQTn0gPSAiZ2l0IgotLSAKMi40Ny4xCgo=

--===============0714492762982892715==--

