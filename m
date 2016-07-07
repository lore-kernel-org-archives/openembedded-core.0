Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id C956F6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 15:13:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga104.fm.intel.com with ESMTP; 07 Jul 2016 08:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,324,1464678000"; d="scan'208";a="990802931"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 07 Jul 2016 08:13:31 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 5C3266A4006
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 08:13:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jul 2016 18:13:04 +0300
Message-Id: <1467904384-841-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1467904384-841-1-git-send-email-maxin.john@intel.com>
References: <1467904384-841-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/2] graph-tool: convert to python3
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
X-List-Received-Date: Thu, 07 Jul 2016 15:13:33 -0000

move graph-tool to python3

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 scripts/contrib/graph-tool | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/graph-tool b/scripts/contrib/graph-tool
index 6dc7d33..0275fbd 100755
--- a/scripts/contrib/graph-tool
+++ b/scripts/contrib/graph-tool
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Simple graph query utility
 # useful for getting answers from .dot files produced by bitbake -g
@@ -56,7 +56,7 @@ def find_paths(args, usage):
     paths = list(get_path_networkx(args[0], fromnode, tonode))
     if paths:
         for path in paths:
-            print ' -> '.join(path)
+            print(" -> ".join(map(str,path)))
     else:
         print("ERROR: no path from %s to %s in graph" % (fromnode, tonode))
         sys.exit(1)
-- 
2.4.0


