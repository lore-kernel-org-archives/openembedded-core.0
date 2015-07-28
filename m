Return-Path: <cristian.iorga@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C126573D13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 13:40:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga102.jf.intel.com with ESMTP; 28 Jul 2015 06:40:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,563,1432623600"; d="scan'208";a="614447108"
Received: from sentry.rb.intel.com ([10.237.105.63])
	by orsmga003.jf.intel.com with ESMTP; 28 Jul 2015 06:40:56 -0700
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 16:41:07 +0300
Message-Id: <1438090867-30086-1-git-send-email-cristian.iorga@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] linux-firmware: upgrade to commit 75cc3ef8ba6712fd72c073b17a790282136cc743
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
X-List-Received-Date: Tue, 28 Jul 2015 13:40:58 -0000

- Intel copyright years changed;
- Advanced Micro Devices copyright years changed;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 4b9e9b8..ef8117c 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -56,7 +56,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
-    file://LICENCE.iwlwifi_firmware;md5=5106226b2863d00d8ed553221ddf8cd2 \
+    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
     file://LICENCE.mwl8335;md5=9a6271ee0e644404b2ff3c61fd070983 \
@@ -79,7 +79,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
     file://LICENSE.amd-ucode;md5=3a0de451253cc1edbf30a3c621effee3 \
     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
-    file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74 \
+    file://LICENSE.radeon;md5=6c7f97c6c62bdd9596d0238bb205118c \
     file://LICENCE.siano;md5=602c79ae3f98f1e73d880fd9f940a418 \
 "
 
@@ -124,7 +124,7 @@ NO_GENERIC_LICENSE[Firmware-dib0700] = "LICENSE.dib0700"
 NO_GENERIC_LICENSE[Firmware-radeon] = "LICENSE.radeon"
 NO_GENERIC_LICENSE[Firmware-siano] = "LICENCE.siano"
 
-SRCREV = "3161bfa479d5e9ed4f46b57df9bcecbbc4f8eb3c"
+SRCREV = "75cc3ef8ba6712fd72c073b17a790282136cc743"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.1.4


