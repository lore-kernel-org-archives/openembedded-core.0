Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id C4F096C660
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2018 04:16:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2018 20:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.56,289,1539673200"; d="scan'208";a="96057619"
Received: from thivuong-mobl.ccr.corp.intel.com (HELO localhost.localdomain)
	([10.255.138.218])
	by orsmga008.jf.intel.com with ESMTP; 27 Nov 2018 20:16:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2018 17:16:16 +1300
Message-Id: <a451ee6de9c448ab81c98ae850d36a1bff28aaa0.1543378296.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <cover.1543378296.git.paul.eggleton@linux.intel.com>
References: <cover.1543378296.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/4] lib/oe/recipeutils: drop obsolete functions
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
X-List-Received-Date: Wed, 28 Nov 2018 04:16:38 -0000

These date from the time before Tinfoil's API covered this functionality
(back when you could actually access cooker from a tinfoil-based
script).

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/recipeutils.py | 25 -------------------------
 1 file changed, 25 deletions(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 886ad26f178..9c99164d248 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -27,31 +27,6 @@ list_vars = ['SRC_URI', 'LIC_FILES_CHKSUM']
 meta_vars = ['SUMMARY', 'DESCRIPTION', 'HOMEPAGE', 'BUGTRACKER', 'SECTION']
 
 
-def pn_to_recipe(cooker, pn, mc=''):
-    """Convert a recipe name (PN) to the path to the recipe file"""
-
-    best = cooker.findBestProvider(pn, mc)
-    return best[3]
-
-
-def get_unavailable_reasons(cooker, pn):
-    """If a recipe could not be found, find out why if possible"""
-    import bb.taskdata
-    taskdata = bb.taskdata.TaskData(None, skiplist=cooker.skiplist)
-    return taskdata.get_reasons(pn)
-
-
-def parse_recipe(cooker, fn, appendfiles):
-    """
-    Parse an individual recipe file, optionally with a list of
-    bbappend files.
-    """
-    import bb.cache
-    parser = bb.cache.NoCache(cooker.databuilder)
-    envdata = parser.loadDataFull(fn, appendfiles)
-    return envdata
-
-
 def simplify_history(history, d):
     """
     Eliminate any irrelevant events from a variable history
-- 
2.17.2


