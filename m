Return-Path: <william.c.randle@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CB5BD73166
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 22:11:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 12 Apr 2016 15:11:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,476,1455004800"; d="scan'208";a="931097521"
Received: from wcrandle-mobl1.jf.intel.com ([10.24.0.173])
	by orsmga001.jf.intel.com with ESMTP; 12 Apr 2016 15:11:34 -0700
From: Bill Randle <william.c.randle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Apr 2016 15:10:52 -0700
Message-Id: <1460499052-14368-3-git-send-email-william.c.randle@intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1460499052-14368-1-git-send-email-william.c.randle@intel.com>
References: <1460499052-14368-1-git-send-email-william.c.randle@intel.com>
Subject: [PATCH 2/2] image.bbclass: add DEB_{PRE, POST}PROCESS_COMMANDS to rootfs_command_variables list
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
X-List-Received-Date: Tue, 12 Apr 2016 22:11:32 -0000

Remove duplicate ROOTFS_POSTPROCESS_COMMAND in the rootfs_command_variables list.
Add DEB_PREPROCESS_COMMANDS and DEB_POSTPROCESS_COMMANDS to rootfs_command_variables
list for consistency with the RPM_ and OPKG_ versions of those variables.
Note: the package manager specific pre and post process commands
may removed entirely in Yocto 2.2 or later.

Signed-off-by: Bill Randle <william.c.randle@intel.com>
---
 meta/classes/image.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index ea77ab8..4421acb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -103,7 +103,7 @@ do_rootfs[recrdeptask] += "do_packagedata"
 
 def rootfs_command_variables(d):
     return ['ROOTFS_POSTPROCESS_COMMAND','ROOTFS_PREPROCESS_COMMAND','ROOTFS_POSTINSTALL_COMMAND','ROOTFS_POSTUNINSTALL_COMMAND','OPKG_PREPROCESS_COMMANDS','OPKG_POSTPROCESS_COMMANDS','IMAGE_POSTPROCESS_COMMAND',
-            'IMAGE_PREPROCESS_COMMAND','ROOTFS_POSTPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS']
+            'IMAGE_PREPROCESS_COMMAND','RPM_PREPROCESS_COMMANDS','RPM_POSTPROCESS_COMMANDS','DEB_PREPROCESS_COMMANDS','DEB_POSTPROCESS_COMMANDS']
 
 python () {
     variables = rootfs_command_variables(d) + sdk_command_variables(d)
-- 
2.5.0


