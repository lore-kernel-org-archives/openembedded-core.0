Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36696C25B7C
	for <webhook@archiver.kernel.org>; Fri, 31 May 2024 11:55:16 +0000 (UTC)
Received: from smtp-42ac.mail.infomaniak.ch (smtp-42ac.mail.infomaniak.ch [84.16.66.172])
 by mx.groups.io with SMTP id smtpd.web11.9665.1717156514437814240
 for <openembedded-core@lists.openembedded.org>;
 Fri, 31 May 2024 04:55:14 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: 0leil.net, ip: 84.16.66.172, mailfrom: foss+yocto@0leil.net)
Received: from smtp-4-0000.mail.infomaniak.ch (smtp-4-0000.mail.infomaniak.ch [10.7.10.107])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4VrM4c5jfmz2Tc;
	Fri, 31 May 2024 13:55:12 +0200 (CEST)
Received: from unknown by smtp-4-0000.mail.infomaniak.ch (Postfix) with ESMTPA id 4VrM4c3YHNzvJF;
	Fri, 31 May 2024 13:55:12 +0200 (CEST)
From: Quentin Schulz <foss+yocto@0leil.net>
Date: Fri, 31 May 2024 13:53:58 +0200
Subject: [PATCH 3/3] mesa: add new package for Mali CSFFW Valhall firmware
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240531-panthor-v1-3-1a76fd752c1b@cherry.de>
References: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
In-Reply-To: <20240531-panthor-v1-0-1a76fd752c1b@cherry.de>
To: Quentin Schulz <quentin.schulz@cherry.de>, 
 openembedded-core@lists.openembedded.org
X-Mailer: b4 0.13.0
X-Infomaniak-Routing: alpha
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 May 2024 11:55:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200067

From: Quentin Schulz <quentin.schulz@cherry.de>

This firmware is necessary for closed-source mali blob + drivers and
open-source Panthor (via Mesa + Linux kernel) drivers.

Signed-off-by: Quentin Schulz <quentin.schulz@cherry.de>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
index 026e5dba00..4a87105d98 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20240513.bb
@@ -39,6 +39,7 @@ LICENSE = "\
     & Firmware-kaweth \
     & Firmware-linaro \
     & Firmware-Lontium \
+    & Firmware-mali_csffw \
     & Firmware-Marvell \
     & Firmware-mediatek \
     & Firmware-microchip \
@@ -113,6 +114,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.kaweth;md5=b1d876e562f4b3b8d391ad8395dfe03f \
                     file://LICENCE.linaro;md5=936d91e71cf9cd30e733db4bf11661cc \
                     file://LICENSE.Lontium;md5=4ec8dc582ff7295f39e2ca6a7b0be2b6 \
+                    file://LICENCE.mali_csffw;md5=e064aaec4d21ef856e1b76a6f5dc435f \
                     file://LICENCE.Marvell;md5=28b6ed8bd04ba105af6e4dcd6e997772 \
                     file://LICENCE.mediatek;md5=7c1976b63217d76ce47d0a11d8a79cf2 \
                     file://LICENCE.microchip;md5=db753b00305675dfbf120e3f24a47277 \
@@ -192,6 +194,7 @@ NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
 NO_GENERIC_LICENSE[Firmware-kaweth] = "LICENCE.kaweth"
 NO_GENERIC_LICENSE[Firmware-linaro] = "LICENCE.linaro"
 NO_GENERIC_LICENSE[Firmware-Lontium] = "LICENSE.Lontium"
+NO_GENERIC_LICENSE[Firmware-mali_csffw] = "LICENCE.mali_csffw"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mediatek] = "LICENCE.mediatek"
 NO_GENERIC_LICENSE[Firmware-microchip] = "LICENCE.microchip"
@@ -354,6 +357,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-bnx2 \
              ${PN}-bnx2x \
              ${PN}-liquidio \
+             ${PN}-mali-csffw-arch108 ${PN}-mali-csffw-license \
              ${PN}-mellanox \
              ${PN}-nvidia-license \
              ${PN}-nvidia-tegra-k1 ${PN}-nvidia-tegra \
@@ -608,6 +612,13 @@ LICENSE:${PN}-lt9611uxc = "Firmware-Lontium"
 FILES:${PN}-lontium-license = "${nonarch_base_libdir}/firmware/LICENSE.Lontium"
 FILES:${PN}-lt9611uxc = "${nonarch_base_libdir}/firmware/lt9611uxc_fw.bin"
 
+# For Arm Mali
+LICENSE:${PN}-mali-csffw-arch108 = "Firmware-mali_csffw"
+FILES:${PN}-mali-csffw-license = "${nonarch_base_libdir}/firmware/LICENCE.mali_csffw"
+FILES:${PN}-mali-csffw-arch108 = "${nonarch_base_libdir}/firmware/arm/mali/arch10.8/mali_csffw.bin"
+
+RDEPENDS:${PN}-mali-csffw-arch108 += "${PN}-mali-csffw-license"
+
 # For marvell
 LICENSE:${PN}-pcie8897 = "Firmware-Marvell"
 LICENSE:${PN}-pcie8997 = "Firmware-Marvell"

-- 
2.45.1


