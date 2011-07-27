Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuE-0001t0-Md
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:51:51 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949308"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:29 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:00 -0700
Message-Id: <da7e2be313ba0364d94d488d4557113d38065ab5.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 10/35] scripts/combo-layer: keep carriage returns at the end of lines
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
X-List-Received-Date: Wed, 27 Jul 2011 07:51:51 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

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
1.7.3.4



