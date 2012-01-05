Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Rirfq-0004n0-Ag
	for openembedded-core@lists.openembedded.org;
	Thu, 05 Jan 2012 19:04:22 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 05 Jan 2012 09:56:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="53632760"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.73])
	by AZSMGA002.ch.intel.com with ESMTP; 05 Jan 2012 09:56:58 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Jan 2012 17:56:27 +0000
Message-Id: <cfbaa2ce71dd7112b80469a4ca11450ac08a490e.1325785538.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1325785538.git.paul.eggleton@linux.intel.com>
References: <cover.1325785538.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/4] classes/buildhistory: remove redundant package history checking stub
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
X-List-Received-Date: Thu, 05 Jan 2012 18:04:22 -0000

The code that would have gone here has been superseded by the
buildhistory analysis functionality implemented in
meta/lib/oe/buildhistory_analysis.py and scripts/buildhistory-diff, so
remove it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/buildhistory.bbclass |   11 -----------
 1 files changed, 0 insertions(+), 11 deletions(-)

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f618903..34cc297 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -182,21 +182,10 @@ python buildhistory_emit_pkghistory() {
 
 		write_pkghistory(pkginfo, d)
 
-		if lastversion:
-			check_pkghistory(pkginfo, lastversion)
-
 		write_latestlink(pkg, pe, pv, pr, d)
 }
 
 
-def check_pkghistory(pkginfo, lastversion):
-
-	bb.debug(2, "Checking package history")
-	# RDEPENDS removed?
-	# PKG changed?
-	# Each file list of each package for file removals?
-
-
 def write_recipehistory(rcpinfo, d):
 	bb.debug(2, "Writing recipe history")
 
-- 
1.7.5.4



