Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 660957702B
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Nov 2015 17:01:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Nov 2015 09:01:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,252,1444719600"; d="scan'208";a="844321648"
Received: from bdiacone-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.207])
	by orsmga002.jf.intel.com with ESMTP; 06 Nov 2015 09:01:57 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Nov 2015 17:01:40 +0000
Message-Id: <1e102754634af98b1c8b33c73bc15b3a458b61ab.1446829227.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1446829227.git.paul.eggleton@linux.intel.com>
References: <cover.1446829227.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/4] verify-homepage: get expanded HOMEPAGE value
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
X-List-Received-Date: Fri, 06 Nov 2015 17:01:59 -0000

We tend not to use any variables in HOMEPAGE values, but that doesn't
mean we would never do so.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/verify-homepage.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 9953bab..3e73339 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -35,7 +35,7 @@ def verifyHomepage(bbhandler):
     for pn in pnlist:
         fn = pkg_pn[pn].pop()
         data = bb.cache.Cache.loadDataFull(fn, bbhandler.cooker.collection.get_file_appends(fn), bbhandler.config_data)
-        homepage = data.getVar("HOMEPAGE")
+        homepage = data.getVar("HOMEPAGE", True)
         if homepage:
             try:
                 urllib2.urlopen(homepage, timeout=5)
-- 
2.1.0


