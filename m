Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 0451871D9A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 19:14:39 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 08 Feb 2017 11:14:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,348,1484035200"; d="scan'208";a="1104796433"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 08 Feb 2017 11:14:40 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 885046A4080
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Feb 2017 11:13:39 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Feb 2017 20:51:31 +0200
Message-Id: <ad916954a47b7c875f416e0966b0cdc48af9c3d6.1486579259.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1486579259.git.ed.bartosh@linux.intel.com>
References: <cover.1486579259.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 7/9] wic: direct: remove unused plugin attributes
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
X-List-Received-Date: Wed, 08 Feb 2017 19:14:40 -0000

Removed unused _disks, _disk_format and _disk_names
attributes from DirectPlugin class.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/plugins/imager/direct.py | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/scripts/lib/wic/plugins/imager/direct.py b/scripts/lib/wic/plugins/imager/direct.py
index 663655a..7d6c59a 100644
--- a/scripts/lib/wic/plugins/imager/direct.py
+++ b/scripts/lib/wic/plugins/imager/direct.py
@@ -90,9 +90,6 @@ class DirectPlugin(ImagerPlugin):
                                strftime("%Y%m%d%H%M"))
         self.workdir = tempfile.mkdtemp(dir=self.outdir, prefix='tmp.wic.')
         self._image = None
-        self._disks = {}
-        self._disk_format = "direct"
-        self._disk_names = []
         self.ptable_format = self.ks.bootloader.ptable
         self.parts = self.ks.partitions
 
@@ -249,7 +246,6 @@ class DirectPlugin(ImagerPlugin):
             msger.debug("Adding disk %s as %s with size %s bytes" \
                         % (disk_name, full_path, disk['min_size']))
             disk_obj = DiskImage(full_path, disk['min_size'])
-            #self._disks[disk_name] = disk_obj
             self._image.add_disk(disk_name, disk_obj, disk_ids.get(disk_name))
 
         self._image.create()
-- 
2.1.4


