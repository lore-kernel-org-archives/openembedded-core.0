Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 4E555605F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Apr 2015 09:03:12 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 07 Apr 2015 02:03:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,536,1422950400"; d="scan'208";a="709789828"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 07 Apr 2015 02:03:14 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 3705D6A408F;
	Tue,  7 Apr 2015 02:02:50 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Apr 2015 12:03:06 +0300
Message-Id: <1428397386-17205-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] wic: make error message more informative
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
X-List-Received-Date: Tue, 07 Apr 2015 09:03:14 -0000

Included name of the missing program into the error message produced
by exec_native_cmd when program is not found.

Removed mentioning of the host programs as this API is not running
them anymore.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/wic/utils/oe/misc.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/wic/utils/oe/misc.py b/scripts/lib/wic/utils/oe/misc.py
index 5facbe0..7769f3f 100644
--- a/scripts/lib/wic/utils/oe/misc.py
+++ b/scripts/lib/wic/utils/oe/misc.py
@@ -92,9 +92,9 @@ def exec_native_cmd(cmd_and_args, native_sysroot, catch = 3):
     rc, out = __exec_cmd(native_cmd_and_args, True, catch)
 
     if rc == 127: # shell command-not-found
-        msger.error("A native (host) program required to build the image "
+        msger.error("A native program %s required to build the image "
                     "was not found (see details above). Please make sure "
-                    "it's installed and try again.")
+                    "it's installed and try again." % args[0])
 
     return (rc, out)
 
-- 
2.1.4


