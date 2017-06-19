Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5F8B971A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jun 2017 14:39:38 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 19 Jun 2017 07:39:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,361,1493708400"; d="scan'208";a="99411696"
Received: from yctb05.ostc.intel.com ([10.54.69.59])
	by orsmga004.jf.intel.com with ESMTP; 19 Jun 2017 07:39:39 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Jun 2017 07:39:35 -0700
Message-Id: <20170619143936.20912-1-leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH 1/2] commands: send stderr to a new pipe
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
X-List-Received-Date: Mon, 19 Jun 2017 14:39:40 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Do not mix the stderr into stdout, allowing test cases to query
the specific output.

[YOCTO #9693]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/utils/commands.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/commands.py b/meta/lib/oeqa/utils/commands.py
index 57286fcb10..4ef0e874ff 100644
--- a/meta/lib/oeqa/utils/commands.py
+++ b/meta/lib/oeqa/utils/commands.py
@@ -29,7 +29,7 @@ class Command(object):
 
         self.defaultopts = {
             "stdout": subprocess.PIPE,
-            "stderr": subprocess.STDOUT,
+            "stderr": subprocess.PIPE,
             "stdin": None,
             "shell": False,
             "bufsize": -1,
-- 
2.12.0


