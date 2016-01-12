Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E4F8860110
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jan 2016 13:23:16 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 12 Jan 2016 05:23:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,557,1444719600"; d="scan'208";a="888877473"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga002.jf.intel.com with ESMTP; 12 Jan 2016 05:23:17 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Jan 2016 15:20:26 +0200
Message-Id: <7f5889bdc8f1562bffd9e7074fa9fa4579254ce0.1452604534.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
References: <cover.1452604534.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 3/5] iso-codes: upgrade to 3.64
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
X-List-Received-Date: Tue, 12 Jan 2016 13:23:17 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../iso-codes/{iso-codes_3.63.bb => iso-codes_3.64.bb}                | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/iso-codes/{iso-codes_3.63.bb => iso-codes_3.64.bb} (76%)

diff --git a/meta/recipes-support/iso-codes/iso-codes_3.63.bb b/meta/recipes-support/iso-codes/iso-codes_3.64.bb
similarity index 76%
rename from meta/recipes-support/iso-codes/iso-codes_3.63.bb
rename to meta/recipes-support/iso-codes/iso-codes_3.64.bb
index 8ae8a43..44c8735 100644
--- a/meta/recipes-support/iso-codes/iso-codes_3.63.bb
+++ b/meta/recipes-support/iso-codes/iso-codes_3.64.bb
@@ -3,8 +3,8 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=fbc093901857fcd118f065f900982c24"
 
 SRC_URI = "https://pkg-isocodes.alioth.debian.org/downloads/iso-codes-${PV}.tar.xz"
-SRC_URI[md5sum] = "129f822fd64c9bf80931cccc269ccb95"
-SRC_URI[sha256sum] = "60600e56952dc92b3a8cd8a7044348f7cfa35be528bab2491c3c18582fb5277f"
+SRC_URI[md5sum] = "01c02633ede9d6fdf4b5f99d5dbd47b2"
+SRC_URI[sha256sum] = "5ef061381e37e9576760df1ad504d4bbc84c270da30512b2891baed9add70729"
 
 # inherit gettext cannot be used, because it adds gettext-native to BASEDEPENDS which
 # are inhibited by allarch
-- 
2.6.4


