Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73A99CA9EBD
	for <webhook@archiver.kernel.org>; Mon,  1 May 2023 21:26:04 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.107438.1682976352359142046
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 May 2023 14:25:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=QcBv4ZpN;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010187d935259c-5174d35c-6939-4cfc-b4ac-c5c11b5b5347-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=jLwXyrIPOhycTrK+uBOdyMvIUq8ieRQRQBDp5Y5GZVU=;
	b=QcBv4ZpNjAeeCt6ZU/Zs9NR2a89MuBa293tERP0MnLsacZMRvNl8wlVfA/O3FTCB
	Idq6u5C0DatkrbdTLhrjA11QzywrMeKXNJ+5vTzamPvBI60KgZemlErW/k29sLpj0yN
	HpcEpEybPXuuBwPPnWoooz9vLPdh34fHIBCVY/Pg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1682976351;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=jLwXyrIPOhycTrK+uBOdyMvIUq8ieRQRQBDp5Y5GZVU=;
	b=cobb5pxWZXmq8ZXTBmMRhhdQhzkJnEKLAt4rD4QCKwI5+4TzNqmzvMQVUsJPdtX+
	9eyrdeeTILr3zlIlp1wsTXUVVIkktFthsn6/9Y3dcvDRPVYeT261rWDHAPsvxJWqotR
	76AmIol91WqNydpO+hAE0/k+rL46rLFyxSA/1mMk=
Content-Type: multipart/mixed; boundary="===============4010379040346482330=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.2 FAILED
Message-ID: <01010187d935259c-5174d35c-6939-4cfc-b4ac-c5c11b5b5347-000000@us-west-2.amazonses.com>
Date: Mon, 1 May 2023 21:25:51 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 May 2023 21:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180676

--===============4010379040346482330==
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
--===============4010379040346482330==
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
meta-yocto-bsp       = "tmp-auh-upgrades:5529a24aec9e6bc9b291be9b49c779e78676d9f4"
workspace            = "master:cce6db2a59d309f77c1f9ca173fc674c506062d0"

Initialising tasks...done.
Sstate summary: Wanted 232 Local 225 Mirrors 0 Missed 7 Current 718 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2963 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_fetch)
NOTE: Running task 3223 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_write_config)
NOTE: recipe epiphany-44.2-r0: task do_fetch: Started
NOTE: recipe epiphany-44.2-r0: task do_fetch: Succeeded
NOTE: Running task 3328 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_unpack)
NOTE: Running task 3329 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.2-r0: task do_write_config: Started
NOTE: recipe epiphany-44.2-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.2-r0: task do_unpack: Started
NOTE: recipe epiphany-44.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.2-r0: task do_unpack: Succeeded
NOTE: Running task 3330 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_patch)
NOTE: recipe epiphany-44.2-r0: task do_patch: Started
NOTE: recipe epiphany-44.2-r0: task do_patch: Succeeded
NOTE: Running task 3331 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3332 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_populate_lic)
NOTE: recipe epiphany-44.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.2-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3333 of 3341 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_configure)
NOTE: recipe epiphany-44.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_12.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_7.2.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_43.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.74.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.0.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.36.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'glib-2.0', 'python3-wheel-native', 'python3-installer-native', 'python3-build-native', 'python3-setuptools-native', 'libtool-native', 'attr-native', 'bzip2', 'acl', 'attr', 'xz', 'zstd', 'zlib', 'opkg-utils', 'gmp', 'libpcre2-native', 'zlib-native', 'util-linux-native', 'gettext-minimal-native', 'libffi-native', 'linux-libc-headers', 'libpsl', 'nghttp2', 'gobject-introspection', 'libxml2', 'sqlite3', 'vala', 'harfbuzz', 'libsecret', 'cairo', 'libwpe',
  'wpebackend-fdo', 'at-spi2-core', 'libxcomposite', 'gstreamer1.0-plugins-base', 'libnotify', 'libxdamage', 'libx11', 'libtasn1', 'gstreamer1.0', 'libxt', 'systemd', 'libwebp', 'enchant2', 'libxslt', 'mesa', 'libxrender', 'wayland', 'libjpeg-turbo', 'texinfo-dummy-native', 'gtk4', 'libtirpc-native', 'sqlite3-native', 'readline-native', 'ncurses-native', 'util-linux-libuuid-native', 'libnsl2-native', 'bzip2-native', 'openssl-native', 'gdbm-native', 'shared-mime-info', 'libpng', 'libxrandr', 'wayland-protocols', 'libepoxy', 'libxi', 'libxext', 'libxcursor', 'libxkbcommon', 'pango', 'libxfixes', 'fontconfig', 're2c-native', 'gobject-introspection-native', 'libxrandr-native', 'libpng-native', 'libxrender-native', 'at-spi2-core-native', 'fontconfig-native', 'libjpeg-turbo-native', 'libxdamage-native', 'pango-native', 'libxcursor-native', 'libx11-native', 'libxext-native', 'libxcomposite-native', 'libxi-native', 'gdk-pixbuf-native', 'libxfixes-native', 'cairo-native', 'flex-native', 'gmp-
 native', 'gnu-config-native', 'zstd-native', 'mpfr-native', 'binutils-cross-i686', 'libmpc-native', 'libgcrypt', 'p11-kit', 'libgcc', 'libpcre2', 'libffi', 'util-linux', 'bash-completion', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'libcap-ng-native', 'icu', 'autoconf-archive', 'python3', 'freetype', 'libxcb', 'libsm', 'pixman', 'libxtst', 'dbus', 'util-macros', 'xorgproto', 'libxv', 'iso-codes', 'libvorbis', 'libdrm', 'libogg', 'orc', 'alsa-lib', 'libtheora', 'xtrans', 'libxdmcp', 'kmod', 'initscripts', 'base-passwd', 'libseccomp', 'base-files', 'update-rc.d', 'shadow-sysroot', 'libcap', 'libpam', 'shadow', 'shadow-native', 'aspell', 'xrandr', 'vulkan-loader', 'vulkan-headers', 'libxxf86vm', 'expat', 'libxshmfence', 'graphene', 'gi-docgen', 'libxinerama', 'fribidi', 'tiff', 'gstreamer1.0-plugins-bad', 'librsvg', 'perl-native', 'xkeyboard-config', 'libxft', 'util-macros-native', 'xorgproto-native', 'libxtst-native', 'libxml2-native', 'd
 bus-native', 'expat-native', 'freetype-native', 'cmake-native', 'fribidi-native', 'libxft-native', 'harfbuzz-native', 'xtrans-native', 'libxcb-native', 'shared-mime-info-native', 'pixman-native', 'libsm-native', 'm4-native', 'libgpg-error', 'util-linux-libuuid', 'libcap-ng', 'ncurses', 'libxcrypt', 'unzip-native', 'libnsl2', 'gdbm', 'openssl', 'libtirpc', 'readline', 'libxau', 'xcb-proto', 'libpthread-stubs', 'libice', 'libpciaccess', 'cracklib', 'libusb1', 'libgudev', 'libsndfile1', 'sbc', 'curl', 'bluez5', 'libstd-rs', 'make-native', 'icu-native', 'libpthread-stubs-native', 'libxdmcp-native', 'xcb-proto-native', 'libxau-native', 'itstool-native', 'libice-native', 'flac', 'libidn2', 'libical', 'libunistring']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.2977536:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.2977536, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.2977536, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.2977536, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.2977536, line 187
NOTE: recipe epiphany-44.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3333 tasks of which 3325 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.2-r0 do_configure: meson failed
ERROR: epiphany-44.2-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/run.do_configure.2977536', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.2-r0/temp/log.do_configure.2977536
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.2.bb:do_configure) failed with exit code '1'

--===============4010379040346482330==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.2.patch"

RnJvbSA5OTdiMTU1ZTExZjUyOGI3MDliZjZhODA5ZjAyNGY0ZWJhMmZiYzM1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMSBNYXkgMjAyMyAxNTo1NzozMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQzLjEgLT4gNDQuMgoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQzLjEuYmIgPT4gZXBpcGhhbnlfNDQuMi5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQzLjEuYmIgPT4gZXBpcGhhbnlfNDQuMi5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDMuMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80NC4yLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9lcGlwaGFueV80My4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZXBpcGhhbnlfNDQuMi5iYgppbmRleCBlYTIyNzIzYTk3Li4xZWUyMDQxN2E0IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuMi5iYgpAQCAtMzEsNyArMzEsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1f
dmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlODZlYWQyN2NiOTk4MjgxNTE1MDY2NGRl
M2JmMjBmYWYzNzVmNzdiODA2NWIwMmIzMTE4MGM2NWI2YmJlYmI0IgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiYjFmNmRmMTVmYjZhNjE3ZmVkZDYxOThiMmRjYWFiZDQ0MTBkMjU4MzQ0
MDlkYTUxNTcwOWRkNzdjZmM1NmIzMyIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVn
Z2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10
cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCi0tIAoyLjM5LjIKCg==

--===============4010379040346482330==--

