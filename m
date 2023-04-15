Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D810C88C8D
	for <webhook@archiver.kernel.org>; Sat, 15 Apr 2023 18:01:30 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web10.13812.1681581686192071924
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Apr 2023 11:01:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GNL0eDSx;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018786143aa5-02ba6b45-2350-49c5-976f-12f80733177e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=PMF0ncrLHozNlsXjt/yW2p3eR1R887o9mSq07v1AEOk=;
	b=GNL0eDSxjjG1HsIidW1OX1mRLSZAfrMR9UJSKFXDj39K0DLmTpTupIaOEzNqwveQ
	Xw+7J17H6ew+8HDV8JZa0GXTHhWRItZuR1A6KwPIVx5d/+zu8cYNxb3DZ0dQ1TneD60
	s36Rf4kJkObDpQMGKOetLo8ZPwc2KdwQTi66k2mY=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1681581685;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=PMF0ncrLHozNlsXjt/yW2p3eR1R887o9mSq07v1AEOk=;
	b=gfkuf6EyZfugFa6wcF95vgz68LgZX7QmOE/T9myl3mcgcz4tvAp4/shwwOjgrAQK
	Qujij4UJDITOZMTEE49+L4iTHyjQ2x9PZcEemUR/RJNcX5j8JipNVpgNlIK5wYXr8JN
	FQUNNLLysJkq+dzUZUjuR4cunrQQgFEtX/OksGUs=
Content-Type: multipart/mixed; boundary="===============1165989723675828509=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.1 FAILED
Message-ID: <0101018786143aa5-02ba6b45-2350-49c5-976f-12f80733177e-000000@us-west-2.amazonses.com>
Date: Sat, 15 Apr 2023 18:01:25 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.04.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Apr 2023 18:01:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180061

--===============1165989723675828509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *44.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-43.1-44.1.patch
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
--===============1165989723675828509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1798 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1798 targets, 40 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a764322edf91f07beedf43549046981793cff486"
workspace            = "master:ff633ce7a7ffc0d39b86043caeb63a9ffcef99b8"

Initialising tasks...done.
Sstate summary: Wanted 209 Local 202 Mirrors 0 Missed 7 Current 741 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2963 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_fetch)
NOTE: Running task 3223 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_write_config)
NOTE: recipe epiphany-44.1-r0: task do_fetch: Started
NOTE: recipe epiphany-44.1-r0: task do_fetch: Succeeded
NOTE: Running task 3328 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_unpack)
NOTE: Running task 3329 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.1-r0: task do_write_config: Started
NOTE: recipe epiphany-44.1-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.1-r0: task do_unpack: Started
NOTE: recipe epiphany-44.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.1-r0: task do_unpack: Succeeded
NOTE: Running task 3330 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_patch)
NOTE: recipe epiphany-44.1-r0: task do_patch: Started
NOTE: recipe epiphany-44.1-r0: task do_patch: Succeeded
NOTE: Running task 3331 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3332 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_populate_lic)
NOTE: recipe epiphany-44.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.1-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.1-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3333 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_configure)
NOTE: recipe epiphany-44.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'glib-2.0', 'gobject-introspection', 'vala', 'libpcre2-native', 'gettext-minimal-native', 'zlib-native', 'libffi-native', 'util-linux-native', 'texinfo-dummy-native', 'attr-native', 'libtool-native', 'python3-installer-native', 'python3-wheel-native', 'python3-setuptools-native', 'python3-build-native', 'libxrandr-native', 'libxcursor-native', 'libxext-native', 'libpng-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'libxrender-native', '
 fontconfig-native', 'pango-native', 'libjpeg-turbo-native', 'libxi-native', 'libx11-native', 'libxcomposite-native', 'cairo-native', 'libxfixes-native', 'at-spi2-core-native', 'libxdamage-native', 'libtirpc-native', 'openssl-native', 'bzip2-native', 'sqlite3-native', 'util-linux-libuuid-native', 'readline-native', 'ncurses-native', 'libnsl2-native', 'gdbm-native', 'gstreamer1.0-plugins-base', 'libsecret', 'wpebackend-fdo', 'mesa', 'libxdamage', 'systemd', 'libnotify', 'gstreamer1.0', 'libx11', 'harfbuzz', 'libtasn1', 'libxrender', 'cairo', 'libxslt', 'at-spi2-core', 'enchant2', 'libxt', 'libxcomposite', 'wayland', 'libjpeg-turbo', 'libwpe', 'libwebp', 'mpfr-native', 'binutils-cross-i686', 'gnu-config-native', 'zstd-native', 'gmp-native', 'flex-native', 'linux-libc-headers', 'libmpc-native', 'gtk4', 'p11-kit', 'libgcrypt', 'shared-mime-info', 'libxi', 'fontconfig', 'libxfixes', 'wayland-protocols', 'pango', 'libxkbcommon', 'libxrandr', 'libxext', 'libepoxy', 'libpng', 'opkg-utils', '
 libxcursor', 'libpsl', 'nghttp2', 'sqlite3', 'libxml2', 're2c-native', 'attr', 'zlib', 'acl', 'bzip2', 'xz', 'zstd', 'gmp', 'libgcc', 'bash-completion', 'libpcre2', 'util-linux', 'libffi', 'python3', 'autoconf-archive', 'libcap-ng-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'python3-packaging-native', 'xorgproto-native', 'util-macros-native', 'shared-mime-info-native', 'expat-native', 'freetype-native', 'fribidi-native', 'libxft-native', 'harfbuzz-native', 'cmake-native', 'libxcb-native', 'xtrans-native', 'pixman-native', 'libsm-native', 'libxtst-native', 'libxml2-native', 'dbus-native', 'perl-native', 'libxv', 'libtheora', 'iso-codes', 'alsa-lib', 'libvorbis', 'libogg', 'libsm', 'libdrm', 'orc', 'libxshmfence', 'vulkan-loader', 'vulkan-headers', 'xrandr', 'xorgproto', 'expat', 'libxxf86vm', 'util-macros', 'base-passwd', 'libcap', 'shadow-sysroot', 'libpam', 'base-files', 'update-rc.d', 'shadow-native', 'kmod', 'initscripts', 'shadow', 'libseccomp', 'xtran
 s', 'libxcb', 'icu', 'freetype', 'pixman', 'dbus', 'libxtst', 'aspell', 'libxdmcp', 'm4-native', 'gi-docgen', 'libxinerama', 'fribidi', 'graphene', 'librsvg', 'tiff', 'gstreamer1.0-plugins-bad', 'libgpg-error', 'libxft', 'xkeyboard-config', 'libcap-ng', 'util-linux-libuuid', 'libxcrypt', 'ncurses', 'gdbm', 'libtirpc', 'openssl', 'readline', 'libnsl2', 'unzip-native', 'itstool-native', 'icu-native', 'xcb-proto-native', 'libxau-native', 'libpthread-stubs-native', 'libxdmcp-native', 'libice-native', 'make-native', 'libice', 'libpciaccess', 'libpthread-stubs', 'cracklib', 'libxau', 'xcb-proto', 'libstd-rs', 'sbc', 'libusb1', 'libsndfile1', 'bluez5', 'libgudev', 'curl', 'flac', 'libical', 'libidn2', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.0.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/epiphany-44.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/build
| Build type: cross build
| Project name: epiphany
| Project version: 44.1
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/recipe-sysroot (gcc 12.2.0 "i686-poky-linux-gcc (GCC) 12.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/recipe-sysroot ld.bfd 2.40.20230119
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.13.0
| Run-time dependency cairo found: YES 1.16.0
| Found CMake: NO
| Run-time dependency gcr-4 found: NO (tried pkgconfig)
| 
| ../epiphany-44.1/meson.build:89:0: ERROR: Dependency "gcr-4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/run.do_configure.2625854:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/run.do_configure.2625854, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/run.do_configure.2625854, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/run.do_configure.2625854, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/run.do_configure.2625854, line 187
NOTE: recipe epiphany-44.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3333 tasks of which 3325 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.1-r0 do_configure: meson failed
ERROR: epiphany-44.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/run.do_configure.2625854', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.1-r0/temp/log.do_configure.2625854
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.1.bb:do_configure) failed with exit code '1'

--===============1165989723675828509==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.1.patch"

RnJvbSBlZDc1MzIyNzVhNmM3NTUzZGY0MDQyMWE3ODhiODI3Y2ZjNTc0NmExIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgQXByIDIwMjMgMTI6NTQ6MjUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0My4xIC0+IDQ0LjEKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjEuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjEuYmJ9
ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQzLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQ0LjEuYmIKaW5kZXggZWEyMjcyM2E5Ny4uYmFkNDYxMmVlYSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQzLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ0LjEuYmIKQEAgLTMxLDcgKzMxLDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTg2ZWFkMjdjYjk5ODI4MTUxNTA2NjRk
ZTNiZjIwZmFmMzc1Zjc3YjgwNjViMDJiMzExODBjNjViNmJiZWJiNCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gImJiYWQyOGZjNzI3M2E4NjZiOWI1ZTVkZDU2ODZiZDA0ODQzMGMzZjBi
ZWVkNGMwODI2MGI0ZDA4ZGQ4ZmY4NWIiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1
Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9
dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgotLSAKMi4zOS4yCgo=

--===============1165989723675828509==--

