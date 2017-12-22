Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 34F38787DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Dec 2017 08:58:32 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Dec 2017 00:58:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,440,1508828400"; 
   d="scan'208";a="4821374"
Received: from ekhor-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.78.185])
	by orsmga008.jf.intel.com with ESMTP; 22 Dec 2017 00:58:29 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Dec 2017 21:57:53 +1300
Message-Id: <20171222085753.9153-1-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH] lib/oe/patch: add missing import
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
X-List-Received-Date: Fri, 22 Dec 2017 08:58:33 -0000

This module refers to oe.types, so it needs to actually import oe.types.
Fixes errors when parsing certain OE-Core recipes within the layer
index update script.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oe/patch.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oe/patch.py b/meta/lib/oe/patch.py
index f1ab3dd..584bf6c 100644
--- a/meta/lib/oe/patch.py
+++ b/meta/lib/oe/patch.py
@@ -1,4 +1,5 @@
 import oe.path
+import oe.types
 
 class NotFoundError(bb.BBHandledException):
     def __init__(self, path):
-- 
2.9.5


