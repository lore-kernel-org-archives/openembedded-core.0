Return-Path: <alejandro.franco@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id ABD106AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Oct 2015 00:12:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 06 Oct 2015 17:12:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,646,1437462000"; d="scan'208";a="820909299"
Received: from afshjern.zpn.intel.com ([10.219.26.48])
	by orsmga002.jf.intel.com with ESMTP; 06 Oct 2015 17:12:30 -0700
From: Alex Franco <alejandro.franco@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 19:13:16 -0500
Message-Id: <1444176796-12700-1-git-send-email-alejandro.franco@linux.intel.com>
X-Mailer: git-send-email 2.5.3
Cc: paul.eggleton@linux.intel.com
Subject: [PATCHv2] empty-image: rename from core-image-empty
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
X-List-Received-Date: Wed, 07 Oct 2015 00:12:37 -0000

As the empty image isn't a "core" image

[YOCTO #7664]

Signed-off-by: Alex Franco <alejandro.franco@linux.intel.com>
---
 meta-selftest/recipes-test/images/core-image-empty.bb | 7 -------
 meta-selftest/recipes-test/images/empty-image.bb      | 7 +++++++
 2 files changed, 7 insertions(+), 7 deletions(-)
 delete mode 100644 meta-selftest/recipes-test/images/core-image-empty.bb
 create mode 100644 meta-selftest/recipes-test/images/empty-image.bb

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
diff --git a/meta-selftest/recipes-test/images/empty-image.bb b/meta-selftest/recipes-test/images/empty-image.bb
new file mode 100644
index 0000000..550567c
--- /dev/null
+++ b/meta-selftest/recipes-test/images/empty-image.bb
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


