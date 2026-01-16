Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CBDBD4A5E4
	for <webhook@archiver.kernel.org>; Fri, 16 Jan 2026 01:26:05 +0000 (UTC)
Received: from a27-191.smtp-out.us-west-2.amazonses.com (a27-191.smtp-out.us-west-2.amazonses.com [54.240.27.191])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1444.1768526752375640149
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jan 2026 17:25:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=qMtE9iip;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=lHMPup1B;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.191, mailfrom: 0101019bc468ae54-a7c101fc-6631-4fab-90e4-82db7e3dfca0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1768526753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ukFXxLl12GICE6A11LySm+v6Z2zr5/C5Ah7F6e4ekIk=;
	b=qMtE9iipBJ2GwD0lOlYZZj+PQk2JL+i1oHC9WQUNWzER6hBxb/sP15OxB4DEGAXk
	vDAfmVAGsDqabhNMxTyufYbY2cygdxxthWeVFfKAq2b1GOdbScKiK1qDb0gW4qksRN8
	s4Z/n5yKKExKA9OurYkC9jO1OIc0XjLiv/YhCb60=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1768526753;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ukFXxLl12GICE6A11LySm+v6Z2zr5/C5Ah7F6e4ekIk=;
	b=lHMPup1BPzFguIFmV0ADeMK0PhUI07bGKFdO1VqoafHn2v9nOwp+LJqTtGtRr86X
	8OcqXiGelHaHarlOIfDjXb0+YCXQDe5Gu4G+GQfYib7AnQFm3/b3/r0ztNaTG3z7HwH
	0MjaS17LVse2v/MaSHcNJIsXp+KJ6vZ7cRHmsjbI=
Content-Type: multipart/mixed; boundary="===============4024190869325687714=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Markus Volk <f_l_k@t-online.de>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] gtk4: upgrading to 4.20.3 SUCCEEDED
Message-ID: <0101019bc468ae54-a7c101fc-6631-4fab-90e4-82db7e3dfca0-000000@us-west-2.amazonses.com>
Date: Fri, 16 Jan 2026 01:25:53 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.01.16-54.240.27.191
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Jan 2026 01:26:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/229489

--===============4024190869325687714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gtk4* to *4.20.3* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gtk4-upgrade-4.20.2-4.20.3.patch
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
From bd0b59f0cc3a89aa70d2ef14a6840bebe2ea36a8 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 Jan 2026 23:26:14 +0000
Subject: [PATCH] gtk4: upgrade 4.20.2 -> 4.20.3

---
 meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-gnome/gtk+/{gtk4_4.20.2.bb => gtk4_4.20.3.bb} (97%)

diff --git a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
similarity index 97%
rename from meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
rename to meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
index 92791db169..ef9a05f7fe 100644
--- a/meta/recipes-gnome/gtk+/gtk4_4.20.2.bb
+++ b/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb
@@ -33,7 +33,7 @@ LIC_FILES_CHKSUM = " \
     file://tests/testgtk.c;endline=25;md5=49d06770681b8322466b52ed19d29fb2 \
 "
 
-SRC_URI[archive.sha256sum] = "5e8240edecafaff2b8baf4663bdceaa668ef10a207bee4d7f90e010e10bddc5c"
+SRC_URI[archive.sha256sum] = "2873f2903088a66c71173ea2ed85ffae266a66b972c3a4842bbb2f6f187ec153"
 
 S = "${UNPACKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.47.1


--===============4024190869325687714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1956 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-a4191bcce7bd4142c72f153ae42b445633a6d883"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:a4191bcce7bd4142c72f153ae42b445633a6d883"
meta-yocto-bsp       
meta-poky            = "master:c23c19e0b300812bad314f1d0a901965315271ae"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 970 Local 903 Mirrors 0 Missed 67 Current 454 (93% match, 95% complete)
done.
Removing 11 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 463 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 487 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 490 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 496 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 506 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 529 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_qa_setscene)
NOTE: Running setscene task 558 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 560 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 562 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: Running setscene task 563 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_populate_lic_setscene)
NOTE: Running setscene task 577 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_create_spdx_setscene)
NOTE: Running setscene task 578 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 596 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 597 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 600 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 602 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_create_spdx_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_create_spdx_setscene: Started
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 603 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 608 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 612 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 613 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/iso-codes/iso-codes_4.19.0.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 616 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 617 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-packaging_25.0.bb:do_packagedata_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 620 of 1424 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 622 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 624 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 625 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 627 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/ttf-fonts/liberation-fonts_2.1.5.bb:do_packagedata_setscene)
NOTE: recipe gtk4-4.20.3-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 628 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gnome/adwaita-icon-theme_49.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 635 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe iso-codes-4.19.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 638 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-native-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.18.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe liberation-fonts-1_2.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 654 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe iso-codes-4.19.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 656 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_create_spdx_setscene)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 661 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 674 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 676 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx_setscene)
NOTE: recipe orc-native-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 681 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 682 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_recipe_qa_setscene)
NOTE: recipe python3-packaging-25.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtheora-1.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 687 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 690 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_create_spdx_setscene)
NOTE: recipe adwaita-icon-theme-49.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 697 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 702 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_recipe_qa_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 703 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: Running setscene task 705 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_populate_sysroot_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 707 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 708 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 709 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 711 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_packagedata_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 714 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 715 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/hicolor-icon-theme/hicolor-icon-theme_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 716 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 717 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx_setscene)
NOTE: recipe gtk4-4.20.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 719 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 720 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 721 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 723 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 726 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_create_spdx_setscene)
NOTE: Running setscene task 727 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe graphene-1.10.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 729 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 732 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 733 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 735 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 738 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_populate_sysroot_setscene)
NOTE: recipe hicolor-icon-theme-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 739 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 740 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_packagedata_setscene)
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 742 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 744 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 747 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe gtk4-4.20.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 755 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 757 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 758 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 759 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_populate_sysroot_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 761 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe librsvg-2.61.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 763 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 764 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 767 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 771 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 773 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_create_spdx_setscene)
NOTE: recipe graphene-1.10.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 782 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 787 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 788 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 791 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 792 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 795 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 796 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.47.bb:do_create_spdx_setscene)
NOTE: recipe bluez5-5.85-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 798 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 799 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 804 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 807 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 808 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 812 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 813 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 814 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 817 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe wayland-protocols-1.47-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 820 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 826 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 830 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.13.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 835 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 836 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 842 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 843 of 1424 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 845 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 847 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 848 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 851 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 852 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 856 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 863 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-native-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 864 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.13.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 865 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_populate_sysroot_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 873 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 875 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 876 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 878 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 879 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 880 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 881 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_packagedata_setscene)
NOTE: recipe orc-native-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 883 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 886 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 887 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 888 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 891 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 895 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 896 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 898 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 899 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 900 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 902 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_recipe_qa_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 905 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 907 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 909 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 910 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 915 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 918 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 919 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 920 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 921 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.13.1.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 925 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 927 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 931 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 932 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 933 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 935 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.3.bb:do_recipe_qa_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 937 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 941 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 942 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.13.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 945 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 946 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 947 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_create_spdx_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 950 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 951 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 952 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 955 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 957 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 958 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.53-r0: task do_create_spdx_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 959 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 961 of 1424 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe librsvg-2.61.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 964 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 966 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.9.bb:do_recipe_qa_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 970 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.53-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 974 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 975 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 976 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 977 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 978 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 979 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe orc-native-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 980 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 983 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-native-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 986 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 987 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 989 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 992 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 993 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 994 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 996 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 997 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 998 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1000 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1004 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1006 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.92.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1012 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1013 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1015 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1016 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1017 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1018 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1021 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1022 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1023 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1025 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.92.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1033 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1037 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1038 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1039 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1040 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1042 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1043 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1044 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1045 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1047 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1051 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_packagedata_setscene)
NOTE: Running setscene task 1056 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1057 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1058 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1060 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1061 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1067 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1068 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1075 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1077 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1078 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1079 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1085 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe harfbuzz-12.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1086 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1088 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1089 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1091 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1095 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1096 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1100 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1102 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1103 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1105 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1107 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_12.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1109 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1110 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1112 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx_setscene)
NOTE: recipe libdrm-2.4.131-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1113 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-12.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1117 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1118 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1120 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-12.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1122 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1125 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1127 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1128 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1129 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1130 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1131 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1133 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1134 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1138 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-78.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe icu-78.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1139 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1140 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1142 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1146 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1147 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1151 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1153 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1155 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.131.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1157 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.335.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1158 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1159 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1160 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe icu-78.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1162 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1164 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1165 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1166 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1169 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1172 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1173 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-78.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1174 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.335.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libdrm-2.4.131-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1175 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1176 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1178 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1179 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1181 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1182 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1185 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1187 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_78.1.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1188 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-78.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1198 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1199 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1200 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1201 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1202 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1203 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1204 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe icu-78.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1206 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe freetype-2.14.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1213 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1214 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe freetype-2.14.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1216 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.14.1.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1217 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1219 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe freetype-2.14.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1225 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1226 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1228 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1229 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1231 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1232 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1234 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1136 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1239 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1242 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1244 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1245 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1246 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1248 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1250 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: Running task 1282 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1304 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1588 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1254 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1256 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1838 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1905 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1906 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 1907 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_fetch)
NOTE: Running task 1908 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_fetch)
NOTE: Running task 1957 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1997 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_fetch)
NOTE: Running task 1998 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_fetch)
NOTE: Running task 1999 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_fetch)
NOTE: Running task 2000 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_fetch)
NOTE: Running task 2008 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_fetch)
NOTE: Running task 2050 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2051 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_write_config)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 2104 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_fetch: Succeeded
NOTE: Running task 2111 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_write_config)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Started
NOTE: Running task 2120 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_unpack)
NOTE: Running task 2124 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_fetch)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_fetch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Started
NOTE: Running task 2125 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_unpack)
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Started
NOTE: recipe graphene-1.10.8-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2126 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_unpack)
NOTE: recipe gtk+3-3.24.51-r0: task do_fetch: Succeeded
NOTE: Running task 2127 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_unpack)
NOTE: Running task 2128 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_unpack)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_unpack: Started
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_write_config: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Started
NOTE: Running task 2153 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 2154 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_unpack)
NOTE: Running task 2157 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_write_config)
NOTE: Running task 2158 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_write_config)
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Started
NOTE: Running task 2165 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_write_config)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_unpack: Succeeded
NOTE: Running task 2166 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Started
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Started
NOTE: recipe graphene-1.10.8-r0: task do_unpack: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Started
NOTE: Running task 2167 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_patch)
NOTE: recipe graphene-1.10.8-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_write_config: Succeeded
NOTE: Running task 2195 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_fetch)
NOTE: Running task 2206 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_patch: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_write_config: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_patch: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running task 2257 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_patch)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2288 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_unpack)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 2300 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_write_config)
NOTE: Running task 2317 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_fetch)
NOTE: recipe graphene-1.10.8-r0: task do_patch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Started
NOTE: Running task 2319 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_fetch)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_unpack: Succeeded
NOTE: Running task 2320 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Started
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_fetch: Succeeded
NOTE: Running task 2342 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.20.3-r0: task do_write_config: Succeeded
NOTE: Running task 2343 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_unpack)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_fetch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 2344 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_patch)
NOTE: Running task 2345 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_patch: Succeeded
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_fetch: Succeeded
NOTE: Running task 2346 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2348 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_patch: Succeeded
NOTE: Running task 2387 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_write_config)
NOTE: recipe desktop-file-utils-0.28-r0: task do_unpack: Succeeded
NOTE: Running task 2388 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_patch)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_unpack: Succeeded
NOTE: Running task 2389 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_patch)
NOTE: recipe gtk+3-3.24.51-r0: task do_unpack: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Started
NOTE: Running task 2390 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_patch)
NOTE: recipe desktop-file-utils-0.28-r0: task do_write_config: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_patch: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_patch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Started
NOTE: Running task 2437 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_configure)
NOTE: recipe gtk4-4.20.3-r0: task do_unpack: Succeeded
NOTE: Running task 2438 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_patch)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_patch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_patch: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 8556b01e3639acc06a244965fab732cce4e58677da6fd4edd6bf39d2ff60c00d to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '6a0151bab45da27cbcf4b9f9b4866e0bcc18d3a560eca6a7293395f71d09bf45', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8556b01e3639acc06a244965fab732cce4e58677da6fd4edd6bf39d2ff60c00d'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed 6a0151bab45da27cbcf4b9f9b4866e0bcc18d3a560eca6a7293395f71d09bf45 -> 8556b01e3639acc06a244965fab732cce4e58677da6fd4edd6bf39d2ff60c00d as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe gtk4-4.20.3-r0: task do_patch: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_configure: Succeeded
NOTE: Running task 2443 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_compile)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1257 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_packagedata_setscene)
NOTE: Running setscene task 1258 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1259 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1260 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1261 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1262 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1263 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_packagedata_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_compile: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_packagedata_setscene: Started
NOTE: recipe libpng-1.6.53-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2445 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_install)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1264 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_recipe_qa_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2446 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Started
NOTE: recipe libpng-1.6.53-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1268 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.53.bb:do_recipe_qa_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1270 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.3.bb:do_recipe_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libpng-1.6.53-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_install: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.53-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2463 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1271 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_setscene)
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 2464 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_unpack)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2465 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe qemuwrapper-cross-1.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2466 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_patch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemuwrapper-cross_1.0.bb:do_populate_sysroot unihash changed to 51778725f194616169f7bd986fe6a210102aab443a45fbba5c1fe4f7017cc1bc
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 2467 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe tiff-4.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 2470 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_unpack)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_fetch: Succeeded
NOTE: Running task 2471 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_unpack)
NOTE: recipe tiff-4.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 2472 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_patch)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: Running task 2473 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe tiff-4.7.1-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: Running task 2474 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_unpack)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_unpack: Succeeded
NOTE: Running task 2475 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_patch)
NOTE: recipe tiff-4.7.1-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: Running task 2479 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Running task 2480 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash 8556b01e3639acc06a244965fab732cce4e58677da6fd4edd6bf39d2ff60c00d to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'd50536851c7643071e697030eea00c4cd7c7dd801628e3fb8e7da46fd5149d7f', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '8556b01e3639acc06a244965fab732cce4e58677da6fd4edd6bf39d2ff60c00d'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed d50536851c7643071e697030eea00c4cd7c7dd801628e3fb8e7da46fd5149d7f -> 8556b01e3639acc06a244965fab732cce4e58677da6fd4edd6bf39d2ff60c00d as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1273 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1274 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1275 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1276 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1277 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1278 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1282 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1283 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1284 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1285 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1286 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1288 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1289 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.47-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1291 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1294 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1295 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1301 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1303 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.47.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1305 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.47-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1308 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1309 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1311 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1312 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1314 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1315 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1317 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1318 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1319 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1322 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1323 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1324 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1325 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1326 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1330 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1332 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.11-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1334 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1335 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1336 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1339 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1341 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1343 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1344 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1345 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1346 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1347 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1351 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.11.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1357 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1359 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1360 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1362 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1364 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1366 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.3.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1369 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1370 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.11-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1372 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1377 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1378 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1381 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1383 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1384 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1385 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1387 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1389 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1391 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1392 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1394 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1396 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1398 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1399 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1401 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1402 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1403 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1404 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1406 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1410 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1412 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1413 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1418 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1420 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1422 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.18.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3506 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3507 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3508 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3509 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3538 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3582 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3583 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3584 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3684 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3729 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3730 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3752 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_collect_spdx_deps)
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3753 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_collect_spdx_deps)
NOTE: Running task 3754 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_collect_spdx_deps)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3755 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_collect_spdx_deps)
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3775 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3776 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3777 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_configure)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3785 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3786 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_configure)
NOTE: Running task 3787 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_configure)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Started
NOTE: Running task 3788 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Started
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3789 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_collect_spdx_deps)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3790 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_configure)
NOTE: Running task 3791 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: Running task 3792 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk)
NOTE: recipe tiff-4.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3793 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3794 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3795 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_configure)
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Started
NOTE: Running task 3796 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_configure)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_configure: Started
NOTE: recipe graphene-1.10.8-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3797 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3803 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_configure)
NOTE: recipe graphene-1.10.8-r0: task do_configure: Started
NOTE: Running task 3804 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_configure)
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_configure: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Started
NOTE: Running task 3805 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_configure: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_configure: Succeeded
NOTE: Running task 3806 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_compile)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_compile: Succeeded
NOTE: Running task 3807 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_configure: Succeeded
NOTE: Running task 3808 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_compile)
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_install: Succeeded
NOTE: Running task 3809 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_package)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_package: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_ipk unihash changed to 197ae3d0942d7f23cb0c4cebf56614f9bf5acc01744543f5b6917b713074b5b6
NOTE: recipe desktop-file-utils-0.28-r0: task do_compile: Succeeded
NOTE: Running task 3810 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_install)
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_deb unihash changed to 17b290acaac0b59eb0001bda1cf3182ef7985470be2375742020f7e0ea8f0d02
NOTE: recipe graphene-1.10.8-r0: task do_configure: Succeeded
NOTE: Running task 3811 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_compile)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Started
NOTE: recipe shared-mime-info-2.4-r0: task do_package_write_rpm: Succeeded
NOTE: recipe desktop-file-utils-0.28-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_package_write_rpm unihash changed to cbdfd793856b25035591e37cd1f6572fc57569f56cfab9a9d55f22849ca45229
NOTE: Running task 3812 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package)
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_package unihash changed to 3bbb10917aaa4cc785d70ab0c631f69349db5f0dc844570daa8c973ea16d16c5
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata became valid
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-dbusmock_0.37.2.bb:do_packagedata_setscene)
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-dbusmock-0.37.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe at-spi2-core-2.58.3-r0: task do_configure: Succeeded
NOTE: Running task 3814 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_compile)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_compile: Started
NOTE: recipe desktop-file-utils-0.28-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_package unihash changed to 1ec1a1784033181d5db670a4439dabee04a9645c663b0e17fa7bb0407167da66
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata became valid
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/desktop-file-utils/desktop-file-utils_0.28.bb:do_packagedata_setscene)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3815 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe desktop-file-utils-0.28-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3817 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_configure: Succeeded
NOTE: Running task 3818 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_compile)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_configure: Succeeded
NOTE: Running task 3819 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3820 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_compile: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_compile: Succeeded
NOTE: Running task 3821 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_install)
NOTE: Running task 3822 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_configure: Succeeded
NOTE: Running task 3823 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_compile)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_install: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_install: Succeeded
NOTE: Running task 3825 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package)
NOTE: Running task 3826 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_compile: Succeeded
NOTE: Running task 3828 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_install)
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_compile: Succeeded
NOTE: Running task 3829 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_install)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3830 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_compile: Started
NOTE: recipe graphene-1.10.8-r0: task do_install: Succeeded
NOTE: Running task 3831 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package)
NOTE: Running task 3832 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_install: Succeeded
NOTE: Running task 3834 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Started
NOTE: recipe tiff-4.7.1-r0: task do_configure: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Started
NOTE: Running task 3835 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_compile)
NOTE: recipe tiff-4.7.1-r0: task do_compile: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_compile: Succeeded
NOTE: Running task 3836 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_install)
NOTE: recipe graphene-1.10.8-r0: task do_populate_sysroot: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_populate_sysroot unihash changed to 1eebae2493deb92242caca83ed3e4cf32faad971a23691d56db766b678b02213
NOTE: Setscene tasks completed
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package unihash changed to 25c9218910212ad44349c509022b2fbfae29ccdf669b0933c8e35a7c7a769fa9
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata became valid
NOTE: Running setscene task 1420 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 1423 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_qa_setscene)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_qa_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_package: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_package: Succeeded
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_package unihash changed to 944fc8ea28d35d88fd919969aa63ab1441549e22c941c4d05efb7e37e37b29ff
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata became valid
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_package unihash changed to 865fb2f3dc8b0a0840249482bc56c0ca168a2a429e4558dd96f7561712dd8886
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '7ceeec353421eb587cbbd981af6454be492ca7bbb26dd8d43af5eca86c4ba1fa', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 7ceeec353421eb587cbbd981af6454be492ca7bbb26dd8d43af5eca86c4ba1fa -> 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata became valid
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1423 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_install: Succeeded
NOTE: Running task 3837 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_populate_sysroot)
NOTE: Running task 3838 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Started
NOTE: Running task 3840 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_ipk)
NOTE: Running task 3841 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_deb)
NOTE: Running task 3842 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_rpm)
NOTE: Running task 3844 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_ipk)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_populate_sysroot: Started
NOTE: Running task 3845 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_deb)
NOTE: recipe libxinerama-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_package: Started
NOTE: Running task 3846 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_rpm)
NOTE: Setscene tasks completed
NOTE: Running task 3849 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcomposite_0.4.6.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Started
NOTE: Running task 3850 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxinerama_1.1.5.bb:do_create_spdx)
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_ipk: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_deb: Started
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_rpm: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe graphene-1.10.8-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_package unihash changed to a3c80324dd4067ff32981fc12c28bdc0fc5e48fe0dcaef9f0331f03f857e2280
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata became valid
NOTE: recipe at-spi2-core-2.58.3-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_populate_sysroot unihash changed to 51de226b753450cafbd1bfbf4ca716398166d129a83ba50d6fac1db0fb4bfecd
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 26ce94be619f3a19fb1c35f2ef51e316f780ae9ab6a80ec79840ee2b056aaac2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '559b766bf0d058f52cae666557c3d731a90843fe157a2c7b54d461dc285b485e', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '26ce94be619f3a19fb1c35f2ef51e316f780ae9ab6a80ec79840ee2b056aaac2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 559b766bf0d058f52cae666557c3d731a90843fe157a2c7b54d461dc285b485e -> 26ce94be619f3a19fb1c35f2ef51e316f780ae9ab6a80ec79840ee2b056aaac2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '5afbe5a61bc7b51b9ddee5f313d5399c4f49faacac6dd93c00f6758b6df7207a', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 5afbe5a61bc7b51b9ddee5f313d5399c4f49faacac6dd93c00f6758b6df7207a -> 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxinerama-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcomposite-1_0.4.6-r0: task do_create_spdx: Succeeded
NOTE: recipe graphene-1.10.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3853 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/graphene/graphene_1.10.8.bb:do_create_spdx)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_package unihash changed to 55f4f59aafa9786ed1e215be8d621537edca6191074385bcbfb23436f31b7f49
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'eb042c204a3298c18cfd043f937c92cf8dae03808f50ddaa64f73988b6311462', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed eb042c204a3298c18cfd043f937c92cf8dae03808f50ddaa64f73988b6311462 -> 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata became valid
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Started
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_packagedata_setscene)
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3855 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcursor_1.2.3.bb:do_create_spdx)
NOTE: recipe graphene-1.10.8-r0: task do_create_spdx: Succeeded
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Started
NOTE: recipe libxcursor-1_1.2.3-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_ipk unihash changed to a216646cd22b6bc39c75db250c5455856570ccdd3a1975769dd0804ec56cfa95
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_ipk unihash changed to 9331ffebc00f694d5116eb5b57bffef044e34ba8c356f12eb5cd5ecec09d35cb
NOTE: recipe libepoxy-1.5.10-r0: task do_compile: Succeeded
NOTE: Running task 3856 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_install)
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_rpm unihash changed to 8056c2245cbf5bb527aaf8a12c9a7d09820e5c2f4e92c32dd6d96cd5fcb9defb
NOTE: recipe tiff-4.7.1-r0: task do_compile: Succeeded
NOTE: Running task 3857 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_install)
NOTE: recipe tiff-4.7.1-r0: task do_install: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_install: Succeeded
NOTE: Running task 3858 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot)
NOTE: Running task 3859 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package)
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_rpm: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_rpm unihash changed to 9861b6c12d7f6bf59410267c1b4c004984ace7f474605b2b14d7db66e7242970
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_populate_sysroot unihash changed to c7c40c459804d8ec8589281bb5a54cd87387699db6ccaf6d4ea4b19b4bc98626
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot as unihash 26ce94be619f3a19fb1c35f2ef51e316f780ae9ab6a80ec79840ee2b056aaac2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '1e045cf453b9e6b47b7bd8d161746a4fb881303361a145c500b9d05257899480', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '26ce94be619f3a19fb1c35f2ef51e316f780ae9ab6a80ec79840ee2b056aaac2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot unihash changed 1e045cf453b9e6b47b7bd8d161746a4fb881303361a145c500b9d05257899480 -> 26ce94be619f3a19fb1c35f2ef51e316f780ae9ab6a80ec79840ee2b056aaac2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_populate_sysroot so ignoring rehash (remap)
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '517045b42be2237006d6ed86e1d2ae892b03e2eab26200e4241238cfe60d1f84', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 517045b42be2237006d6ed86e1d2ae892b03e2eab26200e4241238cfe60d1f84 -> 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running task 3860 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk+3-3.24.51-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gdk-pixbuf-2.44.4-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.44.4.bb:do_package_write_deb unihash changed to e36309b132aaae580463b9a79b64043d06b06d1c11bb771bb9a1b9011234860e
NOTE: recipe libepoxy-1.5.10-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_package unihash changed to e805e70cb79e225c2d6b964114e3eabbf8a987afa4313b96cf06c795adc24f5c
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': '679c41f6a399d8f89ef9ce860461ec4c984926e63e924ae2ccb35072eb4380f4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed 679c41f6a399d8f89ef9ce860461ec4c984926e63e924ae2ccb35072eb4380f4 -> 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata became valid
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_packagedata_setscene)
NOTE: recipe gtk+3-3.24.51-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3861 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3863 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_create_spdx)
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_package unihash changed to ad74300806260008e773833a64741e675e46125b36e6e4be77e5b318dec5fc6e
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx as unihash 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'f738221b791659b7201664fb83fecbc41f975f44ab568e21382ec4bfeab7ded4', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': '377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx unihash changed f738221b791659b7201664fb83fecbc41f975f44ab568e21382ec4bfeab7ded4 -> 377b835c0d46f4ca46371414d0d3fa1702d60ea25c198b2f9af0d584791bc932 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_packagedata became valid
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_packagedata_setscene)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_create_spdx: Succeeded
NOTE: recipe at-spi2-core-2.58.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3865 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/atk/at-spi2-core_2.58.3.bb:do_create_spdx)
NOTE: recipe at-spi2-core-2.58.3-r0: task do_create_spdx: Started
NOTE: recipe at-spi2-core-2.58.3-r0: task do_create_spdx: Succeeded
NOTE: recipe tiff-4.7.1-r0: task do_install: Succeeded
NOTE: Running task 3867 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_package)
NOTE: recipe tiff-4.7.1-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.86.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.3.bb:do_package_write_deb unihash changed to 2246600abbc6d0c816b4495930d6ec3448de6c697604f0998ebc7f05a6da6bfa
NOTE: recipe tiff-4.7.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_package unihash changed to ad6e1bd4a6145774c8201abaf98119fb7a44a3f0e128b1a7952bd687be7762c6
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata became valid
NOTE: Running setscene task 1424 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_packagedata_setscene)
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe tiff-4.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3870 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtiff/tiff_4.7.1.bb:do_create_spdx)
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3871 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_compile)
NOTE: recipe gtk+3-3.24.51-r0: task do_compile: Started
NOTE: recipe tiff-4.7.1-r0: task do_create_spdx: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 3872 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_install: Succeeded
NOTE: Running task 3873 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot)
NOTE: Running task 3874 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_populate_sysroot unihash changed to d7cb60796700f48b2e6b7664310294797a6bf29d7c6810504ae11a9d24b5a55d
NOTE: Setscene tasks completed
NOTE: Running task 3875 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3876 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_package unihash changed to b4d856cc83bf53ac7f5bbcb6c32e55a4e91c27750c6b1f973d6746c84f32b85e
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata became valid
NOTE: Running setscene task 1422 of 1424 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata_setscene: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-base/1.26.9/temp/log.do_packagedata_setscene.2391906
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Setscene tasks completed
NOTE: Running task 3877 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_packagedata: Succeeded
NOTE: Running task 3878 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.9.bb:do_create_spdx)
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3879 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.9-r0: task do_create_spdx: Succeeded
NOTE: Running task 3880 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_compile: Succeeded
NOTE: Running task 3881 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_install)
NOTE: recipe gtk+3-3.24.51-r0: task do_install: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_install: Succeeded
NOTE: Running task 3882 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_package)
NOTE: recipe gtk+3-3.24.51-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 3889 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_install: Succeeded
NOTE: Running task 3890 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_package)
NOTE: Running task 3891 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3892 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe gtk4-4.20.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gtk4-4.20.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gtk+3-3.24.51-r0: task do_package: Succeeded
NOTE: Running task 3893 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_configure)
NOTE: Running task 3894 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk+3_3.24.51.bb:do_packagedata)
NOTE: recipe gtk4-4.20.3-r0: task do_configure: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_packagedata: Started
NOTE: recipe gtk+3-3.24.51-r0: task do_packagedata: Succeeded
NOTE: recipe gtk4-4.20.3-r0: task do_configure: Succeeded
NOTE: Running task 3904 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gtk+/gtk4_4.20.3.bb:do_compile)
NOTE: recipe gtk4-4.20.3-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_package: Succeeded
NOTE: Running task 3905 of 3918 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.9-r0: task do_packagedata: Failed
NOTE: recipe gtk4-4.20.3-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3905 tasks of which 3735 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115232404.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260115232404.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-bad/1.26.9/temp/log.do_packagedata.2413229
Summary: There were 290 ERROR messages, returning a non-zero exit code.
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-src went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dbg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-staticdev went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dev went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-doc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-af went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-az went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-bg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ca went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-cs went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-da went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-de went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-el went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-en-gb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eo went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-es went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-eu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-fur went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-gl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-hu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-id went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-it went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ja went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ka went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lt went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-lv went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-nl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-or went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-pt-br went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ro went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-ru went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sk went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sq went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-sv went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-tr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-uk went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-vi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-locale-zh-cn went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-apps went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-meta went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstallocators-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstapp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstaudio-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstfft-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstgl-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstpbutils-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstriff-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstrtsp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstsdp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgsttag-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package libgstvideo-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-adder went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-alsa went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioconvert went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiomixer went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiorate went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audioresample went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audiotestsrc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-basedebug went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-compositor went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-dsd went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-encoding went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gio went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ogg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-opengl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-overlaycomposition went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pango went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbtypes went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-playback went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rawparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-subparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tcp went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-theora went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-typefindfunctions went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videoconvertscale went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videorate went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-videotestsrc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-volume went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-vorbis went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-ximagesink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-xvimagesink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-allocators-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-app-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-audio-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-gl-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glegl-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glwayland-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-glx11-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-pbutils-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtp-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-rtsp-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-sdp-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-tag-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: QA Issue: Package version for package gstreamer1.0-plugins-base-video-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-base-1.26.9-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstanalytics-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstdxva-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstmse-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-analyticsoverlay went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-unixfd went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvcgadget went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-analytics-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dxva-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.26.10-r0 to 0:1.26.9-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.9-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-bad/1.26.9/temp/log.do_packagedata.2413229
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.9.bb:do_packagedata) failed with exit code '1'

--===============4024190869325687714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============4024190869325687714==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gtk4-upgrade-4.20.2-4.20.3.patch"

RnJvbSBiZDBiNTlmMGNjM2E4OWFhNzBkMmVmMTRhNjg0MGJlYmUyZWEzNmE4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgSmFuIDIwMjYgMjM6MjY6MTQgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
dGs0OiB1cGdyYWRlIDQuMjAuMiAtPiA0LjIwLjMKCi0tLQogbWV0YS9yZWNpcGVzLWdub21lL2d0
aysve2d0azRfNC4yMC4yLmJiID0+IGd0azRfNC4yMC4zLmJifSB8IDIgKy0KIDEgZmlsZSBjaGFu
Z2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1n
bm9tZS9ndGsrL3tndGs0XzQuMjAuMi5iYiA9PiBndGs0XzQuMjAuMy5iYn0gKDk3JSkKCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMi5iYiBiL21ldGEvcmVj
aXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTclCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1nbm9tZS9ndGsrL2d0azRfNC4yMC4yLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMy5iYgppbmRleCA5Mjc5MWRiMTY5Li5l
ZjlhMDVmN2ZlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAu
Mi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZ25vbWUvZ3RrKy9ndGs0XzQuMjAuMy5iYgpAQCAtMzMs
NyArMzMsNyBAQCBMSUNfRklMRVNfQ0hLU1VNID0gIiBcCiAgICAgZmlsZTovL3Rlc3RzL3Rlc3Rn
dGsuYztlbmRsaW5lPTI1O21kNT00OWQwNjc3MDY4MWI4MzIyNDY2YjUyZWQxOWQyOWZiMiBcCiAi
CiAKLVNSQ19VUklbYXJjaGl2ZS5zaGEyNTZzdW1dID0gIjVlODI0MGVkZWNhZmFmZjJiOGJhZjQ2
NjNiZGNlYWE2NjhlZjEwYTIwN2JlZTRkN2Y5MGUwMTBlMTBiZGRjNWMiCitTUkNfVVJJW2FyY2hp
dmUuc2hhMjU2c3VtXSA9ICIyODczZjI5MDMwODhhNjZjNzExNzNlYTJlZDg1ZmZhZTI2NmE2NmI5
NzJjM2E0ODQyYmJiMmY2ZjE4N2VjMTUzIgogCiBTID0gIiR7VU5QQUNLRElSfS8ke0dOT01FQk59
LSR7UFZ9IgogCi0tIAoyLjQ3LjEKCg==

--===============4024190869325687714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGSIZE changed from 73372512 to 73409176 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-dbg: FILELIST: removed "/usr/lib/.debug/libgtk-4.so.1.2000.2", added "/usr/lib/.debug/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGSIZE changed from 23794509 to 23802810 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-dev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-doc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-af: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-am: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-an: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ang: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ar: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-as: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ast: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az-ir: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-az: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-be: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn-in: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-bs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca+valencia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-crh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cs: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-cy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-da: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGSIZE changed from 121534 to 122638 (+1%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-de: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-dz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-el: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en+shaw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-ca: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGSIZE changed from 113168 to 115169 (+2%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en-gb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-en: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eo: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-es: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-et: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGSIZE changed from 122561 to 122565 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-eu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-fur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ga: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gd: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-gu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-he: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hu: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-hy: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ia: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-id: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ie: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-io: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-is: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-it: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ja: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ka: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kab: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-km: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-kn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ko: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ku: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ky: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-li: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-lv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mai: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mjw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ml: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-mr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ms: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-my: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nb: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nds: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ne: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-nso: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-oc: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-or: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ps: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt-br: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-pt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ro: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ru: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-rw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-si: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sl: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sq: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+ije: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGSIZE changed from 115522 to 121144 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr+latin: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGSIZE changed from 141246 to 148230 (+5%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-sv: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ta: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-te: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tg: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGSIZE changed from 124843 to 167657 (+34%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-th: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tr: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-tt: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGSIZE changed from 73153 to 147744 (+102%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ug: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-ur: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz+cyrillic: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-uz: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-vi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-wa: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-xh: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-yi: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-cn: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-hk: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-locale-zh-tw: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGSIZE changed from 48648202 to 48660513 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4-src: FILELIST: directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu/shaders -> /usr/src/debug/gtk4/4.20.3/gsk/gpu/shaders, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y/atspi -> /usr/src/debug/gtk4/4.20.3/gtk/a11y/atspi, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/inspector -> /usr/src/debug/gtk4/4.20.3/gtk/inspector, directory renamed /usr/src/debug/gtk4/4.20.2/gdk -> /usr/src/debug/gtk4/4.20.3/gdk, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/timsort -> /usr/src/debug/gtk4/4.20.3/gtk/timsort, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/loaders -> /usr/src/debug/gtk4/4.20.3/gdk/loaders, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gl -> /usr/src/debug/gtk4/4.20.3/gsk/gl, directory renamed /usr/src/debug/gtk4/4.20.2/gsk/gpu -> /usr/src/debug/gtk4/4.20.3/gsk/gpu, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/deprecated -> /usr/src/debug/gtk4/4.20.3/gdk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/depr
 ecated -> /usr/src/debug/gtk4/4.20.3/gtk/deprecated, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/roaring -> /usr/src/debug/gtk4/4.20.3/gtk/roaring, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/a11y -> /usr/src/debug/gtk4/4.20.3/gtk/a11y, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/wayland -> /usr/src/debug/gtk4/4.20.3/gdk/wayland, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print -> /usr/src/debug/gtk4/4.20.3/gtk/print, directory renamed /usr/src/debug/gtk4/4.20.2/gdk/x11 -> /usr/src/debug/gtk4/4.20.3/gdk/x11, directory renamed /usr/src/debug/gtk4/4.20.2/tools -> /usr/src/debug/gtk4/4.20.3/tools, directory renamed /usr/src/debug/gtk4/4.20.2/gtk -> /usr/src/debug/gtk4/4.20.3/gtk, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/css -> /usr/src/debug/gtk4/4.20.3/gtk/css, directory renamed /usr/src/debug/gtk4/4.20.2/gsk -> /usr/src/debug/gtk4/4.20.3/gsk, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/media -> /usr/src/debug/gtk4/4.20.3/gtk/media, directory renamed 
 /usr/src/debug/gtk4/4.20.2/testsuite/reftests -> /usr/src/debug/gtk4/4.20.3/testsuite/reftests, directory renamed /usr/src/debug/gtk4/4.20.2/gtk/print/backends -> /usr/src/debug/gtk4/4.20.3/gtk/print/backends
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4-staticdev: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGSIZE changed from 18779030 to 18833598 (+0%)
packages/x86-64-v3-poky-linux/gtk4/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4/gtk4: FILELIST: removed "/usr/lib/libgtk-4.so.1.2000.2", added "/usr/lib/libgtk-4.so.1.2000.3"
packages/x86-64-v3-poky-linux/gtk4: PV changed from "4.20.2" to "4.20.3"
packages/x86-64-v3-poky-linux/gtk4: PKGV changed from 4.20.2 [default] to 4.20.3 [default]
packages/x86-64-v3-poky-linux/gtk4: SRC_URI changed from "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.2.tar.xz;name=archive" to "https://download.gnome.org/sources//gtk/4.20/gtk-4.20.3.tar.xz;name=archive"
Changes to packages/x86-64-v3-poky-linux/gtk4 (sysroot):
  /usr/lib/libgtk-4.so.1 changed symlink target from libgtk-4.so.1.2000.2 to libgtk-4.so.1.2000.3
  /usr/lib/libgtk-4.so.1.2000.2 moved to /usr/lib/libgtk-4.so.1.2000.3

--===============4024190869325687714==--

