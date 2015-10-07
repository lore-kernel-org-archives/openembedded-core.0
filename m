Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id A73C476536
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 15:50:32 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga102.jf.intel.com with ESMTP; 07 Oct 2015 08:50:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,649,1437462000"; d="scan'208";a="575930702"
Received: from afshjern.zpn.intel.com ([10.219.26.48])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Oct 2015 08:50:31 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Oct 2015 10:51:12 -0500
Message-Id: <1444233072-11071-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv3] test-empty-image: rename from core-image-empty
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
X-List-Received-Date: Wed, 07 Oct 2015 15:50:32 -0000

As the empty image isn't a "core" image, and it's meant for testing

Additionally, don't set LICENSE as it is inherited from image

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta-selftest/recipes-test/images/core-image-empty.bb | 7 -------
 meta-selftest/recipes-test/images/test-empty-image.bb | 6 ++++++
 2 files changed, 6 insertions(+), 7 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/images/core-image-empty.bb
 create mode 100644 meta-selftest/recipes-test/images/test-empty-image.bb

diff --git a/meta-selftest/recipes-test/images/core-image-empty.bb b/meta-selftest/recipes-test/images/core-image-empty.bb
deleted file mode 100644
index 550567c..0000000
--- a/meta-selftest/recipes-test/images/core-image-empty.bb
+++ /dev/null
@@ -1,7 +0,0 @@
-SUMMARY = "An empty image."
-IMAGE_INSTALL = ""
-IMAGE_LINGUAS = ""
-PACKAGE_INSTALL = ""
-LICENSE = "MIT"
-
-inherit image
diff --git a/meta-selftest/recipes-test/images/test-empty-image.bb b/meta-selftest/recipes-test/images/test-empty-image.bb
new file mode 100644
index 0000000..88d8d61
--- /dev/null
+++ b/meta-selftest/recipes-test/images/test-empty-image.bb
@@ -0,0 +1,6 @@
+SUMMARY = "An empty image."
+IMAGE_INSTALL = ""
+IMAGE_LINGUAS = ""
+PACKAGE_INSTALL = ""
+
+inherit image
-- 
2.5.3


