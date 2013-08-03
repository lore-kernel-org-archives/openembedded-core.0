Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id AEE2560664
	for <openembedded-core@lists.openembedded.org>;
	Sat,  3 Aug 2013 21:39:02 +0000 (UTC)
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2013 14:39:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,808,1367996400"; d="scan'208";a="277306040"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.14.110])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2013 14:39:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Aug 2013 14:39:01 -0700
Message-Id: <1375565941-24943-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH] apt-native: fix SRC_URI Checksum for update
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
X-List-Received-Date: Sat, 03 Aug 2013 21:39:02 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/apt/apt-native_0.9.9.4.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb b/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
index babf4cf..d5934f9 100644
--- a/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
+++ b/meta/recipes-devtools/apt/apt-native_0.9.9.4.bb
@@ -3,7 +3,7 @@ require apt-native.inc
 SRC_URI += "file://noconfigure.patch \
             file://no-curl.patch"
 
-SRC_URI[md5sum] = "956bb906224a5662111d353ab11a0347"
-SRC_URI[sha256sum] = "cb0360e218490d875dc1e9e15c4e0ba0b53c7f512a6c98253f2eb07877be5106"
+SRC_URI[md5sum] = "72b3283acd9b99868da5545f0499b0da"
+SRC_URI[sha256sum] = "770cb94d7f4c922c2a1516f2b5ec852d3ad668a8c9c3713ac2528c861b7fa79a"
 
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=0636e73ff0215e8d672dc4c32c317bb3"
-- 
1.8.1.4


