Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1Sw0A3-0004FO-K1
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 02:18:07 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 30 Jul 2012 17:06:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="175049376"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.121.49])
	by azsmga001.ch.intel.com with ESMTP; 30 Jul 2012 17:06:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jul 2012 01:06:20 +0100
Message-Id: <1d6c82026f0307cf3516213aad39fc9d9790452f.1343693147.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1343693147.git.paul.eggleton@linux.intel.com>
References: <cover.1343693147.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/7] combo-layer: remove &> bashism
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
X-List-Received-Date: Tue, 31 Jul 2012 00:18:07 -0000

&> does not work with dash - use > xxxx 2>&1 instead.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/combo-layer |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/combo-layer b/scripts/combo-layer
index 73d61cc..b1a9dca 100755
--- a/scripts/combo-layer
+++ b/scripts/combo-layer
@@ -75,7 +75,7 @@ class Configuration(object):
             sys.exit(1)
 
         # filterdiff is required by action_splitpatch, so check its availability
-        if subprocess.call("which filterdiff &>/dev/null", shell=True) != 0:
+        if subprocess.call("which filterdiff > /dev/null 2>&1", shell=True) != 0:
             logger.error("ERROR: patchutils package is missing, please install it (e.g. # apt-get install patchutils)")
             sys.exit(1)
 
-- 
1.7.9.5



