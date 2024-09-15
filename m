Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21D65C36017
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:21 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.web11.115384.1726410840113020315
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=f2ouYC6S;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=admC9zZC;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 01010191f61adbaa-24386344-7817-4ea2-8d54-008a5ad8443e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=YEtodYUCZO+wp2pe59WGWfzVkcvAhsADQWSyP8KzI58=;
	b=f2ouYC6Sc4KLVTjvgThhwWRjkbdq1xB1QQ5+RiaaG4b906snxRaH5O3FYqJ6Cf2I
	3+M1Rg9UbhnkmC8JXH51aCtsqC5ux2f5bCGroGXgsximTKZKPM8yePRGGAwG/oalH31
	GyrP8XPbm35Yy+yAVncvoS9Gge/dSuSobHk/HrZA=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=YEtodYUCZO+wp2pe59WGWfzVkcvAhsADQWSyP8KzI58=;
	b=admC9zZCwSWIM9LXzhmYhJ5l+qvhZN3O4KKQ4/cG79NeXsP7308FfERteEI+2wOH
	94J9jSWXH9zZwuopdE18Ickln6qk1ChmwZB5ZUIoahmo19q9stYizOcZt3wezpXk0Qk
	peC6KvRJhjVdJu/7vhg+avl6yRL0iYWQWJQdp6io=
Content-Type: multipart/mixed; boundary="===============0000181186213941577=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.16.1 FAILED
Message-ID: <01010191f61adbaa-24386344-7817-4ea2-8d54-008a5ad8443e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204541

--===============0000181186213941577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.16.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.14.5-4.16.1.patch
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
From 3662542587a1a67dc2c26361d9c36c79a69874e0 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 11:07:09 +0000
Subject: [PATCH] gtk4: upgrade 4.14.5 -> 4.16.1

---
 meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb => gtk4_4.16.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.14.5.bb => gtk4_4.16.1.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb b/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
index 0b3d33f8eb..cb52b59245 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.14.5.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb
@@ -38,7 +38,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "5547f2b9f006b133993e070b87c17804e051efda3913feaca1108fa2be41e24d"
+SRC_URI[sha256sum] = "926a1eabd481f9bfa25538f95016fdfcfaf963b2f90b40ae69e90def5499215c"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.44.0


--===============0000181186213941577==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1868 entries from dependency cache.
Parsing recipes...done.
Parsing of 916 .bb files complete (915 cached, 1 parsed). 1867 targets, 40 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.0+snapshot-1989fff5f81c7873ed9b490cd2dcb3c4b0ca2cc8"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:1989fff5f81c7873ed9b490cd2dcb3c4b0ca2cc8"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 555 Local 542 Mirrors 0 Missed 13 Current 911 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1242 of 1466 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1465 of 1466 (virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_create_spdx_setscene)
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gobject-introspection-native-1.80.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3309 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_recipe_qa)
NOTE: recipe gtk4-4.16.1-r0: task do_recipe_qa: Started
NOTE: Running task 3670 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_write_config)
NOTE: recipe gtk4-4.16.1-r0: task do_write_config: Started
NOTE: recipe gtk4-4.16.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3989 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_fetch)
NOTE: recipe gtk4-4.16.1-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_fetch: Started
NOTE: recipe gtk4-4.16.1-r0: task do_fetch: Succeeded
NOTE: Running task 3990 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_unpack)
NOTE: Running task 3991 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.16.1-r0: task do_unpack: Started
NOTE: recipe gtk4-4.16.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.16.1-r0: task do_unpack: Succeeded
NOTE: Running task 3992 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_patch)
NOTE: Running task 3993 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.16.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.16.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_patch: Succeeded
NOTE: Running task 3994 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3995 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_populate_lic)
NOTE: recipe gtk4-4.16.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.16.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.16.1-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.16.1-r0: task do_populate_lic: Succeeded
NOTE: recipe gtk4-4.16.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3996 of 4008 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_configure)
NOTE: recipe gtk4-4.16.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.16.1-r0: task do_collect_spdx_deps: Succeeded
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gi-docgen/gi-docgen_2024.1.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/librsvg/librsvg_2.58.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/cairo/cairo_1.18.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.123.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/fontconfig/fontconfig_2.15.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/harfbuzz/harfbuzz_9.0.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/lib
 epoxy_1.5.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/pango/pango_1.54.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.3.290.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.3.290.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.37.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xor
 g-lib/libxcursor_1.2.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.7.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipe
 s-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.24.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libpng/libpng_1.6.43.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libtiff/tiff_4.6.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/atk/at-spi2-core_2.52.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/fribidi/fribidi_1.0.15.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot'
 , 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.80.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/shaderc/shaderc_2024.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.23.1.bb:do_p
 opulate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'cracklib', 'libidn2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gdk-pixbuf', 'gi-docgen', 'gobject-introspection', 'libgudev', 'librsvg', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11
 ', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'fribidi', 'gdbm', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libical', 'libpcre2', 'libseccomp', 'libunistring', 'libusb1', 'shared-mime-info', 'sqlite3', 'openssl-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native'
 , 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'glslang-native', 'libjpeg-turbo-native', 'shaderc-native', 'spirv-headers-native', 'spirv-tools-native', 'wayland-native', 'libpng-native', 'attr-native', 'gdbm-native', 'gmp-native', 'itstool-native', 'libbsd-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'shared-mime-info-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Dintrospection=enabled -Dgtk_doc=false -Dbuild-tests=false -Dbuild-testsuite=false -Dbuild-demos=false -Dcloudproviders=disabled -Dcolord=disabled -Dprint-cups=disabled -Dmedia-gstreamer=enabled -Dtracker=disabled -Dvulkan=enabled -Dwayland-backend=true -Dx11-backend=true...
| The Meson build system
| Version: 1.5.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/gtk-4.16.1
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/build
| Build type: cross build
| 
| ../gtk-4.16.1/meson.build:1:0: ERROR: Unknown options: "gtk_doc"
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/run.do_configure.2559077:176 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/run.do_configure.2559077, line 176
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/run.do_configure.2559077, line 165
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/run.do_configure.2559077, line 154
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/run.do_configure.2559077, line 189
NOTE: recipe gtk4-4.16.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 3996 tasks of which 3986 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915110649.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915110649.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_configure
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/log.do_configure.2559077
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: gtk4-4.16.1-r0 do_configure: meson failed
ERROR: gtk4-4.16.1-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/run.do_configure.2559077' failed with exit code 1
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/gtk4/4.16.1/temp/log.do_configure.2559077
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk4_4.16.1.bb:do_configure) failed with exit code '1'

--===============0000181186213941577==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.14.5-4.16.1.patch"

RnJvbSAzNjYyNTQyNTg3YTFhNjdkYzJjMjYzNjFkOWMzNmM3OWE2OTg3NGUwIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTE6MDc6MDkgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMTQuNSAtPiA0LjE2LjEKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4xNC41LmJiID0+IGd0azRfNC4xNi4xLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMTQuNS5iYiA9PiBndGs0XzQuMTYuMS5iYn0gKDk4JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTQuNS5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNi4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTglCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xNC41LmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYuMS5iYgppbmRleCAwYjNkMzNmOGViLi5j
YjUyYjU5MjQ1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTQu
NS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMTYuMS5iYgpAQCAtMzgs
NyArMzgsNyBAQCBNQUpfVkVSID0gIiR7QG9lLnV0aWxzLnRyaW1fdmVyc2lvbigiJHtQVn0iLCAy
KX0iCiBVUFNUUkVBTV9DSEVDS19SRUdFWCA9ICJndGstKD9QPHB2ZXI+XGQrXC4oXGQqWzAyNDY4
XSkrKFwuXGQrKSspXC50YXIueHoiCiAKIFNSQ19VUkkgPSAiaHR0cDovL2Z0cC5nbm9tZS5vcmcv
cHViL2dub21lL3NvdXJjZXMvZ3RrLyR7TUFKX1ZFUn0vZ3RrLSR7UFZ9LnRhci54eiIKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI1NTQ3ZjJiOWYwMDZiMTMzOTkzZTA3MGI4N2MxNzgwNGUwNTFlZmRh
MzkxM2ZlYWNhMTEwOGZhMmJlNDFlMjRkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjkyNmExZWFi
ZDQ4MWY5YmZhMjU1MzhmOTUwMTZmZGZjZmFmOTYzYjJmOTBiNDBhZTY5ZTkwZGVmNTQ5OTIxNWMi
CiAKIFMgPSAiJHtXT1JLRElSfS9ndGstJHtQVn0iCiAKLS0gCjIuNDQuMAoK

--===============0000181186213941577==--

