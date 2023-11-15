Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA44C54FBA
	for <webhook@archiver.kernel.org>; Wed, 15 Nov 2023 14:37:14 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.14622.1700059030255471634
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Nov 2023 06:37:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=NtTXn2R/;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=gitNd05S;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101018bd36a27a2-58c6518a-57f0-4eb7-a232-151fed915e75-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=t3eq47piZ+cnxfLJ9zt2/01vDv4ULtaishkqAK3shKo=;
	b=NtTXn2R/u9T9J7uxmWpN5Hyb167j3MEa9Sa+0hOUaHBWc797E8SvrQPgD3oyGLSe
	KMhLXxh0gw3K5coOmg+JJBLHQO8PkFSEacpGHhK1SyEs2VnLfZDRM8VkwP/G04zFfXO
	QeFSNPL18vpfNZE6FGX66GXi3pXFiXlskeMl6jGg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1700059032;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=t3eq47piZ+cnxfLJ9zt2/01vDv4ULtaishkqAK3shKo=;
	b=gitNd05SyxVwZsLksdvvTIJbMjmQNik9cKfLwNvLOx0o1u1B704o/TCz7TQiV3ts
	cGW48xyH3US9WvHUvonUBfTJu7k2Kjhc5C4/sJroURcUOOlqKiJEIzm0RGX6zKv3ZqA
	rb6TuFUkRqLu+xTRNWsTALdmyHN1RiE5ZKFOJ+WI=
Content-Type: multipart/mixed; boundary="===============8099396441286524720=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.1 FAILED
Message-ID: <0101018bd36a27a2-58c6518a-57f0-4eb7-a232-151fed915e75-000000@us-west-2.amazonses.com>
Date: Wed, 15 Nov 2023 14:37:11 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.11.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Nov 2023 14:37:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190679

--===============8099396441286524720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *45.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-44.6-45.1.patch
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
From 49b9b6d613e81ca6e41fe382a20ec09e2ec7cf29 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 15 Nov 2023 10:21:10 +0000
Subject: [PATCH] epiphany: upgrade 44.6 -> 45.1

---
 .../epiphany/{epiphany_44.6.bb => epiphany_45.1.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_44.6.bb => epiphany_45.1.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_44.6.bb b/meta/recipes-gnome/epiphany/epiphany_45.1.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_44.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.1.bb
index 577eb43a80..c8631e05e9 100644
--- a/meta/recipes-gnome/epiphany/epiphany_44.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.1.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "5335dd573581db61e126d854dc16ae519657a5b8790789a47d25e43e17cd3a43"
+SRC_URI[archive.sha256sum] = "7c994ef34ecd60e915de331ee123c08938f9623cefada6d50b99e3c9c5ad8135"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.39.2


--===============8099396441286524720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 911 .bb files complete (910 cached, 1 parsed). 1843 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.3+snapshot-6778f23812e3d8b9d78e9bdd5039dc16eafad9da"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:6778f23812e3d8b9d78e9bdd5039dc16eafad9da"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
done.
Sstate summary: Wanted 534 Local 521 Mirrors 0 Missed 13 Current 1096 (97% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3843 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_recipe_qa)
NOTE: Running task 4102 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_write_config)
NOTE: recipe epiphany-45.1-r0: task do_recipe_qa: Started
NOTE: recipe epiphany-45.1-r0: task do_write_config: Started
NOTE: recipe epiphany-45.1-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-45.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4396 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_fetch)
NOTE: recipe epiphany-45.1-r0: task do_fetch: Started
NOTE: recipe epiphany-45.1-r0: task do_fetch: Succeeded
NOTE: Running task 4397 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_unpack)
NOTE: Running task 4398 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-45.1-r0: task do_unpack: Started
NOTE: recipe epiphany-45.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-45.1-r0: task do_unpack: Succeeded
NOTE: Running task 4399 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_patch)
NOTE: Running task 4400 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-45.1-r0: task do_patch: Started
NOTE: recipe epiphany-45.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-45.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-45.1-r0: task do_patch: Succeeded
NOTE: Running task 4401 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 4402 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_populate_lic)
NOTE: recipe epiphany-45.1-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-45.1-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-45.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 4403 of 4415 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_configure)
NOTE: recipe epiphany-45.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe epiphany-45.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_8.1.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.1
 0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/rec
 ipes-sato/webkit/webkitgtk_2.40.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.4.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.78.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.11.1
 .bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-x86_64', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'gettext-minimal-native', 'attr-native', 'texinfo-dummy-native', 'libtool-native', 'libpsl', 'nghttp2', 'libxml2', 'gobject-introspection', 'sqlite3', 'glib-2.0', 'binutils-cross-x86_64', 'libmpc-native', 'mpfr-native', 'zlib-native', 'gmp-native', 'gnu-config-native', 'linux-libc-headers', 'flex-native', 'zstd-native', 're2c-native', 'libffi-native', 'libpcre2-native', 'util-linux-native', 'gtk4', 'appstream', 'vala', 'libgcc', 'python3
 -wheel-native', 'python3-setuptools-native', 'python3-build-native', 'python3-installer-native', 'libwebp', 'libxcomposite', 'libnotify', 'enchant2', 'at-spi2-core', 'gstreamer1.0', 'libxslt', 'gstreamer1.0-plugins-base', 'libwpe', 'libtasn1', 'libjpeg-turbo', 'libxdamage', 'wpebackend-fdo', 'wayland', 'systemd', 'mesa', 'libsecret', 'cairo', 'harfbuzz', 'libx11', 'libxrender', 'libxt', 'libnsl2-native', 'ncurses-native', 'expat-native', 'sqlite3-native', 'gdbm-native', 'libedit-native', 'libtirpc-native', 'openssl-native', 'util-linux-libuuid-native', 'bzip2-native', 'pango', 'libxi', 'libepoxy', 'libxfixes', 'libxext', 'libxcursor', 'libpng', 'fontconfig', 'wayland-protocols', 'libxkbcommon', 'opkg-utils', 'libxrandr', 'libpng-native', 'gdk-pixbuf-native', 'libxrender-native', 'pango-native', 'cairo-native', 'libx11-native', 'fontconfig-native', 'libxcomposite-native', 'gobject-introspection-native', 'libxrandr-native', 'libxfixes-native', 'at-spi2-core-native', 'libxi-native', 'l
 ibxext-native', 'libxcursor-native', 'libxdamage-native', 'libjpeg-turbo-native', 'acl', 'bzip2', 'xz', 'zstd', 'attr', 'zlib', 'shared-mime-info', 'libgcrypt', 'p11-kit', 'gmp', 'icu', 'python3', 'libffi', 'util-linux', 'bash-completion', 'libpcre2', 'm4-native', 'libcap-ng-native', 'vulkan-headers', 'tiff', 'fribidi', 'gstreamer1.0-plugins-bad', 'librsvg', 'graphene', 'gi-docgen', 'libxinerama', 'vulkan-loader', 'curl', 'libxmlb', 'libyaml', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'util-macros', 'xorgproto', 'aspell', 'dbus', 'libxtst', 'libvorbis', 'libglu', 'libxv', 'alsa-lib', 'libogg', 'orc', 'libsm', 'libdrm', 'libtheora', 'iso-codes', 'expat', 'shadow', 'initscripts', 'base-files', 'kmod', 'libseccomp', 'update-rc.d', 'shadow-sysroot', 'base-passwd', 'shadow-native', 'libcap', 'libpam', 'libxshmfence', 'libxxf86vm', 'xrandr', 'libxcb', 'pixman', 'freetype', 'xtrans', 'libxdmcp', 'cmake-native', 'perl-native', 'libxft', 'xkeyb
 oard-config', 'shared-mime-info-native', 'xorgproto-native', 'util-macros-native', 'fribidi-native', 'freetype-native', 'harfbuzz-native', 'libxft-native', 'libsm-native', 'libxcb-native', 'pixman-native', 'xtrans-native', 'dbus-native', 'libxml2-native', 'libxtst-native', 'libgpg-error', 'gdbm', 'libtirpc', 'libedit', 'libxcrypt', 'libnsl2', 'ncurses', 'util-linux-libuuid', 'openssl', 'libcap-ng', 'libsndfile1', 'bluez5', 'sbc', 'libusb1', 'libgudev', 'libstd-rs', 'libidn2', 'unzip-native', 'libice', 'libpthread-stubs', 'libpciaccess', 'cracklib', 'xcb-proto', 'libxau', 'make-native', 'itstool-native', 'icu-native', 'libice-native', 'libpthread-stubs-native', 'xcb-proto-native', 'libxau-native', 'libxdmcp-native', 'flac', 'readline', 'libical', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/epiphany-45.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/build
| Build type: cross build
| Project name: epiphany
| Project version: 45.1
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/recipe-sysroot (gcc 13.2.0 "x86_64-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.15.0
| Run-time dependency cairo found: YES 1.16.0
| Run-time dependency gcr-4 found: YES 4.1.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.10
| Run-time dependency gio-2.0 found: YES 2.78.1
| Run-time dependency gio-unix-2.0 found: YES 2.78.1
| Run-time dependency glib-2.0 found: YES 2.78.1
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 44.0
| Run-time dependency gstreamer-1.0 found: YES 1.22.6
| Run-time dependency gtk4 found: YES 4.12.3
| Run-time dependency gtk4-unix-print found: YES 4.12.3
| Run-time dependency hogweed found: YES 3.9.1
| Dependency iso-codes found: YES 4.15.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.6.6
| Run-time dependency libarchive found: YES 3.7.2
| Run-time dependency libadwaita-1 found: YES 1.4.0
| Run-time dependency libsecret-1 found: YES 0.21.1
| Run-time dependency libsoup-3.0 found: YES 3.4.4
| Run-time dependency libxml-2.0 found: YES 2.11.5
| Run-time dependency nettle found: YES 3.9.1
| Run-time dependency libportal-gtk4 found: YES 0.7.1
| Run-time dependency sqlite3 found: YES 3.43.2
| Dependency webkitgtk-6.0 found: NO found 2.40.5 but need: '>= 2.41.1'
| Found CMake: NO
| Run-time dependency webkitgtk-6.0 found: NO
| 
| ../epiphany-45.1/meson.build:112:16: ERROR: Dependency lookup for webkitgtk-6.0 with method 'pkgconfig' failed: Invalid version, need 'webkitgtk-6.0' ['>= 2.41.1'] found '2.40.5'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/run.do_configure.3546457:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/run.do_configure.3546457, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/run.do_configure.3546457, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/run.do_configure.3546457, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/run.do_configure.3546457, line 187
NOTE: recipe epiphany-45.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4403 tasks of which 4393 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115102047.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20231115102047.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-45.1-r0 do_configure: meson failed
ERROR: epiphany-45.1-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/run.do_configure.3546457', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/45.1/temp/log.do_configure.3546457
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_45.1.bb:do_configure) failed with exit code '1'

--===============8099396441286524720==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-44.6-45.1.patch"

RnJvbSA0OWI5YjZkNjEzZTgxY2E2ZTQxZmUzODJhMjBlYzA5ZTJlYzdjZjI5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTUgTm92IDIwMjMgMTA6MjE6MTAgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0NC42IC0+IDQ1LjEKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80NC42LmJiID0+IGVwaXBoYW55XzQ1LjEuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80NC42LmJiID0+IGVwaXBoYW55XzQ1LjEuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQ0LjYuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMS5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDQuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQ1LjEuYmIKaW5kZXggNTc3ZWI0M2E4MC4uYzg2MzFlMDVlOSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ0LjYuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ1LjEuYmIKQEAgLTMxLDcgKzMxLDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTMzNWRkNTczNTgxZGI2MWUxMjZkODU0
ZGMxNmFlNTE5NjU3YTViODc5MDc4OWE0N2QyNWU0M2UxN2NkM2E0MyIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjdjOTk0ZWYzNGVjZDYwZTkxNWRlMzMxZWUxMjNjMDg5MzhmOTYyM2Nl
ZmFkYTZkNTBiOTllM2M5YzVhZDgxMzUiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1
Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9
dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgotLSAKMi4zOS4yCgo=

--===============8099396441286524720==--

