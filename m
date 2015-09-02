Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E1CC577042
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 11:00:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 02 Sep 2015 04:00:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="760751620"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2015 04:00:19 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 72C596A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:59:28 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:04 +0300
Message-Id: <b83bb9a03f1f006ba71689db0e8d3dba6e2232fc.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1441191270.git.ed.bartosh@linux.intel.com>
References: <cover.1441191270.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 04/17] wic: add test cases for 3 images
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
X-List-Received-Date: Wed, 02 Sep 2015 11:00:27 -0000

Added test cases to build qemux86_directdisk, mkgummidisk and
mkefdisk images.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 817a820..3dc54a4 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -213,3 +213,24 @@ class Wic(oeSelfTest):
             path = prefix + suffix
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
+
+    def test21_qemux86_directdisk(self):
+        """Test creation of qemux-86-directdisk image"""
+        image = "qemux86-directdisk"
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % image).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def test22_mkgummidisk(self):
+        """Test creation of mkgummidisk image"""
+        image = "mkgummidisk"
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % image).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
+
+    def test23_mkefidisk(self):
+        """Test creation of mkefidisk image"""
+        image = "mkefidisk"
+        self.assertEqual(0, runCmd("wic create %s -e core-image-minimal" \
+                                   % image).status)
+        self.assertEqual(1, len(glob(self.resultdir + "%s-*direct" % image)))
-- 
2.1.4


