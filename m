Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB83B6FF9B
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 17:06:36 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 09 Jun 2016 10:06:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="994444796"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.152])
	by orsmga002.jf.intel.com with ESMTP; 09 Jun 2016 10:06:04 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 12:07:38 -0500
Message-Id: <1465492059-7708-3-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
In-Reply-To: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
References: <1465492059-7708-1-git-send-email-humberto.ibarra.lopez@intel.com>
Subject: [PATCH 2/3] scripts/lib/bsp/kernel.py: python3: use explicit relative imports
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
X-List-Received-Date: Thu, 09 Jun 2016 17:06:37 -0000

Have to convert implicit relative imports to explicit imports since
implicit relative imports are not supported on python3.

[YOCTO #9723]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/lib/bsp/kernel.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/kernel.py b/scripts/lib/bsp/kernel.py
index 91cc79c..32cab3b 100644
--- a/scripts/lib/bsp/kernel.py
+++ b/scripts/lib/bsp/kernel.py
@@ -29,7 +29,7 @@
 import sys
 import os
 import shutil
-from tags import *
+from .tags import *
 import glob
 import subprocess
 from .engine import create_context
-- 
2.4.11


