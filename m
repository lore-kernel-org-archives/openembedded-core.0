Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 08B3E734DA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Sep 2015 15:22:56 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 24 Sep 2015 08:22:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,581,1437462000"; d="scan'208";a="567732560"
Received: from afshjern.zpn.intel.com ([10.219.128.51])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Sep 2015 08:22:54 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Sep 2015 10:23:15 -0500
Message-Id: <1443108196-26245-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2 1/2] Empty image: core-image-empty recipe
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
X-List-Received-Date: Thu, 24 Sep 2015 15:22:59 -0000

Added core-image-empty recipe in meta-selftest/recipes-test/images

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta-selftest/recipes-test/images/core-image-empty.bb | 7 +++++++
 1 file changed, 7 insertions(+)
 create mode 100644 meta-selftest/recipes-test/images/core-image-empty.bb

diff --git a/meta-selftest/recipes-test/images/core-image-empty.bb b/meta-selftest/recipes-test/images/core-image-empty.bb
new file mode 100644
index 0000000..550567c
--- /dev/null
+++ b/meta-selftest/recipes-test/images/core-image-empty.bb
@@ -0,0 +1,7 @@
+SUMMARY = "An empty image."
+IMAGE_INSTALL = ""
+IMAGE_LINGUAS = ""
+PACKAGE_INSTALL = ""
+LICENSE = "MIT"
+
+inherit image
-- 
2.5.3


