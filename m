Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4E00B7732D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 21:14:55 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Jun 2016 14:14:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,408,1459839600"; d="scan'208";a="967783321"
Received: from yctb01.ostc.intel.com (HELO yctb01.otcr.intel.com)
	([10.54.69.55])
	by orsmga001.jf.intel.com with ESMTP; 02 Jun 2016 14:14:55 -0700
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 13:09:58 +0000
Message-Id: <b2f510d05e14569f1765ca78ee30aa93dd19cdde.1464872981.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1464872981.git.mariano.lopez@linux.intel.com>
References: <cover.1464872981.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] testexport.bbclass: Update to use python3
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
X-List-Received-Date: Thu, 02 Jun 2016 21:14:55 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Remove deprecated attributes in order to use python3.

runexported was changed to use python3.

[YOCTO #9702]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testexport.bbclass | 4 ++--
 meta/lib/oeqa/runexported.py    | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index e06c668..51b7d93 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -95,9 +95,9 @@ def exportTests(d,tc):
                     if not os.path.exists(target_folder):
                         shutil.copytree(foldername, target_folder)
         if not isfolder:
-            shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
+            shutil.copy2(mod.path, os.path.join(exportpath, "oeqa/runtime"))
     # copy __init__.py files
-    oeqadir = pkgutil.get_loader("oeqa").filename
+    oeqadir = os.path.dirname(pkgutil.get_loader("oeqa").path)
     shutil.copy2(os.path.join(oeqadir, "__init__.py"), os.path.join(exportpath, "oeqa"))
     shutil.copy2(os.path.join(oeqadir, "runtime/__init__.py"), os.path.join(exportpath, "oeqa/runtime"))
     # copy oeqa/oetest.py and oeqa/runexported.py
diff --git a/meta/lib/oeqa/runexported.py b/meta/lib/oeqa/runexported.py
index 52c1171..f1366a6 100755
--- a/meta/lib/oeqa/runexported.py
+++ b/meta/lib/oeqa/runexported.py
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 
 # Copyright (C) 2013 Intel Corporation
-- 
2.6.6


