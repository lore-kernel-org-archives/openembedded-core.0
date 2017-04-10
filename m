Return-Path: <wei.tee.ng@intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 53CFC6010B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Apr 2017 09:09:57 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 10 Apr 2017 02:09:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,181,1488873600"; d="scan'208";a="85508391"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga005.jf.intel.com with ESMTP; 10 Apr 2017 02:09:57 -0700
From: wei.tee.ng@intel.com
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Apr 2017 18:58:43 -0700
Message-Id: <1491789524-26109-3-git-send-email-wei.tee.ng@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
References: <1491789524-26109-1-git-send-email-wei.tee.ng@intel.com>
Subject: [PATCH v3 2/3] linux-firmware: Set the license for carl9170 to GPLv2
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
X-List-Received-Date: Mon, 10 Apr 2017 09:09:57 -0000

From: "Ng, Wei Tee" <wei.tee.ng@intel.com>

linux-firmwara-carl9170 was set to a wrong license string.
Carl9170 firmware is bounded by GPLv2 via code inspection on
linux firmware source tree. Hence we include GPLv2 in LICENSE
field and set carl9170 firmware to the correct license.

[YOCTO #11090]

Signed-off-by: Ng, Wei Tee <wei.tee.ng@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb            | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index be82a63..7b43c25 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -19,6 +19,7 @@ LICENSE = "\
     & Firmware-ene_firmware \
     & Firmware-fw_sst_0f28 \
     & Firmware-go7007 \
+    & Firmware-GPLv2 \
     & Firmware-hfi1_firmware \
     & Firmware-i2400m \
     & Firmware-i915 \
@@ -75,6 +76,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.ene_firmware;md5=ed67f0f62f8f798130c296720b7d3921 \
     file://LICENCE.fw_sst_0f28;md5=6353931c988ad52818ae733ac61cd293 \
     file://LICENCE.go7007;md5=c0bb9f6aaaba55b0529ee9b30aa66beb \
+    file://GPL-2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
     file://LICENSE.hfi1_firmware;md5=5e7b6e586ce7339d12689e49931ad444 \
     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
     file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
@@ -132,6 +134,7 @@ NO_GENERIC_LICENSE[Firmware-e100] = "LICENCE.e100"
 NO_GENERIC_LICENSE[Firmware-ene_firmware] = "LICENCE.ene_firmware"
 NO_GENERIC_LICENSE[Firmware-fw_sst_0f28] = "LICENCE.fw_sst_0f28"
 NO_GENERIC_LICENSE[Firmware-go7007] = "LICENCE.go7007"
+NO_GENERIC_LICENSE[Firmware-GPLv2] = "GPL-2"
 NO_GENERIC_LICENSE[Firmware-hfi1_firmware] = "LICENSE.hfi1_firmware"
 NO_GENERIC_LICENSE[Firmware-i2400m] = "LICENCE.i2400m"
 NO_GENERIC_LICENSE[Firmware-i915] = "LICENSE.i915"
@@ -223,7 +226,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-vt6656-license ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8188 ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su ${PN}-rtl8723 ${PN}-rtl8821 \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 ${PN}-bcm43340 ${PN}-bcm4339 ${PN}-bcm43430 ${PN}-bcm4354 \
-             ${PN}-atheros-license ${PN}-ar9170 ${PN}-carl9170 ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-atheros-license ${PN}-ar9170 ${PN}-ath6k ${PN}-ath9k \
+             ${PN}-gplv2-license ${PN}-carl9170 \
              ${PN}-ar3k-license  ${PN}-ar3k  ${PN}-ath10k-license  ${PN}-ath10k  \
              \
              ${PN}-iwlwifi-license ${PN}-iwlwifi \
@@ -253,9 +257,6 @@ FILES_${PN}-atheros-license = "${nonarch_base_libdir}/firmware/LICENCE.atheros_f
 FILES_${PN}-ar9170 = " \
   ${nonarch_base_libdir}/firmware/ar9170*.fw \
 "
-FILES_${PN}-carl9170 = " \
-  ${nonarch_base_libdir}/firmware/carl9170*.fw \
-"
 FILES_${PN}-ath6k = " \
   ${nonarch_base_libdir}/firmware/ath6k \
 "
@@ -269,10 +270,20 @@ FILES_${PN}-ath9k = " \
 "
 
 RDEPENDS_${PN}-ar9170 += "${PN}-atheros-license"
-RDEPENDS_${PN}-carl9170 += "${PN}-atheros-license"
 RDEPENDS_${PN}-ath6k += "${PN}-atheros-license"
 RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
 
+# For carl9170
+LICENSE_${PN}-carl9170 = "Firmware-GPLv2"
+LICENSE_${PN}-gplv2-license = "Firmware-GPLv2"
+
+FILES_${PN}-gplv2-license = "${nonarch_base_libdir}/firmware/GPL-2"
+FILES_${PN}-carl9170 = " \
+  ${nonarch_base_libdir}/firmware/carl9170*.fw \
+"
+
+RDEPENDS_${PN}-carl9170 += "${PN}-gplv2-license"
+
 # For QualCommAthos
 LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
-- 
2.7.4


