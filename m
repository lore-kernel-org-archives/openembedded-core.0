Return-Path: <anujx.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E7A18734B8
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 08:12:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 07 Oct 2015 01:12:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,648,1437462000"; d="scan'208";a="786456816"
Received: from yocto-pc.png.intel.com ([172.30.197.17])
	by orsmga001.jf.intel.com with ESMTP; 07 Oct 2015 01:12:25 -0700
From: Anuj Mittal <anujx.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 16:02:44 +0800
Message-Id: <1444204964-21670-2-git-send-email-anujx.mittal@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1444204964-21670-1-git-send-email-anujx.mittal@intel.com>
References: <1444204964-21670-1-git-send-email-anujx.mittal@intel.com>
Subject: [fido][PATCH 1/1] linux-firmware: upgrade to commit 75cc3ef8ba6712fd72c073b17a790282136cc743
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
X-List-Received-Date: Wed, 07 Oct 2015 08:12:29 -0000

From: Cristian Iorga <cristian.iorga@intel.com>

- Intel copyright years changed;
- Advanced Micro Devices copyright years changed;

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 0120fa37d0215998947616a93a5b59cc4a40cd2a)
Signed-off-by: Anuj Mittal <anujx.mittal@intel.com>
---
 .../linux-firmware/linux-firmware_git.bb           |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 16ebf6a..fb9a6a2 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -7,12 +7,12 @@ SECTION = "kernel"
 
 LICENSE = "Proprietary"
 
-LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74\
+LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=6c7f97c6c62bdd9596d0238bb205118c \
                     file://LICENSE.dib0700;md5=f7411825c8a555a1a3e5eab9ca773431 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.ralink-firmware.txt;md5=ab2c269277c45476fb449673911a2dfd \
                     file://LICENCE.qla2xxx;md5=f5ce8529ec5c17cb7f911d2721d90e91 \
-                    file://LICENCE.iwlwifi_firmware;md5=5106226b2863d00d8ed553221ddf8cd2 \
+                    file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
@@ -24,7 +24,7 @@ LIC_FILES_CHKSUM = "file://LICENSE.radeon;md5=07b0c31777bd686d8e1609c6940b5e74\
                     file://LICENCE.Marvell;md5=9ddea1734a4baf3c78d845151f42a37a \
                    "
 
-SRCREV = "0e5f63771d0df6d7859f7c4100a74d737c62ac88"
+SRCREV = "75cc3ef8ba6712fd72c073b17a790282136cc743"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
1.7.9.5


