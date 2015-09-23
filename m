Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4DB2C766E9
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 10:05:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 23 Sep 2015 03:05:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,577,1437462000"; d="scan'208";a="795471358"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.4.127])
	by fmsmga001.fm.intel.com with ESMTP; 23 Sep 2015 03:05:46 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:05:24 +0100
Message-Id: <d704afc34cb88818e7ccd3d331f6ede48cd2d10c.1443002672.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1443002672.git.paul.eggleton@linux.intel.com>
References: <cover.1443002672.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/3] devtool: runqemu: avoid recipe parse
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
X-List-Received-Date: Wed, 23 Sep 2015 10:05:48 -0000

We only need the base configuration to get the variable values we want
to get here, there's no need to parse recipes / load the cache.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/runqemu.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
index 4d08d8c..5282afb 100644
--- a/scripts/lib/devtool/runqemu.py
+++ b/scripts/lib/devtool/runqemu.py
@@ -29,7 +29,7 @@ logger = logging.getLogger('devtool')
 def runqemu(args, config, basepath, workspace):
     """Entry point for the devtool 'runqemu' subcommand"""
 
-    tinfoil = setup_tinfoil(basepath=basepath)
+    tinfoil = setup_tinfoil(config_only=True, basepath=basepath)
     machine = tinfoil.config_data.getVar('MACHINE', True)
     bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
     tinfoil.shutdown()
-- 
2.1.0


