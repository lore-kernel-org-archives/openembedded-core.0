Return-Path: <timothy.t.orling@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 0F79765C5B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 15:39:51 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Jun 2017 08:39:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,285,1493708400"; d="scan'208";a="108469998"
Received: from wrath.jf.intel.com ([10.54.70.7])
	by orsmga005.jf.intel.com with ESMTP; 02 Jun 2017 08:39:51 -0700
From: Tim Orling <timothy.t.orling@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 08:39:42 -0700
Message-Id: <20170602153942.21459-1-timothy.t.orling@linux.intel.com>
X-Mailer: git-send-email 2.9.4
Subject: [PATCH] linux-firmware: add support for mt7601u WiFi chip
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
X-List-Received-Date: Fri, 02 Jun 2017 15:39:52 -0000

Mediatek MT7601U is a common 802.11 g/n WiFi USB chip

Signed-off-by: Tim Orling <timothy.t.orling@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0ef1e28..4558daf 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -223,6 +223,7 @@ do_install() {
 
 
 PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
+             ${PN}-mt7601u-license ${PN}-mt7601u \
              ${PN}-radeon-license ${PN}-radeon \
              ${PN}-marvell-license ${PN}-sd8686 ${PN}-sd8688 ${PN}-sd8787 ${PN}-sd8797 ${PN}-sd8801 ${PN}-sd8887 ${PN}-sd8897 \
              ${PN}-ti-connectivity-license ${PN}-wl12xx ${PN}-wl18xx \
@@ -324,6 +325,17 @@ FILES_${PN}-ralink = " \
 
 RDEPENDS_${PN}-ralink += "${PN}-ralink-license"
 
+# For mediatek MT7601U
+LICENSE_${PN}-mt7601u = "Firmware-ralink_a_mediatek_company_firmware"
+LICENSE_${PN}-mt7601u-license = "Firmware-ralink_a_mediatek_company_firmware"
+
+FILES_${PN}-mt7601u-license = "${nonarch_base_libdir}/firmware/LICENCE.ralink_a_mediatek_company_firmware"
+FILES_${PN}-mt7601u = " \
+  ${nonarch_base_libdir}/firmware/mt7601u.bin \
+"
+
+RDEPENDS_${PN}-mt7601u += "${PN}-mt7601u-license"
+
 # For radeon
 LICENSE_${PN}-radeon = "Firmware-radeon"
 LICENSE_${PN}-radeon-license = "Firmware-radeon"
-- 
2.9.4


