Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 9F43473285
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 19:24:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jan 2016 11:24:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,534,1444719600"; d="scan'208";a="885911540"
Received: from bitbang.jf.intel.com ([10.7.199.73])
	by orsmga002.jf.intel.com with ESMTP; 07 Jan 2016 11:24:42 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 11:24:25 -0800
Message-Id: <4faa88e5336bdd693906b65f00df34826e73b056.1452194521.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452194521.git.randy.e.witt@linux.intel.com>
References: <cover.1452194521.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 1/3] populate_sdk_ext: Pass excluded_targets as a list to prune_lockedsigs
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
X-List-Received-Date: Thu, 07 Jan 2016 19:24:43 -0000

prune_lockedsigs expects excluded_targets to be a list, whereas
previously it was passed in as a string.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index c30181a..5c99bd0 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -175,7 +175,7 @@ python copy_buildsystem () {
     excluded_targets = d.getVar('SDK_TARGETS', True)
     lockedsigs_pruned = baseoutpath + '/conf/locked-sigs.inc'
     oe.copy_buildsystem.prune_lockedsigs(allowed_tasks,
-                                         excluded_targets,
+                                         excluded_targets.split(),
                                          sigfile,
                                          lockedsigs_pruned)
 
-- 
2.5.0


