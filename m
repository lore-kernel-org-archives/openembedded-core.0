Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1RMO5S-0000ta-ID
	for openembedded-core@lists.openembedded.org;
	Fri, 04 Nov 2011 19:01:54 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 04 Nov 2011 10:55:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="71129582"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.98])
	by orsmga002.jf.intel.com with ESMTP; 04 Nov 2011 10:55:43 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  4 Nov 2011 17:55:34 +0000
Message-Id: <07d515939e71caf353b962253fbff00e2d72c4e2.1320429268.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1320429268.git.paul.eggleton@linux.intel.com>
References: <cover.1320429268.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] scripts/combo-layer: handle merge commits
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
X-List-Received-Date: Fri, 04 Nov 2011 18:01:54 -0000

The combo-layer tool had trouble handling merge commits as they were
included in the revision list but not the patches; these are now
excluded from the revision list.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index f8763ee..d6d238d 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -218,7 +218,7 @@ def action_update(conf, args):
         logger.debug("generated patch set:\n%s" % output)
         patchlist = output.splitlines()
 
-        rev_cmd = 'git log --pretty=format:"%H" ' + rev_cmd_range
+        rev_cmd = 'git rev-list --no-merges ' + rev_cmd_range
         revlist = runcmd(rev_cmd, ldir).splitlines()
 
         # Step 3: Call repo specific hook to adjust patch
-- 
1.7.5.4



