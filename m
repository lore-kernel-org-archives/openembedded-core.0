Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A77807016E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Sep 2016 20:08:58 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga104.jf.intel.com with ESMTP; 18 Sep 2016 13:08:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,358,1470726000"; d="scan'208";a="1058565614"
Received: from yewyangh-mobl2.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.139])
	by fmsmga002.fm.intel.com with ESMTP; 18 Sep 2016 13:08:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Sep 2016 08:08:09 +1200
Message-Id: <dc168c3cd2fa4754d85a02f7c2531a915cfc4f71.1474229259.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1474229259.git.paul.eggleton@linux.intel.com>
References: <cover.1474229259.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/10] recipetool: create: pick up AC_PROG_SWIG
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
X-List-Received-Date: Sun, 18 Sep 2016 20:08:58 -0000

AX_PKG_SWIG is not the only commonly-used macro for detecting swig -
there's also AC_PROG_SWIG. As per AX_PKG_SWIG, add swig-native to
DEPENDS if AC_PROG_SWIG is found in configure.ac.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/recipetool/create_buildsys.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/recipetool/create_buildsys.py b/scripts/lib/recipetool/create_buildsys.py
index 067be18..e914e53 100644
--- a/scripts/lib/recipetool/create_buildsys.py
+++ b/scripts/lib/recipetool/create_buildsys.py
@@ -571,7 +571,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                 deps.append('sqlite3')
             elif keyword == 'AX_LIB_TAGLIB':
                 deps.append('taglib')
-            elif keyword == 'AX_PKG_SWIG':
+            elif keyword in ['AX_PKG_SWIG', 'AC_PROG_SWIG']:
                 deps.append('swig-native')
             elif keyword == 'AX_PROG_XSLTPROC':
                 deps.append('libxslt-native')
@@ -651,6 +651,7 @@ class AutotoolsRecipeHandler(RecipeHandler):
                     'AX_LIB_SQLITE3',
                     'AX_LIB_TAGLIB',
                     'AX_PKG_SWIG',
+                    'AC_PROG_SWIG',
                     'AX_PROG_XSLTPROC',
                     'AC_PYTHON_DEVEL',
                     'AX_PYTHON_DEVEL',
-- 
2.5.5


