Return-Path: <alexander.sverdlin@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D5DCC47258
	for <webhook@archiver.kernel.org>; Wed, 10 Jan 2024 21:20:28 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.5738.1704921621240071301
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jan 2024 13:20:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=alexander.sverdlin@siemens.com header.s=fm1 header.b=VtlpZxoO;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-456497-202401102120071fe7caa4be2b7e0bbc-4fvrbx@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 202401102120071fe7caa4be2b7e0bbc
        for <openembedded-core@lists.openembedded.org>;
        Wed, 10 Jan 2024 22:20:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=eSIiSPei2BWRv9EiTKqZEr8b5Svdlj5nycjC9OUB0hc=;
 b=VtlpZxoO31awMKH93e6Ee2NnD7s5+s2CRynYVukIs3j3hTTyqM4zMGHEVzE/+HmOSWcexU
 VoZ1iy0Uq0o8Z3tvRH4hdUewxqBCzUtEBImLNQmeyAIRPz9SVsjo6shIETTfVRc5nx68spM7
 z9mSnFwzDZLGZRQtrZ12E6/UQbO+o=;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>
Subject: [PATCH 2/2] linux-firmware: package PowerVR firmware
Date: Wed, 10 Jan 2024 22:19:57 +0100
Message-ID: <20240110212003.909270-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20240110212003.909270-1-alexander.sverdlin@siemens.com>
References: <20240110212003.909270-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jan 2024 21:20:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193529

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

linux-firmware commit 9afbbf25689c
("powervr: add firmware for Imagination Technologies AXE-1-16M GPU")
has added the initial firmware for AXE-1-16M GPU.

New packages will be called linux-firmware-powervr{-license}.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 .../linux-firmware/linux-firmware_20231211.bb       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
index 0ed4d91f8ab..38b942c85d2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20231211.bb
@@ -52,6 +52,7 @@ LICENSE = "\
     & Firmware-OLPC \
     & Firmware-ath9k-htc \
     & Firmware-phanfw \
+    & Firmware-powervr \
     & Firmware-qat \
     & Firmware-qcom \
     & Firmware-qcom-yamato \
@@ -125,6 +126,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
+                    file://LICENSE.powervr;md5=83045ed2a2cda15b4eaff682c98c9533 \
                     file://LICENCE.qat_firmware;md5=72de83dfd9b87be7685ed099a39fbea4 \
                     file://LICENSE.qcom;md5=164e3362a538eb11d3ac51e8e134294b \
                     file://LICENSE.qcom_yamato;md5=d0de0eeccaf1843a850bf7a6777eec5c \
@@ -202,6 +204,7 @@ NO_GENERIC_LICENSE[Firmware-nxp_mc_firmware] = "LICENSE.nxp_mc_firmware"
 NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
+NO_GENERIC_LICENSE[Firmware-powervr] = "LICENSE.powervr"
 NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qcom] = "LICENSE.qcom"
 NO_GENERIC_LICENSE[Firmware-qcom-yamato] = "LICENSE.qcom_yamato"
@@ -361,6 +364,7 @@ PACKAGES =+ "${PN}-amphion-vpu-license ${PN}-amphion-vpu \
              ${PN}-netronome-license ${PN}-netronome \
              ${PN}-olpc-license ${PN}-olpc \
              ${PN}-phanfw-license ${PN}-phanfw \
+             ${PN}-powervr-license ${PN}-powervr \
              ${PN}-qat ${PN}-qat-license \
              ${PN}-qcom-license ${PN}-qcom-yamato-license \
              ${PN}-qcom-venus-1.8 ${PN}-qcom-venus-4.2 ${PN}-qcom-venus-5.2 ${PN}-qcom-venus-5.4 ${PN}-qcom-venus-6.0 \
@@ -780,6 +784,15 @@ FILES:${PN}-phanfw-license = "${nonarch_base_libdir}/firmware/LICENCE.phanfw"
 
 RDEPENDS:${PN}-phanfw += "${PN}-phanfw-license"
 
+# For PowerVR
+LICENSE:${PN}-powervr = "Firmware-powervr"
+LICENSE:${PN}-powervr-license = "Firmware-powervr"
+
+FILES:${PN}-powervr = "${nonarch_base_libdir}/firmware/powervr"
+FILES:${PN}-powervr-license = "${nonarch_base_libdir}/firmware/LICENSE.powervr"
+
+RDEPENDS:${PN}-powervr += "${PN}-powervr-license"
+
 # For qla2xxx
 LICENSE:${PN}-qla2xxx = "Firmware-qla2xxx"
 LICENSE:${PN}-qla2xxx-license = "Firmware-qla2xxx"
-- 
2.43.0


