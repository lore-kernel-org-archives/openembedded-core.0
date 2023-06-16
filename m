Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 930D7C18E72
	for <webhook@archiver.kernel.org>; Fri, 16 Jun 2023 03:51:28 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.web10.815.1686887482252421980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 20:51:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=hb7oG+z9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 01010188c254496b-123cceb3-393e-4724-a494-791d05647d0b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=hyhOHz34LCGEbIc58t1/EpOWjhLFuI061mdoJVvn/Ss=;
	b=hb7oG+z94vAXwG8PbcaMHyruYm0rCQgY2Jcq5YFlciFQ3eRibjKLRd500j8kaJ7N
	uf9gemgvh2lj2P0d1LVPMbAfxxBuTdgaQyc5/1HT4CjE66G3TnB2xg7Gk7Z69IUa+C2
	1oEnO0KaCciCX1QRZ7a+udFnUPz6dFrUsEIGb9Qk=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1686887484;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=hyhOHz34LCGEbIc58t1/EpOWjhLFuI061mdoJVvn/Ss=;
	b=TgoUU30LllUi+cfu6nrJEYs8QI7tKRpsdYxIhh67OzFkQZoX0EfixnpxwQnEzaBp
	GCsBkbgw625z1jWKjTIeyMQ7ABsW5PEDytZpUheccm8ZkCAGhYvJyh3w2qwiWTlQseX
	VSmdSnk7igUBXFCxfz9Lu+XXFxWh1t+jUDWH4I5s=
Content-Type: multipart/mixed; boundary="===============2499645039275610631=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.3 FAILED
Message-ID: <01010188c254496b-123cceb3-393e-4724-a494-791d05647d0b-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jun 2023 03:51:23 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.06.16-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jun 2023 03:51:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182947

--===============2499645039275610631==
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

-- >8 --
From 2174de4d1e31745dedecd6f5761f3cea044f3139 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jun 2023 18:38:54 +0000
Subject: [PATCH] epiphany: upgrade 43.1 -> 44.3

---
 .../epiphany/{epiphany_43.1.bb => epiphany_44.3.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_43.1.bb => epiphany_44.3.bb} (93%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-gnome/epiphany/epiphany_44.3.bb
similarity index 93%
rename from meta/recipes-gnome/epiphany/epiphany_43.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_44.3.bb
index ea22723a97..44cf6ee308 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.3.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "e86ead27cb9982815150664de3bf20faf375f77b8065b02b31180c65b6bbebb4"
+SRC_URI[archive.sha256sum] = "f5e904b2e5102104d8b7fe3a615034add78de03116492b54cbdebca280bdd899"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.39.2


--===============2499645039275610631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1801 entries from dependency cache.
Parsing recipes...done.
Parsing of 898 .bb files complete (897 cached, 1 parsed). 1801 targets, 36 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:a17121a8aece78353de0edd26a3ff65fdb870239"
workspace            = "master:d9cf8973d01b74aa2680dba5ac46c5cea3d1a6d0"

Initialising tasks...done.
Sstate summary: Wanted 273 Local 264 Mirrors 0 Missed 9 Current 979 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3402 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_fetch)
NOTE: Running task 3672 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_write_config)
NOTE: recipe epiphany-44.3-r0: task do_fetch: Started
NOTE: recipe epiphany-44.3-r0: task do_fetch: Succeeded
NOTE: Running task 3849 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_unpack)
NOTE: Running task 3850 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.3-r0: task do_write_config: Started
NOTE: recipe epiphany-44.3-r0: task do_unpack: Started
NOTE: recipe epiphany-44.3-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.3-r0: task do_unpack: Succeeded
NOTE: Running task 3935 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_patch)
NOTE: Running task 3936 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-44.3-r0: task do_patch: Started
NOTE: recipe epiphany-44.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-44.3-r0: task do_patch: Succeeded
NOTE: Running task 3937 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3938 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_populate_lic)
NOTE: recipe epiphany-44.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.3-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.3-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-44.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3939 of 3949 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_configure)
NOTE: recipe epiphany-44.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.38.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.8.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.1.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'linux-libc-headers', 'libgcc', 'gobject-introspection', 'vala', 'libxi-native', 'libjpeg-turbo-native', 'gdk-pixbuf-native', 'libxcursor-native', 'fontconfig-native', 'libxrender-native', 'libxdamage-native', 'pango-native', 'gobject-introspection-native', 'libpng-native', 'libxext-native', 'cairo-native', 'at-spi2-core-native', 'gettext-minimal-native', 'libx11-native', 'libxrandr-native', 'libxfixes-native', 'libxcomposite-native', 'pango', 'at-spi2
 -core', 'wayland', 'fontconfig', 'libxi', 'wayland-protocols', 'glib-2.0', 'libxkbcommon', 'libx11', 'libxdamage', 'libpng', 'libjpeg-turbo', 'opkg-utils', 'libxcursor', 'libxext', 'libxfixes', 'mesa', 'libxrandr', 'libxcomposite', 'libepoxy', 'libxrender', 'cairo', 'attr-native', 'texinfo-dummy-native', 'libtool-native', 'ncurses-native', 'libedit-native', 'openssl-native', 'sqlite3-native', 'util-linux-libuuid-native', 'expat-native', 'libnsl2-native', 'libtirpc-native', 'libffi-native', 'bzip2-native', 'zlib-native', 'gdbm-native', 're2c-native', 'bzip2', 'zstd', 'acl', 'attr', 'xz', 'zlib', 'python3-installer-native', 'python3-build-native', 'python3-wheel-native', 'python3-setuptools-native', 'libpsl', 'sqlite3', 'libxml2', 'nghttp2', 'gmp', 'libxt', 'enchant2', 'libsecret', 'wpebackend-fdo', 'systemd', 'libnotify', 'harfbuzz', 'gstreamer1.0', 'libxslt', 'libwpe', 'libtasn1', 'libwebp', 'gstreamer1.0-plugins-base', 'binutils-cross-i686', 'zstd-native', 'flex-native', 'libmpc-na
 tive', 'gmp-native', 'mpfr-native', 'gnu-config-native', 'gtk4', 'libgcrypt', 'shared-mime-info', 'p11-kit', 'util-linux-native', 'libpcre2-native', 'libffi', 'python3', 'xorgproto-native', 'util-macros-native', 'cmake-native', 'shared-mime-info-native', 'freetype-native', 'harfbuzz-native', 'fribidi-native', 'libxft-native', 'libsm-native', 'libxcb-native', 'pixman-native', 'dbus-native', 'libxtst-native', 'libxml2-native', 'xtrans-native', 'libxft', 'fribidi', 'freetype', 'libxtst', 'dbus', 'expat', 'util-linux', 'util-macros', 'xorgproto', 'bash-completion', 'libpcre2', 'libxcb', 'xkeyboard-config', 'xtrans', 'libdrm', 'vulkan-headers', 'xrandr', 'libxshmfence', 'vulkan-loader', 'libxxf86vm', 'pixman', 'libsm', 'perl-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'icu', 'libxdmcp', 'aspell', 'base-files', 'shadow-native', 'libcap', 'initscripts', 'update-rc.d', 'kmod', 'shadow', 'shadow-sysroot', 'libseccomp', 'base-passwd', 'li
 bpam', 'alsa-lib', 'libvorbis', 'iso-codes', 'libtheora', 'orc', 'libogg', 'libxv', 'm4-native', 'tiff', 'gi-docgen', 'libxinerama', 'librsvg', 'gstreamer1.0-plugins-bad', 'graphene', 'libgpg-error', 'libcap-ng-native', 'libedit', 'libtirpc', 'ncurses', 'libxcrypt', 'gdbm', 'openssl', 'libnsl2', 'util-linux-libuuid', 'itstool-native', 'icu-native', 'libice-native', 'libxau-native', 'xcb-proto-native', 'libpthread-stubs-native', 'libxdmcp-native', 'libcap-ng', 'xcb-proto', 'libpthread-stubs', 'libxau', 'libpciaccess', 'libice', 'make-native', 'unzip-native', 'cracklib', 'libstd-rs', 'curl', 'sbc', 'libgudev', 'bluez5', 'libsndfile1', 'libusb1', 'libidn2', 'libical', 'readline', 'flac', 'libunistring']
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
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.4016279:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.4016279, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.4016279, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.4016279, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.4016279, line 187
NOTE: recipe epiphany-44.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3939 tasks of which 3930 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.3-r0 do_configure: meson failed
ERROR: epiphany-44.3-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/run.do_configure.4016279', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.3-r0/temp/log.do_configure.4016279
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.3.bb:do_configure) failed with exit code '1'

--===============2499645039275610631==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.3.patch"

RnJvbSAyMTc0ZGU0ZDFlMzE3NDVkZWRlY2Q2ZjU3NjFmM2NlYTA0NGYzMTM5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSnVuIDIwMjMgMTg6Mzg6NTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0My4xIC0+IDQ0LjMKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjMuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjMuYmJ9
ICg5MyUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQzLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuMy5iYgpz
aW1pbGFyaXR5IGluZGV4IDkzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQ0LjMuYmIKaW5kZXggZWEyMjcyM2E5Ny4uNDRjZjZlZTMwOCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQzLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ0LjMuYmIKQEAgLTMxLDcgKzMxLDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTg2ZWFkMjdjYjk5ODI4MTUxNTA2NjRk
ZTNiZjIwZmFmMzc1Zjc3YjgwNjViMDJiMzExODBjNjViNmJiZWJiNCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gImY1ZTkwNGIyZTUxMDIxMDRkOGI3ZmUzYTYxNTAzNGFkZDc4ZGUwMzEx
NjQ5MmI1NGNiZGViY2EyODBiZGQ4OTkiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1
Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9
dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgotLSAKMi4zOS4yCgo=

--===============2499645039275610631==--

