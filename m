Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id ADAE978202
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 12:14:57 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP; 23 Aug 2017 05:14:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,416,1498546800"; d="scan'208";a="1006804075"
Received: from skhurana-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.43])
	by orsmga003.jf.intel.com with ESMTP; 23 Aug 2017 05:14:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Aug 2017 00:14:47 +1200
Message-Id: <597e0ce43d451de95397f296a8ed4627ca3ac880.1503490439.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1503490439.git.paul.eggleton@linux.intel.com>
References: <cover.1503490439.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] recipetool: create: fix broken import in npm module
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
X-List-Received-Date: Wed, 23 Aug 2017 12:14:57 -0000

With "import oe" in create_npm.py you get "AttributeError: module 'oe'
has no attribute 'package'" when it tries to call
oe.package.npm_split_package_dirs().

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_npm.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_npm.py b/scripts/lib/recipetool/create_npm.py
index 07fcf4d..6252e91 100644
--- a/scripts/lib/recipetool/create_npm.py
+++ b/scripts/lib/recipetool/create_npm.py
@@ -166,7 +166,7 @@ class NpmRecipeHandler(RecipeHandler):
 
     def process(self, srctree, classes, lines_before, lines_after, handled, extravalues):
         import bb.utils
-        import oe
+        import oe.package
         from collections import OrderedDict
 
         if 'buildsystem' in handled:
-- 
2.9.5


