Return-Path: <cristian.iorga@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 7EE60607BB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Jun 2015 16:55:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Jun 2015 09:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,660,1427785200"; d="scan'208";a="592645814"
Received: from sentry.rb.intel.com ([10.237.105.157])
	by orsmga003.jf.intel.com with ESMTP; 22 Jun 2015 09:55:08 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Jun 2015 19:55:15 +0300
Message-Id: <ac1eaa71170086ff67f51d284a90369f756b9c0b.1434992036.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1434992036.git.cristian.iorga@intel.com>
References: <cover.1434992036.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1434992036.git.cristian.iorga@intel.com>
References: <cover.1434992036.git.cristian.iorga@intel.com>
Subject: [PATCH 1/1] linux-firmware: upgrade to commit 3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c
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
X-List-Received-Date: Mon, 22 Jun 2015 16:55:27 -0000

Updates to firmware binaries from (not exhaustive list):
Broadcom, Atheros, Realtek, Marvell, Intel, AMD, Siano.

- AMD microcode copyright years changed;
- Siano license added;
- Intel SST2 license added;

Fixes [YOCTO #6965].

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index af3205f..4b9e9b8 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -18,6 +18,7 @@ LICENSE = "\
     & Firmware-ibt_firmware \
     & Firmware-it913x \
     & Firmware-iwlwifi_firmware \
+    & Firmware-IntcSST2 \
     & Firmware-Marvell \
     & Firmware-mwl8335 \
     & Firmware-myri10ge_firmware \
@@ -38,6 +39,7 @@ LICENSE = "\
     & Firmware-xc4000 \
     & Firmware-xc5000 \
     & Firmware-xc5000c \
+    & Firmware-siano \
 "
 
 LIC_FILES_CHKSUM = "\
@@ -55,6 +57,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
     file://LICENCE.iwlwifi_firmware;md5=5106226b2863d00d8ed553221ddf8cd2 \
+    file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
     file://LICENCE.mwl8335;md5=9a6271ee0e644404b2ff3c61fd070983 \
     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
@@ -74,9 +77,10 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://LICENSE.amd-ucode;md5=81bff4eaa247896f54dd273ce0982611 \
+    file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3 \
     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
     file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74 \
+    file://LICENCE.siano;md5=602c79ae3f98f1e73d880fd9f940a418 \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -95,6 +99,7 @@ NO_GENERIC_LICENSE[Firmware-i2400m] = "LICENCE.i2400m"
 NO_GENERIC_LICENSE[Firmware-ibt_firmware] = "LICENCE.ibt_firmware"
 NO_GENERIC_LICENSE[Firmware-it913x] = "LICENCE.it913x"
 NO_GENERIC_LICENSE[Firmware-iwlwifi_firmware] = "LICENCE.iwlwifi_firmware"
+NO_GENERIC_LICENSE[Firmware-IntcSST2] = "LICENCE.IntcSST2"
 NO_GENERIC_LICENSE[Firmware-Marvell] = "LICENCE.Marvell"
 NO_GENERIC_LICENSE[Firmware-mwl8335] = "LICENCE.mwl8335"
 NO_GENERIC_LICENSE[Firmware-myri10ge_firmware] = "LICENCE.myri10ge_firmware"
@@ -117,8 +122,9 @@ NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[Firmware-amd-ucode] = "LICENSE.amd-ucode"
 NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
 NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
+NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 
-SRCREV = "0e5f63771d0df6d7859f7c4100a74d737c62ac88"
+SRCREV = "3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.1.4


