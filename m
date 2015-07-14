Return-Path: <jose.a.lamego@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id C093475F14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 17:04:10 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 14 Jul 2015 10:04:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,473,1432623600"; d="scan'208";a="764291088"
Received: from yctb04.ostc.intel.com (HELO yctb04.otcr.jf.intel.com)
	([10.23.219.53])
	by orsmga002.jf.intel.com with ESMTP; 14 Jul 2015 10:04:10 -0700
From: jose.a.lamego@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 09:01:38 +0000
Message-Id: <1436864498-8875-1-git-send-email-jose.a.lamego@linux.intel.com>
X-Mailer: git-send-email 1.8.4.5
Subject: [PATCH] subversion_1.8.13.bb: Upstream-Status updated to Accepted
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
X-List-Received-Date: Tue, 14 Jul 2015 17:04:11 -0000

From: Jose Lamego <jose.a.lamego@linux.intel.com>

Upstream-Status changed to Accepted due to [1]

[1] http://svn.apache.org/viewvc/subversion/trunk/build/ac-macros/serf.m4?r1=1594156&r2=1689824

---
 .../serf.m4-Regex-modified-to-allow-D-in-paths.patch                | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch b/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch
index 713b5eb..140e522 100644
--- a/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch
+++ b/meta/recipes-devtools/subversion/subversion-1.8.13/serf.m4-Regex-modified-to-allow-D-in-paths.patch
@@ -3,7 +3,11 @@ From: Jose Lamego <jose.a.lamego@linux.intel.com>
 Date: Thu, 2 Jul 2015 11:37:43 +0000
 Subject: [PATCH] serf.m4: Regex modified to allow '-D' in paths
 
-Upstream-Status: Pending
+Upstream-Status: Accepted
+
+The patch is merged by subversion upstream with replacing '[[:space:]]' with ' '.
+
+http://svn.apache.org/viewvc/subversion/trunk/build/ac-macros/serf.m4?r1=1594156&r2=1689824  
 
 Signed-off-by: Jose Lamego <jose.a.lamego@linux.intel.com>
 ---
-- 
1.8.4.5


