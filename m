Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5CF977710C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Mar 2016 17:45:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga103.fm.intel.com with ESMTP; 03 Mar 2016 09:45:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,532,1449561600"; d="scan'208";a="59276079"
Received: from nikhilbh-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.139.241])
	by fmsmga004.fm.intel.com with ESMTP; 03 Mar 2016 09:45:39 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Mar 2016 06:44:56 +1300
Message-Id: <73d08abf9f55967e8f5b8cc71fda472a886b4a1e.1457027073.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1457027073.git.paul.eggleton@linux.intel.com>
References: <cover.1457027073.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1457027073.git.paul.eggleton@linux.intel.com>
References: <cover.1457027073.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/1] recipetool: create: fix support for AX_CHECK_LIBRARY
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
X-List-Received-Date: Thu, 03 Mar 2016 17:45:52 -0000

Clearly I didn't test this part of the code - lists don't have an "add"
method. Needless to say I have tested it now.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 43dcca3..0228269 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -516,7 +516,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     lib = res.group(2)
                     if not lib.startswith('$'):
                         header = res.group(1)
-                        libdeps.add((lib, header))
+                        libdeps.append((lib, header))
             elif keyword == 'AC_PATH_X':
                 deps.append('libx11')
             elif keyword in ('AX_BOOST', 'BOOST_REQUIRE'):
-- 
2.5.0


