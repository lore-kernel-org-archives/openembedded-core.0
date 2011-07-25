Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1QlMSv-0003BC-4e
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Jul 2011 16:49:05 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 25 Jul 2011 07:44:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,261,1309762800"; d="scan'208";a="32018319"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.255.17.240])
	by fmsmga002.fm.intel.com with ESMTP; 25 Jul 2011 07:44:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jul 2011 15:44:48 +0100
Message-Id: <d1842fa04d3ce36a585e2c0b26ee5d8104f5ec0c.1311605016.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1311605016.git.paul.eggleton@linux.intel.com>
References: <cover.1311605016.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1311605016.git.paul.eggleton@linux.intel.com>
References: <cover.1311605016.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] scripts/combo-layer: keep carriage returns at the end of lines
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
X-List-Received-Date: Mon, 25 Jul 2011 14:49:05 -0000

Use --keep-cr option to "git am" or otherwise we lose carriage returns
which can be important for patches against files that use CRs.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 84cc48f..d129175 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -254,7 +254,7 @@ def action_apply_patch(conf, args):
         for line in open(repo['patchlist']):
             patchfile = line.split()[0]
             lastrev = line.split()[1]
-            cmd = "git am -s -p1 %s" % patchfile
+            cmd = "git am --keep-cr -s -p1 %s" % patchfile
             logger.info("Apply %s" % patchfile )
             try:
                 runcmd(cmd)
-- 
1.7.4.1



