Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.tricorecenter.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 841396093D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 07:07:14 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id CDE06A00368
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 09:07:48 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017033009071359-426612 ;
	Thu, 30 Mar 2017 09:07:13 +0200 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Mar 2017 09:07:13 +0200
Message-Id: <1490857633-1346-1-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 30.03.2017 09:07:13,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 30.03.2017 09:07:13,
	Serialize complete at 30.03.2017 09:07:13
X-TNEFEvaluated: 1
Subject: [PATCH] wic: partition: Update fsck parameters
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
X-List-Received-Date: Thu, 30 Mar 2017 07:07:15 -0000

These parameters are copied from the ext image class.

-D will let fsck perform further directory optimizations
-v might be helpful for debugging purpose

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 scripts/lib/wic/partition.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/wic/partition.py b/scripts/lib/wic/partition.py
index 8e32afc..93b9b16 100644
--- a/scripts/lib/wic/partition.py
+++ b/scripts/lib/wic/partition.py
@@ -286,7 +286,7 @@ class Partition():
             (self.fstype, extra_imagecmd, rootfs, label_str, rootfs_dir)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
-        mkfs_cmd = "fsck.%s -fy %s" % (self.fstype, rootfs)
+        mkfs_cmd = "fsck.%s -pvfD %s" % (self.fstype, rootfs)
         exec_native_cmd(mkfs_cmd, native_sysroot, pseudo=pseudo)
 
     def prepare_rootfs_btrfs(self, rootfs, oe_builddir, rootfs_dir,
-- 
1.9.1


