Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9F53E76389
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jul 2015 07:35:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 28 Jul 2015 00:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,561,1432623600"; d="scan'208";a="772610544"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Jul 2015 00:35:29 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 55DB96A4005;
	Tue, 28 Jul 2015 00:34:43 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Jul 2015 10:35:51 +0300
Message-Id: <1438068951-2857-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] lsbtest: sync test suite packages version
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
X-List-Received-Date: Tue, 28 Jul 2015 07:35:28 -0000

Sync file packages_list with upstream test suite packages version.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/recipes-extended/lsb/lsbtest/packages_list | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-extended/lsb/lsbtest/packages_list b/meta/recipes-extended/lsb/lsbtest/packages_list
index 99f83c1..27d8352 100644
--- a/meta/recipes-extended/lsb/lsbtest/packages_list
+++ b/meta/recipes-extended/lsb/lsbtest/packages_list
@@ -3,15 +3,15 @@ LSB_ARCH="lsbarch"
 
 BASE_PACKAGES_LIST="lsb-setup-4.1.0-1.noarch.rpm"
 
-RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-4.1.0.12-1.targetarch.rpm \
-	lsb-tet3-lite-3.7-23.lsb4.targetarch.rpm \
-	lsb-tet3-lite-devel-3.7-23.lsb4.targetarch.rpm \
-	lsb-xvfb-1.2.0-21.targetarch.rpm \
+RUNTIME_BASE_PACKAGES_LIST="lsb-dist-checker-5.0.0.1-1.targetarch.rpm \
+	lsb-tet3-lite-3.7-27.lsb5.targetarch.rpm \
+	lsb-tet3-lite-devel-3.7-27.lsb5.targetarch.rpm \
+	lsb-xvfb-1.2.0-22.targetarch.rpm \
 	"
 
 RUNTIME_PACKAGES_LIST="lsb-cmdchk-4.1.4-5.targetarch.rpm \
 	lsb-libchk-4.1.4-5.targetarch.rpm \
-	lsb-qm-2.2-8.lsb4.targetarch.rpm \
+	lsb-qm-2.2-12.lsb4.targetarch.rpm \
 	lsb-task-dist-testkit-4.1.9-1.noarch.rpm \
 	lsb-test-core-4.1.15-1.targetarch.rpm \
 	lsb-test-cpp-t2c-4.1.0-1.targetarch.rpm \
-- 
2.1.4


