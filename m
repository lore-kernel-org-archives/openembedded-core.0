Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 1F25B71ABE
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 18:32:08 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga101.jf.intel.com with ESMTP; 14 Oct 2016 11:32:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,346,1473145200"; d="scan'208";a="20111744"
Received: from shealy-mobl4.ger.corp.intel.com (HELO
	heimdall.ger.corp.intel.com) ([10.252.27.118])
	by orsmga004.jf.intel.com with ESMTP; 14 Oct 2016 11:32:08 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 21:32:02 +0300
Message-Id: <7d5dad2edbab072d83048e129697829cd1e757f5.1476469708.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.9.3
In-Reply-To: <a73adb3cfa9964608cd1b5f751dfbb8de351c279.1476469708.git.jussi.kukkonen@intel.com>
References: <a73adb3cfa9964608cd1b5f751dfbb8de351c279.1476469708.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1476469708.git.jussi.kukkonen@intel.com>
References: <cover.1476469708.git.jussi.kukkonen@intel.com>
Subject: [PATCH 2/2] core-tools-testapps: Re-add piglit
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
X-List-Received-Date: Fri, 14 Oct 2016 18:32:08 -0000

Piglit was removed from testapps in 9e227ecb3a because it made
sdk images massive. Add piglit back now that the installed size is
no longer humongous: it still needs 1.5 GB free space at runtime but
the image sizes stay reasonable.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 3170978..69cfd57 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -17,6 +17,8 @@ KEXECTOOLS_nios2 ?= ""
 
 X11GLTOOLS = "\
     mesa-demos \
+    piglit \
+    piglit-generated-tests-compressed \
     "
 
 3GTOOLS = "\
-- 
2.9.3


