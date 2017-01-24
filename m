Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B48CC7723C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 14:07:39 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga105.fm.intel.com with ESMTP; 24 Jan 2017 06:07:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,278,1477983600"; d="scan'208";a="57595586"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 24 Jan 2017 06:07:28 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 933F06A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jan 2017 06:06:31 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Jan 2017 15:43:52 +0200
Message-Id: <4c417d955a79593025280334e54e4594de2e4ac3.1485264964.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485264964.git.ed.bartosh@linux.intel.com>
References: <cover.1485264964.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 4/8] wic: remove unused API DirectImageCreator.get_disk_names
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
X-List-Received-Date: Tue, 24 Jan 2017 14:07:41 -0000

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/imager/direct.py | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/scripts/lib/wic/imager/direct.py b/scripts/lib/wic/imager/direct.py
index 63f1fa1..6340a59 100644
--- a/scripts/lib/wic/imager/direct.py
+++ b/scripts/lib/wic/imager/direct.py
@@ -185,32 +185,6 @@ class DirectImageCreator:
         # partitions list from kickstart file
         return self.ks.partitions
 
-    def get_disk_names(self):
-        """ Returns a list of physical target disk names (e.g., 'sdb') which
-        will be created. """
-
-        if self._disk_names:
-            return self._disk_names
-
-        #get partition info from ks handler
-        parts = self._get_parts()
-
-        for i in range(len(parts)):
-            if parts[i].disk:
-                disk_name = parts[i].disk
-            else:
-                raise CreatorError("Failed to create disks, no --ondisk "
-                                   "specified in partition line of ks file")
-
-            if parts[i].mountpoint and not parts[i].fstype:
-                raise CreatorError("Failed to create disks, no --fstype "
-                                   "specified for partition with mountpoint "
-                                   "'%s' in the ks file")
-
-            self._disk_names.append(disk_name)
-
-        return self._disk_names
-
     def _full_name(self, name, extention):
         """ Construct full file name for a file we generate. """
         return "%s-%s.%s" % (self.name, name, extention)
-- 
2.1.4


