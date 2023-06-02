Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7059CCA9EBC
	for <webhook@archiver.kernel.org>; Fri,  2 Jun 2023 08:10:44 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.7528.1685693431961318251
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Jun 2023 01:10:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=UKHlWILq;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101887b2888f3-9a5c3835-b07f-45d1-82fb-fbb2c66778b8-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=RGZ3rq+C97yACh6Mwe1J3dHB+Q6oU+ZJDqZnqfr6oQU=;
	b=UKHlWILq+tC61tNks4aJZ0KnGvos+KwiTYLC8VZ2YA5saAgYq2STotUSyd7IyvtW
	v1jVUME2ZtuBCqOWewT3YsD5N+3oKY4+wTG7/YbpXiwDIs+YMx787xYgydyZKcmP+34
	9ZZE3eQ4hSKWhdrIymOw+Af+cK5pz8EpycUROPrw=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1685693434;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=RGZ3rq+C97yACh6Mwe1J3dHB+Q6oU+ZJDqZnqfr6oQU=;
	b=Ft9Jzc17gJyve8mXygIj3SHV4MbRulX/C236uYB23uSHad/bM9mxWNJesmAXFwiV
	HioAyvUwTTLhW6jSWGGXkgJO3E9PG4+FsZ7CO5j1FO00WqBjR/G6ox4prNhnlyG4xoT
	IB4teA8wOis2sD33RypSMr8CR44i7+xcNnLM48JM=
Content-Type: multipart/mixed; boundary="===============5763935680254315794=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.3 FAILED
Message-ID: <010101887b2888f3-9a5c3835-b07f-45d1-82fb-fbb2c66778b8-000000@us-west-2.amazonses.com>
Date: Fri, 2 Jun 2023 08:10:34 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.02-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Jun 2023 08:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182219

--===============5763935680254315794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *44.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-43.1-44.3.patch
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
--===============5763935680254315794==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1800 entries from dependency cache.
Parsing recipes...done.
Parsing of 897 .bb files complete (896 cached, 1 parsed). 1800 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:73867e5d01e86cf3df6f90a06571690be69103b9"
workspace            = "master:09505f876856471aa46774237bd3f0888615b89f"

Initialising tasks...done.
Sstate summary: Wanted 219 Local 212 Mirrors 0 Missed 7 Current 733 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 2976 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_fetch)
NOTE: Running task 3232 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_write_config)
NOTE: recipe epiphany-44.3-r0: task do_write_config: Started
NOTE: recipe epiphany-44.3-r0: task do_fetch: Started
NOTE: recipe epiphany-44.3-r0: task do_fetch: Succeeded
NOTE: Running task 3337 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_unpack)
NOTE: Running task 3338 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.3-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_unpack: Started
NOTE: recipe epiphany-44.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.3-r0: task do_unpack: Succeeded
NOTE: Running task 3339 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_patch)
NOTE: recipe epiphany-44.3-r0: task do_patch: Started
NOTE: recipe epiphany-44.3-r0: task do_patch: Succeeded
NOTE: Running task 3340 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3341 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_populate_lic)
NOTE: recipe epiphany-44.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.3-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3342 of 3350 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_configure)
NOTE: recipe epiphany-44.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.37.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'libtool-native', 're2c-native', 'at-spi2-core-native', 'libxcomposite-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'libxi-native', 'pango-native', 'fontconfig-native', 'libxext-native', 'libx11-native', 'gettext-minimal-native', 'libxdamage-native', 'libxrandr-native', 'libjpeg-turbo-native', 'libxcursor-native', 'libxfixes-native', 'cairo-native', 'libpng-native', 'libxrender-native', 'gobject-introspection', 'libxml2', 'nghttp2', 'l
 ibpsl', 'glib-2.0', 'sqlite3', 'linux-libc-headers', 'zlib-native', 'util-linux-native', 'libpcre2-native', 'libffi-native', 'vala', 'texinfo-dummy-native', 'ncurses-native', 'sqlite3-native', 'openssl-native', 'gdbm-native', 'util-linux-libuuid-native', 'libedit-native', 'libnsl2-native', 'expat-native', 'bzip2-native', 'libtirpc-native', 'gmp', 'libgcrypt', 'systemd', 'shared-mime-info', 'p11-kit', 'zstd-native', 'libmpc-native', 'gmp-native', 'binutils-cross-i686', 'mpfr-native', 'gnu-config-native', 'flex-native', 'zstd', 'attr', 'xz', 'acl', 'zlib', 'opkg-utils', 'bzip2', 'attr-native', 'at-spi2-core', 'libxrender', 'gstreamer1.0', 'libsecret', 'harfbuzz', 'enchant2', 'libxcomposite', 'cairo', 'libjpeg-turbo', 'libxt', 'libwebp', 'mesa', 'wpebackend-fdo', 'libnotify', 'libxslt', 'libx11', 'gstreamer1.0-plugins-base', 'libxdamage', 'libtasn1', 'libwpe', 'wayland', 'libgcc', 'libpng', 'fontconfig', 'libxi', 'libxfixes', 'libxext', 'libxrandr', 'libxcursor', 'libxkbcommon', 'wayla
 nd-protocols', 'pango', 'libepoxy', 'python3-build-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-installer-native', 'gtk4', 'dbus-native', 'libxtst-native', 'libxml2-native', 'util-macros-native', 'xorgproto-native', 'shared-mime-info-native', 'harfbuzz-native', 'freetype-native', 'libxft-native', 'fribidi-native', 'xtrans-native', 'libxcb-native', 'cmake-native', 'libsm-native', 'pixman-native', 'python3', 'libffi', 'icu', 'util-linux', 'libpcre2', 'bash-completion', 'libcap-ng-native', 'perl-native', 'libcap', 'libgpg-error', 'update-rc.d', 'base-passwd', 'shadow', 'libpam', 'initscripts', 'kmod', 'libseccomp', 'base-files', 'shadow-sysroot', 'shadow-native', 'm4-native', 'dbus', 'libxtst', 'xorgproto', 'util-macros', 'freetype', 'aspell', 'libxcb', 'pixman', 'libsm', 'libxdmcp', 'libxshmfence', 'vulkan-loader', 'libxxf86vm', 'vulkan-headers', 'expat', 'xrandr', 'libdrm', 'xtrans', 'libogg', 'libvorbis', 'libxv', 'libtheora', 'alsa-lib', 'iso-codes', 'orc'
 , 'xkeyboard-config', 'libxft', 'fribidi', 'python3-packaging-native', 'python3-flit-core-native', 'python3-pyproject-hooks-native', 'tiff', 'libxinerama', 'gi-docgen', 'librsvg', 'gstreamer1.0-plugins-bad', 'graphene', 'itstool-native', 'icu-native', 'libxau-native', 'xcb-proto-native', 'libxdmcp-native', 'libpthread-stubs-native', 'libice-native', 'libnsl2', 'openssl', 'libtirpc', 'libedit', 'util-linux-libuuid', 'ncurses', 'libxcrypt', 'gdbm', 'libcap-ng', 'make-native', 'cracklib', 'libxau', 'libpthread-stubs', 'xcb-proto', 'libice', 'libpciaccess', 'unzip-native', 'libstd-rs', 'libsndfile1', 'libusb1', 'sbc', 'curl', 'bluez5', 'libgudev', 'flac', 'libidn2', 'readline', 'libical', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.1.0
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/epiphany-44.3
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/build
| Build type: cross build
| Project name: epiphany
| Project version: 44.3
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/recipe-sysroot (gcc 13.1.1 "i686-poky-linux-gcc (GCC) 13.1.1 20230520")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/recipe-sysroot ld.bfd 2.40.0.20230419
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.15.0
| Run-time dependency cairo found: YES 1.16.0
| Found CMake: NO
| Run-time dependency gcr-4 found: NO (tried pkgconfig)
| 
| ../epiphany-44.3/meson.build:89:10: ERROR: Dependency "gcr-4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.1873048:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.1873048, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.1873048, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.1873048, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.1873048, line 187
NOTE: recipe epiphany-44.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3342 tasks of which 3334 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.3-r0 do_configure: meson failed
ERROR: epiphany-44.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.1873048', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/log.do_configure.1873048
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_configure) failed with exit code '1'

--===============5763935680254315794==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.3.patch"

RnJvbSAyMTY5MTZjYzg0NDM1YTA2NTZhYjM1NTdkZGFlODIzYjQzYzc3NjBkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBKdW4gMjAyMyAyMjoxODo1OSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQzLjEgLT4gNDQuMwoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQzLjEuYmIgPT4gZXBpcGhhbnlfNDQuMy5iYn0gICAgICAgICAgICAgfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkve2VwaXBoYW55XzQzLjEuYmIgPT4gZXBpcGhhbnlfNDQuMy5iYn0g
KDkzJSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlf
NDMuMS5iYiBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80NC4zLmJiCnNp
bWlsYXJpdHkgaW5kZXggOTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFu
eS9lcGlwaGFueV80My4xLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkv
ZXBpcGhhbnlfNDQuMy5iYgppbmRleCBlYTIyNzIzYTk3Li40NGNmNmVlMzA4IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDMuMS5iYgorKysgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuMy5iYgpAQCAtMzEsNyArMzEsNyBA
QCBTUkNfVVJJID0gIiR7R05PTUVfTUlSUk9SfS8ke0dOT01FQk59LyR7QG9lLnV0aWxzLnRyaW1f
dmVyc2lvbigiJHtQVn0iLCAxKX0vJHtHTgogICAgICAgICAgICBmaWxlOi8vbWlncmF0b3IucGF0
Y2ggXAogICAgICAgICAgICBmaWxlOi8vZGlzdHJpYnV0b3IucGF0Y2ggXAogICAgICAgICAgICAi
Ci1TUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJlODZlYWQyN2NiOTk4MjgxNTE1MDY2NGRl
M2JmMjBmYWYzNzVmNzdiODA2NWIwMmIzMTE4MGM2NWI2YmJlYmI0IgorU1JDX1VSSVthcmNoaXZl
LnNoYTI1NnN1bV0gPSAiZjVlOTA0YjJlNTEwMjEwNGQ4YjdmZTNhNjE1MDM0YWRkNzhkZTAzMTE2
NDkyYjU0Y2JkZWJjYTI4MGJkZDg5OSIKIAogIyBEZXZlbG9wZXIgbW9kZSBlbmFibGVzIGRlYnVn
Z2luZwogUEFDS0FHRUNPTkZJR1tkZXZlbG9wZXItbW9kZV0gPSAiLURkZXZlbG9wZXJfbW9kZT10
cnVlLC1EZGV2ZWxvcGVyX21vZGU9ZmFsc2UiCi0tIAoyLjM5LjIKCg==

--===============5763935680254315794==--

