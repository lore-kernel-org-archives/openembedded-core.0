Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B587B6E64A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 18:13:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 11:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="916617441"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.120.177])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2016 11:13:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 22 Mar 2016 11:13:09 -0700
Message-Id: <1458670391-26915-3-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/4] linux-firmware: Collapse iwlwifi firmware blobs for 7260 and 7265
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
X-List-Received-Date: Tue, 22 Mar 2016 18:13:13 -0000

There are newer blobs that are not include since we currently package
blobs independtly, this will ensure that future updates are correctly
added to the packages.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           | 35 +++++++++++-----------
 1 file changed, 17 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 9a49762..8df4d6f 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -186,9 +186,8 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-6000-4 ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2a-6 \
              ${PN}-iwlwifi-6000g2b-5 ${PN}-iwlwifi-6000g2b-6 \
              ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
-             ${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9 \
-             ${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9 \
-             \
+             ${PN}-iwlwifi-7260 \
+             ${PN}-iwlwifi-7265 \
              ${PN}-license \
              "
 
@@ -393,11 +392,8 @@ LICENSE_${PN}-iwlwifi-6000g2a-5 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6000g2b-6 = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-5    = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-7260-7    = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-7260-8    = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-7260-9    = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-7265-8    = "Firmware-iwlwifi_firmware"
-LICENSE_${PN}-iwlwifi-7265-9    = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7260      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7265      = "Firmware-iwlwifi_firmware"
 
 FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
 FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
@@ -411,11 +407,8 @@ FILES_${PN}-iwlwifi-6000g2b-5 = "/lib/firmware/iwlwifi-6000g2b-5.ucode"
 FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
 FILES_${PN}-iwlwifi-6050-4 = "/lib/firmware/iwlwifi-6050-4.ucode"
 FILES_${PN}-iwlwifi-6050-5 = "/lib/firmware/iwlwifi-6050-5.ucode"
-FILES_${PN}-iwlwifi-7260-7 = "/lib/firmware/iwlwifi-7260-7.ucode"
-FILES_${PN}-iwlwifi-7260-8 = "/lib/firmware/iwlwifi-7260-8.ucode"
-FILES_${PN}-iwlwifi-7260-9 = "/lib/firmware/iwlwifi-7260-9.ucode"
-FILES_${PN}-iwlwifi-7265-8 = "/lib/firmware/iwlwifi-7265-8.ucode"
-FILES_${PN}-iwlwifi-7265-9 = "/lib/firmware/iwlwifi-7265-9.ucode"
+FILES_${PN}-iwlwifi-7260   = "/lib/firmware/iwlwifi-7260-*.ucode"
+FILES_${PN}-iwlwifi-7265   = "/lib/firmware/iwlwifi-7265-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
@@ -428,11 +421,17 @@ RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-7    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-8    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7260-9    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7265-8    = "${PN}-iwlwifi-license"
-RDEPENDS_${PN}-iwlwifi-7265-9    = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7260      = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7265      = "${PN}-iwlwifi-license"
+
+# Handle package updating for the newly merged iwlwifi groupings
+RPROVIDES_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7285-9"
+RREPLACES_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7285-9"
+RCONFLICTS_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7285-9"
+
+RPROVIDES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7280-9"
+RREPLACES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7280-9"
+RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7280-9"
 
 # For other firmwares
 # Maybe split out to separate packages when needed.
-- 
2.5.0


