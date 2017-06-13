Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 3DAB47830A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 11:24:12 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga104.jf.intel.com with ESMTP; 13 Jun 2017 04:24:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,338,1493708400"; d="scan'208";a="867443701"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Jun 2017 04:24:13 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 309D05800CE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Jun 2017 04:24:12 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Jun 2017 14:22:02 +0300
Message-Id: <739d91282190a52a68b94d6f2c480909211f8b84.1497348496.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1497348496.git.ed.bartosh@linux.intel.com>
References: <cover.1497348496.git.ed.bartosh@linux.intel.com>
Subject: [PATCH v2 14/26] wic: add mcopy property
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
X-List-Received-Date: Tue, 13 Jun 2017 11:24:12 -0000

Added property that points to the mcopy executable.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/engine.py | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/lib/wic/engine.py b/scripts/lib/wic/engine.py
index e3701c4..f24fb9a 100644
--- a/scripts/lib/wic/engine.py
+++ b/scripts/lib/wic/engine.py
@@ -237,6 +237,7 @@ class Disk:
         self.native_sysroot = native_sysroot
         self._partitions = None
         self._mdir = None
+        self._mcopy = None
         self._partimages = {}
 
         # find parted
@@ -280,6 +281,10 @@ class Disk:
     def mdir(self):
         return self._prop('mdir')
 
+    @property
+    def mcopy(self):
+        return self._prop("mcopy")
+
     def _get_part_image(self, pnum):
         if pnum not in self.partitions:
             raise WicError("Partition %s is not in the image")
-- 
2.1.4


