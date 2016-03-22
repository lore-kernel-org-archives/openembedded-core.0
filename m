Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 900A96612D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Mar 2016 18:13:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 22 Mar 2016 11:13:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,378,1455004800"; d="scan'208";a="916617440"
Received: from cmdeoliv-mobl4.amr.corp.intel.com (HELO
	swold-mobl.jf.intel.com) ([10.254.120.177])
	by orsmga001.jf.intel.com with ESMTP; 22 Mar 2016 11:13:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Tue, 22 Mar 2016 11:13:08 -0700
Message-Id: <1458670391-26915-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
References: <1458670391-26915-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 1/4] linux-firmware: Update to latest HEAD
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
X-List-Received-Date: Tue, 22 Mar 2016 18:13:12 -0000

5f8ca0c Sherry Hurwitz linux-firmware: Update AMD microcode patch firmware
f6cd3d8 Kyle McMartin Merge branch 'master' of git://people.freedesktop.org/~vivijim/linux-firmware-i915
fa9baa0 Kyle McMartin Merge branch 'skl' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/firmware
0a0c976 Tom O'Rourke linux-firmware/i915: Major GuC release for Skylake - ver 6.1
780f4ee Vinod Koul linux-firmware: intel: Update Skylake audio firmware
deb1d83 Kyle McMartin Merge branch 'master' of git://git.ti.com/wilink8-wlan/linux-firmware
9be9ff2 Emmanuel Grumbach iwlwifi: add -21.ucode to WHENCE
a9ad059 Kyle McMartin Merge tag 'iwlwifi-fw-2016-03-09' of git://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/linux-firmware
69a250d Yaniv Machani wl18xx: update firmware file
a2c354e Emmanuel Grumbach iwlwifi: add new -21.ucode for 7265D, 8260, 3168 and 8265 devices
8d1fd61 Alexandre Courbot nvidia: Add GM20B signed firmware
c4f6a36 Alexandre Courbot nvidia: Add GM200, GM204 and GM206 signed firmware
f66ecca John Fleck Update Intel OPA hfi1 firmware
b2deae5 Dmitry Tunin linux-firmware: Add AR3012 firmware
4f11252 Kyle McMartin Merge branch 'master' of git://people.freedesktop.org/~vivijim/linux-firmware-i915
2394c7d Kyle McMartin Merge branch 'skl' of git://git.kernel.org/pub/scm/linux/kernel/git/vkoul/firmware
c44bc5b Rodrigo Vivi linux-firmware: New minor DMC release for Skylake - ver1_26
f799665 Vinod Koul linux-firmware: intel: Update Skylake audio firmware
91d5dd1 Jes Sorensen rtlwifi: v19 firmware for rtl8192eu
7b1a5cb Tedd Ho-Jeong An linux-firmware: Update firmware patch for Intel Bluetooth 7260 (B3/B4)
ede3068 Tedd Ho-Jeong An linux-firmware: Update firmware patch for Intel Bluetooth 7260 (B5/B6)
4592e37 Tedd Ho-Jeong An linux-firmware: Update firmware patch for Intel Bluetooth 7265 (C0/D0)
c713cb2 Vinod Koul linux-firmware: intel: add symbolic link and file versions

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 9792686..9a49762 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -133,7 +133,7 @@ NO_GENERIC_LICENSE[Firmware-qualcommAthos_ar3k] = "LICENSE.QualcommAtheros_ar3k"
 NO_GENERIC_LICENSE[Firmware-qualcommAthos_ath10k] = "LICENSE.QualcommAtheros_ath10k"
 NO_GENERIC_LICENSE[Firmware-ath9k-htc] = "LICENCE.open-ath9k-htc-firmware"
 
-SRCREV = "52442afee9907bc32a058f22bb3295d040677c26"
+SRCREV = "5f8ca0c1db6106a2d6d7e85eee778917ff03c3de"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.5.0


