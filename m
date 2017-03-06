Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 62698775C7
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 15:24:30 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga105.jf.intel.com with ESMTP; 06 Mar 2017 07:24:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,254,1484035200"; d="scan'208";a="56619714"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2017 07:24:31 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id BBE6E6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Mar 2017 07:24:28 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Mar 2017 17:10:13 +0200
Message-Id: <cc93266d19658e96ac3a7ecfdf08872b792d475c.1488812619.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488812619.git.ed.bartosh@linux.intel.com>
References: <cover.1488812619.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 5/5] selftest: remove extra backslashes from debug output
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
X-List-Received-Date: Mon, 06 Mar 2017 15:24:30 -0000

Remove unneeded backslashes from the format strings that
caused debug output to look confusing:

2017-03-06 16:52:42,428 - selftest.base - DEBUG - Removing from: ...
\IMAGE_FSTYPES = "wic"
WKS_FILE = "mkefidisk.wks"

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/base.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/base.py b/meta/lib/oeqa/selftest/base.py
index 26c93f9..47a8ea8 100644
--- a/meta/lib/oeqa/selftest/base.py
+++ b/meta/lib/oeqa/selftest/base.py
@@ -163,7 +163,7 @@ be re-executed from a clean environment to ensure accurate results.")
 
     # remove data from <builddir>/conf/selftest.inc
     def remove_config(self, data):
-        self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_path, data))
+        self.log.debug("Removing from: %s\n%s\n" % (self.testinc_path, data))
         ftools.remove_from_file(self.testinc_path, data)
 
     # write to meta-sefltest/recipes-test/<recipe>/test_recipe.inc
@@ -206,7 +206,7 @@ be re-executed from a clean environment to ensure accurate results.")
 
     # remove data from <builddir>/conf/bblayers.inc
     def remove_bblayers_config(self, data):
-        self.log.debug("Removing from: %s\n\%s\n" % (self.testinc_bblayers_path, data))
+        self.log.debug("Removing from: %s\n%s\n" % (self.testinc_bblayers_path, data))
         ftools.remove_from_file(self.testinc_bblayers_path, data)
 
     # write to <builddir>/conf/machine.inc
-- 
2.1.4


