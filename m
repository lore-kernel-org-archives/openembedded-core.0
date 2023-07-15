Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61140C25B79
	for <webhook@archiver.kernel.org>; Sat, 15 Jul 2023 21:27:39 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.5935.1689456453502472703
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Jul 2023 14:27:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=HMW0W7n9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101895b73ae20-6137d734-7400-4450-922c-2c1f34ed8b34-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=BvMGkxRYbAo+0qn42arEUyh0ELreyxiopUWmGpo1nu4=;
	b=HMW0W7n9pb4byn9YieH2XAvqARNsknuIBhQyye7YQ29PSvdcpZI78zTkFaBeujiB
	d4T/X6t9WyrTeYK7oy98fBK4ISvHmriikS0C26ymss1axiSqkT0f3wKAXFzUE1a/52i
	9r7dY0UGffjZKmsNlyQLNQM+S7xlAWlH78s5Vons=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1689456455;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=BvMGkxRYbAo+0qn42arEUyh0ELreyxiopUWmGpo1nu4=;
	b=cpoWdH00wSTniPUWV8/0n1TLFDGJypJHP0TFa7jZxCAjhil4GiMZi/RXz8f/iIdM
	jh0TWAZ6iYrL0YHtm5iOjZYiQze+GihGjfi/xitISe0Or1OXeg6HYBQAdK7waoZhYet
	NI+j4gwk+E+2y0AhZiZ7Llxetde5FFcFx5vbuHEs=
Content-Type: multipart/mixed; boundary="===============2907591674242512048=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 44.5 FAILED
Message-ID: <010101895b73ae20-6137d734-7400-4450-922c-2c1f34ed8b34-000000@us-west-2.amazonses.com>
Date: Sat, 15 Jul 2023 21:27:35 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.07.15-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Jul 2023 21:27:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184366

--===============2907591674242512048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *44.5* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-43.1-44.5.patch
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
From 01460b155a7a6e98c1f34a61b06a700e2113ea7a Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Jul 2023 16:08:21 +0000
Subject: [PATCH] epiphany: upgrade 43.1 -> 44.5

---
 .../epiphany/{epiphany_43.1.bb => epiphany_44.5.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_43.1.bb => epiphany_44.5.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_43.1.bb b/meta/recipes-gnome/epiphany/epiphany_44.5.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_43.1.bb
rename to meta/recipes-gnome/epiphany/epiphany_44.5.bb
index c97ede459d..59f8344cd0 100644
--- a/meta/recipes-gnome/epiphany/epiphany_43.1.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_44.5.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "e86ead27cb9982815150664de3bf20faf375f77b8065b02b31180c65b6bbebb4"
+SRC_URI[archive.sha256sum] = "3c475e04ed2a0f410cb44b96937563697079193ac9b7a50c91485fb9b08315ab"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.39.2


--===============2907591674242512048==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

WARNING: Host distribution "almalinux-8.8" has not been validated with this version of the build system; you may possibly experience unexpected failures. It is recommended that you use a tested distribution.
Loading cache...done.
Loaded 1803 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1803 targets, 37 skipped, 0 masked, 0 errors.
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
meta-yocto-bsp       = "tmp-auh-upgrades:9bc86d2f467b5a035dce4575c5a7f7db4508cfa8"
workspace            = "master:e6d4b610fc24ae009bf6d0710fc429a61a38aa34"

Initialising tasks...done.
Sstate summary: Wanted 290 Local 281 Mirrors 0 Missed 9 Current 967 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3413 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_fetch)
NOTE: Running task 3683 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_write_config)
NOTE: recipe epiphany-44.5-r0: task do_fetch: Started
NOTE: recipe epiphany-44.5-r0: task do_fetch: Succeeded
NOTE: Running task 3857 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_unpack)
NOTE: Running task 3858 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-44.5-r0: task do_write_config: Started
NOTE: recipe epiphany-44.5-r0: task do_unpack: Started
NOTE: recipe epiphany-44.5-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-44.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-44.5-r0: task do_unpack: Succeeded
NOTE: Running task 3948 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_patch)
NOTE: Running task 3949 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-44.5-r0: task do_patch: Started
NOTE: recipe epiphany-44.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-44.5-r0: task do_patch: Succeeded
NOTE: Running task 3950 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3951 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_populate_lic)
NOTE: recipe epiphany-44.5-r0: task do_populate_lic: Started
NOTE: recipe epiphany-44.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-44.5-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-44.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-44.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-44.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3952 of 3962 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_configure)
NOTE: recipe epiphany-44.5-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.6.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr3_3.41.1.bb:do_populate_sysroot
 ', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.6.bb:do_pop
 ulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.40.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.21.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/r
 ecipes-devtools/meson/meson_1.1.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr3', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'attr-native', 'libtool-native', 'libx11', 'gobject-introspection', 'libxrandr', 'libjpeg-turbo', 'libxcursor', 'libxdamage', 'wayland-protocols', 'mesa', 'at-spi2-core', 'libxrender', 'libpng', 'pango', 'glib-2.0', 'fontconfig', 'libepoxy', 'libxcomposite', 'libxi', 'opkg-utils', 'wayland', 'cairo', 'libxfixes', 'libxkbcommon', 'libxext', 'xz', 'zstd', 'acl', 'zlib', 'attr', 'bzip2', 'libpsl', 'nghttp2', 'sqlite3', 'libxml2', 'vala', 'gtk4', 'zlib-nat
 ive', 'binutils-cross-i686', 'linux-libc-headers', 'gmp-native', 'libmpc-native', 'mpfr-native', 'zstd-native', 'texinfo-dummy-native', 'flex-native', 'gnu-config-native', 'harfbuzz', 'libwebp', 'libxslt', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libsecret', 'libtasn1', 'enchant2', 'libxt', 'wpebackend-fdo', 'libwpe', 'systemd', 'libnotify', 'gettext-minimal-native', 'libgcc', 'libnsl2-native', 'libedit-native', 'libtirpc-native', 'libffi-native', 'util-linux-libuuid-native', 'ncurses-native', 'bzip2-native', 'sqlite3-native', 'gdbm-native', 'expat-native', 'openssl-native', 'fontconfig-native', 'libxrandr-native', 'pango-native', 'libx11-native', 'libxext-native', 'gdk-pixbuf-native', 'libjpeg-turbo-native', 'libxrender-native', 'libxcomposite-native', 'cairo-native', 'libxi-native', 'at-spi2-core-native', 'libxdamage-native', 'libxcursor-native', 'libpng-native', 'gobject-introspection-native', 'libxfixes-native', 'libpcre2-native', 'util-linux-native', 'python3-installer-nat
 ive', 'python3-build-native', 'python3-setuptools-native', 'python3-wheel-native', 'gmp', 'shared-mime-info', 'libgcrypt', 'p11-kit', 're2c-native', 'xtrans', 'util-macros', 'libxcb', 'xorgproto', 'libffi', 'python3', 'expat', 'xrandr', 'libdrm', 'libxxf86vm', 'libxshmfence', 'vulkan-headers', 'vulkan-loader', 'dbus', 'libxtst', 'libxft', 'freetype', 'fribidi', 'libpcre2', 'bash-completion', 'util-linux', 'libsm', 'pixman', 'xkeyboard-config', 'icu', 'libxinerama', 'tiff', 'librsvg', 'gstreamer1.0-plugins-bad', 'graphene', 'gi-docgen', 'm4-native', 'libglu', 'libvorbis', 'libxv', 'libogg', 'libtheora', 'orc', 'iso-codes', 'alsa-lib', 'aspell', 'libxdmcp', 'initscripts', 'shadow-native', 'kmod', 'update-rc.d', 'libcap', 'base-passwd', 'shadow-sysroot', 'shadow', 'base-files', 'libseccomp', 'libpam', 'cmake-native', 'perl-native', 'freetype-native', 'util-macros-native', 'xorgproto-native', 'libxft-native', 'fribidi-native', 'harfbuzz-native', 'xtrans-native', 'libxcb-native', 'shared
 -mime-info-native', 'pixman-native', 'libsm-native', 'libxtst-native', 'libxml2-native', 'dbus-native', 'libcap-ng-native', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'libgpg-error', 'xcb-proto', 'libpthread-stubs', 'libxau', 'util-linux-libuuid', 'openssl', 'ncurses', 'libnsl2', 'libtirpc', 'libxcrypt', 'libedit', 'gdbm', 'libpciaccess', 'libcap-ng', 'libice', 'libstd-rs', 'libsndfile1', 'libusb1', 'curl', 'sbc', 'libgudev', 'bluez5', 'cracklib', 'make-native', 'icu-native', 'xcb-proto-native', 'libxdmcp-native', 'libpthread-stubs-native', 'libxau-native', 'itstool-native', 'libice-native', 'unzip-native', 'flac', 'libidn2', 'libical', 'readline', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.1.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/epiphany-44.5
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/build
| Build type: cross build
| Project name: epiphany
| Project version: 44.5
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/recipe-sysroot (gcc 13.1.1 "i686-poky-linux-gcc (GCC) 13.1.1 20230520")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/recipe-sysroot ld.bfd 2.40.0.20230419
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.15.0
| Run-time dependency cairo found: YES 1.16.0
| Found CMake: NO
| Run-time dependency gcr-4 found: NO (tried pkgconfig)
| 
| ../epiphany-44.5/meson.build:89:10: ERROR: Dependency "gcr-4" not found, tried pkgconfig
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/run.do_configure.551770:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/run.do_configure.551770, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/run.do_configure.551770, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/run.do_configure.551770, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/run.do_configure.551770, line 187
NOTE: recipe epiphany-44.5-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3952 tasks of which 3943 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_configure
Summary: There was 1 WARNING message.
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-44.5-r0 do_configure: meson failed
ERROR: epiphany-44.5-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/run.do_configure.551770', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/44.5-r0/temp/log.do_configure.551770
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_44.5.bb:do_configure) failed with exit code '1'

--===============2907591674242512048==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-43.1-44.5.patch"

RnJvbSAwMTQ2MGIxNTVhN2E2ZTk4YzFmMzRhNjFiMDZhNzAwZTIxMTNlYTdhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgSnVsIDIwMjMgMTY6MDg6MjEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0My4xIC0+IDQ0LjUKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjUuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80My4xLmJiID0+IGVwaXBoYW55XzQ0LjUuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQzLjEuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDQuNS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDMuMS5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQ0LjUuYmIKaW5kZXggYzk3ZWRlNDU5ZC4uNTlmODM0NGNkMCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQzLjEuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ0LjUuYmIKQEAgLTMxLDcgKzMxLDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiZTg2ZWFkMjdjYjk5ODI4MTUxNTA2NjRk
ZTNiZjIwZmFmMzc1Zjc3YjgwNjViMDJiMzExODBjNjViNmJiZWJiNCIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjNjNDc1ZTA0ZWQyYTBmNDEwY2I0NGI5NjkzNzU2MzY5NzA3OTE5M2Fj
OWI3YTUwYzkxNDg1ZmI5YjA4MzE1YWIiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1
Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9
dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgotLSAKMi4zOS4yCgo=

--===============2907591674242512048==--

