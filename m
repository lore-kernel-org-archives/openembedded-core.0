Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 233B073174
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 14:44:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 03 Feb 2016 06:44:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,391,1449561600"; d="scan'208";a="876092623"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 03 Feb 2016 06:44:59 -0800
Received: from mbabyjoh-mobl.fi.intel.com (mbabyjoh-mobl.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id D43F96A4004
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Feb 2016 07:32:51 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Feb 2016 16:47:40 +0200
Message-Id: <1454510860-20685-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH] linux-firmware: update to latest revision 52442afee
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Feb 2016 14:45:02 -0000

- Update to latest linux-firmware
- Renamed qat_dh895xcc_firmware to  qat_firmware based on commit
  8d1f7a11
- Updated license info for the ath9k_htc firmware

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0ed3970..9792686 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -24,7 +24,7 @@ LICENSE = "\
     & Firmware-myri10ge_firmware \
     & Firmware-OLPC \
     & Firmware-phanfw \
-    & Firmware-qat_dh895xcc_firmware \
+    & Firmware-qat \
     & Firmware-qla2xxx \
     & Firmware-r8a779x_usb3 \
     & Firmware-radeon \
@@ -42,6 +42,7 @@ LICENSE = "\
     & Firmware-siano \
     & Firmware-qualcommAthos_ar3k \
     & Firmware-qualcommAthos_ath10k \
+    & Firmware-ath9k-htc \
 "
 
 LIC_FILES_CHKSUM = "\
@@ -65,7 +66,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
-    file://LICENCE.qat_dh895xcc_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
+    file://LICENCE.qat_firmware;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
     file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
     file://LICENCE.r8a779x_usb3;md5=4c1671656153025d7076105a5da7e498 \
     file://LICENCE.ralink_a_mediatek_company_firmware;md5=728f1a85fd53fd67fa8d7afb080bc435 \
@@ -85,6 +86,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.siano;md5=602c79ae3f98f1e73d880fd9f940a418 \
     file://LICENSE.QualcommAtheros_ar3k;md5=b5fe244fb2b532311de1472a3bc06da5 \
     file://LICENSE.QualcommAtheros_ath10k;md5=b5fe244fb2b532311de1472a3bc06da5 \
+    file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -109,7 +111,7 @@ NO_GENERIC_LICENSE[Firmware-mwl8335] = "LICENCE.mwl8335"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
 NO_GENERIC_LICENSE[Firmware-OLPC] = "LICENCE.OLPC"
 NO_GENERIC_LICENSE[Firmware-phanfw] = "LICENCE.phanfw"
-NO_GENERIC_LICENSE[Firmware-qat_dh895xcc_firmware] = "LICENCE.qat_dh895xcc_firmware"
+NO_GENERIC_LICENSE[Firmware-qat] = "LICENCE.qat_firmware"
 NO_GENERIC_LICENSE[Firmware-qla2xxx] = "LICENCE.qla2xxx"
 NO_GENERIC_LICENSE[Firmware-r8a779x_usb3] = "LICENCE.r8a779x_usb3"
 NO_GENERIC_LICENSE[Firmware-ralink_a_mediatek_company_firmware] = "LICENCE.ralink_a_mediatek_company_firmware"
@@ -129,8 +131,9 @@ NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ath10k] = "LICENSE.QualcommAtheros_ath10k"
+NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 
-SRCREV = "bbe4917c054eb0a73e250c6363341e3bf6725839"
+SRCREV = "52442afee9907bc32a058f22bb3295d040677c26"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
@@ -451,7 +454,7 @@ LICENSE_${PN} = "\
     & Firmware-myri10ge_firmware \
     & Firmware-OLPC \
     & Firmware-phanfw \
-    & Firmware-qat_dh895xcc_firmware \
+    & Firmware-qat \
     & Firmware-qla2xxx \
     & Firmware-r8a779x_usb3 \
     & Firmware-ralink_a_mediatek_company_firmware \
@@ -461,6 +464,7 @@ LICENSE_${PN} = "\
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
+    & Firmware-ath9k-htc \
 "
 FILES_${PN}-license += "/lib/firmware/LICEN*"
 FILES_${PN} += "/lib/firmware/*"
-- 
2.4.0


