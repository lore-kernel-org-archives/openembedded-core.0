Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SirNn-0005Aa-F4
	for openembedded-core@lists.openembedded.org;
	Sun, 24 Jun 2012 20:17:59 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 24 Jun 2012 11:07:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="184323405"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.175])
	by fmsmga002.fm.intel.com with ESMTP; 24 Jun 2012 11:07:08 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Jun 2012 11:07:08 -0700
Message-Id: <1340561228-6976-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH] distrodata: Fix missed VARIABLE name change
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
X-List-Received-Date: Sun, 24 Jun 2012 18:17:59 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/classes/distrodata.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/distrodata.bbclass b/meta/classes/distrodata.bbclass
index 90ee7ae..5b10eac 100644
--- a/meta/classes/distrodata.bbclass
+++ b/meta/classes/distrodata.bbclass
@@ -612,7 +612,7 @@ python do_checkpkg() {
 		pstatus += ":%s%s" % (host, path)
 
 	"""Read from manual distro tracking fields as alternative"""
-	pmver = d.getVar("RECIPE_LATEST_VERSION", True)
+	pmver = d.getVar("RECIPE_UPSTREAM_VERSION", True)
 	if not pmver:
 		pmver = "N/A"
 		pmstatus = "ErrNoRecipeData"
-- 
1.7.7.6



