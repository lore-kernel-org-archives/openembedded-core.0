Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F250BD5E154
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 08:02:50 +0000 (UTC)
Received: from a27-30.smtp-out.us-west-2.amazonses.com (a27-30.smtp-out.us-west-2.amazonses.com [54.240.27.30])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17414.1765872163941707034
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Dec 2025 00:02:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=l9NTnGBg;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PFbWE4BF;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.30, mailfrom: 0101019b262ee6db-3372df84-dd89-4edb-9ce0-f0ea7f886340-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fl/BzHglwTaeA3vHGvycNvysBV9sBGlAjV1vap4gYVo=;
	b=l9NTnGBgZwv6P1t814zmMp6dhH2dhYcd6HWN2UGD2FkhehJDgmpwSceB4ubN4n4g
	QkqrmV6mIjP4X6LwZtcXSBKDgNMKlTxba+J3sxQlgjuMTB7wuAns+RD1HYJUwDU2QgK
	6a/DqP51Ql55XIeVmtJ+mIB+d5WY35ZGrvwishm0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1765872166;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fl/BzHglwTaeA3vHGvycNvysBV9sBGlAjV1vap4gYVo=;
	b=PFbWE4BF3wsWq3JuOncGjrDq/Ut9d9DAr61HPhf19htNi3rxGpE/D/0dQLsz0Pjx
	h3V7v/TkmyBvTfoQrexbpPPgBrbXFleCzxwNvI19Cm1wvfzGOksqRJaDBudVU1fbJES
	aKqNfaSIKX1Evm3+eqx5laxCHJ6yQBISeYXbmG0k=
Content-Type: multipart/mixed; boundary="===============4811116016323401272=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] gstreamer1.0-python: upgrading to 1.26.9 SUCCEEDED
Message-ID: <0101019b262ee6db-3372df84-dd89-4edb-9ce0-f0ea7f886340-000000@us-west-2.amazonses.com>
Date: Tue, 16 Dec 2025 08:02:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.12.16-54.240.27.30
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Dec 2025 08:02:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227904

--===============4811116016323401272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *gstreamer1.0-python* to *1.26.9* has Succeeded.

Next steps:
    - apply the patch: git am 0001-gstreamer1.0-python-upgrade-1.26.7-1.26.9.patch
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
From 800a945276329c05777d895b1472550e7fed8f4b Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 16 Dec 2025 06:10:12 +0000
Subject: [PATCH] gstreamer1.0-python: upgrade 1.26.7 -> 1.26.9

---
 ...reamer1.0-python_1.26.7.bb => gstreamer1.0-python_1.26.9.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.26.7.bb => gstreamer1.0-python_1.26.9.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
index 9a3a86fcbb..57ddf0bbba 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.7.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb
@@ -8,7 +8,7 @@ LICENSE = "LGPL-2.1-or-later"
 LIC_FILES_CHKSUM = "file://COPYING;md5=c34deae4e395ca07e725ab0076a5f740"
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.xz"
-SRC_URI[sha256sum] = "7a544b7968b181c2965e979f2ce889db36397790de9a7c312cf468b51d26428c"
+SRC_URI[sha256sum] = "21a51d35fd973af1186795d3d9d696f321584aeb09ab4d176b59f26e842b8849"
 
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject gstreamer1.0-plugins-bad"
 RDEPENDS:${PN} += "gstreamer1.0 gstreamer1.0-plugins-base python3-pygobject"
-- 
2.47.1


--===============4811116016323401272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGSIZE changed from 211408 to 211600 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dbg: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-dev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-doc: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-locale: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: FILELIST: directory renamed /usr/src/debug/gstreamer1.0-python/1.26.7/plugin -> /usr/src/debug/gstreamer1.0-python/1.26.9/plugin, directory renamed /usr/src/debug/gstreamer1.0-python/1.26.7/gi/overrides -> /usr/src/debug/gstreamer1.0-python/1.26.9/gi/overrides
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGSIZE changed from 67937 to 67958 (+0%)
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-src: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python-staticdev: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGSIZE changed from 185761 to 190321 (+2%)
packages/x86-64-v3-poky-linux/gstreamer1.0-python/gstreamer1.0-python: PKGV changed from 1.26.7 [default] to 1.26.9 [default]
packages/x86-64-v3-poky-linux/gstreamer1.0-python: SRC_URI changed from "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.26.7.tar.xz" to "https://gstreamer.freedesktop.org/src/gst-python/gst-python-1.26.9.tar.xz"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PV changed from "1.26.7" to "1.26.9"
packages/x86-64-v3-poky-linux/gstreamer1.0-python: PKGV changed from 1.26.7 [default] to 1.26.9 [default]

--===============4811116016323401272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 949 .bb files complete (0 cached, 949 parsed). 1951 targets, 71 skipped, 0 masked, 0 errors.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "arm-poky-linux-musleabi"
MACHINE              = "qemuarm"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7617400b5a2b101703ddf577c7245406d1589eea"
TUNE_FEATURES        = "arm vfp cortexa15 neon thumb callconvention-hard"
TARGET_FPU           = "hard"
meta                 = "tmp-auh-upgrades:7617400b5a2b101703ddf577c7245406d1589eea"
meta-yocto-bsp       
meta-poky            = "master:b3b659263566c4d2f2813190e72d93f8598a4c47"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 949 Local 922 Mirrors 0 Missed 27 Current 391 (97% match, 97% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 392 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 393 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_qa_setscene)
NOTE: Running setscene task 421 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 431 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 432 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 454 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_qa_setscene)
NOTE: Running setscene task 462 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 490 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 493 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_populate_lic_setscene)
NOTE: Running setscene task 523 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 526 of 1340 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 529 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 530 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 532 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_create_spdx_setscene)
NOTE: Running setscene task 533 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_create_spdx_setscene)
NOTE: Running setscene task 535 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_qa_setscene: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_populate_lic_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Started
NOTE: recipe shaderc-native-2025.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 536 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 539 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 540 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 541 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 542 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_create_spdx_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shaderc-native-2025.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 547 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 550 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_create_spdx_setscene)
NOTE: Running setscene task 551 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 555 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 556 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 565 of 1340 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 567 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Started
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-native-2025.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 568 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 570 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 572 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 573 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-3.13.9-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 576 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 577 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 580 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 581 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/unzip/unzip_6.0.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 582 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_packagedata_setscene)
NOTE: Running setscene task 583 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_packagedata_setscene)
NOTE: recipe python3-pygobject-3.54.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 585 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 586 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 588 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-locales_git.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.85-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 589 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_create_spdx_setscene: Started
NOTE: recipe shaderc-native-2025.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 592 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_create_spdx_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 595 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 596 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 599 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_populate_sysroot_setscene)
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe unzip-1_6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 600 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils_2.45.bb:do_packagedata_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 603 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 605 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 607 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_populate_sysroot_setscene)
NOTE: recipe libusb1-1.0.29-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 609 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 611 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe libgudev-238-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 615 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 616 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 618 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 619 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 622 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.9.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libwebp-1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 628 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libusb/libusb1_1.0.29.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 633 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-locales-1.0+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe librsvg-2.61.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 634 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 636 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 646 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 649 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 652 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 653 of 1340 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/shaderc/shaderc_2025.3.bb:do_recipe_qa_setscene)
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-pycairo-1.28.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 654 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 656 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb:do_packagedata_setscene)
NOTE: recipe binutils-2.45.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libusb1-1.0.29-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 657 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmpc/libmpc_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 662 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe librsvg-2.61.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 663 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_packagedata_setscene)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 665 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: Running setscene task 666 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe shaderc-native-2025.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-pycairo-1.28.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 672 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 673 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.85.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.28.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 677 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pygobject_3.54.5.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 679 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shaderc-native-2025.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 680 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_package_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-pygobject-3.54.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmpc-1.3.1-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/python3-pycairo/1.28.0/temp/log.do_packagedata_setscene.3082166
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe coreutils-9.9-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bluez5-5.85-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-pygobject-3.54.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 681 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 689 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 690 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb:do_package_setscene)
NOTE: Running setscene task 692 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.194.bb:do_packagedata_setscene)
NOTE: Running setscene task 695 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 696 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 697 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 701 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 702 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/webp/libwebp_1.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 705 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 706 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/librsvg/librsvg_2.61.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 712 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 713 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 715 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 717 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 721 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/libgudev/libgudev_238.bb:do_recipe_qa_setscene)
NOTE: recipe libwebp-1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 727 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 730 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 734 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 738 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 740 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 741 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/mpfr/mpfr_4.2.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 745 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 746 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 751 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe librsvg-2.61.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 752 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.194-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 760 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libstd-rs-1.91.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgudev-238-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 761 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 763 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.91.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 765 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.86.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 772 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 773 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe mpfr-4.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 774 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.8.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 776 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 777 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 779 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_setscene: Started
NOTE: recipe python3-pycairo-1.28.0-r0: task do_package_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 781 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 783 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 784 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libstd-rs-1.91.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 785 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 786 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 790 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 791 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 794 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: Running setscene task 799 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 806 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 807 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/rust/libstd-rs_1.91.1.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 810 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 811 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 817 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 821 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libstd-rs-1.91.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 822 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 827 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 828 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: recipe libunwind-1.8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 830 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.11.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-pycairo-1.28.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libstd-rs-1.91.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 834 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 835 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 853 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 856 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 859 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 865 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 872 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_packagedata_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 876 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 877 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.42.12.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-pycairo-1.28.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 878 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 879 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunwind/libunwind_1.8.3.bb:do_recipe_qa_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 881 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 886 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 890 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.77.bb:do_packagedata_setscene)
NOTE: Running setscene task 892 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 894 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 899 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe python3-pycairo-1.28.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gdk-pixbuf-2.42.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gnutls-3.8.11-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe libunwind-1.8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 905 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 908 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 909 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 910 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 911 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 914 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 920 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 921 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.77-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 935 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 945 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/shared-mime-info/shared-mime-info_2.4.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 950 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 953 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 955 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 957 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 958 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe shared-mime-info-2.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libunistring-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 968 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1103 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe libunistring-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1333 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: Running task 1334 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1710 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1752 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: Running task 1760 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_fetch)
NOTE: Running task 1771 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_write_config)
NOTE: Running task 1801 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_write_config)
NOTE: Running task 1818 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_fetch)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_fetch: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_fetch: Succeeded
NOTE: Running task 1942 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_unpack)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_write_config: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_fetch: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_write_config: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Started
NOTE: Running task 1943 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1945 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_write_config: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_unpack: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_fetch: Succeeded
NOTE: Running task 1946 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: Running task 1947 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_unpack: Succeeded
NOTE: Running task 1948 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running task 1949 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_unpack: Succeeded
NOTE: Running task 1952 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_unpack: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_patch: Started
NOTE: Running task 1953 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_patch)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1954 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 1955 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_patch: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 969 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 970 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 971 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 972 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 973 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 974 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 975 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 976 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 977 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 978 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 979 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_packagedata_setscene)
NOTE: Running setscene task 980 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 982 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 983 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 984 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_populate_sysroot_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 986 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libtheora-1.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 987 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 988 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_packagedata_setscene)
NOTE: recipe orc-0.4.41-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 989 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 991 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 993 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 997 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_packagedata_setscene)
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 999 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_packagedata_setscene)
NOTE: Running setscene task 1000 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/jpeg/libjpeg-turbo_3.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1002 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Started
NOTE: recipe harfbuzz-11.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Started
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1003 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb:do_populate_sysroot_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to 56f86136d7a4cf1994dc4410aea1740546a49f4519d7112a9e473f8c6a2f81f4
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash aa83d36531b414a37ba24c1615089532313bc96dfe7ff2980710bb6c504ad2d2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'dc2f5909d65fbd4b71a230a67c8055ea77d6e075251e935ca202407cbed2027c', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'aa83d36531b414a37ba24c1615089532313bc96dfe7ff2980710bb6c504ad2d2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed dc2f5909d65fbd4b71a230a67c8055ea77d6e075251e935ca202407cbed2027c -> aa83d36531b414a37ba24c1615089532313bc96dfe7ff2980710bb6c504ad2d2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: Running setscene task 1004 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_populate_sysroot_setscene)
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libjpeg-turbo-1_3.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libglu-2_9.0.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxv-1.0.13-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1006 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libtheora/libtheora_1.2.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1007 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_package_setscene)
NOTE: Running setscene task 1008 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/pango/pango_1.57.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1009 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_packagedata_setscene)
NOTE: Running setscene task 1014 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1015 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1016 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1019 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe orc-0.4.41-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1024 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1025 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/orc/orc_0.4.41.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1026 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libglu-2_9.0.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1027 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1028 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxv_1.0.13.bb:do_recipe_qa_setscene)
NOTE: recipe harfbuzz-11.5.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtheora-1.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1031 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxft_2.3.9.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pango-1.57.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1032 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1034 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/libglu_9.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_packagedata_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe orc-0.4.41-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1037 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: recipe libxv-1.0.13-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.5.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1039 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1041 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1042 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/harfbuzz/harfbuzz_11.5.1.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe fribidi-1.0.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1045 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/fribidi/fribidi_1.0.16.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1046 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1049 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe harfbuzz-11.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxft-1_2.3.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1051 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1052 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1053 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1054 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libglu-2_9.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1055 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe harfbuzz-11.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1056 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_packagedata_setscene)
NOTE: recipe fribidi-1.0.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1058 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1059 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_packagedata_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe cairo-1.18.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1061 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1063 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/cairo/cairo_1.18.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1064 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1065 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1066 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1067 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1069 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1070 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1074 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1076 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1079 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe fontconfig-2.17.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1083 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe cairo-1.18.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1084 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1085 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1086 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1089 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1090 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/fontconfig/fontconfig_2.17.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1091 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1094 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1095 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1096 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1098 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1100 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.128.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1101 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1105 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1106 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1108 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.128-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe fontconfig-2.17.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1112 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1116 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1117 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1118 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.51.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.128-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1120 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.51.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1122 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/freetype/freetype_2.13.3.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1124 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1126 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1128 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libpng-1.6.51-r0: task do_packagedata_setscene: Started
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.51-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe freetype-2.13.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1131 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1132 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1133 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1135 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.51-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1138 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpng-1.6.51-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1140 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libpng/libpng_1.6.51.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpng-1.6.51-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1143 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe libpng-1.6.51-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1145 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1147 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1148 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2140 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1150 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1152 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1153 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1155 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1156 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1157 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1158 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1160 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1162 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1163 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1164 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1165 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1166 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1168 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running setscene task 1169 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1171 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1172 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1173 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1176 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1177 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 27a1287f03f8699e6a83b8e7203f6b85f617ccd1b7f11fa183cd486905f39fba
NOTE: Reported task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx as unihash aa83d36531b414a37ba24c1615089532313bc96dfe7ff2980710bb6c504ad2d2 to wss://hashserv-eu.yoctoproject.org/ws ({'taskhash': 'c4aacc57078717eba1492e6977c76430685e4403b74e7c65aa07c3c7bd47c9ed', 'method': 'oe.sstatesig.OEOuthashBasic', 'unihash': 'aa83d36531b414a37ba24c1615089532313bc96dfe7ff2980710bb6c504ad2d2'})
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx unihash changed c4aacc57078717eba1492e6977c76430685e4403b74e7c65aa07c3c7bd47c9ed -> aa83d36531b414a37ba24c1615089532313bc96dfe7ff2980710bb6c504ad2d2 as wanted
NOTE: Already covered setscene for /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx so ignoring rehash (remap)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1178 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1184 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1185 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1187 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1188 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1190 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.15.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1193 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.15.1.bb:do_recipe_qa_setscene)
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxml2-2.15.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1197 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1199 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1201 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1202 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1203 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1204 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1205 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.1.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1208 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.86.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1210 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1212 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1214 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1217 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1219 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1221 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1222 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1224 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1225 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1226 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1227 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1229 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1230 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1231 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1233 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1234 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1235 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1236 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1237 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1238 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1239 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1240 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1241 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1242 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1246 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1248 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1250 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1251 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1252 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1254 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1256 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1257 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1258 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_populate_sysroot_setscene)
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1261 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1262 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1268 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1272 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1274 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1277 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1280 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1281 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1282 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.51.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1285 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20251016-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1286 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1288 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.51.1.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1290 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1292 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1294 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1297 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20251016-3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.51.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1298 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1300 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1301 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1303 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1305 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1307 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1308 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1310 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1312 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1314 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1315 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1317 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1318 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 1319 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1321 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1326 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1327 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1331 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1336 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1338 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1340 of 1340 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3351 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3353 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-pycairo_1.28.0.bb:do_packagedata)
NOTE: Running task 3534 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3623 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_collect_spdx_deps)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe python3-pycairo-1.28.0-r0: task do_packagedata: Started
NOTE: Running task 3624 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_package_write_ipk)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3625 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_package_write_deb)
NOTE: Running task 3626 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_package_write_rpm)
NOTE: Running task 3627 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_package_qa)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_collect_spdx_deps: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_qa: Started
NOTE: recipe python3-pycairo-1.28.0-r0: task do_packagedata: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3641 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_configure)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3642 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_configure)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.26.7.bb:do_package_qa unihash changed to 70ddc583372f222c467641f782ee646947626c1b76d22638225f8b66bc1297be
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_configure: Succeeded
NOTE: Running task 3643 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_compile: Succeeded
NOTE: Running task 3644 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_install)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_install: Succeeded
NOTE: Running task 3645 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_package)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-base-1.26.7-r0: task do_package_write_deb: Succeeded
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_package: Succeeded
NOTE: Running task 3646 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_configure: Succeeded
NOTE: Running task 3647 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_compile)
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_compile: Started
NOTE: recipe gnome-desktop-testing-2021.1-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnome-desktop-testing/gnome-desktop-testing_2021.1.bb:do_packagedata unihash changed to c18f81f4331585c4b3cc4ef4a4ffae6a805da11b445740f28dacd00f02557eb2
NOTE: Setscene tasks completed
NOTE: Running task 3648 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_package_write_ipk)
NOTE: Running task 3649 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_package_write_deb)
NOTE: Running task 3650 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_package_write_rpm)
NOTE: Running task 3651 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_package_qa)
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_write_ipk: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_write_deb: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_write_rpm: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_qa: Started
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_write_ipk: Succeeded
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_write_rpm: Succeeded
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0_1.26.7.bb:do_package_qa unihash changed to 4add9d2315ba0c2b9e568a1bd66e18d4919b221cbbbc0c706a9d068d5a0b7708
NOTE: recipe gstreamer1.0-1.26.7-r0: task do_package_write_deb: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_compile: Succeeded
NOTE: Running task 3652 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_install)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_install: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_package)
NOTE: Running task 3654 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_package: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3655 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_prepare_recipe_sysroot)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3656 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_configure)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_configure: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_configure: Succeeded
NOTE: Running task 3657 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_compile)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_compile: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_compile: Succeeded
NOTE: Running task 3658 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_install)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_install: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_install: Succeeded
NOTE: Running task 3659 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-python_1.26.9.bb:do_populate_sysroot)
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_populate_sysroot: Started
NOTE: recipe gstreamer1.0-python-1.26.9-r0: task do_populate_sysroot: Succeeded
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_package: Succeeded
NOTE: Running task 3660 of 3671 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_packagedata)
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_packagedata: Started
NOTE: recipe gstreamer1.0-plugins-bad-1.26.7-r0: task do_packagedata: Failed
NOTE: Tasks Summary: Attempted 3660 tasks of which 3611 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216060905.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251216060905.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-bad/1.26.7/temp/log.do_packagedata.3124183
Summary: There were 192 ERROR messages, returning a non-zero exit code.
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-src went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dbg went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-staticdev went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-dev went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-doc went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo-locale went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: QA Issue: Package version for package python3-pycairo went backwards which would break package feeds (from 0:1.29.0-r0 to 0:1.28.0-r0) [version-going-backwards]
ERROR: python3-pycairo-1.28.0-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-src went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dbg went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-staticdev went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dev went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-doc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-af went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ast went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-az went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-bg went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ca went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-cs went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-da went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-de went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-el went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-en-gb went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eo went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-es went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-eu went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fi went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fr went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-fur went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-gl went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hr went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-hu went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-id went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-it went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ja went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ka went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ky went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lt went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-lv went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-mt went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nb went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-nl went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-or went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pl went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-pt-br went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ro went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-ru went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sk went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sl went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sq went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sr went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-sv went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-tr went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-uk went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-vi went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-cn went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-locale-zh-tw went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-apps went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-meta went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-glib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstadaptivedemux-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstanalytics-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstbadaudio-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstbasecamerabinsrc-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstcodecparsers-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstcodecs-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstcuda-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstdxva-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstinsertbin-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstisoff-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstmpegts-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstmse-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstphotography-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstplay-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstplayer-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstsctp-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgsttranscoder-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgsturidownloader-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstvulkan-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstwayland-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package libgstwebrtc-1.0 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-accurip went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmdec went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-adpcmenc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aes went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-aiff went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-analyticsoverlay went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-asfmux went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiobuffersplit went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiofxbad went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiolatency went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiomixmatrix went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-audiovisualizers went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-autoconvert went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bayer went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bluez went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-bz2 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-camerabin went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-closedcaption went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecalpha went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codectimestamper went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-coloreffects went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-curl went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dash went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-debugutilsbad went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-decklink went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dtls went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvb went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsubenc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvbsuboverlay went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dvdspu went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-faceoverlay went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fbdevsink went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-festival went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-fieldanalysis went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-freeverb went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-frei0r went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gaudieffects went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-gdp went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-geometrictransform went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-hls went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-id3tag went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-inter went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-interlace went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ipcpipeline went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivfparse went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ivtc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jp2kdecimator went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-jpegformat went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-legacyrawparse went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-midi went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsdemux went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegpsmux went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsdemux went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegtsmux went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mxf went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-netsim went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pcapparse went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-pnm went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-proxy went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-removesilence went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rfbsrc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rist went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rsvg went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtmp2 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtpmanagerbad went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-rtponvif went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sbc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sdpelem went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-segmentclip went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-shm went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-siren went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smooth went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-smoothstreaming went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-sndfile went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-speed went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-subenc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-switchbin went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-timecode went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcode went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-ttmlsubs went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-unixfd went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvcgadget went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-uvch264 went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videofiltersbad went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoframe-audiolevel went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videoparsersbad went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-videosignal went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vmnc went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-waylandsink went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webp went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-y4mdec went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-analytics-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-badaudio-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-codecs-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-cuda-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-dxva-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-insertbin-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mpegts-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-mse-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-play-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-player-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-transcoder-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkan-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanwayland-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-vulkanxcb-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: QA Issue: Package version for package gstreamer1.0-plugins-bad-webrtc-typelib went backwards which would break package feeds (from 0:1.26.9-r0 to 0:1.26.7-r0) [version-going-backwards]
ERROR: gstreamer1.0-plugins-bad-1.26.7-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/cortexa15t2hf-neon-poky-linux-musleabi/gstreamer1.0-plugins-bad/1.26.7/temp/log.do_packagedata.3124183
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.26.7.bb:do_packagedata) failed with exit code '1'

--===============4811116016323401272==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-gstreamer1.0-python-upgrade-1.26.7-1.26.9.patch"

RnJvbSA4MDBhOTQ1Mjc2MzI5YzA1Nzc3ZDg5NWIxNDcyNTUwZTdmZWQ4ZjRiIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTYgRGVjIDIwMjUgMDY6MTA6MTIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBn
c3RyZWFtZXIxLjAtcHl0aG9uOiB1cGdyYWRlIDEuMjYuNyAtPiAxLjI2LjkKCi0tLQogLi4ucmVh
bWVyMS4wLXB5dGhvbl8xLjI2LjcuYmIgPT4gZ3N0cmVhbWVyMS4wLXB5dGhvbl8xLjI2LjkuYmJ9
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCiBy
ZW5hbWUgbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL3tnc3RyZWFtZXIxLjAtcHl0
aG9uXzEuMjYuNy5iYiA9PiBnc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjYuOS5iYn0gKDkxJSkKCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0cmVhbWVyMS4w
LXB5dGhvbl8xLjI2LjcuYmIgYi9tZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI2LjkuYmIKc2ltaWxhcml0eSBpbmRleCA5MSUKcmVuYW1lIGZy
b20gbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEuMC1weXRob25f
MS4yNi43LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtbXVsdGltZWRpYS9nc3RyZWFtZXIvZ3N0
cmVhbWVyMS4wLXB5dGhvbl8xLjI2LjkuYmIKaW5kZXggOWEzYTg2ZmNiYi4uNTdkZGYwYmJiYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLW11bHRpbWVkaWEvZ3N0cmVhbWVyL2dzdHJlYW1lcjEu
MC1weXRob25fMS4yNi43LmJiCisrKyBiL21ldGEvcmVjaXBlcy1tdWx0aW1lZGlhL2dzdHJlYW1l
ci9nc3RyZWFtZXIxLjAtcHl0aG9uXzEuMjYuOS5iYgpAQCAtOCw3ICs4LDcgQEAgTElDRU5TRSA9
ICJMR1BMLTIuMS1vci1sYXRlciIKIExJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0NPUFlJTkc7
bWQ1PWMzNGRlYWU0ZTM5NWNhMDdlNzI1YWIwMDc2YTVmNzQwIgogCiBTUkNfVVJJID0gImh0dHBz
Oi8vZ3N0cmVhbWVyLmZyZWVkZXNrdG9wLm9yZy9zcmMvJHtQTlJFQUx9LyR7UE5SRUFMfS0ke1BW
fS50YXIueHoiCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiN2E1NDRiNzk2OGIxODFjMjk2NWU5Nzlm
MmNlODg5ZGIzNjM5Nzc5MGRlOWE3YzMxMmNmNDY4YjUxZDI2NDI4YyIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICIyMWE1MWQzNWZkOTczYWYxMTg2Nzk1ZDNkOWQ2OTZmMzIxNTg0YWViMDlhYjRkMTc2
YjU5ZjI2ZTg0MmI4ODQ5IgogCiBERVBFTkRTID0gImdzdHJlYW1lcjEuMCBnc3RyZWFtZXIxLjAt
cGx1Z2lucy1iYXNlIHB5dGhvbjMtcHlnb2JqZWN0IGdzdHJlYW1lcjEuMC1wbHVnaW5zLWJhZCIK
IFJERVBFTkRTOiR7UE59ICs9ICJnc3RyZWFtZXIxLjAgZ3N0cmVhbWVyMS4wLXBsdWdpbnMtYmFz
ZSBweXRob24zLXB5Z29iamVjdCIKLS0gCjIuNDcuMQoK

--===============4811116016323401272==--

