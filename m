Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.3390.1592384311048737571
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jun 2020 01:58:31 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: yongxin.liu@windriver.com)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com [147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 05H8wTjR006847
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2020 01:58:29 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCB.corp.ad.wrs.com
 (147.11.189.41) with Microsoft SMTP Server id 14.3.487.0; Wed, 17 Jun 2020
 01:58:09 -0700
From: "Yongxin Liu" <yongxin.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH] linux-firmware: add ice for Intel E800 series driver
Date: Wed, 17 Jun 2020 16:55:03 +0800
Message-ID: <20200617085503.3132-1-yongxin.liu@windriver.com>
X-Mailer: git-send-email 2.14.4
MIME-Version: 1.0
Content-Type: text/plain

Signed-off-by: Yongxin Liu <yongxin.liu@windriver.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
index fcad7df629..18f44bccae 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200519.bb
@@ -26,6 +26,7 @@ LICENSE = "\
     & Firmware-i2400m \
     & Firmware-i915 \
     & Firmware-ibt_firmware \
+    & Firmware-ice \
     & Firmware-it913x \
     & Firmware-iwlwifi_firmware \
     & Firmware-IntcSST2 \
@@ -155,6 +156,7 @@ NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i2400m] = "LICENCE.i2400m"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
+NO_GENERIC_LICENSE[Firmware-ice] = "LICENSE.ice"
 NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
@@ -280,6 +282,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-ibt-11-5 ${PN}-ibt-12-16 ${PN}-ibt-hw-37-7 ${PN}-ibt-hw-37-8 \
              ${PN}-ibt-17 \
              ${PN}-i915-license ${PN}-i915 \
+             ${PN}-ice-license ${PN}-ice \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-liquidio \
@@ -828,6 +831,12 @@ FILES_${PN}-i915-license = "${nonarch_base_libdir}/firmware/LICENSE.i915"
 FILES_${PN}-i915         = "${nonarch_base_libdir}/firmware/i915"
 RDEPENDS_${PN}-i915      = "${PN}-i915-license"
 
+LICENSE_${PN}-ice       = "Firmware-ice"
+LICENSE_${PN}-ice-license = "Firmware-ice"
+FILES_${PN}-ice-license = "${nonarch_base_libdir}/firmware/LICENSE.ice"
+FILES_${PN}-ice         = "${nonarch_base_libdir}/firmware/intel/ice"
+RDEPENDS_${PN}-ice      = "${PN}-ice-license"
+
 FILES_${PN}-adsp-sst-license      = "${nonarch_base_libdir}/firmware/LICENCE.adsp_sst"
 LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
 LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
-- 
2.14.4

