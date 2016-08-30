Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E9A2860110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Aug 2016 12:28:22 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 30 Aug 2016 05:28:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,256,1470726000"; d="scan'208";a="1033127020"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.49])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2016 05:28:23 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Aug 2016 15:26:51 +0300
Message-Id: <20160830122653.16162-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 1/3] iso-codes: update to 3.70
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
X-List-Received-Date: Tue, 30 Aug 2016 12:28:24 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.69.bb => iso-codes_3.70.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.69.bb => iso-codes_3.70.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.69.bb b/meta/recipes-support/iso-codes/iso-codes_3.70.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.69.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.70.bb
index 105949f..7edd8b7 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.69.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.70.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "33ed5ea7eed84a7609f041c838fc96d7"
-SRC_URI[sha256sum] = "3f285d3c13f4dccfbdb9e432f172403ac1a54ab432616f10556eb18c23a1c0b2"
+SRC_URI[md5sum] = "c61f8f02eecf978d3710ff594e43ca7e"
+SRC_URI[sha256sum] = "41e2fbaec2ed57e767b94f175d0dcd31b627aeb23b75cd604605a6fb6109d61f"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.9.3


