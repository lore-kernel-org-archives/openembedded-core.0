Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3F46E740AA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 May 2015 17:45:52 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 May 2015 10:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,430,1427785200"; d="scan'208";a="694963892"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com) ([10.252.30.48])
	by orsmga001.jf.intel.com with ESMTP; 14 May 2015 10:45:53 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 May 2015 18:45:05 +0100
Message-Id: <553feb0346f39253ddcf42f34e03436c7afd1c2a.1431625238.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1431625238.git.paul.eggleton@linux.intel.com>
References: <cover.1431625238.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/9] devtool: remove unused imports / re-imports
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
X-List-Received-Date: Thu, 14 May 2015 17:45:52 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 1 -
 scripts/lib/devtool/deploy.py   | 1 -
 scripts/lib/devtool/standard.py | 1 -
 3 files changed, 3 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 78ae0aa..f19d032 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -75,7 +75,6 @@ def setup_tinfoil():
         sys.exit(1)
 
     import bb.tinfoil
-    import logging
     tinfoil = bb.tinfoil.Tinfoil()
     tinfoil.prepare(False)
     tinfoil.logger.setLevel(logging.WARNING)
diff --git a/scripts/lib/devtool/deploy.py b/scripts/lib/devtool/deploy.py
index f016b23..e46ee05 100644
--- a/scripts/lib/devtool/deploy.py
+++ b/scripts/lib/devtool/deploy.py
@@ -28,7 +28,6 @@ def plugin_init(pluginlist):
 
 def deploy(args, config, basepath, workspace):
     import re
-    from devtool import exec_build_env_command
 
     if not args.recipename in workspace:
         logger.error("no recipe named %s in your workspace" % args.recipename)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3bc84c7..3e7b54e 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -19,7 +19,6 @@ import os
 import sys
 import re
 import shutil
-import glob
 import tempfile
 import logging
 import argparse
-- 
2.1.0


