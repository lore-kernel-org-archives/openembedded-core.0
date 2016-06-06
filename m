Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 1AC3376643
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:31:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 06 Jun 2016 10:31:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,428,1459839600"; d="scan'208";a="969987347"
Received: from jhibarra-mobl1.zpn.intel.com ([10.219.17.149])
	by orsmga001.jf.intel.com with ESMTP; 06 Jun 2016 10:31:39 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 12:33:19 -0500
Message-Id: <1465234399-6545-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] scripts/lib/bsp/engine.py: Added missing keyword to fix syntax error
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
X-List-Received-Date: Mon, 06 Jun 2016 17:31:42 -0000

Commit af9f6b88fcc5d7fddff01595f9bcf2aba548720 introduced a syntax
error in engine.py by removing keyword "in". This patch adds it back.

[Yocto #9719]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/lib/bsp/engine.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/bsp/engine.py b/scripts/lib/bsp/engine.py
index 3ed90fa..0c162eb 100644
--- a/scripts/lib/bsp/engine.py
+++ b/scripts/lib/bsp/engine.py
@@ -1654,7 +1654,7 @@ def get_properties(input_lines):
         props = line.props
         item = {}
         name = props["name"]
-        for key, val props.items():
+        for key, val in props.items():
             if not key == "name":
                 item[key] = val
         properties[name] = item
-- 
2.4.11


