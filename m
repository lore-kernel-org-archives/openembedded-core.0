Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B6FC35FFC
	for <webhook@archiver.kernel.org>; Sun, 15 Sep 2024 14:34:07 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web10.115643.1726410841487197720
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Sep 2024 07:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=d2e/rsQA;
 dkim=pass header.i=@amazonses.com header.s=7v7vs6w47njt4pimodk5mmttbegzsi6n header.b=YRHbB0w7;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010191f61adb84-132fb033-3ac7-4806-b638-bd1cf942ad9e-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=0Yd03t+Jqi210aErSWKDWMMrp8ymcQG432/k6Pgeamo=;
	b=d2e/rsQAGmPsrdKHVB+3lUSd4NH4yf0mhosaqvt5Orx0GZIdjBbTlDChFqfo+jyu
	oMgeWdly4k6hgDX9a9C6FqK9G/k29oxl9Pu0I3Jyfod5kPIh4OkO0cDpihEdXfTMr/G
	bIF6KX0E4xhYydRCbNFs1X93lhC1PRFOWMAJoy/I=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=7v7vs6w47njt4pimodk5mmttbegzsi6n; d=amazonses.com; t=1726410841;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=0Yd03t+Jqi210aErSWKDWMMrp8ymcQG432/k6Pgeamo=;
	b=YRHbB0w7EEBCKadB0Zi9leR0w2/QgllegNfTntNWEHHYPLuZ74KYRK5egLqIaliF
	LbzhXqvL0O9EzljCgNqMhd5bkPIpKhlDl7ph2pE3HHNHw2LXg7xRpspOsBaMh/Inrvc
	5dmzlQGamuYIFMhhLgwtExRArB6V82bKjC+S7Qx8=
Content-Type: multipart/mixed; boundary="===============5568472429649647144=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] epiphany: upgrading to 47.0 FAILED
Message-ID: <01010191f61adb84-132fb033-3ac7-4806-b638-bd1cf942ad9e-000000@us-west-2.amazonses.com>
Date: Sun, 15 Sep 2024 14:34:00 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2024.09.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 15 Sep 2024 14:34:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/204550

--===============5568472429649647144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *47.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-46.3-47.0.patch
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
From 42dc6a39a8118e8bd51d063d31a04948cfb4e099 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 15 Sep 2024 11:01:24 +0000
Subject: [PATCH] epiphany: upgrade 46.3 -> 47.0

---
 .../epiphany/{epiphany_46.3.bb => epiphany_47.0.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_46.3.bb => epiphany_47.0.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_46.3.bb b/meta/recipes-gnome/epiphany/epiphany_47.0.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_46.3.bb
rename to meta/recipes-gnome/epiphany/epiphany_47.0.bb
index d9ad38d693..b3e295737d 100644
--- a/meta/recipes-gnome/epiphany/epiphany_46.3.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_47.0.bb
@@ -31,7 +31,7 @@ SRC_URI = "${GNOME_MIRROR}/${GNOMEBN}/${@oe.utils.trim_version("${PV}", 1)}/${GN
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "a9e1ad206449117fc5ebe4d0177c1d7a2ff503d6b55019072a068ff2ab278656"
+SRC_URI[archive.sha256sum] = "8e38ee7f90fd6054f8aef0e7f505d53c4520742f5acd1f008282a47b2764affa"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index e129d503e8..6b18421fb5 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 4ec86871f8c2a854aec9e6955566fa437fd5f09a Mon Sep 17 00:00:00 2001
+From b18fca27e682e11e8bf52286ccddfcc146165ac0 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index ba674e4aad..4c5310feea 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 641c9d5fc0d9f16151a20a5df2f0b4059d1130a1 Mon Sep 17 00:00:00 2001
+From 7962e6b62d6f8c5aba374eb7a6eb9aed95b508d3 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index 2691828..c466af6 100644
+index e9f2d85..f4a616b 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 53837f448b..5f58ab2f6b 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From 2fcc2b3c3751b2fb63474ca78b24e4b6375d62a9 Mon Sep 17 00:00:00 2001
+From 23b0f9a05a8366009677e2b7e45c4538e7093482 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.44.0


--===============5568472429649647144==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1867 entries from dependency cache.
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
DISTRO_VERSION       = "5.0+snapshot-c3bb086143dac36886c43a02ae2743b91c57ac22"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:c3bb086143dac36886c43a02ae2743b91c57ac22"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 610 Local 597 Mirrors 0 Missed 13 Current 1078 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 3989 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_recipe_qa)
NOTE: recipe epiphany-47.0-r0: task do_recipe_qa: Started
NOTE: Running task 4256 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_write_config)
NOTE: recipe epiphany-47.0-r0: task do_write_config: Started
NOTE: recipe epiphany-47.0-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-47.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 4578 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_fetch)
NOTE: recipe epiphany-47.0-r0: task do_fetch: Started
NOTE: recipe epiphany-47.0-r0: task do_fetch: Succeeded
NOTE: Running task 4579 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_unpack)
NOTE: Running task 4580 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-47.0-r0: task do_unpack: Started
NOTE: recipe epiphany-47.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-47.0-r0: task do_unpack: Succeeded
NOTE: Running task 4581 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_patch)
NOTE: Running task 4582 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-47.0-r0: task do_patch: Started
NOTE: recipe epiphany-47.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-47.0-r0: task do_patch: Succeeded
NOTE: Running task 4583 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 4584 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_populate_lic)
NOTE: recipe epiphany-47.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-47.0-r0: task do_populate_lic: Started
NOTE: recipe epiphany-47.0-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-47.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe epiphany-47.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-47.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 4585 of 4597 (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_configure)
NOTE: recipe epiphany-47.0-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.40.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu-native_9.0.2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.7.4.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gcr/gcr_4.3.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.1
 2.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_46.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/json-glib/json-glib_1.8.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libadwaita/libadwaita_1.5.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/libportal/libportal_0.7.1.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/rec
 ipes-sato/webkit/webkitgtk_2.44.3.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/libsoup/libsoup_3.6.0.bb:do_populate_sysroot', '/home/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/gettext/gettext_0.22.5.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.80.4.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.27.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/meson/meson_1.5.1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/ninja/ninja_1.12.
 1.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.12.6.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.6.2.bb:do_populate_sysroot', 'virtual:native:/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gtk+/gtk+3_3.24.43.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'desktop-file-utils', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'cracklib', 'libarchive', 'libidn2', 'libnsl2', 'libtirpc', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gcr', 'gdk-pixbuf', 'gi-docgen', 'gobject-introspection', 'gsettings-desktop-schemas', 'gtk+3', 'gtk4', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libgudev', 'libhandy', 'libnotify', 'libportal', 'librsvg', 'libsecret', 'libxmlb', 'cairo', 'libdrm', 'fontconfig', 'freetype', 'graph
 ene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxt', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'libwpe', 'webkitgtk', 'wpebackend-fdo', 'appstream', 'aspell', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'enchant2', 'fribidi', 'gdbm', 'gmp', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error',
  'libical', 'libpcre2', 'libpsl', 'libseccomp', 'libsoup', 'libunistring', 'libusb1', 'libxslt', 'libyaml', 'nettle', 'nghttp2', 'p11-kit', 'shared-mime-info', 'sqlite3', 'openssl-native', 'coreutils-native', 'dbus-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'desktop-file-utils-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'bzip2-native', 'libnsl2-native', 'libtirpc-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'gtk+3-native', 'cairo-native', 'fontconf
 ig-native', 'freetype-native', 'harfbuzz-native', 'libjpeg-turbo-native', 'pango-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxcomposite-native', 'libxcursor-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfixes-native', 'libxft-native', 'libxi-native', 'libxrandr-native', 'libxrender-native', 'libxtst-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'util-macros-native', 'libpng-native', 'at-spi2-core-native', 'attr-native', 'fribidi-native', 'gdbm-native', 'gmp-native', 'icu-native', 'itstool-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'mpfr-native', 're2c-native', 'shared-mime-info-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.5.1
| Source dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/epiphany-47.0
| Build dir: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/build
| Build type: cross build
| Project name: epiphany
| Project version: 47.0
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/recipe-sysroot (gcc 14.2.0 "x86_64-poky-linux-gcc (GCC) 14.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 -mfpmath=sse -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/recipe-sysroot ld.bfd 2.43.1
| C compiler for the build machine: gcc (gcc 13.2.0 "gcc (GCC) 13.2.0")
| C linker for the build machine: gcc ld.bfd 2.42.0.20240216
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency iso-codes found: YES 4.16.0
| Run-time dependency cairo found: YES 1.18.2
| Run-time dependency gck-2 found: YES 4.3.0
| Run-time dependency gcr-4 found: YES 4.3.0
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.42.12
| Run-time dependency gio-2.0 found: YES 2.80.4
| Run-time dependency gio-unix-2.0 found: YES 2.80.4
| Run-time dependency glib-2.0 found: YES 2.80.4
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 46.1
| Run-time dependency gstreamer-1.0 found: YES 1.24.6
| Run-time dependency gtk4 found: YES 4.14.5
| Run-time dependency gtk4-unix-print found: YES 4.14.5
| Run-time dependency hogweed found: YES 3.10
| Dependency iso-codes found: YES 4.16.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.8.0
| Run-time dependency libarchive found: YES 3.7.4
| Dependency libadwaita-1 found: NO. Found 1.5.3 but need: '>= 1.6.alpha'
| Found CMake: NO
| Run-time dependency libadwaita-1 found: NO
| 
| ../epiphany-47.0/meson.build:102:17: ERROR: Dependency lookup for libadwaita-1 with method 'pkgconfig' failed: Invalid version, need 'libadwaita-1' ['>= 1.6.alpha'] found '1.5.3'.
| 
| A full log can be found at /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/build/meson-logs/meson-log.txt
| ERROR: meson failed
| WARNING: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/run.do_configure.2515828:171 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/run.do_configure.2515828, line 171
| 	#2: meson_do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/run.do_configure.2515828, line 160
| 	#3: do_configure, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/run.do_configure.2515828, line 149
| 	#4: main, /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/run.do_configure.2515828, line 184
NOTE: recipe epiphany-47.0-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4585 tasks of which 4575 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915110103.txt
You can send the errors to a reports server by running:
  send-error-report /home/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20240915110103.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_configure
    log: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/log.do_configure.2515828
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-47.0-r0 do_configure: meson failed
ERROR: epiphany-47.0-r0 do_configure: Execution of '/home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/run.do_configure.2515828' failed with exit code 1
ERROR: Logfile of failure stored in: /home/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/epiphany/47.0/temp/log.do_configure.2515828
ERROR: Task (/home/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/epiphany/epiphany_47.0.bb:do_configure) failed with exit code '1'

--===============5568472429649647144==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-46.3-47.0.patch"

RnJvbSA0MmRjNmEzOWE4MTE4ZThiZDUxZDA2M2QzMWEwNDk0OGNmYjRlMDk5IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMTUgU2VwIDIwMjQgMTE6MDE6MjQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBl
cGlwaGFueTogdXBncmFkZSA0Ni4zIC0+IDQ3LjAKCi0tLQogLi4uL2VwaXBoYW55L3tlcGlwaGFu
eV80Ni4zLmJiID0+IGVwaXBoYW55XzQ3LjAuYmJ9ICAgICAgICAgICB8IDIgKy0KIC4uLi9maWxl
cy8wMDAyLWhlbHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggfCAy
ICstCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gg
ICAgICAgICAgIHwgNCArKy0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWln
cmF0b3IucGF0Y2ggICAgICAgICAgICAgIHwgMiArLQogNCBmaWxlcyBjaGFuZ2VkLCA1IGluc2Vy
dGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdub21lL2VwaXBo
YW55L3tlcGlwaGFueV80Ni4zLmJiID0+IGVwaXBoYW55XzQ3LjAuYmJ9ICg5NCUpCgpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjMuYmIgYi9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDcuMC5iYgpzaW1pbGFyaXR5IGluZGV4
IDk0JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDYu
My5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ3LjAu
YmIKaW5kZXggZDlhZDM4ZDY5My4uYjNlMjk1NzM3ZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2VwaXBoYW55XzQ2LjMuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2VwaXBoYW55XzQ3LjAuYmIKQEAgLTMxLDcgKzMxLDcgQEAgU1JDX1VSSSA9ICIk
e0dOT01FX01JUlJPUn0vJHtHTk9NRUJOfS8ke0BvZS51dGlscy50cmltX3ZlcnNpb24oIiR7UFZ9
IiwgMSl9LyR7R04KICAgICAgICAgICAgZmlsZTovL21pZ3JhdG9yLnBhdGNoIFwKICAgICAgICAg
ICAgZmlsZTovL2Rpc3RyaWJ1dG9yLnBhdGNoIFwKICAgICAgICAgICAgIgotU1JDX1VSSVthcmNo
aXZlLnNoYTI1NnN1bV0gPSAiYTllMWFkMjA2NDQ5MTE3ZmM1ZWJlNGQwMTc3YzFkN2EyZmY1MDNk
NmI1NTAxOTA3MmEwNjhmZjJhYjI3ODY1NiIKK1NSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0g
IjhlMzhlZTdmOTBmZDYwNTRmOGFlZjBlN2Y1MDVkNTNjNDUyMDc0MmY1YWNkMWYwMDgyODJhNDdi
Mjc2NGFmZmEiCiAKICMgRGV2ZWxvcGVyIG1vZGUgZW5hYmxlcyBkZWJ1Z2dpbmcKIFBBQ0tBR0VD
T05GSUdbZGV2ZWxvcGVyLW1vZGVdID0gIi1EZGV2ZWxvcGVyX21vZGU9dHJ1ZSwtRGRldmVsb3Bl
cl9tb2RlPWZhbHNlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2Zp
bGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCBi
L21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVpbGQt
ZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKaW5kZXggZTEyOWQ1MDNlOC4uNmIxODQyMWZi
NSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVzLzAwMDItaGVs
cC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUt
dGhlLXVzZS1vZi15ZWxwLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA0ZWM4Njg3MWY4YzJh
ODU0YWVjOWU2OTU1NTY2ZmE0MzdmZDVmMDlhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBiMThmY2EyN2U2ODJlMTFlOGJmNTIyODZjY2RkZmNjMTQ2MTY1YWMwIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+CiBEYXRlOiBXZWQsIDMxIEphbiAyMDE4IDE1OjUwOjM4ICswMjAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGhlbHAvbWVzb24uYnVpbGQ6IGRpc2FibGUgdGhlIHVzZSBvZiB5ZWxwCmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvZGlzdHJpYnV0b3IucGF0Y2gKaW5kZXgg
YmE2NzRlNGFhZC4uNGM1MzEwZmVlYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9l
cGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNjQx
YzlkNWZjMGQ5ZjE2MTUxYTIwYTVkZjJmMGI0MDU5ZDExMzBhMSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gNzk2MmU2YjYyZDZmOGM1YWJhMzc0ZWI3YTZlYjlhZWQ5NWI1MDhkMyBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRp
ZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCAyNiBGZWIgMjAyMSAxMDoxNzo1MiAr
MDAwMAogU3ViamVjdDogW1BBVENIXSBEb24ndCBlbmNvZGUgdGhlIGRpc3RybyBmcm9tIC9ldGMv
b3MtcmVsZWFzZSBpbnRvIHRoZQpAQCAtMTEsNyArMTEsNyBAQCBSUCAyMDIxLzIvMjYKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL21lc29uLmJ1aWxkIGIv
bWVzb24uYnVpbGQKLWluZGV4IDI2OTE4MjguLmM0NjZhZjYgMTAwNjQ0CitpbmRleCBlOWYyZDg1
Li5mNGE2MTZiIDEwMDY0NAogLS0tIGEvbWVzb24uYnVpbGQKICsrKyBiL21lc29uLmJ1aWxkCiBA
QCAtMTUsNiArMTUsNyBAQCBpZiByLnJldHVybmNvZGUoKSA9PSAwCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0Y2gKaW5kZXggNTM4MzdmNDQ4Yi4u
NWY1OGFiMmY2YiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWdub21lL2VwaXBoYW55L2ZpbGVz
L21pZ3JhdG9yLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9t
aWdyYXRvci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMmZjYzJiM2MzNzUxYjJmYjYzNDc0
Y2E3OGIyNGU0YjYzNzVkNjJhOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMjNiMGY5
YTA1YTgzNjYwMDk2NzdlMmI3ZTQ1YzQ1MzhlNzA5MzQ4MiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogRGF0ZTogVGh1LCAyNSBGZWIgMjAyMSAxNDo1MjozMiArMDAwMAogU3ViamVjdDogW1BB
VENIXSBlcGlwaGFueTogRml4IHJlcHJvZHVjaWJpbGl0eSBpc3N1ZQotLSAKMi40NC4wCgo=

--===============5568472429649647144==--

