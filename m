Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1E33E6526E
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:58 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.29058.1769951567353759956
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=4CeGi93l;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=J1Kw4EE3;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019c1955bee1-94f0e58e-ab02-4e4c-9877-f23f11170997-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=K3Yxqz2wkoCXiiamtP5e7KZT51Bu9Ji2NxRlQbQmcjQ=;
	b=4CeGi93l2jjN5MH9VxpIluuJmbA0YtyXdtHW13zQ72KxY6NnwLtZKPMZouNHBsGN
	6+9IuKu57Ax++DQ6YSXDtI0ahuTbvDORhKCV5nqqTgfiSbpAiGzclxnWtdZx302vYIl
	29MgI5zL2SezA9rPgYv3FiNKkZhzuYg/r0JIgjIE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951575;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=K3Yxqz2wkoCXiiamtP5e7KZT51Bu9Ji2NxRlQbQmcjQ=;
	b=J1Kw4EE3hTtF7JVTl3B763OAquZHICKhiGQHpqnsUEdDIiMXyMVAM+4PCjEhNRha
	UAA6NPP4rc+2JFwx3Hn/EZRb8aNbVJSZvvG0d3vGgn7OI+iuMSi6HN7qtlObl0B1Ye7
	HfZKZGaQ0WrpVA7+gRf0n9J2RsJ8obGmQGhO9QnA=
Content-Type: multipart/mixed; boundary="===============9053549108655497519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] epiphany: upgrading to 49.2 FAILED
Message-ID: <0101019c1955bee1-94f0e58e-ab02-4e4c-9877-f23f11170997-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:55 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230306

--===============9053549108655497519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *epiphany* to *49.2* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-epiphany-upgrade-48.5-49.2.patch
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
From ee8d894b39000ce6a831ecaff17be44f52faffcb Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 10:56:15 +0000
Subject: [PATCH] epiphany: upgrade 48.5 -> 49.2

---
 .../epiphany/{epiphany_48.5.bb => epiphany_49.2.bb}           | 2 +-
 .../files/0002-help-meson.build-disable-the-use-of-yelp.patch | 2 +-
 meta/recipes-gnome/epiphany/files/distributor.patch           | 4 ++--
 meta/recipes-gnome/epiphany/files/migrator.patch              | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)
 rename meta/recipes-gnome/epiphany/{epiphany_48.5.bb => epiphany_49.2.bb} (94%)

diff --git a/meta/recipes-gnome/epiphany/epiphany_48.5.bb b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
similarity index 94%
rename from meta/recipes-gnome/epiphany/epiphany_48.5.bb
rename to meta/recipes-gnome/epiphany/epiphany_49.2.bb
index 6a1abdc553..acd1aa3f08 100644
--- a/meta/recipes-gnome/epiphany/epiphany_48.5.bb
+++ b/meta/recipes-gnome/epiphany/epiphany_49.2.bb
@@ -31,7 +31,7 @@ SRC_URI += "\
            file://migrator.patch \
            file://distributor.patch \
            "
-SRC_URI[archive.sha256sum] = "0f66552ad6593c7952a3ddee5bf515656c8c434871076d9f1a91a7af9346b1b4"
+SRC_URI[archive.sha256sum] = "b3ba3d68213e87f81f1733e85500c37b82b5938f9009e4fe89994963d5fb2b8e"
 
 # Developer mode enables debugging
 PACKAGECONFIG[developer-mode] = "-Ddeveloper_mode=true,-Ddeveloper_mode=false"
diff --git a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
index 6c00ab9b40..25055f5bce 100644
--- a/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
+++ b/meta/recipes-gnome/epiphany/files/0002-help-meson.build-disable-the-use-of-yelp.patch
@@ -1,4 +1,4 @@
-From 91045ece41faefbeac14b60d7b19b0c652e586fb Mon Sep 17 00:00:00 2001
+From 37523e6d95783cb6f1b361a8cadfea09dd7d0ced Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Wed, 31 Jan 2018 15:50:38 +0200
 Subject: [PATCH] help/meson.build: disable the use of yelp
diff --git a/meta/recipes-gnome/epiphany/files/distributor.patch b/meta/recipes-gnome/epiphany/files/distributor.patch
index 54a3305aaf..f88f975942 100644
--- a/meta/recipes-gnome/epiphany/files/distributor.patch
+++ b/meta/recipes-gnome/epiphany/files/distributor.patch
@@ -1,4 +1,4 @@
-From 46084da03b5f20423a2946d988c68e9ea9339c9c Mon Sep 17 00:00:00 2001
+From 7d6a64f3a17a2f7cbecce99f9ec82d6bb542fcae Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 26 Feb 2021 10:17:52 +0000
 Subject: [PATCH] Don't encode the distro from /etc/os-release into the
@@ -11,7 +11,7 @@ RP 2021/2/26
  1 file changed, 1 insertion(+)
 
 diff --git a/meson.build b/meson.build
-index df0340c..8ec6c79 100644
+index ba09333..49a2aa8 100644
 --- a/meson.build
 +++ b/meson.build
 @@ -15,6 +15,7 @@ if r.returncode() == 0
diff --git a/meta/recipes-gnome/epiphany/files/migrator.patch b/meta/recipes-gnome/epiphany/files/migrator.patch
index 8ebcdc9991..eff1089e2d 100644
--- a/meta/recipes-gnome/epiphany/files/migrator.patch
+++ b/meta/recipes-gnome/epiphany/files/migrator.patch
@@ -1,4 +1,4 @@
-From ca504370b9aa893ceac21141d8f24e28a474b674 Mon Sep 17 00:00:00 2001
+From 686212d5248ef30b4293e42401789cb2fb853872 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Thu, 25 Feb 2021 14:52:32 +0000
 Subject: [PATCH] epiphany: Fix reproducibility issue
-- 
2.47.1


--===============9053549108655497519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-ad836de1f4cd44f77e4d7dfc5dc3d26e018cd7a5"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:ad836de1f4cd44f77e4d7dfc5dc3d26e018cd7a5"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 446 Local 434 Mirrors 0 Missed 12 Current 1350 (97% match, 99% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 1641 of 1796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1776 of 1796 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_recipe_qa_setscene)
NOTE: recipe epiphany-49.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe epiphany-49.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 4379 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_fetch)
NOTE: Running task 4622 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_write_config)
NOTE: recipe epiphany-49.2-r0: task do_fetch: Started
NOTE: recipe epiphany-49.2-r0: task do_fetch: Succeeded
NOTE: Running task 4791 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_unpack)
NOTE: Running task 4792 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe epiphany-49.2-r0: task do_write_config: Started
NOTE: recipe epiphany-49.2-r0: task do_unpack: Started
NOTE: recipe epiphany-49.2-r0: task do_write_config: Succeeded
NOTE: recipe epiphany-49.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe epiphany-49.2-r0: task do_unpack: Succeeded
NOTE: Running task 4910 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_patch)
NOTE: Running task 4911 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_collect_spdx_deps)
NOTE: recipe epiphany-49.2-r0: task do_patch: Started
NOTE: recipe epiphany-49.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe epiphany-49.2-r0: task do_patch: Succeeded
NOTE: Running task 4912 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 4913 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_populate_lic)
NOTE: recipe epiphany-49.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe epiphany-49.2-r0: task do_populate_lic: Started
NOTE: recipe epiphany-49.2-r0: task do_populate_lic: Succeeded
NOTE: recipe epiphany-49.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_populate_lic unihash changed to 74914a526f84b0428a31b6f999e30fd9a9a7f272bc23f528d73520af81bba88f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_deploy_source_date_epoch unihash changed to 1fa55205fe96370413a3eadfd5caa432b1d803804b078751047365c2f8fb1cec
NOTE: Setscene tasks completed
NOTE: recipe epiphany-49.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe epiphany-49.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Setscene tasks completed
NOTE: Running task 4914 of 4926 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_configure)
NOTE: recipe epiphany-49.2-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.5.bb:do_populate_sysroot', '/srv/pokybuild/
 yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gcr/gcr_4.4.0.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_49.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/json-glib/json-glib_1.10.8.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libadwaita/libadwaita_1.8.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build
 /layers/openembedded-core/meta/recipes-gnome/libdazzle/libdazzle_3.44.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libhandy/libhandy_1.8.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libportal/libportal_0.9.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-sato/webkit/webkitgtk_2.50.4.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libsoup/libsoup_3.6.5.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-co
 re/gettext/gettext_0.26.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/ninja/ninja_1.13.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/bu
 ild/layers/openembedded-core/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['bluez5', 'openssl', 'base-files', 'base-passwd', 'dbus', 'expat', 'gettext-minimal-native', 'glib-2.0', 'glibc', 'initscripts', 'libxcrypt', 'libxml2', 'ncurses', 'readline', 'systemd', 'update-rc.d', 'util-linux-libuuid', 'util-linux', 'zlib', 'binutils-cross-x86_64', 'libclc', 'llvm-tblgen-native', 'llvm', 'cmake-native', 'desktop-file-utils', 'elfutils', 'file', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'json-c', 'libedit', 'libtool-native', 'm4-native', 'opkg-utils', 'orc', 'python3-setuptools', 'python3', 'qemu-native', 'quilt-native', 'libstd-rs', 'vala', 'bzip2', 'libarchive', 'libidn2', 'lzlib', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'zstd', 'gcr', 'gdk-pixbuf', 'gobject-introspection', 'gsettings-desktop-schemas', 'gtk+3', 'gtk4', 'hicolor-icon-theme', 'json-glib', 'libadwaita', 'libdazzle', 'libgudev', 'libhandy', 'libnotify', 'libportal', 'librsvg', 'libsecret', 'libxmlb', 'cairo', 'libdrm', '
 fontconfig', 'freetype', 'graphene', 'harfbuzz', 'libjpeg-turbo', 'libepoxy', 'libglu', 'mesa', 'pango', 'spirv-headers', 'spirv-llvm-translator', 'spirv-tools', 'vulkan-headers', 'vulkan-loader', 'wayland-protocols', 'wayland', 'xrandr', 'libice', 'libpciaccess', 'libpthread-stubs', 'libsm', 'libx11', 'libxau', 'libxcb', 'libxcomposite', 'libxcursor', 'libxdamage', 'libxdmcp', 'libxext', 'libxfixes', 'libxft', 'libxi', 'libxinerama', 'libxkbcommon', 'libxrandr', 'libxrender', 'libxshmfence', 'libxt', 'libxtst', 'libxv', 'libxxf86vm', 'pixman', 'xkeyboard-config', 'xtrans', 'xcb-proto', 'xorgproto', 'util-macros', 'kmod', 'linux-libc-headers', 'alsa-lib', 'flac', 'gstreamer1.0-plugins-bad', 'gstreamer1.0-plugins-base', 'gstreamer1.0', 'libogg', 'libpng', 'libsndfile1', 'libtheora', 'tiff', 'libvorbis', 'sbc', 'libwebp', 'libwpe', 'webkitgtk', 'wpebackend-fdo', 'appstream', 'aspell', 'at-spi2-core', 'acl', 'attr', 'bash-completion', 'curl', 'enchant2', 'fribidi', 'gdbm', 'gmp', 'gnut
 ls', 'libtasn1', 'icu', 'iso-codes', 'libcap-ng', 'libcap', 'libffi', 'libgcrypt', 'libgpg-error', 'libical', 'libmicrohttpd', 'libpcre2', 'libpsl', 'libseccomp', 'libsoup', 'libunistring', 'libusb1', 'libxslt', 'libyaml', 'nettle', 'nghttp2', 'p11-kit', 'shared-mime-info', 'sqlite3', 'openssl-native', 'coreutils-native', 'dbus-native', 'expat-native', 'gettext-native', 'glib-2.0-native', 'libxml2-native', 'ncurses-native', 'util-linux-libuuid-native', 'util-linux-native', 'zlib-native', 'llvm-native', 'desktop-file-utils-native', 'flex-native', 'gnu-config-native', 'libedit-native', 'make-native', 'meson-native', 'ninja-native', 'patch-native', 'patchelf-native', 'perl-native', 'pkgconfig-native', 'pseudo-native', 'python3-build-native', 'python3-docutils-native', 'python3-flit-core-native', 'python3-installer-native', 'python3-packaging-native', 'python3-pyproject-hooks-native', 'python3-setuptools-native', 'python3-wheel-native', 'python3-native', 'cargo-c-native', 'cargo-native'
 , 'rust-native', 'vala-native', 'bzip2-native', 'shadow-native', 'unzip-native', 'xz-native', 'zstd-native', 'gdk-pixbuf-native', 'gobject-introspection-native', 'gtk+3-native', 'librsvg-native', 'cairo-native', 'fontconfig-native', 'freetype-native', 'harfbuzz-native', 'libjpeg-turbo-native', 'pango-native', 'libpthread-stubs-native', 'libx11-native', 'libxau-native', 'libxcb-native', 'libxcomposite-native', 'libxcursor-native', 'libxdamage-native', 'libxdmcp-native', 'libxext-native', 'libxfixes-native', 'libxft-native', 'libxi-native', 'libxrandr-native', 'libxrender-native', 'libxtst-native', 'pixman-native', 'xtrans-native', 'xcb-proto-native', 'xorgproto-native', 'util-macros-native', 'libpng-native', 'at-spi2-core-native', 'attr-native', 'ca-certificates-native', 'curl-native', 'fribidi-native', 'gdbm-native', 'gmp-native', 'icu-native', 'libbsd-native', 'libcap-ng-native', 'libffi-native', 'libmd-native', 'libmpc-native', 'libpcre2-native', 'libssh2-native', 'mpfr-native', '
 re2c-native', 'shared-mime-info-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| NOTE: Executing meson -Ddeveloper_mode=false...
| The Meson build system
| Version: 1.10.1
| Source dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/sources/epiphany-49.2
| Build dir: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/build
| Build type: cross build
| Project name: epiphany
| Project version: 49.2
| C compiler for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot (gcc 15.2.0 "x86_64-poky-linux-gcc (GCC) 15.2.0")
| C linker for the host machine: x86_64-poky-linux-gcc -m64 -march=x86-64-v3 -fstack-protector-strong -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security --sysroot=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot ld.bfd 2.45.1.20251126
| C compiler for the build machine: gcc (gcc 14.2.0 "gcc (GCC) 14.2.0")
| C linker for the build machine: gcc ld.bfd 2.43.1.20241111
| Build machine cpu family: x86_64
| Build machine cpu: x86_64
| Host machine cpu family: x86_64
| Host machine cpu: x86_64
| Target machine cpu family: x86_64
| Target machine cpu: x86_64
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/pkg-config) 0.29.2
| Run-time dependency iso-codes found: YES 4.19.0
| Run-time dependency cairo found: YES 1.18.4
| Run-time dependency gck-2 found: YES 4.4.0.1
| Run-time dependency gcr-4 found: YES 4.4.0.1
| Run-time dependency gdk-pixbuf-2.0 found: YES 2.44.4
| Run-time dependency gio-2.0 found: YES 2.86.3
| Run-time dependency gio-unix-2.0 found: YES 2.86.3
| Run-time dependency glib-2.0 found: YES 2.86.3
| Dependency granite-7 skipped: feature granite disabled
| Run-time dependency gsettings-desktop-schemas found: YES 49.1
| Run-time dependency gstreamer-1.0 found: YES 1.26.9
| Run-time dependency gtk4 found: YES 4.20.2
| Run-time dependency gtk4-unix-print found: YES 4.20.2
| Run-time dependency hogweed found: YES 3.10.2
| Dependency iso-codes found: YES 4.19.0 (cached)
| Run-time dependency json-glib-1.0 found: YES 1.10.8
| Run-time dependency libarchive found: YES 3.8.5
| Run-time dependency libadwaita-1 found: YES 1.8.2
| Run-time dependency libsecret-1 found: YES 0.21.7
| Run-time dependency libsoup-3.0 found: YES 3.6.5
| Run-time dependency libxml-2.0 found: YES 2.15.1
| Run-time dependency nettle found: YES 3.10.2
| Run-time dependency libportal-gtk4 found: YES 0.9.1
| Run-time dependency sqlite3 found: YES 3.51.2
| Run-time dependency webkitgtk-6.0 found: YES 2.50.4
| Run-time dependency webkitgtk-web-process-extension-6.0 found: YES 2.50.4
| Configuring config.h.in using configuration
| Library gmp found: YES
| Library m found: YES
| Compiler for C supports arguments -Werror=declaration-after-statement: YES
| Compiler for C supports arguments -Werror=implicit-function-declaration: YES
| Compiler for C supports arguments -Wno-cast-function-type: YES
| Compiler for C supports arguments -Wno-missing-field-initializers: YES
| Compiler for C supports arguments -Wno-unused-parameter: YES
| Configuring org.gnome.Epiphany.desktop.in using configuration
| Program msgfmt found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/msgfmt)
| Configuring org.gnome.Epiphany.metainfo.xml.in using configuration
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program glib-compile-schemas found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-schemas)
| Configuring org.gnome.Epiphany.SearchProvider.service using configuration
| Configuring org.gnome.Epiphany.WebAppProvider.service using configuration
| Configuring org.gnome.Epiphany.SearchProvider.ini using configuration
| Configuring default-bookmarks.rdf using configuration
| Program rst2man found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/rst2man)
| Program desktop-file-validate found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/desktop-file-validate)
| Program appstreamcli found: NO
| Program msginit found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/msginit)
| Program msgmerge found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/msgmerge)
| Program xgettext found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/xgettext)
| Found pkg-config: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/pkg-config-native) 0.29.2
| Build-time dependency gio-2.0 found: YES 2.86.3
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Dependency gio-2.0 found: YES 2.86.3 (cached)
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Build-time dependency glib-2.0 found: YES 2.86.3
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency gio-2.0 found: YES 2.86.3 (cached)
| Program glib-compile-resources found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-compile-resources)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program blueprint-compiler found: NO
| 
| ../sources/epiphany-49.2/src/meson.build:119:12: ERROR: Program 'blueprint-compiler' not found or not executable
| 
| A full log can be found at /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/build/meson-logs/meson-log.txt
| 
| Last 10 lines of meson-log.txt:
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Dependency glib-2.0 found: YES 2.86.3 (cached)
| Program glib-mkenums found: YES (/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/recipe-sysroot-native/usr/bin/glib-mkenums)
| Program blueprint-compiler found: NO
| 
| ../sources/epiphany-49.2/src/meson.build:119:12: ERROR: Program 'blueprint-compiler' not found or not executable
| 
| ERROR: meson setup failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.181436:172 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.181436, line 172
| 	#2: meson_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.181436, line 161
| 	#3: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.181436, line 148
| 	#4: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.181436, line 185
NOTE: recipe epiphany-49.2-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 4914 tasks of which 4905 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201105554.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201105554.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/log.do_configure.181436
Summary: There were 2 ERROR messages, returning a non-zero exit code.
ERROR: epiphany-49.2-r0 do_configure: meson setup failed
ERROR: epiphany-49.2-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/run.do_configure.181436' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/epiphany/49.2/temp/log.do_configure.181436
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/epiphany/epiphany_49.2.bb:do_configure) failed with exit code '1'

--===============9053549108655497519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-epiphany-upgrade-48.5-49.2.patch"

RnJvbSBlZThkODk0YjM5MDAwY2U2YTgzMWVjYWZmMTdiZTQ0ZjUyZmFmZmNiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAxMDo1NjoxNSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGVw
aXBoYW55OiB1cGdyYWRlIDQ4LjUgLT4gNDkuMgoKLS0tCiAuLi4vZXBpcGhhbnkve2VwaXBoYW55
XzQ4LjUuYmIgPT4gZXBpcGhhbnlfNDkuMi5iYn0gICAgICAgICAgIHwgMiArLQogLi4uL2ZpbGVz
LzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2YteWVscC5wYXRjaCB8IDIg
Ky0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9kaXN0cmlidXRvci5wYXRjaCAg
ICAgICAgICAgfCA0ICsrLS0KIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdy
YXRvci5wYXRjaCAgICAgICAgICAgICAgfCAyICstCiA0IGZpbGVzIGNoYW5nZWQsIDUgaW5zZXJ0
aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhh
bnkve2VwaXBoYW55XzQ4LjUuYmIgPT4gZXBpcGhhbnlfNDkuMi5iYn0gKDk0JSkKCmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguNS5iYiBiL21ldGEv
cmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OS4yLmJiCnNpbWlsYXJpdHkgaW5kZXgg
OTQlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9lcGlwaGFueV80OC41
LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDkuMi5i
YgppbmRleCA2YTFhYmRjNTUzLi5hY2QxYWEzZjA4IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
Z25vbWUvZXBpcGhhbnkvZXBpcGhhbnlfNDguNS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUv
ZXBpcGhhbnkvZXBpcGhhbnlfNDkuMi5iYgpAQCAtMzEsNyArMzEsNyBAQCBTUkNfVVJJICs9ICJc
CiAgICAgICAgICAgIGZpbGU6Ly9taWdyYXRvci5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly9k
aXN0cmlidXRvci5wYXRjaCBcCiAgICAgICAgICAgICIKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZz
dW1dID0gIjBmNjY1NTJhZDY1OTNjNzk1MmEzZGRlZTViZjUxNTY1NmM4YzQzNDg3MTA3NmQ5ZjFh
OTFhN2FmOTM0NmIxYjQiCitTUkNfVVJJW2FyY2hpdmUuc2hhMjU2c3VtXSA9ICJiM2JhM2Q2ODIx
M2U4N2Y4MWYxNzMzZTg1NTAwYzM3YjgyYjU5MzhmOTAwOWU0ZmU4OTk5NDk2M2Q1ZmIyYjhlIgog
CiAjIERldmVsb3BlciBtb2RlIGVuYWJsZXMgZGVidWdnaW5nCiBQQUNLQUdFQ09ORklHW2RldmVs
b3Blci1tb2RlXSA9ICItRGRldmVsb3Blcl9tb2RlPXRydWUsLURkZXZlbG9wZXJfbW9kZT1mYWxz
ZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhl
bHAtbWVzb24uYnVpbGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvMDAwMi1oZWxwLW1lc29uLmJ1aWxkLWRpc2FibGUtdGhl
LXVzZS1vZi15ZWxwLnBhdGNoCmluZGV4IDZjMDBhYjliNDAuLjI1MDU1ZjViY2UgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy8wMDAyLWhlbHAtbWVzb24uYnVp
bGQtZGlzYWJsZS10aGUtdXNlLW9mLXllbHAucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWdub21l
L2VwaXBoYW55L2ZpbGVzLzAwMDItaGVscC1tZXNvbi5idWlsZC1kaXNhYmxlLXRoZS11c2Utb2Yt
eWVscC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTEwNDVlY2U0MWZhZWZiZWFjMTRiNjBk
N2IxOWIwYzY1MmU1ODZmYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMzc1MjNlNmQ5
NTc4M2NiNmYxYjM2MWE4Y2FkZmVhMDlkZDdkMGNlZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTog
V2VkLCAzMSBKYW4gMjAxOCAxNTo1MDozOCArMDIwMAogU3ViamVjdDogW1BBVENIXSBoZWxwL21l
c29uLmJ1aWxkOiBkaXNhYmxlIHRoZSB1c2Ugb2YgeWVscApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWdub21lL2VwaXBoYW55L2ZpbGVzL2Rpc3RyaWJ1dG9yLnBhdGNoCmluZGV4IDU0YTMzMDVhYWYu
LmY4OGY5NzU5NDIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxl
cy9kaXN0cmlidXRvci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmls
ZXMvZGlzdHJpYnV0b3IucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDQ2MDg0ZGEwM2I1ZjIw
NDIzYTI5NDZkOTg4YzY4ZTllYTkzMzljOWMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDdkNmE2NGYzYTE3YTJmN2NiZWNjZTk5ZjllYzgyZDZiYjU0MmZjYWUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3Vu
ZGF0aW9uLm9yZz4KIERhdGU6IEZyaSwgMjYgRmViIDIwMjEgMTA6MTc6NTIgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRG9uJ3QgZW5jb2RlIHRoZSBkaXN0cm8gZnJvbSAvZXRjL29zLXJlbGVhc2Ug
aW50byB0aGUKQEAgLTExLDcgKzExLDcgQEAgUlAgMjAyMS8yLzI2CiAgMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9tZXNvbi5idWlsZCBiL21lc29uLmJ1aWxk
Ci1pbmRleCBkZjAzNDBjLi44ZWM2Yzc5IDEwMDY0NAoraW5kZXggYmEwOTMzMy4uNDlhMmFhOCAx
MDA2NDQKIC0tLSBhL21lc29uLmJ1aWxkCiArKysgYi9tZXNvbi5idWlsZAogQEAgLTE1LDYgKzE1
LDcgQEAgaWYgci5yZXR1cm5jb2RlKCkgPT0gMApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWdu
b21lL2VwaXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWdub21lL2Vw
aXBoYW55L2ZpbGVzL21pZ3JhdG9yLnBhdGNoCmluZGV4IDhlYmNkYzk5OTEuLmVmZjEwODllMmQg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9lcGlwaGFueS9maWxlcy9taWdyYXRvci5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZXBpcGhhbnkvZmlsZXMvbWlncmF0b3IucGF0
Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGNhNTA0MzcwYjlhYTg5M2NlYWMyMTE0MWQ4ZjI0ZTI4
YTQ3NGI2NzQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDY4NjIxMmQ1MjQ4ZWYzMGI0
MjkzZTQyNDAxNzg5Y2IyZmI4NTM4NzIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBS
aWNoYXJkIFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6
IFRodSwgMjUgRmViIDIwMjEgMTQ6NTI6MzIgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gZXBpcGhh
bnk6IEZpeCByZXByb2R1Y2liaWxpdHkgaXNzdWUKLS0gCjIuNDcuMQoK

--===============9053549108655497519==--

