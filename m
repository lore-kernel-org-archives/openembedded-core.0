Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web12.11097.1593399884441016497
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Jun 2020 20:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: jun.miao@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 05T345N7016042
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Sun, 28 Jun 2020 20:04:16 -0700
Received: from pek-jmiao1-u16.wrs.com (128.224.162.214) by
 ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 20:03:42 -0700
From: "jmiao1" <jun.miao@windriver.com>
To: <richard.purdie@linuxfoundation.org>
CC: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][PATCH] linux-firmware: add iwlwifi FWs Qu for IceLake-Y/U
Date: Mon, 29 Jun 2020 11:03:41 +0800
Message-ID: <1593399821-19454-1-git-send-email-jun.miao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain

Add wifi Qu firmware required by intel AX201NGW chipset on Icelake-Y/U.

Signed-off-by: Jun Miao <jun.miao@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
index 392e03a10a..726055738f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200619.bb
@@ -277,6 +277,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-7265 \
              ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
              ${PN}-iwlwifi-9000 \
+             ${PN}-iwlwifi-Qu-c0-hr \
              ${PN}-iwlwifi-misc \
              ${PN}-ibt-license ${PN}-ibt ${PN}-ibt-misc \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
@@ -728,6 +729,7 @@ LICENSE_${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-9000      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-Qu-c0-hr  = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-misc      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-license   = "Firmware-iwlwifi_firmware"
 
@@ -755,6 +757,7 @@ FILES_${PN}-iwlwifi-7265d   = "${nonarch_base_libdir}/firmware/iwlwifi-7265D-*.u
 FILES_${PN}-iwlwifi-8000c   = "${nonarch_base_libdir}/firmware/iwlwifi-8000C-*.ucode"
 FILES_${PN}-iwlwifi-8265   = "${nonarch_base_libdir}/firmware/iwlwifi-8265-*.ucode"
 FILES_${PN}-iwlwifi-9000   = "${nonarch_base_libdir}/firmware/iwlwifi-9000-*.ucode"
+FILES_${PN}-iwlwifi-Qu-c0-hr = "${nonarch_base_libdir}/firmware/iwlwifi-Qu-c0-hr-*.ucode"
 FILES_${PN}-iwlwifi-misc   = "${nonarch_base_libdir}/firmware/iwlwifi-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
@@ -779,6 +782,7 @@ RDEPENDS_${PN}-iwlwifi-7265d     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-9000      = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-Qu-c0-hr  = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-misc      = "${PN}-iwlwifi-license"
 
 # -iwlwifi-misc is a "catch all" package that includes all the iwlwifi
-- 
2.25.1

