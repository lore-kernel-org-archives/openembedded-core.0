Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8CE4C88CB2
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 21:39:16 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.3709.1684186747327869018
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 May 2023 14:39:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=fBm6Z+j+;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 01010188215a5925-3ff3c260-9ee2-45ce-b7bd-369957eb925f-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=CMy0d3qpPp8ColsiqgP9FNo8Cy0QVuU8bBsiO4Qy30A=;
	b=fBm6Z+j+kjs/ivZ8najsLNgX9nKCy0s+VQOuUCmj0D8CliF/zHHwJQ1Kr7o+O00x
	vPoXaerFdqFq2+2A5U/MQDJMX/ntqFvKXDjjeMsxtbDUHhub4fj3T55pfaL1mW+Tra0
	N+UlZpacS5LkN6oKhZ542b7aZtF70ikZI85LQyto=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1684186749;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=CMy0d3qpPp8ColsiqgP9FNo8Cy0QVuU8bBsiO4Qy30A=;
	b=bXVvUe2T5Gu/kk+9S6MJBX8Mv7+21Bg5hU+lv0tP5i3/1C4aNLdwjX+7Z9m8/1Tt
	TTWotFKKjzlOsDTrxi3hON6pz2sJLcC8wgQFXzAgan9pchL4+jQMYIaFtIFeDTv7G4N
	mhFhmQgFXsWBVQXnpUdR8BLGklF5VdPwrc9wdYQE=
Content-Type: multipart/mixed; boundary="===============7596331859991901121=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.2 FAILED
Message-ID: <01010188215a5925-3ff3c260-9ee2-45ce-b7bd-369957eb925f-000000@us-west-2.amazonses.com>
Date: Mon, 15 May 2023 21:39:09 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.15-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 May 2023 21:39:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181349

--===============7596331859991901121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *44.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-43.1-44.2.patch
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
--===============7596331859991901121==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 900 .bb files complete (899 cached, 1 parsed). 1803 targets, 40 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:c64291927550d913d99234ee0d5661e78ab38859"
workspace            = "master:35e5d29a7d654fc79bdb898d0f1fb277270dbfd5"

Initialising tasks...done.
Sstate summary: Wanted 224 Local 217 Mirrors 0 Missed 7 Current 732 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2981 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_fetch)
NOTE: Running task 3243 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_write_config)
NOTE: recipe epiphany-44.2-r0: task do_fetch: Started
NOTE: recipe epiphany-44.2-r0: task do_fetch: Succeeded
NOTE: Running task 3348 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_unpack)
NOTE: Running task 3349 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.2-r0: task do_write_config: Started
NOTE: recipe epiphany-44.2-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.2-r0: task do_unpack: Started
NOTE: recipe epiphany-44.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.2-r0: task do_unpack: Succeeded
NOTE: Running task 3350 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_patch)
NOTE: recipe epiphany-44.2-r0: task do_patch: Started
NOTE: recipe epiphany-44.2-r0: task do_patch: Succeeded
NOTE: Running task 3351 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3352 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_populate_lic)
NOTE: recipe epiphany-44.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.2-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3353 of 3361 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_configure)
NOTE: recipe epiphany-44.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'libpng', 'libjpeg-turbo', 'shared-mime-info', 'gobject-introspection', 'glib-2.0', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-build-native', 'libtool-native', 'gettext-minimal-native', 'zlib-native', 'ncurses-native', 'libedit-native', 'util-linux-libuuid-native', 'libffi-native', 'bzip2-native', 'openssl-native', 'libtirpc-native', 'sqlite3-native', 'gdbm-native', 'expat-native', 'libnsl2-native', 'libgc
 c', 'linux-libc-headers', 'gtk4', 'vala', 'libxdamage-native', 'fontconfig-native', 'libxcomposite-native', 'libxrandr-native', 'gdk-pixbuf-native', 'libxext-native', 'libxcursor-native', 'gobject-introspection-native', 'libxi-native', 'cairo-native', 'libx11-native', 'libxfixes-native', 'at-spi2-core-native', 'libjpeg-turbo-native', 'libpng-native', 'libxrender-native', 'pango-native', 'texinfo-dummy-native', 'attr-native', 'harfbuzz', 'gstreamer1.0', 'libsecret', 'libtasn1', 'cairo', 'libxcomposite', 'libxrender', 'libxt', 'gstreamer1.0-plugins-base', 'libwpe', 'at-spi2-core', 'libxslt', 'libwebp', 'wpebackend-fdo', 'mesa', 'wayland', 'libxdamage', 'libx11', 'systemd', 'libnotify', 'enchant2', 'libpsl', 'nghttp2', 'libxml2', 'sqlite3', 'flex-native', 'binutils-cross-i686', 'libmpc-native', 'zstd-native', 'mpfr-native', 'gnu-config-native', 'gmp-native', 'gmp', 're2c-native', 'libxcursor', 'libxkbcommon', 'libxi', 'libxfixes', 'wayland-protocols', 'libxrandr', 'opkg-utils', 'libxex
 t', 'libepoxy', 'pango', 'fontconfig', 'libpcre2-native', 'util-linux-native', 'p11-kit', 'libgcrypt', 'attr', 'xz', 'acl', 'zlib', 'zstd', 'bzip2', 'libffi', 'autoconf-archive', 'python3', 'libpcre2', 'util-linux', 'bash-completion', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'perl-native', 'cmake-native', 'fribidi', 'graphene', 'librsvg', 'libxinerama', 'gi-docgen', 'vulkan-headers', 'vulkan-loader', 'gstreamer1.0-plugins-bad', 'tiff', 'xorgproto-native', 'util-macros-native', 'freetype-native', 'shared-mime-info-native', 'pixman-native', 'libsm-native', 'libxcb-native', 'xtrans-native', 'libxtst-native', 'libxml2-native', 'dbus-native', 'harfbuzz-native', 'fribidi-native', 'libxft-native', 'freetype', 'icu', 'libxcb', 'libsm', 'pixman', 'util-macros', 'xorgproto', 'libxdmcp', 'libdrm', 'alsa-lib', 'libtheora', 'orc', 'libxv', 'libogg', 'libvorbis', 'iso-codes', 'libxtst', 'dbus', 'expat', 'libxxf86vm', 'libxshmfence', 'xrandr', 'xtra
 ns', 'shadow-sysroot', 'libseccomp', 'base-passwd', 'libcap', 'shadow-native', 'libpam', 'initscripts', 'shadow', 'update-rc.d', 'base-files', 'kmod', 'aspell', 'm4-native', 'xkeyboard-config', 'libxft', 'libcap-ng-native', 'libgpg-error', 'gdbm', 'openssl', 'libnsl2', 'libxcrypt', 'libtirpc', 'ncurses', 'libedit', 'util-linux-libuuid', 'libcap-ng', 'unzip-native', 'make-native', 'libstd-rs', 'curl', 'bluez5', 'sbc', 'libgudev', 'libusb1', 'libsndfile1', 'itstool-native', 'libice-native', 'libpthread-stubs-native', 'libxau-native', 'xcb-proto-native', 'libxdmcp-native', 'icu-native', 'libxau', 'libpthread-stubs', 'xcb-proto', 'libice', 'libpciaccess', 'cracklib', 'libidn2', 'readline', 'libical', 'flac', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.0.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/epiphany-44.2
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/build
| Build type: cross build
| Project name: epiphany
| Project version: 44.2
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.13.0
| Run-time dependency cairo found: YES 1.16.0
| Found CMake: NO
| Run-time dependency gcr-4 found: NO (tried pkgconfig)
| 
| ../epiphany-44.2/meson.build:89:0: ERROR: Dependency "gcr-4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.3065852:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.3065852, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.3065852, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.3065852, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.3065852, line 187
NOTE: recipe epiphany-44.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3353 tasks of which 3345 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.2-r0 do_configure: meson failed
ERROR: epiphany-44.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.3065852', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/log.do_configure.3065852
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_configure) failed with exit code '1'

--===============7596331859991901121==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.2.patch"

RnJvbSAzMGFjNTI5NWVlNzIyZTU5MjU1YTk5YmE4MGY5MjFiMjQwMmI5MjBhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgTWF5IDIwMjMgMTc6MDM6NDYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0My4xIC0+IDQ0LjIKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjIuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjIuYmJ9
ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQzLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQ0LjIuYmIKaW5kZXggZWEyMjcyM2E5Ny4uMWVlMjA0MTdhNCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQzLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ0LjIuYmIKQEAgLTMxLDcgKzMxLDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTg2ZWFkMjdjYjk5ODI4MTUxNTA2NjRk
ZTNiZjIwZmFmMzc1Zjc3YjgwNjViMDJiMzExODBjNjViNmJiZWJiNCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gImIxZjZkZjE1ZmI2YTYxN2ZlZGQ2MTk4YjJkY2FhYmQ0NDEwZDI1ODM0
NDA5ZGE1MTU3MDlkZDc3Y2ZjNTZiMzMiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1
Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9
dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgotLSAKMi4zOS4yCgo=

--===============7596331859991901121==--

