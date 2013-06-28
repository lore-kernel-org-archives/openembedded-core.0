Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3AF566AD9B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 17:57:02 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Jun 2013 10:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,960,1363158000"; d="scan'208";a="361241389"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.97])
	by orsmga002.jf.intel.com with ESMTP; 28 Jun 2013 10:56:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Jun 2013 18:56:47 +0100
Message-Id: <e50493eabf21983d1c6755c0dfa8552a8e5cfa83.1372442170.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1372442170.git.paul.eggleton@linux.intel.com>
References: <cover.1372442170.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1372442170.git.paul.eggleton@linux.intel.com>
References: <cover.1372442170.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] linux-firmware: be consistent with license package naming
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
X-List-Received-Date: Fri, 28 Jun 2013 17:57:02 -0000

Much as I prefer en_GB spelling, we need to be consistent with the other
package names in this recipe. Thanks to Trevor Woerner for pointing this
out.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index f586321..81795f2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -58,7 +58,7 @@ PACKAGES =+ "${PN}-ralink ${PN}-sd8686 ${PN}-wl12xx ${PN}-vt6656 \
              ${PN}-rtl-license ${PN}-rtl8192cu ${PN}-rtl8192ce ${PN}-rtl8192su \
              ${PN}-broadcom-license ${PN}-bcm4329 ${PN}-bcm4330 ${PN}-bcm4334 \
              ${PN}-atheros-license ${PN}-ar9170 ${PN}-ar3k ${PN}-ath6k ${PN}-ath9k \
-             ${PN}-iwlwifi-licence ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2b-6"
+             ${PN}-iwlwifi-license ${PN}-iwlwifi-6000g2a-5 ${PN}-iwlwifi-6000g2b-6"
 
 FILES_${PN}-atheros-license = "/lib/firmware/LICENCE.atheros_firmware"
 
@@ -170,10 +170,10 @@ RDEPENDS_${PN}-bcm4334 += "${PN}-broadcom-license"
 ALTERNATIVE_linux-firmware-bcm4334 = "brcmfmac-sdio.bin"
 ALTERNATIVE_TARGET_linux-firmware-bcm4334[brcmfmac-sdio.bin] = "/lib/firmware/brcm/brcmfmac4334.bin"
 
-RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-licence"
-RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-licence"
+RDEPENDS_${PN}-iwlwifi-6000g2a-5 = "${PN}-iwlwifi-license"
+RDEPENDS_${PN}-iwlwifi-6000g2b-6 = "${PN}-iwlwifi-license"
 
-FILES_${PN}-iwlwifi-licence =   "/lib/firmware/LICENCE.iwlwifi_firmware"
+FILES_${PN}-iwlwifi-license =   "/lib/firmware/LICENCE.iwlwifi_firmware"
 FILES_${PN}-iwlwifi-6000g2a-5 = "/lib/firmware/iwlwifi-6000g2a-5.ucode"
 FILES_${PN}-iwlwifi-6000g2b-6 = "/lib/firmware/iwlwifi-6000g2b-6.ucode"
 
-- 
1.8.1.2


