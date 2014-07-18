Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id A3C15706B0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Jul 2014 17:05:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jul 2014 10:05:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,686,1400050800"; d="scan'208";a="571932284"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.13.17])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jul 2014 10:05:14 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 Jul 2014 10:05:14 -0700
Message-Id: <1405703114-29239-1-git-send-email-sgw@linux.intel.com>
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
X-List-Received-Date: Fri, 18 Jul 2014 17:05:19 -0000

The /install/tmp diectory is created during installation by
the smart package manager, we need to clean it up here

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


