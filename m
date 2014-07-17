Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EA1AA65CF6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Jul 2014 20:34:08 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 17 Jul 2014 13:34:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,680,1400050800"; d="scan'208";a="544985346"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.12.224])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2014 13:34:09 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Jul 2014 13:34:09 -0700
Message-Id: <1405629249-1294-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] rootfs: Remove the extraneous install directory
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
X-List-Received-Date: Thu, 17 Jul 2014 20:34:15 -0000

[YOCTO #6497]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/lib/oe/rootfs.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/rootfs.py b/meta/lib/oe/rootfs.py
index bc2524f..b34856c 100644
--- a/meta/lib/oe/rootfs.py
+++ b/meta/lib/oe/rootfs.py
@@ -379,6 +379,7 @@ class RpmRootfs(Rootfs):
         # __db.00* (Berkeley DB files that hold locks, rpm specific environment
         # settings, etc.), that should not get into the final rootfs
         self.pm.unlock_rpm_db()
+        bb.utils.remove(self.image_rootfs + "/install", True)
 
 
 class DpkgRootfs(Rootfs):
-- 
1.8.3.1


