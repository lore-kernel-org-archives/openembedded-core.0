Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2005971DF7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jan 2017 22:37:30 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 13 Jan 2017 14:37:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,223,1477983600"; d="scan'208";a="53643596"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by fmsmga006.fm.intel.com with ESMTP; 13 Jan 2017 14:37:31 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Jan 2017 14:33:54 +0000
Message-Id: <909bdbf6a01c73a7b837cfe7e0ba027181be1146.1484317844.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1484317844.git.mariano.lopez@linux.intel.com>
References: <cover.1484317844.git.mariano.lopez@linux.intel.com>
In-Reply-To: <cover.1484317844.git.mariano.lopez@linux.intel.com>
References: <cover.1484317844.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/2] oeqa/utils/qemurunner.py: Add missing sys module
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
X-List-Received-Date: Fri, 13 Jan 2017 22:37:33 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds the missing sys module used by the child process
to exit. It seems the exception was cached in testimage and
selftest. It seems nobody noticed this because the module
is only used for sys.exit().

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 8f1b5b9..6927456 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -7,6 +7,7 @@
 
 import subprocess
 import os
+import sys
 import time
 import signal
 import re
-- 
2.6.6


