Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id EE3526D491
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Feb 2014 18:21:57 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Feb 2014 10:21:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,787,1384329600"; d="scan'208";a="450278014"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.76])
	by orsmga001.jf.intel.com with ESMTP; 05 Feb 2014 10:21:41 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Feb 2014 10:21:40 -0800
Message-Id: <1391624500-21372-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] rootfs_deb: Fix whitespace issue
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
X-List-Received-Date: Wed, 05 Feb 2014 18:21:58 -0000

Fixing the following warning:
WARNING: Variable rootfs_deb_bad_recommendations contains tabs, please remove these (/srv/ssd/sgw/poky/meta/recipes-extended/images/core-image-lsb-dev.bb)

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/rootfs_deb.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_deb.bbclass b/meta/classes/rootfs_deb.bbclass
index b837e4c..728ea0e 100644
--- a/meta/classes/rootfs_deb.bbclass
+++ b/meta/classes/rootfs_deb.bbclass
@@ -13,7 +13,7 @@ do_rootfs[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 python rootfs_deb_bad_recommendations() {
     if d.getVar("BAD_RECOMMENDATIONS", True):
-	bb.warn("Debian package install does not support BAD_RECOMMENDATIONS")
+        bb.warn("Debian package install does not support BAD_RECOMMENDATIONS")
 }
 do_rootfs[prefuncs] += "rootfs_deb_bad_recommendations"
 
-- 
1.8.3.1


