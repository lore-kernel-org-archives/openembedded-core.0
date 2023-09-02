Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89C0ECCF97A
	for <webhook@archiver.kernel.org>; Sat,  2 Sep 2023 10:29:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.5734.1693650554029144069
 for <openembedded-core@lists.openembedded.org>;
 Sat, 02 Sep 2023 03:29:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=VIU5htXl;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=igpIXM1D;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101018a55708f17-072178db-c752-4550-a2ae-bffa34d4436b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ZyaPg2XHWw3F935El0UPGrktPCpIbC2UJHp8hCw9z0A=;
	b=VIU5htXlsBa3czBPaPjjBUw0fTqWBqpIvkJntpx/FRp4YhldJ7243XKa533wa930
	EeURP7MT6EfB5yHTjXgUUKGNW7uTMaJK6aqfVfxKgj0rWxuTyQ15IhqFblJGEmWKxJh
	qvVFig+4ZYyBMmCut52Xvap4slT9DFoVd2eYob0w=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1693650554;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ZyaPg2XHWw3F935El0UPGrktPCpIbC2UJHp8hCw9z0A=;
	b=igpIXM1Dt6MgXqCMPPektc3wKcdUhAayP9sssf2qHu5XiFEHHvlccVDWHAG2NWih
	m2/ZiwW05KyTAJjFYq/JR3uJttyI9LqokiIw0hXwu+OUtDnkoqhkyE1J+7jfJ0KjQUD
	4tmvtsxYDEAeB4JDRZbqBeLWJ0w1RZsJcPzl0xfQ=
Content-Type: multipart/mixed; boundary="===============8370047939843152935=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.12.1 SUCCEEDED
Message-ID: <0101018a55708f17-072178db-c752-4550-a2ae-bffa34d4436b-000000@us-west-2.amazonses.com>
Date: Sat, 2 Sep 2023 10:29:14 +0000
Feedback-ID: 1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2023.09.02-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 02 Sep 2023 10:29:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/187106

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe *gtk4* to *4.12.1* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.12.0-4.12.1.patch
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
From 17fcfd6f1e22351ee9af8e0d58a289ebadeec2c7 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Sep 2023 23:37:29 +0000
Subject: [PATCH] gtk4: upgrade 4.12.0 -> 4.12.1

---
 meta/recipes-gnome/gtk+/{gtk4_4.12.0.bb => gtk4_4.12.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.12.0.bb => gtk4_4.12.1.bb} (98%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
similarity index 98%
rename from meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
index 4f38e0cb2c..aa7115b11e 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.12.0.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb
@@ -37,7 +37,7 @@ MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
 UPSTREAM_CHECK_REGEX = "gtk-(?P<pver>\d+\.(\d*[02468])+(\.\d+)+)\.tar.xz"
 
 SRC_URI = "http://ftp.gnome.org/pub/gnome/sources/gtk/${MAJ_VER}/gtk-${PV}.tar.xz"
-SRC_URI[sha256sum] = "a6d10829f405b1afc0b65e2a9642c04126a1d1b638d11c6d97426da4f84f1f6f"
+SRC_URI[sha256sum] = "b8b61d6cf94fac64bf3a0bfc7af137c9dd2f8360033fdeb0cfe9612b77a99a72"
 
 S = "${WORKDIR}/gtk-${PV}"
 
-- 
2.39.2


--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuppc.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 70 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuppc sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "powerpc-poky-linux"
MACHINE              = "qemuppc"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b93957af14fdeced9bac798428317b64594e6425"
TUNE_FEATURES        = "m32 fpu-hard ppc7400 altivec bigendian"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93957af14fdeced9bac798428317b64594e6425"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 289 Local 127 Mirrors 0 Missed 162 Current 1096 (43% match, 88% complete)
Removing 4 stale sstate objects for arch ppc7400...done.
Removing 5 stale sstate objects for arch qemuppc...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1100 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1127 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1132 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1167 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1171 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1173 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1176 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1233 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1283 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1290 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1346 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1347 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1352 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1353 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/ppc7400-poky-linux/vala/0.56.8/temp/log.do_packagedata_setscene.3594835
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1358 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1361 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1362 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1367 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1430 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1587 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1588 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1664 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running setscene task 1372 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1707 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 1722 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1723 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1780 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 1800 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1822 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 1823 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: recipe gcc-cross-powerpc-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1855 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1856 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: Running task 1858 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: Running task 1916 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1917 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1918 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1919 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: Running task 1950 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 1962 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1963 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1964 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1965 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1966 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2002 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-powerpc-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1385 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2480 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2619 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 2643 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2667 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2672 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2684 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2685 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2709 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2724 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2745 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: Setscene tasks completed
NOTE: Running task 2761 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2795 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: Running task 2803 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2804 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 2805 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2839 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2840 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: Running task 2841 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 2842 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 2858 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: Running task 2859 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: Running task 2873 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: Running task 2874 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2875 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 2876 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2877 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2878 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2885 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 2886 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 2887 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2888 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2889 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2927 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 2928 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 2929 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 2930 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2931 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 2937 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 2938 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 2939 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: Running task 2940 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: Running task 2953 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 2954 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: Running task 2958 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2969 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2970 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: Running task 2971 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running task 2976 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: Running task 2981 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 2982 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 2985 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2994 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: Running task 2999 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3040 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 3059 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3060 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 3061 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 3062 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 3063 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3064 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 7568d355d9c9c8ce2f4df915a11aa6dcfb33f13fac4dcb464666b2b9b9ba02ef
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 3076 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3080 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 3082 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3083 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 3086 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 3087 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 3088 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 3095 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 3096 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 3097 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3098 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: Running task 3099 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3100 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 3103 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: Running task 3104 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: Running task 3105 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3106 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: Running task 3107 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: Running task 3108 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3109 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: Running task 3123 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 3124 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 3125 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running task 3154 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 3167 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: Running task 3179 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3191 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3202 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3218 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: Running task 3219 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 3227 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 3228 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 3236 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3237 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3238 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 3244 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3245 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3246 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3252 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3262 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3263 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3271 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3272 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3273 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 3288 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: Running task 3289 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3292 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3344 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3371 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3372 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3407 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3408 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 3409 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3410 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3411 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3421 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3422 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 3431 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: Running task 3432 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3433 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3434 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3435 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3436 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 3437 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3438 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 3439 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: Running task 3440 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: Running task 3441 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3442 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: Running task 3443 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3444 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: Running task 3445 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: Running task 3446 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3459 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Started
NOTE: Running task 3460 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3461 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: Running task 3462 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 3463 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3470 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3471 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3473 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 3480 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3481 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 9817e6a4efa6dd3c576432bcaa0a5cf193db4cf18a5504b969245390a17b5548
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 116ded368e339a3782cf16f2df0bded78f36fecba5a41675b8fb19a6fc6416d4 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '191b92c30d7f2b1e28211cd7551b26acc871d39c67c7a4606c59bf1b92b9498d', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '116ded368e339a3782cf16f2df0bded78f36fecba5a41675b8fb19a6fc6416d4'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 191b92c30d7f2b1e28211cd7551b26acc871d39c67c7a4606c59bf1b92b9498d -> 116ded368e339a3782cf16f2df0bded78f36fecba5a41675b8fb19a6fc6416d4 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3494 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3507 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3508 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3509 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: Running task 3511 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3515 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3516 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 3517 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3523 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3524 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3525 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3526 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: Running task 3527 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Started
NOTE: Running task 3548 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3585 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3588 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3590 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3591 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3592 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3593 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3594 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3595 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3596 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 3597 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3598 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3599 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3600 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: Running task 3601 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic unihash changed to 054c4bb5170b04f7cfcdb6e90d2623c13ad1cc4f6bc88596b6be3bd4f8e928f4
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: Running task 3602 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3603 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3604 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3605 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3611 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: Running task 3612 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3613 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3614 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3615 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: Running task 3616 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3617 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3618 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3619 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3620 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: Running task 3621 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3622 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3623 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3624 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3625 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: Running task 3626 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: Running task 3627 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3628 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3629 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3630 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3631 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: Running task 3632 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3633 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3634 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3635 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3636 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3637 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: Running task 3638 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3640 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: Running task 3641 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3642 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3644 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: Running task 3645 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3646 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3647 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3648 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3649 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3650 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3651 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3652 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3653 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3654 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3655 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3656 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3657 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3658 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: Running task 3659 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3660 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3661 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3662 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3663 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 3664 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3665 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3666 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 3667 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3668 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3669 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3670 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3671 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: Running task 3672 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3673 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3674 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: Running task 3675 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3676 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3677 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3678 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3679 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3680 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3681 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3682 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3683 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3684 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3685 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3687 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3688 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3689 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3690 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3691 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3692 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3693 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3694 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3695 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3696 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3697 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3698 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3699 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3700 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3701 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3702 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3703 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3704 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: Running task 3705 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3706 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3707 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3708 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3709 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3710 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3711 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3712 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3713 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3714 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3715 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3716 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3717 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3718 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3719 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3720 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3721 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3722 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3723 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3724 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3725 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3726 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3727 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3728 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3729 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3730 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3731 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3732 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3733 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3734 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3735 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3736 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3737 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3738 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3739 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3740 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3741 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3742 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3743 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3744 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3745 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3746 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3747 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3748 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3749 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3750 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3751 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3752 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3753 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3754 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3755 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3756 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3757 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3758 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3759 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3760 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3761 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3762 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3763 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3764 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3765 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3766 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3767 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3768 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_configure)
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Succeeded
NOTE: Running task 3769 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_compile)
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3770 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3771 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3772 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Succeeded
NOTE: Running task 3773 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_install)
NOTE: recipe gtk4-4.12.1-r0: task do_install: Started
NOTE: recipe gtk4-4.12.1-r0: task do_install: Succeeded
NOTE: Running task 3774 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package)
NOTE: Running task 3775 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_package: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package: Succeeded
NOTE: Running task 3776 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_packagedata)
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3777 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_spdx)
NOTE: Running task 3778 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_write_rpm)
NOTE: Running task 3779 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_qa)
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3780 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3781 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3781 tasks of which 3409 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 30644300 to 30650320 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.1200.0", added "/usr/lib/.debug/libgtk-4.so.1.1200.1"
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dbg: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 14509752 to 14511772 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-dev: RDEPENDS: added "wayland-dev libx11-dev"
packages/core2-32-poky-linux/gtk4/gtk4-dev: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-doc: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kg: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGSIZE changed from 102362 to 106824 (+4%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGSIZE changed from 97969 to 106605 (+9%)
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tk: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-printbackend-file: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 40261449 to 40266929 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4-src: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-src: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4/gtk4: PKGSIZE changed from 13510514 to 13510562 (+0%)
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1200.0", added "/usr/lib/libgtk-4.so.1.1200.1"
packages/core2-32-poky-linux/gtk4/gtk4: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4/gtk4: PV changed from "4.12.0" to "4.12.1"
packages/core2-32-poky-linux/gtk4: SRC_URI changed from "http://ftp.gnome.org/pub/gnome/sources/gtk/4.12/gtk-4.12.0.tar.xz" to "http://ftp.gnome.org/pub/gnome/sources/gtk/4.12/gtk-4.12.1.tar.xz"
packages/core2-32-poky-linux/gtk4: PKGV changed from 4.12.0 [default] to 4.12.1 [default]
packages/core2-32-poky-linux/gtk4: PV changed from "4.12.0" to "4.12.1"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1200.0 to libgtk-4.so.1.1200.1
  /usr/lib/libgtk-4.so.1.1200.0 moved to /usr/lib/libgtk-4.so.1.1200.1

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86_musl.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 50 skipped, 0 masked, 0 errors.
Removing 119 recipes from the core2-32 sysroot...done.
Removing 124 recipes from the qemux86 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "i686-poky-linux-musl"
MACHINE              = "qemux86"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b93957af14fdeced9bac798428317b64594e6425"
TUNE_FEATURES        = "m32 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93957af14fdeced9bac798428317b64594e6425"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 842 Local 670 Mirrors 0 Missed 172 Current 535 (79% match, 87% complete)
Removing 7 stale sstate objects for arch x86_64...done.
Removing 7 stale sstate objects for arch qemux86...done.
Removing 18 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 536 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 538 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/coreutils/coreutils_9.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 541 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 542 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 543 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/timezone/tzdata.bb:do_packagedata_setscene)
NOTE: Running setscene task 558 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_package_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Started
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 559 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_populate_sysroot_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 560 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 573 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_create_spdx_setscene)
NOTE: Running setscene task 580 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 589 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 598 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 602 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 603 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 611 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 618 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 626 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe tzdata-2023c-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 709 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 710 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 711 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 712 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 719 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 724 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_create_spdx_setscene)
NOTE: Running setscene task 730 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 757 of 1377 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 765 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.17.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 766 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 770 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/acl_2.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 772 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 774 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap/libcap_2.69.bb:do_packagedata_setscene)
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 776 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 777 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 781 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 783 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 786 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 787 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.2+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 792 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_package_setscene)
NOTE: recipe librsvg-native-2.56.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 796 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_package_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libcap-2.69-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 802 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 808 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 809 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_create_spdx_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe librsvg-native-2.56.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe acl-2.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 820 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 821 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 823 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/curl/curl_8.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_package_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r3: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 824 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 825 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 826 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: recipe initscripts-1.0-r155: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 831 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_create_spdx_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 834 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 836 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_create_spdx_setscene)
NOTE: Running setscene task 838 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 843 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libidn/libidn2_2.3.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 844 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 845 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 1106 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1107 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: Running task 1164 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1187 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 1190 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1191 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1238 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1258 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1267 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 1268 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1295 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_recipe_qa)
NOTE: Running task 1296 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1297 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: Running task 1298 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1344 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1345 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1346 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1347 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: recipe libstd-rs-1.70.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 1373 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running setscene task 847 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 848 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 849 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 850 of 1377 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/cargo_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1383 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1384 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1385 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1386 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1387 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-protocols-1.32-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_recipe_qa: Started
NOTE: Running setscene task 851 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 852 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 853 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_create_spdx_setscene)
NOTE: recipe libidn2-2.3.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe util-linux-2.39.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 857 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: Running task 1482 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 1483 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 1486 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: Running task 1500 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: Running task 1544 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: Running task 1545 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: Running task 1552 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_recipe_qa)
NOTE: Running task 1553 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_recipe_qa)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: Running task 1637 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: recipe iso-codes-4.15.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_package_setscene: Succeeded
NOTE: recipe libunistring-1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_recipe_qa unihash changed to c85934a1964225b42b9daa36f2ae5e87cffd8ea02815bd3e767366f6e45c227b
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running setscene task 848 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 849 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 850 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 851 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 852 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 866 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 867 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 869 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunistring/libunistring_1.1.bb:do_recipe_qa_setscene)
NOTE: Running task 1667 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: Running task 1669 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_fetch)
NOTE: Running task 1670 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 1671 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 1672 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 1673 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_fetch)
NOTE: Running task 1674 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 1675 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_recipe_qa: Started
NOTE: Running task 1676 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 1677 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 1678 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 1679 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 1680 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 1681 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe libunwind-1.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 870 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_package_setscene)
NOTE: Running task 1693 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: Running setscene task 871 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 872 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_create_spdx_setscene)
NOTE: Running task 1715 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 871 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_create_spdx_setscene)
NOTE: Running task 1716 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 1717 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 1718 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1719 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 1720 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 1721 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 1745 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_recipe_qa: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 1763 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_recipe_qa unihash changed to 8571e4cbb0d735cf5736710e7b0c816bffe53a8cf598ee893c3bbdaa6b3ea61a
NOTE: recipe iso-codes-4.15.0-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_recipe_qa unihash changed to 5fbd0643202f8095c33c0a26852543555c67f011d4d6fcfd628613baeba6a63d
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_package_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1764 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: Running task 1765 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_unpack)
NOTE: Running task 1766 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 1767 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 1768 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: Running task 1769 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe bluez5-5.68-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 1770 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 1771 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 1772 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 1773 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 1774 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 1775 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: recipe libunistring-1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Started
NOTE: Running setscene task 874 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: Running task 1781 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_unpack)
NOTE: Running task 1782 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 1783 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: Running task 1784 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe desktop-file-utils-0.26-r0: task do_fetch: Succeeded
NOTE: Running task 1785 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 1786 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: Running task 1787 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_fetch)
NOTE: Running task 1788 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe cargo-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: Running task 1792 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: recipe libunwind-1.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: Running setscene task 877 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 879 of 1377 (virtual:native:/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/rust_1.70.0.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 1825 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 1826 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_unpack)
NOTE: recipe eudev-3.2.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 879 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_packagedata_setscene)
NOTE: Running task 1842 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1843 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 1844 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe readline-8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1845 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 883 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_fetch: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running setscene task 885 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/udev/eudev_3.2.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 886 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_populate_sysroot_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_fetch: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxml2-2.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_fetch: Succeeded
NOTE: Running setscene task 887 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_create_spdx_setscene)
NOTE: recipe iso-codes-4.15.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 1846 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_unpack)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: recipe libical-3.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 888 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 890 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libical/libical_3.0.16.bb:do_recipe_qa_setscene)
NOTE: Running task 1857 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Started
NOTE: Running task 1858 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_unpack)
NOTE: Running task 1859 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 1862 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: Running task 1863 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 892 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1865 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_fetch)
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_unpack: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 1866 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 1867 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 1868 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 1870 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1871 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 1872 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 1873 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 1874 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_patch)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1875 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: Running task 1876 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-32-poky-linux-musl/vala/0.56.8/temp/log.do_packagedata_setscene.4052702
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Started
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: Running setscene task 893 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 1882 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running setscene task 894 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 895 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 896 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 897 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 899 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_fetch: Started
NOTE: Running task 1888 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1889 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 1890 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_patch)
NOTE: recipe bluez5-5.68-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1891 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libical-3.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Started
NOTE: Running task 1896 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_unpack)
NOTE: Running task 1899 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: Running task 1900 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 1901 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 1902 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_patch: Succeeded
NOTE: Running task 1903 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: Running task 1904 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 901 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: Running task 1905 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1906 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_patch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe python3-3.11.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe kmod-30-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running setscene task 903 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: Running setscene task 906 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_create_spdx_setscene)
NOTE: Running setscene task 909 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 912 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: Running setscene task 917 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/kmod/kmod_30.bb:do_recipe_qa_setscene)
NOTE: Running task 1908 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 1909 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_patch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe bluez5-5.68-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 1910 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 1911 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 1912 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: Running task 1913 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 1915 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1916 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 1917 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1918 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 1919 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running setscene task 918 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_package_setscene)
NOTE: Running setscene task 919 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_package_setscene)
NOTE: recipe libucontext-1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Started
NOTE: recipe kmod-30-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 924 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 925 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1925 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1926 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_unpack)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 926 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package_setscene: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1927 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_deploy_source_date_epoch unihash changed to ee53c5ed6f55b20f8ebfac75141a97e835c576b7b4c4df2e864d8d60c2fcc195
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 1928 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 1929 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_unpack: Succeeded
NOTE: Running task 1930 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1931 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_patch)
NOTE: recipe util-macros-1_1.20.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 927 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_unpack: Succeeded
NOTE: Running task 1934 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_patch)
NOTE: Running task 1935 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: Running task 1936 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 1937 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_patch: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_configure: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_patch: Succeeded
NOTE: Running task 1938 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_compile)
NOTE: Running setscene task 929 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 1940 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_deploy_source_date_epoch)
NOTE: recipe adwaita-icon-theme-43-r0: task do_unpack: Succeeded
NOTE: Running task 1941 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_patch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_package_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe rust-native-1.70.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1942 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 932 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 933 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 935 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1973 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_compile: Succeeded
NOTE: Running task 1974 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_install)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1976 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_fetch)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_patch: Succeeded
NOTE: Running task 1978 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_fetch)
NOTE: Running task 1979 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_deploy_source_date_epoch)
NOTE: recipe bluez5-5.68-r0: task do_patch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_deploy_source_date_epoch unihash changed to d15907c3d703925c65979b30f32f60f477cd39f05cc23584ff371291ee24defc
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_package_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 1986 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_configure)
NOTE: Running setscene task 937 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 938 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 939 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 942 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 943 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 944 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 945 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 946 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 947 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 948 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 949 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 950 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 951 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 953 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_fetch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_fetch: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_configure: Started
NOTE: Running task 1988 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_unpack)
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.2-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1989 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.4+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 957 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.2-r0: task do_unpack: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_deploy_source_date_epoch unihash changed to 75fb2fae379507c49296ecde45578fa784783df0e44f84c1ef4cd751d4f106d5
NOTE: recipe libatomic-ops-7.8.0-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_install: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1993 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_fetch)
NOTE: Running task 1994 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package)
NOTE: recipe pango-1.50.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 962 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 963 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 964 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 966 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxkbcommon-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 970 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 972 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 973 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 976 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 978 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 980 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_fetch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2020 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_packagedata_setscene)
NOTE: recipe libucontext-1.2-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 2048 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe libxft-1_2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 992 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe fribidi-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.39-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 994 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 995 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 997 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2051 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2052 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.39.bb:do_recipe_qa_setscene)
NOTE: recipe icu-73-2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1004 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1005 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1006 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1008 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1009 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1010 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1011 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1013 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-8.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1015 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/cairo/cairo_1.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1016 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1017 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1018 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.39-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic unihash changed to 054c4bb5170b04f7cfcdb6e90d2623c13ad1cc4f6bc88596b6be3bd4f8e928f4
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_setscene)
NOTE: recipe icu-73-2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1021 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/icu/icu_73-2.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.14.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package: Succeeded
NOTE: recipe cairo-1.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2085 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata)
NOTE: recipe libxtst-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1027 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1029 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1033 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1034 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1036 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1037 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.14.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1041 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/dbus/dbus_1.14.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1042 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1043 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1044 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_23.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1046 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_packagedata_setscene)
NOTE: Running setscene task 1047 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1048 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_packagedata_setscene)
NOTE: Running setscene task 1049 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1050 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1051 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe icu-73-2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1054 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/pixman_0.42.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1056 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/fontconfig/fontconfig_2.14.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1057 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_23.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1060 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/mesa_23.1.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1063 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1064 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1065 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1067 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1068 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-passwd-3.6.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1073 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-passwd/base-passwd_3.6.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.14.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1074 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1076 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_package_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.42.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.14.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1080 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1082 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1084 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1087 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r155: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1089 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running task 2126 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx)
NOTE: recipe shadow-4.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1092 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2130 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe wayland-protocols-1.32-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_23.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1094 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1096 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/freetype/freetype_2.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx: Started
NOTE: recipe base-passwd-3.6.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1098 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1099 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1101 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.115-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1103 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-app/xrandr_1.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/drm/libdrm_2.4.115.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1108 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Started
NOTE: Running setscene task 1109 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1111 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-loader_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1112 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1114 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r155: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_fetch: Succeeded
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1117 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/shadow/shadow_4.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1118 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1119 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 2160 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 2161 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1122 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.22.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1123 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1127 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libice_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libpciaccess-0.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxxf86vm-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.115-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 2208 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running setscene task 1130 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxfixes_6.0.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.32-r0: task do_package_setscene: Succeeded
NOTE: Running task 2224 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_package_write_rpm)
NOTE: recipe libpciaccess-0.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpciaccess_0.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1134 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1136 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1139 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1140 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1141 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_patch: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1143 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/vulkan/vulkan-headers_1.3.250.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1146 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/attr/attr_2.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_package_write_rpm: Started
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2237 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_configure: Started
NOTE: recipe vulkan-headers-1.3.250.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1148 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxext_1.3.5.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1150 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1151 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_configure: Succeeded
NOTE: Running task 2264 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe libxrender-1_0.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1152 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1154 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxrender_0.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_compile: Succeeded
NOTE: recipe libxext-1_1.3.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2270 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxrender-1_0.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1156 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1157 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1158 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1159 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1160 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1161 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_packagedata_setscene)
NOTE: Running setscene task 1162 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1164 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1166 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1167 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1168 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1170 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1171 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1172 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1174 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.32-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1179 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.40-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1181 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libpng/libpng_1.6.40.bb:do_recipe_qa_setscene)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland-protocols_1.32.bb:do_package_write_rpm unihash changed to 849b20b4b193ee71380b4416f4a91118bb45357d6a977b00b20549ef46156cab
NOTE: Running setscene task 1182 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1183 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1185 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1186 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/xtrans_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1189 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1191 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.76.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1195 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1196 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_configure: Succeeded
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2288 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_compile)
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Started
NOTE: Running task 2289 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libpng-1.6.40-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_compile: Started
NOTE: recipe gobject-introspection-1.76.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1199 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1201 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xcb-proto_1.15.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1203 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxau_1.0.11.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1205 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1206 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1208 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1210 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_setscene)
NOTE: recipe libxau-1_1.0.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.15.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1212 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-util/util-macros_1.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Started
NOTE: Running setscene task 1214 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_compile: Succeeded
NOTE: Running task 2347 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_install)
NOTE: recipe iso-codes-4.15.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 2348 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 2349 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2350 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1215 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1216 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1217 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1218 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1221 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/libxml/libxml2_2.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1225 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 2357 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe shared-mime-info-2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe python3-3.11.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1227 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1228 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1229 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1231 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1232 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1234 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/python/python3_3.11.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1235 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 1236 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1237 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1239 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1241 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1242 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a1cc294b777438cf57075b2ade5a9c63b5460abf3eed3615217df9727300a7a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 815b80232bfa0888a0a7095536f3a367dd6de2bcbb2a5719778942fcde1468b0 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'b63d81c4af16c90bce53becf48713ecc7579a749d5c2e8ab6c1674b3f43eb329', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '815b80232bfa0888a0a7095536f3a367dd6de2bcbb2a5719778942fcde1468b0'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b63d81c4af16c90bce53becf48713ecc7579a749d5c2e8ab6c1674b3f43eb329 -> 815b80232bfa0888a0a7095536f3a367dd6de2bcbb2a5719778942fcde1468b0 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1243 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20221030-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1246 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libedit/libedit_20221030-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libnsl2-2.0.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.11.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1248 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1251 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/expat/expat_2.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1255 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libnsl/libnsl2_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1256 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.4.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1259 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1261 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/sqlite/sqlite3_3.42.0.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1263 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/openssl/openssl_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.23-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1266 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gdbm/gdbm_1.23.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20221030-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libnsl2-2.0.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.42.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtirpc-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.23-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1269 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/libtirpc/libtirpc_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtirpc-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1270 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1271 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1272 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1273 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1274 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1275 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1277 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1280 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe libffi-3.4.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1282 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libffi/libffi_3.4.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.42-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1283 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libpcre/libpcre2_10.42.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.4.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.42-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1288 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1290 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1293 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1295 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux_2.39.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1296 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1297 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1298 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1299 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1300 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1301 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1305 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/util-linux/util-linux-libuuid_2.39.1.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1308 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/bash-completion/bash-completion_2.11.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1310 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libcap-ng/libcap-ng_0.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1313 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/ncurses/ncurses_6.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1314 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1315 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.39.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1318 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1320 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/pam/libpam_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe cracklib-2.9.11-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1325 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_packagedata_setscene)
NOTE: Running setscene task 1326 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1329 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/cracklib/cracklib_2.9.11.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cracklib-2.9.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1331 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.2.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1335 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/zlib/zlib_1.2.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1336 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.2.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1338 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1340 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1341 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1343 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1344 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1346 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/libgcc_13.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1349 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1350 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1354 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1357 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.4+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1362 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1364 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1365 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1368 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1370 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_populate_sysroot_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-i686-13.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1371 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb:do_recipe_qa_setscene)
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-cross-i686-2.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1377 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/binutils/binutils-cross_2.41.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-i686-2.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3006 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 3097 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3098 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3193 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 3211 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3256 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3265 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3302 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3303 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3310 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: Running task 3356 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3357 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3377 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3378 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3379 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3380 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3388 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: Running task 3389 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3430 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3431 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: Running task 3448 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3449 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 3450 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_collect_spdx_deps)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 8e674b5c93ffaaba6f218d1060d51b2e2023bdc01969167a5eb944c404805895
NOTE: Running task 3459 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3474 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3475 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_packagedata)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: Running task 3480 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: Running task 3482 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3483 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: Running task 3484 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3485 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: recipe libatomic-ops-7.8.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3486 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3487 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.0.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3488 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 3489 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3490 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe libucontext-1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3501 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/musl/libucontext_1.2.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3506 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 3507 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3516 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: Running task 3517 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: Running task 3519 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: Running task 3520 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3528 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3529 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 3530 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3531 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3532 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3533 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3538 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3542 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe libatomic-ops-7.8.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.2-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3543 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3544 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3545 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3546 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_collect_spdx_deps)
NOTE: Running task 3553 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm)
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3554 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe bluez5-5.68-r0: task do_configure: Started
NOTE: Running task 3555 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: Running task 3556 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3557 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libunwind-1.6.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3558 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libunwind/libunwind_1.6.2.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3559 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_packagedata: Succeeded
NOTE: Running task 3560 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk+3_3.24.38.bb:do_create_spdx)
NOTE: recipe adwaita-icon-theme-43-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3561 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_configure)
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Started
NOTE: recipe libunwind-1.6.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3562 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe adwaita-icon-theme-43-r0: task do_configure: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3563 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3564 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3565 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3566 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3567 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3568 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3569 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3570 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_configure: Succeeded
NOTE: Running task 3571 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3572 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe adwaita-icon-theme-43-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3573 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe gtk+3-3.24.38-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: Running task 3574 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_collect_spdx_deps)
NOTE: recipe adwaita-icon-theme-43-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3575 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3576 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3577 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3578 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3579 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3580 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3581 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3582 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3583 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe iso-codes-4.15.0-r0: task do_install: Succeeded
NOTE: Running task 3584 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: Running task 3585 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_package)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_populate_sysroot: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3586 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_populate_sysroot unihash changed to 02dec1125f4b7aadc040c5a44d0affd0d1d44a4e43543a5b4a292f9e02d3e0bc
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3587 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe bluez5-5.68-r0: task do_configure: Succeeded
NOTE: Running task 3588 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_configure_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3589 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile)
NOTE: recipe bluez5-5.68-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3590 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3591 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3592 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3593 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3594 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3595 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: Running task 3596 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3597 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3598 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3599 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3600 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3602 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3603 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3604 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: Running task 3605 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3606 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3607 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: Running task 3608 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3609 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3610 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3611 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3612 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3613 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3614 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: Running task 3615 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: Running task 3616 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3617 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3618 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3619 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3620 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3621 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3622 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3623 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3624 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3625 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3626 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3627 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3628 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3629 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3630 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3631 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: Running task 3632 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3633 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3634 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3635 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: Running task 3636 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3637 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3638 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3639 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3640 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3641 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3642 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_compile_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3644 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_package: Succeeded
NOTE: Running task 3645 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3646 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3647 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3648 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3649 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx)
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3650 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3651 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3653 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: Running task 3654 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3655 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_compile: Succeeded
NOTE: Running task 3656 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_install)
NOTE: recipe adwaita-icon-theme-43-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3657 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: Running task 3658 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3659 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3660 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3661 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3662 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3663 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3664 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: Running task 3665 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3666 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3667 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3668 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3669 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3670 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3671 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3672 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3673 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3674 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3675 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3676 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3677 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3678 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3679 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3680 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3681 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3682 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: Running task 3683 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3684 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3685 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3687 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3688 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3689 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3690 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3691 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3692 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3693 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3694 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3695 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3696 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3697 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3698 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe bluez5-5.68-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3699 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install)
NOTE: recipe bluez5-5.68-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_install: Succeeded
NOTE: Running task 3700 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_install_ptest_base)
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Started
NOTE: recipe bluez5-5.68-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3701 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot)
NOTE: Running task 3704 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3705 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Started
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3706 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3707 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3708 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3709 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3710 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3711 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3712 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3713 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3714 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3715 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3716 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3717 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3718 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3719 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3720 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3721 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3722 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3723 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3724 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3725 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_install: Succeeded
NOTE: Running task 3726 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package)
NOTE: recipe adwaita-icon-theme-43-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3727 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3728 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3729 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3730 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3731 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3732 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3733 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_package: Succeeded
NOTE: Running task 3734 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata unihash changed to e2ad3bf8af6a3d6ff0a9c518a35bc2192921bc37d83853967f291539ec289e6f
NOTE: Setscene tasks completed
NOTE: Running task 3735 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_create_spdx)
NOTE: Running task 3736 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package_write_rpm)
NOTE: recipe adwaita-icon-theme-43-r0: task do_create_spdx: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_package_write_rpm: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3737 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3738 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3739 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3740 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe adwaita-icon-theme-43-r0: task do_package_write_rpm: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_package_write_rpm unihash changed to 8a1479c3ab961d9fe1a0b00cf82c9b3e7a4d28098f8f8aa15d3f1798592b93a1
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3741 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_configure)
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Succeeded
NOTE: Running task 3742 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_compile)
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3743 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3744 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3745 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Succeeded
NOTE: Running task 3746 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_install)
NOTE: recipe gtk4-4.12.1-r0: task do_install: Started
NOTE: recipe gtk4-4.12.1-r0: task do_install: Succeeded
NOTE: Running task 3747 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package)
NOTE: Running task 3748 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package: Succeeded
NOTE: Running task 3749 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_packagedata)
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3750 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_spdx)
NOTE: Running task 3751 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_write_rpm)
NOTE: Running task 3752 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_qa)
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3753 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3754 of 3754 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3754 tasks of which 3326 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 5 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8370047939843152935==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.12.0-4.12.1.patch"

RnJvbSAxN2ZjZmQ2ZjFlMjIzNTFlZTlhZjhlMGQ1OGEyODllYmFkZWVjMmM3IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBTZXAgMjAyMyAyMzozNzoyOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGd0
azQ6IHVwZ3JhZGUgNC4xMi4wIC0+IDQuMTIuMQoKLS0tCiBtZXRhL3JlY2lwZXMtZ25vbWUvZ3Rr
Ky97Z3RrNF80LjEyLjAuYmIgPT4gZ3RrNF80LjEyLjEuYmJ9IHwgMiArLQogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWdu
b21lL2d0aysve2d0azRfNC4xMi4wLmJiID0+IGd0azRfNC4xMi4xLmJifSAoOTglKQoKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4wLmJiIGIvbWV0YS9yZWNp
cGVzLWdub21lL2d0aysvZ3RrNF80LjEyLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5OCUKcmVuYW1l
IGZyb20gbWV0YS9yZWNpcGVzLWdub21lL2d0aysvZ3RrNF80LjEyLjAuYmIKcmVuYW1lIHRvIG1l
dGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4xLmJiCmluZGV4IDRmMzhlMGNiMmMuLmFh
NzExNWIxMWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4w
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4xMi4xLmJiCkBAIC0zNyw3
ICszNyw3IEBAIE1BSl9WRVIgPSAiJHtAb2UudXRpbHMudHJpbV92ZXJzaW9uKCIke1BWfSIsIDIp
fSIKIFVQU1RSRUFNX0NIRUNLX1JFR0VYID0gImd0ay0oP1A8cHZlcj5cZCtcLihcZCpbMDI0Njhd
KSsoXC5cZCspKylcLnRhci54eiIKIAogU1JDX1VSSSA9ICJodHRwOi8vZnRwLmdub21lLm9yZy9w
dWIvZ25vbWUvc291cmNlcy9ndGsvJHtNQUpfVkVSfS9ndGstJHtQVn0udGFyLnh6IgotU1JDX1VS
SVtzaGEyNTZzdW1dID0gImE2ZDEwODI5ZjQwNWIxYWZjMGI2NWUyYTk2NDJjMDQxMjZhMWQxYjYz
OGQxMWM2ZDk3NDI2ZGE0Zjg0ZjFmNmYiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiYjhiNjFkNmNm
OTRmYWM2NGJmM2EwYmZjN2FmMTM3YzlkZDJmODM2MDAzM2ZkZWIwY2ZlOTYxMmI3N2E5OWE3MiIK
IAogUyA9ICIke1dPUktESVJ9L2d0ay0ke1BWfSIKIAotLSAKMi4zOS4yCgo=

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemumips.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 64 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemumips sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "mips-poky-linux"
MACHINE              = "qemumips"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b93957af14fdeced9bac798428317b64594e6425"
TUNE_FEATURES        = "o32 bigendian fpu-hard mips32r2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93957af14fdeced9bac798428317b64594e6425"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 282 Local 126 Mirrors 0 Missed 156 Current 1087 (44% match, 88% complete)
Removing 4 stale sstate objects for arch mips32r2...done.
Removing 5 stale sstate objects for arch qemumips...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1091 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1118 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1123 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1146 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1157 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1158 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1162 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1164 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1167 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 1178 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1218 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1268 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1275 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1330 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1331 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1336 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1337 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/mips32r2-poky-linux/vala/0.56.8/temp/log.do_packagedata_setscene.3330630
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1342 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1345 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1346 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe glibc-locale-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1347 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1351 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: Running task 1425 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1582 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1583 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Started
NOTE: Running task 1660 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1687 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 1702 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1703 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1760 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 1780 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1802 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1832 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1833 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1835 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 1891 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1892 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1893 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1894 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1936 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1937 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1938 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1939 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 1940 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: Running task 2041 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2042 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2043 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1356 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2087 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2118 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2119 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: Running task 2128 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2159 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: Running task 2172 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2179 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2238 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: Running task 2245 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2268 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: Running task 2291 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe gcc-cross-mips-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running task 2316 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2327 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: Running task 2374 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: Running task 2411 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: Running task 2412 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2423 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2424 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2425 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: Running task 2426 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2427 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2428 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2429 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: Running task 2430 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2431 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2432 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2433 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gcc-cross-mips-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 2434 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1369 of 1369 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: Running task 2867 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 3028 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: Running task 3058 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: Running task 3061 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3062 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3074 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3114 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 3115 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 3146 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 3152 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3179 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 3183 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 3184 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 3221 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 3222 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 3223 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 3225 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 3245 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 3246 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 3247 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 3248 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 3259 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3260 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3261 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3266 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: Running task 3272 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 3274 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 3275 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 3276 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: Running task 3277 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3305 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 3315 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 3316 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: Running task 3320 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: Running task 3331 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: Running task 3332 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3333 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 3334 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 0b33c027f0202e62503cab7c451fbd457bbba674288a166b0ab8845afb7d30f6
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: Running task 3349 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: Running task 3350 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 3354 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: Running task 3361 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: Running task 3362 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 3363 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: Running task 3366 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3367 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 3368 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: Running task 3369 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: Running task 3374 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 3375 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3377 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 3378 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3379 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3380 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3381 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: Running task 3393 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 3401 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3402 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 3403 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: Running task 3404 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3413 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: Running task 3414 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: Running task 3419 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 3420 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3421 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3422 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3423 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: Running task 3424 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3425 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: Running task 3426 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3429 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: Running task 3435 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3436 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 3437 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3451 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 3452 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3453 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3454 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3455 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3456 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3457 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3458 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 3459 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3460 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3461 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3462 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3463 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: Running task 3464 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3465 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3466 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3467 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 3468 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 3469 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3470 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3476 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3477 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3478 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Started
NOTE: Running task 3479 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: Running task 3480 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3489 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: Running task 3497 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3498 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3499 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 3500 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 3501 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3502 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3503 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: Running task 3504 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: Running task 3505 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3506 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3514 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3516 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3518 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3519 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: Running task 3520 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3521 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Running task 3522 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 5a0aa8749c4947fab02dda4b951409725b6a3a9c7a5a5ec59338227ae49b9835
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash e9984f2a8b0bb9bc877c8d6e5fca156a069c3d790da6b5b68541728138ef2ba2 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'b214610221efb9d62380652c30bbbfe136717cc37db29a13036ad57da14dd4f9', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'e9984f2a8b0bb9bc877c8d6e5fca156a069c3d790da6b5b68541728138ef2ba2'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b214610221efb9d62380652c30bbbfe136717cc37db29a13036ad57da14dd4f9 -> e9984f2a8b0bb9bc877c8d6e5fca156a069c3d790da6b5b68541728138ef2ba2 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3540 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: Running task 3541 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3543 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3544 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_create_spdx)
NOTE: Running task 3550 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3551 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3552 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: Running task 3553 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3554 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3555 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3556 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 3557 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3558 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic)
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3559 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3560 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic unihash changed to 054c4bb5170b04f7cfcdb6e90d2623c13ad1cc4f6bc88596b6be3bd4f8e928f4
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3561 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3562 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3563 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3564 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3565 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3566 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3571 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: Running task 3572 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: Running task 3573 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: Running task 3574 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3575 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3576 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: Running task 3577 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3578 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3579 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3580 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3581 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3582 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3583 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3584 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3585 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3586 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3587 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3588 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3589 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3590 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3591 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: Running task 3592 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3593 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: Running task 3594 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3595 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: Running task 3596 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3597 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3598 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3599 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: Running task 3600 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3601 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3602 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3603 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3604 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3605 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3606 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3607 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3608 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3609 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3610 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3611 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3612 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3613 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3614 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3615 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3616 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3617 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3618 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3619 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: Running task 3620 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: Running task 3621 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3622 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3623 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3624 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3625 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3626 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: Running task 3627 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3628 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3629 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3630 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3631 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3632 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3633 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3634 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3635 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3636 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3637 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3638 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3639 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3640 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3641 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3642 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3643 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3644 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3645 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3646 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3647 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3648 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3649 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3650 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3651 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3653 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3654 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3655 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3656 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3657 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3658 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3659 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3660 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3661 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3662 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3663 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3664 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3665 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: Running task 3666 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3667 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3668 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3669 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3670 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3671 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3672 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3673 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3674 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3675 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3676 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3677 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3678 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3679 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3680 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3681 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3682 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3683 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3684 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3685 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3686 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3687 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3688 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3689 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3690 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3691 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3692 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3693 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3694 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3695 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3696 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3697 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3698 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3699 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3700 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3701 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3702 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3703 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3704 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3705 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3706 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3707 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3708 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3709 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3710 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3711 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3712 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: Running task 3713 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3714 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3715 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3716 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3717 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3718 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3719 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3720 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3721 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3722 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3723 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_configure)
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Succeeded
NOTE: Running task 3724 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_compile)
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3725 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3726 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3727 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Succeeded
NOTE: Running task 3728 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_install)
NOTE: recipe gtk4-4.12.1-r0: task do_install: Started
NOTE: recipe gtk4-4.12.1-r0: task do_install: Succeeded
NOTE: Running task 3729 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package)
NOTE: Running task 3730 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_package: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package: Succeeded
NOTE: Running task 3731 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_packagedata)
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3732 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_spdx)
NOTE: Running task 3733 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_write_rpm)
NOTE: Running task 3734 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_qa)
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3735 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3736 of 3736 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3736 tasks of which 3379 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

Loading cache...done.
Loaded 1809 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (898 cached, 1 parsed). 1807 targets, 37 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b93957af14fdeced9bac798428317b64594e6425"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93957af14fdeced9bac798428317b64594e6425"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 277 Local 115 Mirrors 0 Missed 162 Current 1116 (41% match, 88% complete)
Removing 3 stale sstate objects for arch core2-64...done.
Removing 5 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1120 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1143 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1167 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 1178 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1179 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1183 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1185 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1188 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 1199 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1209 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1245 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1295 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1299 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1300 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe update-rc.d-0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1353 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1354 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1355 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1356 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1361 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/core2-64-poky-linux/vala/0.56.8/temp/log.do_packagedata_setscene.2749462
NOTE: Running setscene task 1368 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1369 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1370 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1371 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1375 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Started
NOTE: Running task 1430 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: Running task 1595 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1596 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 1684 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1712 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1380 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 1742 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1743 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1800 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 1820 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1842 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1843 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: Running task 1875 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1876 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1878 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: Running task 1936 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1937 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1938 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: Running task 1939 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: Running task 1970 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: Running task 1982 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1983 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: Running task 1984 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1985 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1986 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: Running task 2015 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: Running task 2045 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe gcc-cross-x86_64-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running setscene task 1393 of 1393 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2492 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2655 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: Running task 2656 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Setscene tasks completed
NOTE: Running task 2684 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2689 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2690 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2702 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: Running task 2703 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2733 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: Running task 2748 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: Running task 2774 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: Running task 2775 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: Running task 2808 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2817 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2818 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2819 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: Running task 2853 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: Running task 2854 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: Running task 2855 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: Running task 2856 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 2885 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 2886 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: Running task 2887 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2888 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 2889 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2897 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: Running task 2898 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 2930 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: Running task 2931 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2932 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2933 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: Running task 2948 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: Running task 2975 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: Running task 2979 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2980 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2985 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: Running task 3010 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 3011 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 3012 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: Running task 3013 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 3014 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 3015 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: Running task 3016 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: Running task 3017 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 3018 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 3019 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 3020 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running task 3021 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: Running task 3027 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3028 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: Running task 3029 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: Running task 3030 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: Running task 3035 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3079 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: Running task 3080 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: Running task 3081 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 3082 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to d09c5a32b26f664d547f186926a3641ab5aaa30a571662d12e240218b0e77eee
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 3092 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: Running task 3098 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 3102 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 3106 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: Running task 3110 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: Running task 3111 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3112 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 3113 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: Running task 3114 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: Running task 3117 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot)
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3118 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 3119 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: Running task 3120 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 3121 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3122 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: Running task 3123 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3124 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 3125 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 3126 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 3127 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3128 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: Running task 3129 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3130 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: Running task 3131 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: Running task 3155 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: Running task 3174 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: Running task 3204 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3211 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 3225 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3226 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3228 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 3257 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: Running task 3258 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3259 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3260 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3261 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: Running task 3262 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3263 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3264 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: Running task 3265 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3266 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3267 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3268 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3288 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3296 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: Running task 3297 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 3298 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3299 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3316 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3317 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3318 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: Running task 3320 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3328 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: Running task 3329 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 3330 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 3331 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3401 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3435 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3436 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3438 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 3440 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3441 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3442 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3443 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: Running task 3444 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3445 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: Running task 3446 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3447 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3448 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3449 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3450 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3451 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 3452 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: Running task 3453 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3462 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3471 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: Running task 3472 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: Running task 3473 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3474 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 3475 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: Running task 3476 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: Running task 3495 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 3a34e87fb12bc478fce02fd1539f1bd8da47d021d6031c63048a9a21401fce53
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash f4c91e445a991870c34d6c29070417dfa2776e560c7c81c6f01d9bbfd5489db1 to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': 'b4f5ffc24feda53dc12c8973a92325768869c6090be8aac2e746231fe6a0c1c0', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'f4c91e445a991870c34d6c29070417dfa2776e560c7c81c6f01d9bbfd5489db1'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed b4f5ffc24feda53dc12c8973a92325768869c6090be8aac2e746231fe6a0c1c0 -> f4c91e445a991870c34d6c29070417dfa2776e560c7c81c6f01d9bbfd5489db1 as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3500 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: Running task 3502 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3516 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3517 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3518 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: Running task 3533 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: Running task 3534 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3535 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3539 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: Running task 3540 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3541 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: Running task 3542 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3548 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: Running task 3549 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3550 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: Running task 3551 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3552 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3573 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3611 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: Running task 3613 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3615 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3616 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3617 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3618 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: Running task 3619 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3620 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3621 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic unihash changed to 054c4bb5170b04f7cfcdb6e90d2623c13ad1cc4f6bc88596b6be3bd4f8e928f4
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3622 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3623 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3624 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3625 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: Running task 3626 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3627 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3628 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3629 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3630 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3631 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: Running task 3632 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3633 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3634 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3635 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: Running task 3636 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: Running task 3637 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3638 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3639 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3644 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: Running task 3645 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3646 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3647 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3648 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3649 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3650 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3651 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: Running task 3653 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3654 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: Running task 3655 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3656 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3657 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3658 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: Running task 3659 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: Running task 3661 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: Running task 3662 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3663 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3664 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3665 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3666 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3667 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3668 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: Running task 3669 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: Running task 3670 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3671 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: Running task 3672 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3673 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: Running task 3674 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: Running task 3675 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: Running task 3676 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3677 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: Running task 3678 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3679 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3680 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3681 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3682 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3683 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: Running task 3684 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3685 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: Running task 3686 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Running task 3687 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: Running task 3688 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3689 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3690 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3691 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3692 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: Running task 3693 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3694 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3695 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3696 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3697 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: Running task 3698 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: Running task 3699 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3700 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3701 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: Running task 3702 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3703 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3704 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3705 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3706 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3707 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: Running task 3708 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3709 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3710 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3711 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3712 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3713 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3714 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3715 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3716 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3717 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3718 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3719 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3720 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3721 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3722 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3723 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3724 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3725 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3726 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3727 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3728 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3729 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3730 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3731 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3732 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3733 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: Running task 3734 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3735 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3736 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3737 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3738 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3739 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3740 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: Running task 3741 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3742 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3743 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3744 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3745 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3746 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3747 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3748 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3749 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3750 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3751 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3752 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3753 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3754 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3755 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3756 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3757 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3758 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3759 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3760 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3761 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3762 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3763 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3764 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3765 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3766 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3767 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3768 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3769 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3770 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3771 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3772 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3773 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3774 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3775 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3776 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3777 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3778 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3779 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3780 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3781 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3782 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3783 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3784 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3785 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3786 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3787 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3788 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3789 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3790 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3791 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3792 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_configure)
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Succeeded
NOTE: Running task 3793 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_compile)
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3794 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3795 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3796 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Succeeded
NOTE: Running task 3797 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_install)
NOTE: recipe gtk4-4.12.1-r0: task do_install: Started
NOTE: recipe gtk4-4.12.1-r0: task do_install: Succeeded
NOTE: Running task 3798 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package)
NOTE: Running task 3799 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_package: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package: Succeeded
NOTE: Running task 3800 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_packagedata)
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3801 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_spdx)
NOTE: Running task 3802 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_write_rpm)
NOTE: Running task 3803 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_qa)
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3804 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3805 of 3805 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3805 tasks of which 3433 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm.txt"

Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 899 .bb files complete (0 cached, 899 parsed). 1807 targets, 54 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemuarm sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.4.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-gnueabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "4.2+snapshot-b93957af14fdeced9bac798428317b64594e6425"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 
meta-poky            
meta-yocto-bsp       = "tmp-auh-upgrades:b93957af14fdeced9bac798428317b64594e6425"
workspace            = "master:bdc74e5ff3c16fed24829fd494e5860754c08778"

Initialising tasks...done.
Sstate summary: Wanted 289 Local 127 Mirrors 0 Missed 162 Current 1096 (43% match, 88% complete)
Removing 5 stale sstate objects for arch qemuarm...done.
Removing 4 stale sstate objects for arch cortexa15t2hf-neon...done.
NOTE: Executing Tasks
NOTE: Running setscene task 1100 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1127 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc-locale_2.38.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1132 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gnome/adwaita-icon-theme_43.bb:do_packagedata_setscene)
NOTE: Running setscene task 1155 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1166 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/readline/readline_8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1167 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1171 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1173 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxkbcommon_1.5.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1176 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_packagedata_setscene)
NOTE: Running setscene task 1187 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1197 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libsm_1.2.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1233 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-extended/xz/xz_5.4.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1283 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libx11_1.8.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1290 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/iso-codes/iso-codes_4.15.0.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Started
NOTE: recipe glibc-locale-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe adwaita-icon-theme-43-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.5.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1346 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1347 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/wayland/wayland_1.22.0.bb:do_create_spdx_setscene)
NOTE: recipe libsm-1_1.2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.4.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1352 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/opkg-utils/opkg-utils_0.6.2.bb:do_create_spdx_setscene)
NOTE: recipe libx11-1_1.8.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1353 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcb_1.15.bb:do_create_spdx_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.68-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Started
NOTE: recipe opkg-utils-0.6.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe wayland-1.22.0-r0: task do_create_spdx_setscene: Succeeded
WARNING: Logfile for failed setscene task is /home/pokybuild/yocto-worker/auh/build/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-gnueabi/vala/0.56.8/temp/log.do_packagedata_setscene.3069436
WARNING: Setscene task (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1358 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_package_setscene)
NOTE: recipe libxcb-1.15-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1361 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/libtool/libtool-cross_2.4.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1362 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-proto/xorgproto_2023.2.bb:do_create_spdx_setscene)
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe glibc-locale-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-cross-2.4.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xorgproto-2023.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1363 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-runtime_13.2.bb:do_create_spdx_setscene)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.15.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1428 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gcc-runtime-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1367 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glibc/glibc_2.38.bb:do_create_spdx_setscene)
NOTE: Running task 1587 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1588 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_recipe_qa)
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Started
NOTE: Running task 1663 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_recipe_qa)
NOTE: Running task 1692 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_write_config)
NOTE: Running task 1707 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_recipe_qa)
NOTE: Running task 1708 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa)
NOTE: Running task 1765 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_recipe_qa)
NOTE: Running task 1785 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_recipe_qa)
NOTE: Running task 1807 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_recipe_qa)
NOTE: Running task 1808 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_recipe_qa)
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Started
NOTE: Running task 1840 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_recipe_qa)
NOTE: Running task 1841 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_recipe_qa)
NOTE: Running task 1842 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Started
NOTE: Running task 1901 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_recipe_qa)
NOTE: Running task 1902 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1903 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_recipe_qa)
NOTE: Running task 1904 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_recipe_qa)
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Started
NOTE: Running task 1935 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_write_config)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Started
NOTE: Running task 1947 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa)
NOTE: Running task 1948 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa)
NOTE: Running task 1949 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_recipe_qa)
NOTE: Running task 1950 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_recipe_qa)
NOTE: Running task 1951 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_recipe_qa)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Started
NOTE: Running task 2059 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_write_config)
NOTE: Running task 2060 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_write_config)
NOTE: Running task 2061 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_recipe_qa)
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Started
NOTE: recipe glibc-2.38-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Started
NOTE: Running setscene task 1372 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/gcc/gcc-cross_13.2.bb:do_create_spdx_setscene)
NOTE: Running task 2131 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_fetch)
NOTE: Running task 2136 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: Running task 2137 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_write_config)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2158 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_fetch)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe orc-0.4.34-r0: task do_write_config: Started
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Started
NOTE: recipe libusb1-1.0.26-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2219 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2233 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_fetch)
NOTE: Running task 2243 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_fetch)
NOTE: Running task 2256 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_write_config)
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Started
NOTE: recipe flac-1.4.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Started
NOTE: Running task 2293 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_write_config: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_write_config: Succeeded
NOTE: Running task 2351 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Started
NOTE: recipe libtheora-1.1.1-r1: task do_recipe_qa: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_recipe_qa: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_recipe_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Started
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Started
NOTE: Running task 2380 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_fetch)
NOTE: Running task 2381 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_fetch)
NOTE: Running task 2386 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_fetch)
NOTE: recipe gcc-cross-arm-13.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_recipe_qa: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_fetch: Succeeded
NOTE: Running task 2430 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_fetch)
NOTE: Running task 2436 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_unpack)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Started
NOTE: recipe libgudev-237-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2442 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2443 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2444 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_fetch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Started
NOTE: Running task 2445 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_recipe_qa: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_fetch: Succeeded
NOTE: Running task 2446 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_fetch)
NOTE: Running task 2447 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_unpack)
NOTE: recipe libvorbis-1.3.7-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_write_config: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2448 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2449 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_unpack)
NOTE: recipe librsvg-2.56.3-r0: task do_recipe_qa: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_fetch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r90: task do_install: Succeeded
NOTE: Running task 2450 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_unpack)
NOTE: Running task 2451 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_fetch)
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Started
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Started
NOTE: recipe tiff-4.5.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2452 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_fetch)
NOTE: Running task 2453 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_fetch)
NOTE: recipe libgudev-237-r0: task do_recipe_qa: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_fetch: Succeeded
NOTE: Running task 2454 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_write_config: Succeeded
NOTE: Running task 2455 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_unpack)
NOTE: Running task 2456 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_fetch)
NOTE: recipe libusb1-1.0.26-r0: task do_fetch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Started
NOTE: Running task 2457 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_unpack)
NOTE: recipe gtk4-4.12.1-r0: task do_recipe_qa: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Started
NOTE: recipe orc-0.4.34-r0: task do_fetch: Started
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Started
NOTE: Running task 2458 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_fetch)
NOTE: recipe gcc-cross-arm-13.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_fetch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_fetch: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_write_config: Succeeded
NOTE: recipe sbc-2.0-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Started
NOTE: recipe sbc-2.0-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_fetch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_package: Started
NOTE: recipe tiff-4.5.1-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_fetch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Started
NOTE: recipe vala-0.56.8-r0: task do_package_setscene: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Started
NOTE: recipe libogg-1.3.5-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Started
NOTE: Running setscene task 1385 of 1385 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe libgudev-237-r0: task do_fetch: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_fetch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_unpack: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_unpack: Succeeded
NOTE: Running task 2897 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_unpack: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3060 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_patch)
NOTE: Running task 3063 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Started
NOTE: Running task 3093 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3094 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3106 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_patch)
NOTE: Running task 3146 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_patch)
NOTE: Running task 3147 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_patch)
NOTE: Running task 3178 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_patch)
NOTE: Running task 3184 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_unpack)
NOTE: Running task 3214 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_unpack)
NOTE: Running task 3215 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_unpack)
NOTE: Running task 3216 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Started
NOTE: Running task 3255 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_unpack)
NOTE: Running task 3256 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_unpack)
NOTE: Running task 3257 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_unpack)
NOTE: Running task 3259 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Started
NOTE: Running task 3268 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_prepare_recipe_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_patch: Succeeded
NOTE: Running task 3280 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_unpack)
NOTE: Running task 3281 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_unpack)
NOTE: Running task 3282 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_deploy_source_date_epoch)
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3283 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_unpack)
NOTE: Running task 3284 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_unpack)
NOTE: Running task 3295 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Started
NOTE: Running task 3296 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Started
NOTE: Running task 3301 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/vala/vala_0.56.8.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_patch: Started
NOTE: Running task 3307 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: Running task 3308 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: Running task 3310 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_unpack)
NOTE: Running task 3311 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_unpack)
NOTE: Running task 3313 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_unpack)
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Started
NOTE: Running task 3340 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe flac-1.4.3-r0: task do_patch: Succeeded
NOTE: Running task 3345 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Started
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_unpack: Started
NOTE: Running task 3363 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_unpack)
NOTE: Running task 3365 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe libvorbis-1.3.7-r0: task do_patch: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 3366 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_deploy_source_date_epoch)
NOTE: Running task 3367 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_patch)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3368 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe alsa-lib-1.2.9-r0: task do_patch: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_unpack: Succeeded
NOTE: Running task 3369 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_deploy_source_date_epoch)
NOTE: Running task 3370 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_patch)
NOTE: recipe libwebp-1.3.1-r0: task do_unpack: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 3371 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_patch)
NOTE: recipe libusb1-1.0.26-r0: task do_patch: Succeeded
NOTE: recipe libgudev-237-r0: task do_unpack: Started
NOTE: Running task 3372 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_deploy_source_date_epoch)
NOTE: Running task 3373 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Started
NOTE: Running task 3374 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_patch)
NOTE: Running task 3375 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r90: task do_populate_sysroot: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Started
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to f982a4123a6cd558c191245ca50978150707844bc8d5e1992485a942d8fdeede
NOTE: recipe libsndfile1-1.2.0-r0: task do_unpack: Succeeded
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe sbc-2.0-r0: task do_unpack: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: Running task 3387 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Started
NOTE: Running task 3390 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3393 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_patch)
NOTE: recipe libgudev-237-r0: task do_unpack: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3396 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_patch)
NOTE: Running task 3397 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_patch)
NOTE: Running task 3404 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Started
NOTE: recipe tiff-4.5.1-r0: task do_unpack: Succeeded
NOTE: Running task 3407 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_populate_sysroot)
NOTE: recipe libtheora-1.1.1-r1: task do_unpack: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_patch: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3408 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_configure)
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: Running task 3409 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_patch)
NOTE: Running task 3410 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: Running task 3411 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_patch)
NOTE: Running task 3413 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe base-files-3.0.14-r90: task do_package: Succeeded
NOTE: Running task 3418 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe sbc-2.0-r0: task do_patch: Started
NOTE: recipe libxv-1.0.12-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Started
NOTE: Running task 3430 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3431 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_patch: Succeeded
NOTE: Running task 3439 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe sbc-2.0-r0: task do_patch: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_patch: Started
NOTE: Running task 3440 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_patch)
NOTE: Running task 3441 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_deploy_source_date_epoch)
NOTE: recipe libwebp-1.3.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3442 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3443 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_collect_spdx_deps)
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_patch: Succeeded
NOTE: Running task 3451 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_deploy_source_date_epoch)
NOTE: recipe vala-0.56.8-r0: task do_packagedata: Succeeded
NOTE: Running task 3455 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe libgudev-237-r0: task do_patch: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3456 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_deploy_source_date_epoch)
NOTE: Running task 3457 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_deploy_source_date_epoch)
NOTE: recipe libvorbis-1.3.7-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3464 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_collect_spdx_deps)
NOTE: recipe alsa-lib-1.2.9-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 3465 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3466 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3467 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_collect_spdx_deps)
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Started
NOTE: recipe libogg-1.3.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_unpack: Succeeded
NOTE: Running task 3468 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/jpeg/libjpeg-turbo_3.0.0.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3469 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_patch)
NOTE: Running task 3475 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libtheora-1.1.1-r1: task do_patch: Succeeded
NOTE: Running task 3480 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure)
NOTE: recipe orc-0.4.34-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3481 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_deploy_source_date_epoch)
NOTE: Running task 3482 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3492 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3493 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_collect_spdx_deps)
NOTE: recipe tiff-4.5.1-r0: task do_patch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Started
NOTE: Running task 3494 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3495 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_collect_spdx_deps)
NOTE: recipe fribidi-1.0.13-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3496 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/fribidi/fribidi_1.0.13.bb:do_create_spdx)
NOTE: recipe libglu-2_9.0.2-r0: task do_patch: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3497 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3498 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r90: task do_packagedata: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to f561b45f6c5e241d6ad9ef43d77edcf1f3a5b9f911a27c22eff9209cd0f9544a
NOTE: Reported task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 465bc5f3d9f53accc7dd0b932bfddfef226f0648cbc6b0e6ff82ef7ceaae0fdf to unix:///home/pokybuild/yocto-worker/auh/build/build/build/hashserve.sock ({'taskhash': '9427cafe31e0a29f9b94ffb1090e868b297f321faab5795337fbe608410cce44', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '465bc5f3d9f53accc7dd0b932bfddfef226f0648cbc6b0e6ff82ef7ceaae0fdf'})
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 9427cafe31e0a29f9b94ffb1090e868b297f321faab5795337fbe608410cce44 -> 465bc5f3d9f53accc7dd0b932bfddfef226f0648cbc6b0e6ff82ef7ceaae0fdf as wanted
NOTE: Already covered setscene for /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3501 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libxft-1_2.3.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_patch: Succeeded
NOTE: Running task 3504 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_patch)
NOTE: Running task 3505 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: recipe sbc-2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Started
NOTE: Running task 3507 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_deploy_source_date_epoch)
NOTE: recipe alsa-lib-1.2.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3514 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxft_2.3.8.bb:do_create_spdx)
NOTE: recipe libwebp-1.3.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libgudev-237-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3515 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_configure)
NOTE: Running task 3522 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3523 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_create_spdx)
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe harfbuzz-8.1.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Started
NOTE: Running task 3524 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/harfbuzz/harfbuzz_8.1.1.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3525 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3526 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch)
NOTE: Running task 3527 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: recipe orc-0.4.34-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libstd-rs-1.70.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Started
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Started
NOTE: Running task 3528 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxi_1.8.1.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Started
NOTE: Running task 3529 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/rust/libstd-rs_1.70.0.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3530 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: recipe libtheora-1.1.1-r1: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3533 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3534 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libglu-2_9.0.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3535 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_configure)
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3536 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_configure)
NOTE: Running task 3537 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_configure)
NOTE: recipe librsvg-2.56.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3538 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_populate_sysroot: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Started
NOTE: Running task 3539 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxcursor_1.2.1.bb:do_create_spdx)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: Running task 3550 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3551 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_configure)
NOTE: Running task 3552 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_patch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Started
NOTE: Running task 3553 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_deploy_source_date_epoch)
NOTE: Running task 3555 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_collect_spdx_deps)
NOTE: recipe libgudev-237-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libjpeg-turbo-1_3.0.0-r0: task do_create_spdx: Succeeded
NOTE: recipe fribidi-1.0.13-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3556 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_configure)
NOTE: recipe tiff-4.5.1-r0: task do_configure: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: Running task 3560 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-connectivity/bluez5/bluez5_5.68.bb:do_create_spdx)
NOTE: recipe libxft-1_2.3.8-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3566 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3567 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Started
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3568 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libxv-1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3569 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libwebp-1.3.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Started
NOTE: Running task 3570 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_collect_spdx_deps)
NOTE: recipe gi-docgen-2023.1-r0: task do_configure: Succeeded
NOTE: Running task 3571 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.1-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Started
NOTE: Running task 3572 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3573 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_collect_spdx_deps)
NOTE: recipe libusb1-1.0.26-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3578 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3586 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/shared-mime-info/shared-mime-info_git.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: Running task 3590 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgudev-237-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe tiff-4.5.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.1-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_unpack: Succeeded
NOTE: Running task 3591 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_patch)
NOTE: recipe libxtst-1_1.2.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3592 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxtst_1.2.4.bb:do_create_spdx)
NOTE: recipe desktop-file-utils-0.26-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3593 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Started
NOTE: Running task 3594 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 3595 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic)
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Started
NOTE: recipe libxtst-1_1.2.4-r0: task do_create_spdx: Succeeded
NOTE: recipe harfbuzz-8.1.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3596 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_populate_lic: Succeeded
NOTE: recipe shared-mime-info-2.2-r0: task do_create_spdx: Succeeded
NOTE: Task /home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_lic unihash changed to 054c4bb5170b04f7cfcdb6e90d2623c13ad1cc4f6bc88596b6be3bd4f8e928f4
NOTE: Running task 3597 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_collect_spdx_deps)
NOTE: recipe libstd-rs-1.70.0-r0: task do_create_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3598 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_collect_spdx_deps)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe at-spi2-core-2.48.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3599 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/atk/at-spi2-core_2.48.3.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3600 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.10.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_compile: Succeeded
NOTE: Running task 3601 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_install)
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Started
NOTE: recipe pango-1.50.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3602 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/pango/pango_1.50.14.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_configure: Succeeded
NOTE: Running task 3603 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_configure: Succeeded
NOTE: Running task 3604 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_compile)
NOTE: recipe gi-docgen-2023.1-r0: task do_install: Succeeded
NOTE: Running task 3605 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_package)
NOTE: Running task 3606 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_populate_sysroot)
NOTE: recipe libgudev-237-r0: task do_compile: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Started
NOTE: recipe pango-1.50.14-r0: task do_create_spdx: Succeeded
NOTE: recipe bluez5-5.68-r0: task do_create_spdx: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.48.3-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_unpack: Succeeded
NOTE: Running task 3607 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_patch)
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_create_spdx: Succeeded
NOTE: Running task 3608 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_collect_spdx_deps)
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_patch: Succeeded
NOTE: Running task 3613 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_create_wrappers)
NOTE: Running task 3614 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 3615 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_rust_gen_targets)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Started
NOTE: recipe librsvg-2.56.3-r0: task do_rust_gen_targets: Succeeded
NOTE: recipe gi-docgen-2023.1-r0: task do_package: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3616 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Running task 3617 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_configure)
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3618 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Started
NOTE: recipe gi-docgen-2023.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3619 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gi-docgen/gi-docgen_2023.1.bb:do_create_spdx)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Started
NOTE: recipe orc-0.4.34-r0: task do_compile: Succeeded
NOTE: Running task 3620 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_install)
NOTE: recipe gi-docgen-2023.1-r0: task do_create_spdx: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_configure: Succeeded
NOTE: Running task 3621 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3622 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_configure_ptest_base)
NOTE: recipe orc-0.4.34-r0: task do_install: Succeeded
NOTE: Running task 3623 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_populate_sysroot)
NOTE: Running task 3624 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Started
NOTE: recipe shared-mime-info-2.2-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3625 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Started
NOTE: recipe orc-0.4.34-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_compile: Succeeded
NOTE: Running task 3626 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_install)
NOTE: recipe orc-0.4.34-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_configure: Succeeded
NOTE: Running task 3627 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_compile)
NOTE: recipe libgudev-237-r0: task do_install: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_compile: Succeeded
NOTE: Running task 3628 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_install)
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Started
NOTE: recipe libgudev-237-r0: task do_install: Succeeded
NOTE: Running task 3629 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_populate_sysroot)
NOTE: Running task 3630 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_package)
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Started
NOTE: recipe desktop-file-utils-0.26-r0: task do_install: Succeeded
NOTE: recipe libgudev-237-r0: task do_package: Started
NOTE: Running task 3631 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_package)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Started
NOTE: recipe gdk-pixbuf-2.42.10-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libgudev-237-r0: task do_populate_sysroot: Succeeded
NOTE: recipe orc-0.4.34-r0: task do_package: Succeeded
NOTE: Running task 3632 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_packagedata)
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_packagedata: Succeeded
NOTE: Running task 3633 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/orc/orc_0.4.34.bb:do_create_spdx)
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3634 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_package: Succeeded
NOTE: Running task 3635 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.26.bb:do_packagedata)
NOTE: recipe libxv-1.0.12-r0: task do_configure: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: Running task 3636 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_compile)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Started
NOTE: recipe orc-0.4.34-r0: task do_create_spdx: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_compile: Started
NOTE: recipe libgudev-237-r0: task do_package: Succeeded
NOTE: Running task 3637 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_packagedata)
NOTE: recipe desktop-file-utils-0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3638 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-core/glib-2.0/glib-2.0_2.76.4.bb:do_package_write_rpm)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3639 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Started
NOTE: Running task 3640 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libgudev-237-r0: task do_packagedata: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: Running task 3641 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/libgudev/libgudev_237.bb:do_create_spdx)
NOTE: recipe libgudev-237-r0: task do_create_spdx: Started
NOTE: recipe libxv-1.0.12-r0: task do_compile: Succeeded
NOTE: Running task 3642 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_install)
NOTE: recipe libxv-1.0.12-r0: task do_install: Started
NOTE: recipe libogg-1.3.5-r0: task do_configure: Succeeded
NOTE: Running task 3643 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3644 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3645 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3646 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_configure: Succeeded
NOTE: Running task 3647 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_compile)
NOTE: Running task 3648 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot)
NOTE: recipe libogg-1.3.5-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Started
NOTE: recipe libgudev-237-r0: task do_create_spdx: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3649 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_configure: Succeeded
NOTE: Running task 3650 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_configure_ptest_base)
NOTE: recipe libxv-1.0.12-r0: task do_install: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Started
NOTE: Running task 3651 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_populate_sysroot)
NOTE: Running task 3652 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Started
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3653 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_install: Succeeded
NOTE: Running task 3654 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_populate_sysroot)
NOTE: Running task 3655 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_configure: Succeeded
NOTE: Running task 3656 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_compile)
NOTE: recipe libxv-1.0.12-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Started
NOTE: recipe libogg-1.3.5-r0: task do_compile: Succeeded
NOTE: Running task 3657 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_install)
NOTE: recipe libogg-1.3.5-r0: task do_install: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_install: Succeeded
NOTE: Running task 3658 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_populate_sysroot)
NOTE: Running task 3659 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_package)
NOTE: recipe libusb1-1.0.26-r0: task do_compile: Succeeded
NOTE: Running task 3660 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_compile_ptest_base)
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Started
NOTE: recipe libogg-1.3.5-r0: task do_package: Started
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: Running task 3661 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata)
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3662 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3663 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3664 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3665 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install)
NOTE: Running task 3666 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_package: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Started
NOTE: Running task 3667 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3668 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3669 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_configure)
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Started
NOTE: recipe libtheora-1.1.1-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe tiff-4.5.1-r0: task do_configure: Succeeded
NOTE: Running task 3670 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_configure)
NOTE: Running task 3671 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3672 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_configure)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_packagedata: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Started
NOTE: Running task 3673 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_compile: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Started
NOTE: recipe libxv-1.0.12-r0: task do_packagedata: Succeeded
NOTE: Running task 3674 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/xorg-lib/libxv_1.0.12.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_configure: Succeeded
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Started
NOTE: Running task 3675 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_install_ptest_base)
NOTE: Running task 3676 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Started
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Started
NOTE: recipe libusb1-1.0.26-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3677 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_populate_sysroot)
NOTE: Running task 3678 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Started
NOTE: recipe libxv-1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_package: Succeeded
NOTE: Running task 3679 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libglu-2_9.0.2-r0: task do_packagedata: Succeeded
NOTE: Running task 3680 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-graphics/mesa/libglu_9.0.2.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_package: Succeeded
NOTE: Running task 3681 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_packagedata)
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Started
NOTE: recipe libogg-1.3.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3682 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libogg/libogg_1.3.5.bb:do_create_spdx)
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Started
NOTE: recipe libglu-2_9.0.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libogg-1.3.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3683 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_collect_spdx_deps)
NOTE: Running task 3684 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_collect_spdx_deps)
NOTE: Running task 3685 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_collect_spdx_deps)
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe flac-1.4.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_collect_spdx_deps: Succeeded
NOTE: recipe libusb1-1.0.26-r0: task do_package: Succeeded
NOTE: Running task 3686 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_packagedata)
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Started
NOTE: recipe libusb1-1.0.26-r0: task do_packagedata: Succeeded
NOTE: Running task 3687 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-support/libusb/libusb1_1.0.26.bb:do_create_spdx)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3688 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_compile_ptest_base)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3689 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install)
NOTE: recipe libusb1-1.0.26-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_compile: Succeeded
NOTE: Running task 3690 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_install)
NOTE: recipe libwebp-1.3.1-r0: task do_install: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_configure: Succeeded
NOTE: Running task 3691 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_install_ptest_base)
NOTE: Running task 3692 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_compile)
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3693 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3694 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Started
NOTE: recipe libwebp-1.3.1-r0: task do_install: Succeeded
NOTE: Running task 3695 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_populate_sysroot)
NOTE: Running task 3696 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_configure: Succeeded
NOTE: Running task 3697 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_compile)
NOTE: recipe tiff-4.5.1-r0: task do_compile: Succeeded
NOTE: Running task 3698 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Started
NOTE: recipe tiff-4.5.1-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_compile: Succeeded
NOTE: Running task 3699 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_install)
NOTE: recipe libtheora-1.1.1-r1: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_install: Succeeded
NOTE: Running task 3700 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_populate_sysroot)
NOTE: Running task 3701 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_package)
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_compile: Succeeded
NOTE: Running task 3702 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_install)
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Started
NOTE: recipe libtheora-1.1.1-r1: task do_populate_sysroot: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_compile: Succeeded
NOTE: Running task 3703 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_install)
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Started
NOTE: recipe libwebp-1.3.1-r0: task do_package: Succeeded
NOTE: Running task 3704 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_packagedata)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_install: Succeeded
NOTE: Running task 3705 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot)
NOTE: Running task 3706 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_package)
NOTE: recipe libwebp-1.3.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3707 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/webp/libwebp_1.3.1.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Started
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libwebp-1.3.1-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_install: Succeeded
NOTE: Running task 3708 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_populate_sysroot)
NOTE: Running task 3709 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_package)
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Started
NOTE: recipe libtheora-1.1.1-r1: task do_package: Succeeded
NOTE: Running task 3710 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_packagedata)
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3711 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libtheora-1.1.1-r1: task do_packagedata: Succeeded
NOTE: Running task 3712 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtheora/libtheora_1.1.1.bb:do_create_spdx)
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_install: Succeeded
NOTE: recipe libtheora-1.1.1-r1: task do_create_spdx: Succeeded
NOTE: Running task 3713 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_package)
NOTE: Running task 3714 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_populate_sysroot)
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3715 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Started
NOTE: recipe tiff-4.5.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_package: Succeeded
NOTE: Running task 3716 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata: Succeeded
NOTE: Running task 3717 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx)
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_configure: Succeeded
NOTE: Running task 3718 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_compile)
NOTE: recipe flac-1.4.3-r0: task do_compile: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx: Succeeded
NOTE: recipe alsa-lib-1.2.9-r0: task do_package: Succeeded
NOTE: Running task 3719 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_packagedata)
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3720 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/alsa/alsa-lib_1.2.9.bb:do_create_spdx)
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Started
NOTE: recipe alsa-lib-1.2.9-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3721 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Started
NOTE: recipe tiff-4.5.1-r0: task do_package: Succeeded
NOTE: Running task 3722 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_packagedata)
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3723 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3724 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libtiff/tiff_4.5.1.bb:do_create_spdx)
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Started
NOTE: recipe tiff-4.5.1-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.76.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3725 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3726 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Started
NOTE: recipe flac-1.4.3-r0: task do_compile: Succeeded
NOTE: Running task 3727 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_install)
NOTE: recipe flac-1.4.3-r0: task do_install: Started
NOTE: recipe flac-1.4.3-r0: task do_install: Succeeded
NOTE: Running task 3728 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_populate_sysroot)
NOTE: Running task 3729 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_package)
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Started
NOTE: recipe flac-1.4.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3730 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3731 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_configure)
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Started
NOTE: recipe flac-1.4.3-r0: task do_package: Succeeded
NOTE: Running task 3732 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_packagedata)
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Started
NOTE: recipe flac-1.4.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3733 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/flac/flac_1.4.3.bb:do_create_spdx)
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Started
NOTE: recipe flac-1.4.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3734 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_collect_spdx_deps)
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3735 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3736 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_populate_sysroot)
NOTE: Running task 3737 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsndfile1-1.2.0-r0: task do_configure: Succeeded
NOTE: Running task 3738 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_compile)
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_compile: Succeeded
NOTE: Running task 3739 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_install)
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_install: Succeeded
NOTE: Running task 3740 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_populate_sysroot)
NOTE: Running task 3741 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_package)
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3742 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3743 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3744 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3745 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_package: Succeeded
NOTE: Running task 3746 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_packagedata)
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3747 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.0.bb:do_create_spdx)
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Started
NOTE: recipe libsndfile1-1.2.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3748 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_collect_spdx_deps)
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe sbc-2.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: recipe sbc-2.0-r0: task do_configure: Succeeded
NOTE: Running task 3749 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_compile)
NOTE: recipe sbc-2.0-r0: task do_compile: Started
NOTE: recipe sbc-2.0-r0: task do_compile: Succeeded
NOTE: Running task 3750 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_install)
NOTE: recipe sbc-2.0-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_install: Succeeded
NOTE: Running task 3751 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_populate_sysroot)
NOTE: Running task 3752 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Started
NOTE: recipe sbc-2.0-r0: task do_package: Started
NOTE: recipe sbc-2.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_compile: Succeeded
NOTE: Running task 3753 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_install)
NOTE: recipe librsvg-2.56.3-r0: task do_install: Started
NOTE: recipe sbc-2.0-r0: task do_package: Succeeded
NOTE: Running task 3754 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_packagedata)
NOTE: recipe sbc-2.0-r0: task do_packagedata: Started
NOTE: recipe sbc-2.0-r0: task do_packagedata: Succeeded
NOTE: Running task 3755 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/sbc/sbc_2.0.bb:do_create_spdx)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_install: Succeeded
NOTE: Running task 3756 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_populate_sysroot)
NOTE: Running task 3757 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_package)
NOTE: recipe sbc-2.0-r0: task do_create_spdx: Succeeded
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Started
NOTE: recipe librsvg-2.56.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3758 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3759 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Started
NOTE: recipe librsvg-2.56.3-r0: task do_package: Succeeded
NOTE: Running task 3760 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_packagedata)
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Started
NOTE: recipe librsvg-2.56.3-r0: task do_packagedata: Succeeded
NOTE: Running task 3761 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/librsvg/librsvg_2.56.3.bb:do_create_spdx)
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Started
NOTE: recipe librsvg-2.56.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3762 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_configure: Succeeded
NOTE: Running task 3763 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_compile: Succeeded
NOTE: Running task 3764 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_install: Succeeded
NOTE: Running task 3765 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_package)
NOTE: Running task 3766 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3767 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3768 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_configure)
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Started
NOTE: recipe gtk4-4.12.1-r0: task do_configure: Succeeded
NOTE: Running task 3769 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_compile)
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_package: Succeeded
NOTE: Running task 3770 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_packagedata: Succeeded
NOTE: Running task 3771 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.22.5.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.22.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3772 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_collect_spdx_deps)
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gtk4-4.12.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_compile: Succeeded
NOTE: Running task 3773 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_install)
NOTE: recipe gtk4-4.12.1-r0: task do_install: Started
NOTE: recipe gtk4-4.12.1-r0: task do_install: Succeeded
NOTE: Running task 3774 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package)
NOTE: Running task 3775 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_populate_sysroot)
NOTE: recipe gtk4-4.12.1-r0: task do_package: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Started
NOTE: recipe gtk4-4.12.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package: Succeeded
NOTE: Running task 3776 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_packagedata)
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Started
NOTE: recipe gtk4-4.12.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3777 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_spdx)
NOTE: Running task 3778 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_write_rpm)
NOTE: Running task 3779 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_package_qa)
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Started
NOTE: recipe gtk4-4.12.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3780 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_create_runtime_spdx)
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Started
NOTE: recipe gtk4-4.12.1-r0: task do_package_qa: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_create_runtime_spdx: Succeeded
NOTE: recipe gtk4-4.12.1-r0: task do_package_write_rpm: Succeeded
NOTE: Running noexec task 3781 of 3781 (/home/pokybuild/yocto-worker/auh/build/build/poky/meta/recipes-gnome/gtk+/gtk4_4.12.1.bb:do_build)
NOTE: Tasks Summary: Attempted 3781 tasks of which 3409 didn't need to be rerun and all succeeded.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 3 seconds

Summary: There were 8 ERROR messages, returning a non-zero exit code.
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-src went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dbg went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-staticdev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-dev went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-doc went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala-locale went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: QA Issue: Package version for package vala went backwards which would break package feeds (from 0:0.56.13-r0 to 0:0.56.8-r0) [version-going-backwards]
ERROR: vala-0.56.8-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.

--===============8370047939843152935==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/core2-32-poky-linux/gtk4/gtk4-dev: RDEPENDS: added "wayland-dev libx11-dev"
packages/core2-32-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.1200.0", added "/usr/lib/libgtk-4.so.1.1200.1"
Changes to packages/core2-32-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.1200.0 to libgtk-4.so.1.1200.1
  /usr/lib/libgtk-4.so.1.1200.0 moved to /usr/lib/libgtk-4.so.1.1200.1

--===============8370047939843152935==--

