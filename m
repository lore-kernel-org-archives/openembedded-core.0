Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 6AAEF772EA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 14:11:27 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 01 Feb 2017 06:11:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="220099081"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 01 Feb 2017 06:11:27 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 07AE06A4006
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Feb 2017 06:10:27 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Feb 2017 15:48:14 +0200
Message-Id: <bd8d217305a2d0b78a634ab85478b7f8c0bbab89.1485953483.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485953483.git.ed.bartosh@linux.intel.com>
References: <cover.1485953483.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 07/18] wic: pylinted direct_plugin
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
X-List-Received-Date: Wed, 01 Feb 2017 14:11:27 -0000

Fixed wrong continued indentation, unused import and
trailing new line pyling warnings.

[YOCTO #10619]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct_plugin.py | 22 +++++++---------------
 1 file changed, 7 insertions(+), 15 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct_plugin.py b/scripts/lib/wic/plugins/imager/direct_plugin.py
index 48588db..1d0d3ff 100644
--- a/scripts/lib/wic/plugins/imager/direct_plugin.py
+++ b/scripts/lib/wic/plugins/imager/direct_plugin.py
@@ -27,7 +27,6 @@ import os
 import shutil
 import uuid
 import tempfile
-import time
 
 from time import strftime
 from os.path import basename, splitext
@@ -307,19 +306,13 @@ class DirectImageCreator:
                          self.bootimg_dir, self.kernel_dir, self.native_sysroot)
 
 
-            self._image.add_partition(part.disk_size,
-                                       part.disk,
-                                       part.mountpoint,
-                                       part.source_file,
-                                       part.fstype,
-                                       part.label,
-                                       fsopts=part.fsopts,
-                                       boot=part.active,
-                                       align=part.align,
-                                       no_table=part.no_table,
-                                       part_type=part.part_type,
-                                       uuid=part.uuid,
-                                       system_id=part.system_id)
+            self._image.add_partition(part.disk_size, part.disk,
+                                      part.mountpoint, part.source_file,
+                                      part.fstype, part.label,
+                                      fsopts=part.fsopts, boot=part.active,
+                                      align=part.align, no_table=part.no_table,
+                                      part_type=part.part_type, uuid=part.uuid,
+                                      system_id=part.system_id)
 
         if fstab_path:
             shutil.move(fstab_path + ".orig", fstab_path)
@@ -443,4 +436,3 @@ class DirectImageCreator:
 
         # remove work directory
         shutil.rmtree(self.workdir, ignore_errors=True)
-
-- 
2.1.4


