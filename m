Return-Path: <sgw@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id EDB956011A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Oct 2017 22:33:23 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga105.jf.intel.com with ESMTP; 23 Oct 2017 15:33:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.43,424,1503385200"; d="scan'208";a="166145693"
Received: from swold-mobl2.jf.intel.com ([10.24.11.5])
	by fmsmga005.fm.intel.com with ESMTP; 23 Oct 2017 15:33:24 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Mon, 23 Oct 2017 15:33:23 -0700
Message-Id: <20171023223323.14326-1-sgw@linux.intel.com>
X-Mailer: git-send-email 2.13.5
Subject: [PATCH] linux-firmware: Split out the QAT firmware
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
X-List-Received-Date: Mon, 23 Oct 2017 22:33:24 -0000

Create a new qat package for those firmware blobs

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 0338ba8ac21..020c8579f8c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -264,6 +264,7 @@ PACKAGES =+ "${PN}-ralink-license ${PN}-ralink \
              ${PN}-adsp-sst-license ${PN}-adsp-sst \
              ${PN}-bnx2-mips \
              ${PN}-netronome-license ${PN}-netronome \
+             ${PN}-qat ${PN}-qat-license \
              ${PN}-whence-license \
              ${PN}-license \
              "
@@ -707,6 +708,13 @@ LICENSE_${PN}-adsp-sst-license    = "Firmware-adsp_sst"
 FILES_${PN}-adsp-sst              = "${nonarch_base_libdir}/firmware/intel/dsp_fw*"
 RDEPENDS_${PN}-adsp-sst           = "${PN}-adsp-sst-license"
 
+# For QAT
+LICENSE_${PN}-qat         = "Firmware-qat"
+LICENSE_${PN}-qat-license = "Firmware-qat"
+FILES_${PN}-qat-license   = "${nonarch_base_libdir}/firmware/LICENCE.qat_firmware"
+FILES_${PN}-qat           = "${nonarch_base_libdir}/firmware/qat*.bin"
+RDEPENDS_${PN}-qat        = "${PN}-qat-license"
+
 # For other firmwares
 # Maybe split out to separate packages when needed.
 LICENSE_${PN} = "\
-- 
2.13.5


