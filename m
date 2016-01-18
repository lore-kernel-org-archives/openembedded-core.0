Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id DF86473174
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 14:20:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 Jan 2016 06:20:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,312,1449561600"; d="scan'208";a="895743413"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2016 06:20:48 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 646F92C8001
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 07:08:44 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 18 Jan 2016 14:22:46 +0200
Message-Id: <817f92016161b8d85742d0f0349d5822792bde6d.1453119482.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1453119482.git.ed.bartosh@linux.intel.com>
References: <cover.1453119482.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH 6/6] wic: rename kickstarter.py -> ksparser.py
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
X-List-Received-Date: Mon, 18 Jan 2016 14:20:48 -0000

kickstarter.py was not the best name for this module as previously
there was a directory with the same name in scripts/lib/wic/.
All files were removed from it, but .pyc files could still stay there
causing imports from wic.kickstart to fail with
ImportError: cannot import name KickStart.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/conf.py                       | 2 +-
 scripts/lib/wic/{kickstart.py => ksparser.py} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename scripts/lib/wic/{kickstart.py => ksparser.py} (100%)

diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index 922a0f6..f7d56d0 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -17,7 +17,7 @@
 
 import os
 
-from wic.kickstart import KickStart, KickStartError
+from wic.ksparser import KickStart, KickStartError
 from wic import msger
 from wic.utils import misc
 
diff --git a/scripts/lib/wic/kickstart.py b/scripts/lib/wic/ksparser.py
similarity index 100%
rename from scripts/lib/wic/kickstart.py
rename to scripts/lib/wic/ksparser.py
-- 
2.1.4


