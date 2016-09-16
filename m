Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 35A7273166
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Sep 2016 21:37:45 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga101.jf.intel.com with ESMTP; 16 Sep 2016 14:37:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,346,1470726000"; d="scan'208";a="10075916"
Received: from swold-mobl2.amr.corp.intel.com ([10.254.26.249])
	by orsmga005.jf.intel.com with ESMTP; 16 Sep 2016 14:37:39 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Fri, 16 Sep 2016 14:37:38 -0700
Message-Id: <1474061858-31102-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 2/2] linux-firmware: Correct the LICENSE setting of license packages
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
X-List-Received-Date: Fri, 16 Sep 2016 21:37:48 -0000

This change causes the licenses of the linux-firmware-*-license to be the license
that it contains instead of all the licenses of the linux-firmware package.

[YOCTO #10251]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index c432d4f..53e7374 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -250,6 +250,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
 LICENSE_${PN}-ar9170 = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath6k = "Firmware-atheros_firmware"
 LICENSE_${PN}-ath9k = "Firmware-atheros_firmware"
+LICENSE_${PN}-atheros-license = "Firmware-atheros_firmware"
 
 FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 FILES_${PN}-ar9170 = " \
@@ -271,7 +272,9 @@ RDEPENDS_${PN}-ath9k += "${PN}-atheros-license"
 
 # For QualCommAthos
 LICENSE_${PN}-ar3k = "Firmware-qualcommAthos_ar3k"
+LICENSE_${PN}-ar3k-license = "Firmware-qualcommAthos_ar3k"
 LICENSE_${PN}-ath10k = "Firmware-qualcommAthos_ath10k"
+LICENSE_${PN}-ath10k-license = "Firmware-qualcommAthos_ath10k"
 
 FILES_${PN}-ar3k-license = "/lib/firmware/LICENSE.QualcommAtheros_ar3k"
 FILES_${PN}-ar3k = " \
@@ -288,6 +291,7 @@ RDEPENDS_${PN}-ath10k += "${PN}-ath10k-license"
 
 # For ralink
 LICENSE_${PN}-ralink = "Firmware-ralink-firmware"
+LICENSE_${PN}-ralink-license = "Firmware-ralink-firmware"
 
 FILES_${PN}-ralink-license = "/lib/firmware/LICENCE.ralink-firmware.txt"
 FILES_${PN}-ralink = " \
@@ -298,6 +302,7 @@ RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
 
 # For radeon
 LICENSE_${PN}-radeon = "Firmware-radeon"
+LICENSE_${PN}-radeon-license = "Firmware-radeon"
 
 FILES_${PN}-radeon-license = "/lib/firmware/LICENSE.radeon"
 FILES_${PN}-radeon = " \
@@ -311,6 +316,7 @@ LICENSE_${PN}-sd8686 = "Firmware-Marvell"
 LICENSE_${PN}-sd8688 = "Firmware-Marvell"
 LICENSE_${PN}-sd8787 = "Firmware-Marvell"
 LICENSE_${PN}-sd8797 = "Firmware-Marvell"
+LICENSE_${PN}-marvell-license = "Firmware-Marvell"
 
 FILES_${PN}-marvell-license = "/lib/firmware/LICENCE.Marvell"
 FILES_${PN}-sd8686 = " \
@@ -337,6 +343,7 @@ RDEPENDS_${PN}-sd8797 += "${PN}-marvell-license"
 LICENSE_${PN}-rtl8192cu = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192ce = "Firmware-rtlwifi_firmware"
 LICENSE_${PN}-rtl8192su = "Firmware-rtlwifi_firmware"
+LICENSE_${PN}-rtl-license = "Firmware-rtlwifi_firmware"
 
 FILES_${PN}-rtl-license = " \
   /lib/firmware/LICENCE.rtlwifi_firmware.txt \
@@ -358,6 +365,7 @@ RDEPENDS_${PN}-rtl8192su = "${PN}-rtl-license"
 # For ti-connectivity
 LICENSE_${PN}-wl12xx = "Firmware-ti-connectivity"
 LICENSE_${PN}-wl18xx = "Firmware-ti-connectivity"
+LICENSE_${PN}-ti-connectivity-license = "Firmware-ti-connectivity"
 
 FILES_${PN}-ti-connectivity-license = "/lib/firmware/LICENCE.ti-connectivity"
 FILES_${PN}-wl12xx = " \
@@ -376,6 +384,7 @@ RDEPENDS_${PN}-wl18xx = "${PN}-ti-connectivity-license"
 
 # For vt6656
 LICENSE_${PN}-vt6656 = "Firmware-via_vt6656"
+LICENSE_${PN}-vt6656-license = "Firmware-via_vt6656"
 
 FILES_${PN}-vt6656-license = "/lib/firmware/LICENCE.via_vt6656"
 FILES_${PN}-vt6656 = " \
@@ -396,6 +405,7 @@ LICENSE_${PN}-bcm4334 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm43340 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4339 = "Firmware-broadcom_bcm43xx"
 LICENSE_${PN}-bcm4354 = "Firmware-broadcom_bcm43xx"
+LICENSE_${PN}-broadcom-license = "Firmware-broadcom_bcm43xx"
 
 FILES_${PN}-broadcom-license = " \
   /lib/firmware/LICENCE.broadcom_bcm43xx \
@@ -532,12 +542,14 @@ RREPLACES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-
 RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 
 LICENSE_${PN}-i915       = "Firmware-i915"
+LICENSE_${PN}-i915-license = "Firmware-i915"
 FILES_${PN}-i915-license = "/lib/firmware/LICENSE.i915"
 FILES_${PN}-i915         = "/lib/firmware/i915"
 RDEPENDS_${PN}-i915      = "${PN}-i915-license"
 
 FILES_${PN}-adsp-sst-license      = "/lib/firmware/LICENCE.adsp_sst"
 LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
+LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
 FILES_${PN}-adsp-sst              = "/lib/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
-- 
2.7.4


