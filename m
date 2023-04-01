Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D96C87FE4
	for <webhook@archiver.kernel.org>; Sat,  1 Apr 2023 21:29:03 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.32141.1680384535508255615
 for <openembedded-core@lists.openembedded.org>;
 Sat, 01 Apr 2023 14:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=lOTTSudb;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101873eb928fd-001073d8-008d-435f-bf75-2729a704aa59-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=5tJJEbLs20uucYD7KO/noem6RXYYxDMsq8OrHaGYd9o=;
	b=lOTTSudb3E2N5PDZYtv/ZD3noN4Sed/DMX1Wh999h5tJQmnKNmGRaMjprnh04LBH
	eljJkAChYwekIGLJwUmPKpq4NwaShirIl2ksCmU6JVk0DD5ASUsqCM/YmwCjVNl55bs
	KA9G8mJBgZ3fATbTZql7ilrKhW8reyJiYgjiDMI4=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1680384535;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=5tJJEbLs20uucYD7KO/noem6RXYYxDMsq8OrHaGYd9o=;
	b=q+GyCdCR1hJ0AhVjCv/mSesyaBe2jm8roZUxWTH713th6Wf3n6w2B3fXbR5xyyiI
	L4U/iFBhqln4gVdBWQey5PcZfFP0SRvUepzgkybebc1XnjoHmRtzOgM0crRQshQBoIa
	olrHR2Aqq1Hji63oS3pTEtRIWJTRlYTktwzeJQAM=
Content-Type: multipart/mixed; boundary="===============8420767732448916005=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.0 FAILED
Message-ID: <010101873eb928fd-001073d8-008d-435f-bf75-2729a704aa59-000000@us-west-2.amazonses.com>
Date: Sat, 1 Apr 2023 21:28:54 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 01 Apr 2023 21:29:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179521

--===============8420767732448916005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *44.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-43.1-44.0.patch
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
--===============8420767732448916005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1796 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1796 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.3.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.1+snapshot-8c098b8ecef675315b7cab023cc154c69f2a9d0f"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:8c098b8ecef675315b7cab023cc154c69f2a9d0f"
workspace            = "master:d59756912cd450b0af3d8893b822c66dafe42544"

Initialising tasks...done.
Sstate summary: Wanted 219 Local 212 Mirrors 0 Missed 7 Current 731 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2963 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_fetch)
NOTE: Running task 3223 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_write_config)
NOTE: recipe epiphany-44.0-r0: task do_fetch: Started
NOTE: recipe epiphany-44.0-r0: task do_fetch: Succeeded
NOTE: Running task 3328 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_unpack)
NOTE: Running task 3329 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.0-r0: task do_write_config: Started
NOTE: recipe epiphany-44.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.0-r0: task do_unpack: Started
NOTE: recipe epiphany-44.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.0-r0: task do_unpack: Succeeded
NOTE: Running task 3330 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_patch)
NOTE: recipe epiphany-44.0-r0: task do_patch: Started
NOTE: recipe epiphany-44.0-r0: task do_patch: Succeeded
NOTE: Running task 3331 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3332 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_populate_lic)
NOTE: recipe epiphany-44.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3333 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_configure)
NOTE: recipe epiphany-44.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.2.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'zstd-native', 'libtool-native', 'texinfo-dummy-native', 'linux-libc-headers', 'zlib-native', 'gnu-config-native', 'mpfr-native', 'flex-native', 'gmp-native', 'libmpc-native', 'binutils-cross-i686', 'zstd', 'bzip2', 'zlib', 'xz', 'attr', 'opkg-utils', 'acl', 're2c-native', 'libgcc', 'glib-2.0', 'vala', 'gobject-introspection', 'util-linux-native', 'gettext-minimal-native', 'libpcre2-native', 'libffi-native', 'gmp', 'harfbuzz', 'libxt', 'gstreamer1.0', 
 'libxrender', 'libjpeg-turbo', 'libwpe', 'libxdamage', 'gstreamer1.0-plugins-base', 'libtasn1', 'wpebackend-fdo', 'enchant2', 'libsecret', 'libnotify', 'libxcomposite', 'wayland', 'libx11', 'libxslt', 'cairo', 'mesa', 'at-spi2-core', 'libwebp', 'systemd', 'fontconfig', 'wayland-protocols', 'libxkbcommon', 'libxi', 'libxcursor', 'libepoxy', 'libxrandr', 'libpng', 'libxext', 'pango', 'libxfixes', 'libxml2', 'nghttp2', 'libpsl', 'sqlite3', 'openssl-native', 'readline-native', 'sqlite3-native', 'bzip2-native', 'libtirpc-native', 'util-linux-libuuid-native', 'ncurses-native', 'libnsl2-native', 'gdbm-native', 'gtk4', 'libgcrypt', 'p11-kit', 'shared-mime-info', 'python3-setuptools-native', 'python3-build-native', 'python3-wheel-native', 'python3-installer-native', 'attr-native', 'at-spi2-core-native', 'libx11-native', 'libxfixes-native', 'cairo-native', 'libxrender-native', 'libxi-native', 'libxext-native', 'fontconfig-native', 'libjpeg-turbo-native', 'libxdamage-native', 'libxcursor-nativ
 e', 'pango-native', 'libpng-native', 'libxcomposite-native', 'gdk-pixbuf-native', 'libxrandr-native', 'gobject-introspection-native', 'm4-native', 'libpcre2', 'libffi', 'bash-completion', 'util-linux', 'python3', 'autoconf-archive', 'libcap-ng-native', 'freetype', 'icu', 'libsm', 'util-macros', 'libxcb', 'libxdmcp', 'xorgproto', 'iso-codes', 'libogg', 'libvorbis', 'libtheora', 'alsa-lib', 'libxv', 'orc', 'libdrm', 'aspell', 'dbus', 'expat', 'xtrans', 'pixman', 'libxxf86vm', 'vulkan-headers', 'libxshmfence', 'xrandr', 'vulkan-loader', 'libxtst', 'libcap', 'base-passwd', 'shadow', 'shadow-sysroot', 'initscripts', 'kmod', 'base-files', 'libseccomp', 'libpam', 'update-rc.d', 'shadow-native', 'xkeyboard-config', 'libxft', 'fribidi', 'perl-native', 'gstreamer1.0-plugins-bad', 'libxinerama', 'gi-docgen', 'graphene', 'librsvg', 'tiff', 'libgpg-error', 'python3-packaging-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'libxtst-native', 'dbus-native', 'libxml2-native', 
 'xorgproto-native', 'util-macros-native', 'libxcb-native', 'xtrans-native', 'pixman-native', 'libsm-native', 'expat-native', 'freetype-native', 'cmake-native', 'libxft-native', 'harfbuzz-native', 'fribidi-native', 'shared-mime-info-native', 'libxcrypt', 'util-linux-libuuid', 'ncurses', 'libcap-ng', 'openssl', 'libnsl2', 'readline', 'gdbm', 'libtirpc', 'libice', 'xcb-proto', 'libxau', 'libpthread-stubs', 'libpciaccess', 'cracklib', 'make-native', 'curl', 'sbc', 'bluez5', 'libgudev', 'libusb1', 'libsndfile1', 'libstd-rs', 'unzip-native', 'libxau-native', 'libpthread-stubs-native', 'libxdmcp-native', 'xcb-proto-native', 'libice-native', 'icu-native', 'itstool-native', 'libidn2', 'libical', 'flac', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.0.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/epiphany-44.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/build
| Build type: cross build
| Project name: epiphany
| Project version: 44.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.13.0
| Run-time dependency cairo found: YES 1.16.0
| Found CMake: NO
| Run-time dependency gcr-4 found: NO (tried pkgconfig)
| 
| ../epiphany-44.0/meson.build:89:0: ERROR: Dependency "gcr-4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/run.do_configure.2846204:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/run.do_configure.2846204, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/run.do_configure.2846204, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/run.do_configure.2846204, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/run.do_configure.2846204, line 187
NOTE: recipe epiphany-44.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3333 tasks of which 3325 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.0-r0 do_configure: meson failed
ERROR: epiphany-44.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/run.do_configure.2846204', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.0-r0/temp/log.do_configure.2846204
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.0.bb:do_configure) failed with exit code '1'

--===============8420767732448916005==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.0.patch"

RnJvbSBkOTUzYzYwMDk5ZWIwOGZiYjY3YzQ3YzRmNGFkZjMwOTBhOTc2ZmEyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMSBBcHIgMjAyMyAxNDowNTo0MSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQzLjEgLT4gNDQuMAoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQzLjEuYmIgPT4gZXBpcGhhbnlfNDQuMC5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQzLjEuYmIgPT4gZXBpcGhhbnlfNDQuMC5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDMuMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80NC4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9lcGlwaGFueV80My4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZXBpcGhhbnlfNDQuMC5iYgppbmRleCBlYTIyNzIzYTk3Li5mMDIzZTA5OTY0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuMC5iYgpAQCAtMzEsNyArMzEsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1f
dmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlODZlYWQyN2NiOTk4MjgxNTE1MDY2NGRl
M2JmMjBmYWYzNzVmNzdiODA2NWIwMmIzMTE4MGM2NWI2YmJlYmI0IgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiYWFiZGM5ZGU4MGM0MDkwNzM2NzZlMDBlMTViYTk3MTg3NzE1ZTRiODRi
Yzc3NmZlODZkYjg2ZDBmODE0MGJiMSIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVn
Z2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10
cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCi0tIAoyLjM5LjIKCg==

--===============8420767732448916005==--

