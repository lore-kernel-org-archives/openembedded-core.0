Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB3FCDB49B
	for <webhook@archiver.kernel.org>; Sun, 15 Oct 2023 19:45:21 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.web11.102699.1697399113762344685
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Oct 2023 12:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=P7ku49wD;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=geuJ8B5l;
 spf=pass (domain: automation.yoctoproject.org, ip: 54.240.27.30, mailfrom: 0101018b34df0d39-72f16666-8cab-498d-9450-607de38af6f1-000000@automation.yoctoproject.org)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=23ZnX/KxMls5ybku3ZJPAAPhVqP849/ohvhWf53fEV8=;
	b=P7ku49wDOPbMIP9wmqVSJq5X+07d0A7Cstz+iMq6HvbQZi9hmOJh1f2QSsolah8d
	z4yyl6j4UkqX9dgaPvGbm1UdM/qxf5PLGlTjuNk74FSiIWM9E/9C2y2Z9JdIHXDMDp2
	47hBiXyiw91XG2JQH6Zhudvn9C8zPUCUzUif4ZKQ=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1697399115;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=23ZnX/KxMls5ybku3ZJPAAPhVqP849/ohvhWf53fEV8=;
	b=geuJ8B5lmuG7gwdm4u0kQevbRJetHV+sFRQNQpzieh484HAJBCjRMGR64pxk5aBt
	mGNFDWeJHmMRAsVqz96S24+YIor5rVEpPs0sNkNuJgKO7kc1hdj8gn2ie2PfyKHWtds
	EuUQUEuKz+52EQ+PnjL69ULWvCPnk76O4yGCNEkM=
Content-Type: multipart/mixed; boundary="===============8041124399612299528=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 45.0 FAILED
Message-ID: <0101018b34df0d39-72f16666-8cab-498d-9450-607de38af6f1-000000@us-west-2.amazonses.com>
Date: Sun, 15 Oct 2023 19:45:15 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.10.15-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Oct 2023 19:45:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189222

--===============8041124399612299528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *epiphany* to *45.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-44.6-45.0.patch
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
From e6cde770a9386d9a78d6af3e4ed58c7ba7041f93 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Oct 2023 15:50:22 +0000
Subject: [PATCH] epiphany: upgrade 44.6 -> 45.0

---
 .../epiphany/{epiphany_44.6.bb => epiphany_45.0.bb}             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/epiphany/{epiphany_44.6.bb => epiphany_45.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_44.6.bb b/meta/recipes-gnome/epiphany/epiphany_45.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_44.6.bb
rename to meta/recipes-gnome/epiphany/epiphany_45.0.bb
index d8dd3d6dae..e20a5e993e 100644
--- a/meta/recipes-gnome/epiphany/epiphany_44.6.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_45.0.bb
@@ -32,7 +32,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "5335dd573581db61e126d854dc16ae519657a5b8790789a47d25e43e17cd3a43"
+SRC_URI[archive.sha256sum] = "0ba2443a3390d75d63271e30b9aa1c7b8f37c1bba37bd346a7fdd20bbdb34791"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
-- 
2.39.2


--===============8041124399612299528==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86.txt"

Loading cache...done.
Loaded 1844 entries from dependency cache.
Parsing recipes...done.
Parsing of 912 .bb files complete (911 cached, 1 parsed). 1844 targets, 38 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-32 sysroot...done.
Removing 1 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.6.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-e6d4219da4d22f8919c697502aad5c47a69e5859"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:e6d4219da4d22f8919c697502aad5c47a69e5859"
workspace            = "master:988dc0dea4398e77a7d7862d4655a9b1f5eaa06d"

Initialising tasks...done.
Sstate summary: Wanted 312 Local 301 Mirrors 0 Missed 11 Current 1299 (96% match, 99% complete)
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3857 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_recipe_qa)
NOTE: Running task 4113 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_write_config)
NOTE: recipe epiphany-45.0-r0: task do_recipe_qa: Started
NOTE: recipe epiphany-45.0-r0: task do_write_config: Started
NOTE: recipe epiphany-45.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4358 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_fetch)
NOTE: recipe epiphany-45.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_fetch: Started
NOTE: recipe epiphany-45.0-r0: task do_fetch: Succeeded
NOTE: Running task 4359 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_unpack)
NOTE: Running task 4360 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-45.0-r0: task do_unpack: Started
NOTE: recipe epiphany-45.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-45.0-r0: task do_unpack: Succeeded
NOTE: Running task 4361 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_patch)
NOTE: Running task 4362 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-45.0-r0: task do_patch: Started
NOTE: recipe epiphany-45.0-r0: task do_patch: Succeeded
NOTE: Running task 4363 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4364 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_populate_lic)
NOTE: recipe epiphany-45.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-45.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-45.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-45.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 4365 of 4375 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure)
NOTE: recipe epiphany-45.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe epiphany-45.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/qemu/qemu-native_8.1.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/quilt/quilt-native_0.67.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libarchive/libarchive_3.7.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gcr/gcr_4.1.0.bb:do_populate_sysroot',
  '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/json-glib/json-glib_1.6.6.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libadwaita/libadwaita_1.4.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libhandy/libhandy_1.8.2.bb:do_p
 opulate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-sato/webkit/webkitgtk_2.40.5.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libsoup/libsoup_3.4.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/nettle/nettle_3.9.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/gettext/gettext_0.22.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.78.0.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/
 desktop-file-utils_0.26.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/meson/meson_1.2.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/ninja/ninja_1.11.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.4.bb:do_populate_sysroot', 'virtual:native:/home/poky
 build/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['glibc', 'desktop-file-utils', 'gcc-cross-i686', 'gcc-runtime', 'qemu-native', 'quilt-native', 'libarchive', 'gcr', 'gdk-pixbuf', 'gsettings-desktop-schemas', 'gtk+3', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libhandy', 'libportal', 'webkitgtk', 'libsoup', 'nettle', 'coreutils-native', 'gettext-native', 'glib-2.0-native', 'desktop-file-utils-native', 'meson-native', 'ninja-native', 'patch-native', 'pkgconfig-native', 'pseudo-native', 'python3-native', 'xz-native', 'gtk+3-native', 'libtool-native', 'zlib-native', 'vala', 'glib-2.0', 'gobject-introspection', 'gtk4', 'attr-native', 'gettext-minimal-native', 'texinfo-dummy-native', 'libgcc', 'linux-libc-headers', 'opkg-utils', 'xz', 'acl', 'zlib', 'attr', 'zstd', 'bzip2', 'systemd', 'shared-mime-info', 'libgcrypt', 'p11-kit', 'python3-wheel-native', 'python3-setuptools-native', 'python3-installer-native', 'python3-build-native', 'appstream', 'util-linux-native', 'libff
 i-native', 'libpcre2-native', 'libxt', 'libxslt', 'libnotify', 'cairo', 'libtasn1', 'libxdamage', 'gstreamer1.0-plugins-base', 'wayland', 'libjpeg-turbo', 'libwpe', 'mesa', 'libsecret', 'libxrender', 'harfbuzz', 'gstreamer1.0', 'libxcomposite', 'wpebackend-fdo', 'at-spi2-core', 'enchant2', 'libx11', 'libwebp', 'libxfixes-native', 'libxi-native', 'at-spi2-core-native', 'gobject-introspection-native', 'fontconfig-native', 'cairo-native', 'libxrandr-native', 'libxdamage-native', 'libxext-native', 'gdk-pixbuf-native', 'libpng-native', 'libxcursor-native', 'libxrender-native', 'libx11-native', 'libxcomposite-native', 'pango-native', 'libjpeg-turbo-native', 're2c-native', 'libxml2', 'nghttp2', 'libpsl', 'sqlite3', 'gmp', 'libxi', 'libxrandr', 'libxkbcommon', 'fontconfig', 'pango', 'libxfixes', 'libepoxy', 'libxcursor', 'libpng', 'libxext', 'wayland-protocols', 'libtirpc-native', 'util-linux-libuuid-native', 'gdbm-native', 'ncurses-native', 'sqlite3-native', 'expat-native', 'libedit-native
 ', 'libnsl2-native', 'bzip2-native', 'openssl-native', 'gmp-native', 'gnu-config-native', 'binutils-cross-i686', 'libmpc-native', 'mpfr-native', 'zstd-native', 'flex-native', 'bash-completion', 'libffi', 'util-linux', 'libpcre2', 'python3', 'fribidi', 'gi-docgen', 'libxinerama', 'vulkan-loader', 'graphene', 'gstreamer1.0-plugins-bad', 'tiff', 'vulkan-headers', 'librsvg', 'base-files', 'base-passwd', 'shadow-sysroot', 'libseccomp', 'libpam', 'update-rc.d', 'shadow', 'kmod', 'libcap', 'shadow-native', 'initscripts', 'libgpg-error', 'python3-flit-core-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'libxmlb', 'libyaml', 'curl', 'libcap-ng-native', 'libsm', 'xorgproto', 'libxcb', 'libxdmcp', 'util-macros', 'pixman', 'iso-codes', 'libtheora', 'orc', 'libglu', 'alsa-lib', 'libvorbis', 'libogg', 'libdrm', 'libxv', 'expat', 'libxshmfence', 'libxxf86vm', 'xrandr', 'icu', 'freetype', 'dbus', 'libxtst', 'aspell', 'xtrans', 'util-macros-native', 'xorgproto-native', 'libxm
 l2-native', 'dbus-native', 'libxtst-native', 'freetype-native', 'libxcb-native', 'libsm-native', 'pixman-native', 'shared-mime-info-native', 'xtrans-native', 'harfbuzz-native', 'libxft-native', 'fribidi-native', 'cmake-native', 'xkeyboard-config', 'libxft', 'perl-native', 'm4-native', 'ncurses', 'libxcrypt', 'util-linux-libuuid', 'libcap-ng', 'gdbm', 'libtirpc', 'libnsl2', 'openssl', 'libedit', 'bluez5', 'libusb1', 'sbc', 'libgudev', 'libsndfile1', 'libstd-rs', 'cracklib', 'unzip-native', 'libidn2', 'libice', 'xcb-proto', 'libpthread-stubs', 'libxau', 'libpciaccess', 'xcb-proto-native', 'libxdmcp-native', 'libpthread-stubs-native', 'libxau-native', 'libice-native', 'itstool-native', 'icu-native', 'make-native', 'libical', 'readline', 'flac', 'libunistring']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.2.2
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/epiphany-45.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/build
| Build type: cross build
| Project name: epiphany
| Project version: 45.0
| C compiler for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/recipe-sysroot (gcc 13.2.0 "i686-poky-linux-gcc (GCC) 13.2.0")
| C linker for the host machine: i686-poky-linux-gcc -m32 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -D_TIME_BITS=64 -D_FILE_OFFSET_BITS=64 --sysroot=/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/recipe-sysroot ld.bfd 2.41.0.20230926
| C compiler for the build machine: gcc (gcc 12.2.0 "gcc (GCC) 12.2.0")
| C linker for the build machine: gcc ld.bfd 2.40.20230119
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86
| Host machine cpu: i686
| Target machine cpu family: x86
| Target machine cpu: i686
| Found pkg-config: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/recipe-sysroot-native/usr/bin/pkg-config (0.29.2)
| Run-time dependency iso-codes found: YES 4.15.0
| Run-time dependency cairo found: YES 1.16.0
| Run-time dependency gcr-4 found: YES 4.1.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.10
| Run-time dependency gio-2.0 found: YES 2.78.0
| Run-time dependency gio-unix-2.0 found: YES 2.78.0
| Run-time dependency glib-2.0 found: YES 2.78.0
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
| Run-time dependency libsoup-3.0 found: YES 3.4.2
| Run-time dependency libxml-2.0 found: YES 2.11.5
| Run-time dependency nettle found: YES 3.9.1
| Run-time dependency libportal-gtk4 found: YES 0.7.1
| Run-time dependency sqlite3 found: YES 3.43.1
| Dependency webkitgtk-6.0 found: NO found 2.40.5 but need: '>= 2.41.1'
| Found CMake: NO
| Run-time dependency webkitgtk-6.0 found: NO
| 
| ../epiphany-45.0/meson.build:112:16: ERROR: Dependency lookup for webkitgtk-6.0 with method 'pkgconfig' failed: Invalid version, need 'webkitgtk-6.0' ['>= 2.41.1'] found '2.40.5'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.3278325:174 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.3278325, line 174
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.3278325, line 163
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.3278325, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.3278325, line 187
NOTE: recipe epiphany-45.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4365 tasks of which 4355 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-45.0-r0 do_configure: meson failed
ERROR: epiphany-45.0-r0 do_configure: ExecutionError('/home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/run.do_configure.3278325', 1, None, None)
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux/epiphany/45.0/temp/log.do_configure.3278325
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/epiphany/epiphany_45.0.bb:do_configure) failed with exit code '1'

--===============8041124399612299528==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-44.6-45.0.patch"

RnJvbSBlNmNkZTc3MGE5Mzg2ZDlhNzhkNmFmM2U0ZWQ1OGM3YmE3MDQxZjkzIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgT2N0IDIwMjMgMTU6NTA6MjIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0NC42IC0+IDQ1LjAKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80NC42LmJiID0+IGVwaXBoYW55XzQ1LjAuYmJ9ICAgICAgICAgICAgIHwgMiArLQogMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L3tlcGlwaGFueV80NC42LmJiID0+IGVwaXBoYW55XzQ1LjAuYmJ9
ICg5NCUpCgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55
XzQ0LjYuYmIgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDUuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkvZXBpcGhhbnlfNDQuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55
L2VwaXBoYW55XzQ1LjAuYmIKaW5kZXggZDhkZDNkNmRhZS4uZTIwYTVlOTkzZSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ0LjYuYmIKKysrIGIvbWV0
YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ1LjAuYmIKQEAgLTMyLDcgKzMyLDcg
QEAgU1JDX1VSSSA9ICIke0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmlt
X3ZlcnNpb24oIiR7UFZ9IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBh
dGNoIFwKICAgICAgICAgICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAg
IgotU1JDX1VSSVthcmNoaXZlLnNoYTI1NnN1bV0gPSAiNTMzNWRkNTczNTgxZGI2MWUxMjZkODU0
ZGMxNmFlNTE5NjU3YTViODc5MDc4OWE0N2QyNWU0M2UxN2NkM2E0MyIKK1NSQ19VUklbYXJjaGl2
ZS5zaGEyNTZzdW1dID0gIjBiYTI0NDNhMzM5MGQ3NWQ2MzI3MWUzMGI5YWExYzdiOGYzN2MxYmJh
MzdiZDM0NmE3ZmRkMjBiYmRiMzQ3OTEiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1
Z2dpbmcKIFBBQ0tBR0VDT05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9
dHJ1ZSwtRGRldmVsb3Blcl9tb2RlPWZhbHNlIgotLSAKMi4zOS4yCgo=

--===============8041124399612299528==--

