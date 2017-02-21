Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2856472F92
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 17:13:29 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 09:13:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="67891045"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by fmsmga005.fm.intel.com with ESMTP; 21 Feb 2017 09:13:30 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 11:20:44 -0600
Message-Id: <1487697644-32476-1-git-send-email-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] libusb1: upgrade 1.0.20 -> 1.0.21
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
X-List-Received-Date: Tue, 21 Feb 2017 17:13:30 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/recipes-support/libusb/{libusb1_1.0.20.bb => libusb1_1.0.21.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.20.bb => libusb1_1.0.21.bb} (86%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.20.bb b/meta/recipes-support/libusb/libusb1_1.0.21.bb
similarity index 86%
rename from meta/recipes-support/libusb/libusb1_1.0.20.bb
rename to meta/recipes-support/libusb/libusb1_1.0.21.bb
index 4cad2d4..1fefd14 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.20.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.21.bb
@@ -12,8 +12,8 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
            file://no-dll.patch \
           "
 
-SRC_URI[md5sum] = "1d4eb194eaaa2bcfbba28102768c7dbf"
-SRC_URI[sha256sum] = "cb057190ba0a961768224e4dc6883104c6f945b2bf2ef90d7da39e7c1834f7ff"
+SRC_URI[md5sum] = "1da9ea3c27b3858fa85c5f4466003e44"
+SRC_URI[sha256sum] = "7dce9cce9a81194b7065ee912bcd55eeffebab694ea403ffb91b67db66b1824b"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.1.4


