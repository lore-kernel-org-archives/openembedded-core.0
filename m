Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1S13a2-0003WW-De
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 23:25:34 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 24 Feb 2012 14:17:10 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="111668403"
Received: from envy.jf.intel.com ([10.7.201.175])
	by orsmga001.jf.intel.com with ESMTP; 24 Feb 2012 14:16:10 -0800
From: Beth Flanagan <elizabeth.flanagan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Feb 2012 14:17:37 -0800
Message-Id: <7fb99be3893199165558e9d7bb1638c2d572cff2.1330121220.git.elizabeth.flanagan@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1330121220.git.elizabeth.flanagan@intel.com>
References: <cover.1330121220.git.elizabeth.flanagan@intel.com>
Subject: [PATCH 1/3] less_444.bb: Adding license email from author
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 22:25:34 -0000

From: Elizabeth Flanagan <elizabeth.flanagan@intel.com>

This slipped off my plate. Adding the email response from the
author of less which allows us to use a generic BSD instead of
the less license.

Signed-off-by: Elizabeth Flanagan <elizabeth.flanagan@intel.com>
---
 meta/recipes-extended/less/less_444.bb |   15 ++++++++++++---
 1 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/less/less_444.bb b/meta/recipes-extended/less/less_444.bb
index f413ba0..fb7059d 100644
--- a/meta/recipes-extended/less/less_444.bb
+++ b/meta/recipes-extended/less/less_444.bb
@@ -6,9 +6,18 @@ HOMEPAGE = "http://www.greenwoodsoftware.com/"
 SECTION = "console/utils"
 
 # (GPLv2+ (<< 418), GPLv3+ (>= 418)) | less
-# less is a 2-clause BSD-like permissive license
-# Mark Nudelman (author of less) has given permission to utilize a generic 
-# 2-clause BSD
+# Including email author giving permissing to use BSD
+#
+# From: Mark Nudelman <markn@greenwoodsoftware.com>
+# To: Elizabeth Flanagan <elizabeth.flanagan@intel.com
+# Date: 12/19/11
+#
+# Hi Elizabeth,
+# Using a generic BSD license for less is fine with me.
+# Thanks,
+#
+# --Mark
+#
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-- 
1.7.1



