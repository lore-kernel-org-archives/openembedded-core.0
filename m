Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4522660797
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 21:27:16 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2016 14:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,383,1455004800"; d="scan'208";a="917477760"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.120.177])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 14:27:17 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Wed, 23 Mar 2016 14:27:16 -0700
Message-Id: <1458768436-14658-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
Subject: [PATCH 4/4 v3] linux-firmware: Break out some additional firmware
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
X-List-Received-Date: Wed, 23 Mar 2016 21:27:17 -0000

This breaks out new firmware from the iwlwifi firmware along with the i915 graphics firmware.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
v3: Fixed spelling of LICENSE.i915

 .../linux-firmware/linux-firmware_git.bb           | 25 +++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 2d7126f..80da100 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -224,6 +224,9 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-iwlwifi-6050-4 ${PN}-iwlwifi-6050-5 \
              ${PN}-iwlwifi-7260 \
              ${PN}-iwlwifi-7265 \
+             ${PN}-iwlwifi-7265d ${PN}-iwlwifi-8000c ${PN}-iwlwifi-8265 \
+             ${PN}-i915-license ${PN}-i915 \
+             ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-license \
              "
 
@@ -430,6 +433,10 @@ LICENSE_${PN}-iwlwifi-6050-4    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-6050-5    = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-7260      = "Firmware-iwlwifi_firmware"
 LICENSE_${PN}-iwlwifi-7265      = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-7265d     = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-8000c     = "Firmware-iwlwifi_firmware"
+LICENSE_${PN}-iwlwifi-8265      = "Firmware-iwlwifi_firmware"
+
 
 FILES_${PN}-iwlwifi-license = "/lib/firmware/LICENCE.iwlwifi_firmware"
 FILES_${PN}-iwlwifi-135-6 = "/lib/firmware/iwlwifi-135-6.ucode"
@@ -445,6 +452,9 @@ FILES_${PN}-iwlwifi-6050-4 = "/lib/firmware/iwlwifi-6050-4.ucode"
 FILES_${PN}-iwlwifi-6050-5 = "/lib/firmware/iwlwifi-6050-5.ucode"
 FILES_${PN}-iwlwifi-7260   = "/lib/firmware/iwlwifi-7260-*.ucode"
 FILES_${PN}-iwlwifi-7265   = "/lib/firmware/iwlwifi-7265-*.ucode"
+FILES_${PN}-iwlwifi-7265d   = "/lib/firmware/iwlwifi-7265D-*.ucode"
+FILES_${PN}-iwlwifi-8000c   = "/lib/firmware/iwlwifi-8000C-*.ucode"
+FILES_${PN}-iwlwifi-8265   = "/lib/firmware/iwlwifi-8265-*.ucode"
 
 RDEPENDS_${PN}-iwlwifi-135-6     = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-3160-7    = "${PN}-iwlwifi-license"
@@ -459,6 +469,9 @@ RDEPENDS_${PN}-iwlwifi-6050-4    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-6050-5    = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-7260      = "${PN}-iwlwifi-license"
 RDEPENDS_${PN}-iwlwifi-7265      = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-7265d     = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-8000c     = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-8265      = "${PN}-iwlwifi-license"
 
 # Handle package updating for the newly merged iwlwifi groupings
 RPROVIDES_${PN}-iwlwifi-7265 = "${PN}-iwlwifi-7265-8 ${PN}-iwlwifi-7265-9"
@@ -469,13 +482,20 @@ RPROVIDES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-
 RREPLACES_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 RCONFLICTS_${PN}-iwlwifi-7260 = "${PN}-iwlwifi-7260-7 ${PN}-iwlwifi-7260-8 ${PN}-iwlwifi-7260-9"
 
-
+LICENSE_${PN}-i915       = "Firmware-i915"
+FILES_${PN}-i915-license = "/lib/firmware/LICENSE.i915"
+FILES_${PN}-i915         = "/lib/firmware/i915"
+RDEPENDS_${PN}-i915      = "${PN}-i915-license"
+ 
+FILES_${PN}-adsp-sst-license      = "/lib/firmware/LICENCE.adsp_sst"
+LICENSE_${PN}-adsp-sst            = "Firmware-adsp_sst"
+FILES_${PN}-adsp-sst              = "/lib/firmware/intel/dsp_fw*"
+RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
     Firmware-Abilis \
-    & Firmware-adsp_sst \
     & Firmware-agere \
     & Firmware-amdgpu \
     & Firmware-amd-ucode \
@@ -491,7 +511,6 @@ LICENSE_${PN} = "\
     & Firmware-go7007 \
     & Firmware-hfi1_firmware \
     & Firmware-i2400m \
-    & Firmware-i915 \
     & Firmware-ibt_firmware \
     & Firmware-it913x \
     & Firmware-IntcSST2 \
-- 
2.5.0


