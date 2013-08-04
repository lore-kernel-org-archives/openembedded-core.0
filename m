Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3A789608BF
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 Aug 2013 09:12:58 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 04 Aug 2013 02:12:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,811,1367996400"; d="scan'208";a="357122553"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2013 02:12:46 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.73])
	by linux.intel.com (Postfix) with ESMTP id B2F0A6A4092;
	Sun,  4 Aug 2013 02:12:38 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 Aug 2013 12:12:32 +0300
Message-Id: <1375607552-13458-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] oeqa/utils/qemurunner: fix wrong var in message
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
X-List-Received-Date: Sun, 04 Aug 2013 09:12:58 -0000

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 meta/lib/oeqa/utils/qemurunner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/utils/qemurunner.py b/meta/lib/oeqa/utils/qemurunner.py
index 45b3ccb..d086203 100644
--- a/meta/lib/oeqa/utils/qemurunner.py
+++ b/meta/lib/oeqa/utils/qemurunner.py
@@ -74,7 +74,7 @@ class QemuRunner:
                 console.write("root\n")
                 (index, match, text) = console.expect([r"(root@[\w-]+:~#)"],10)
                 if not match:
-                    bb.note("Couldn't get prompt, all I got was:\n%s" % match.group(0))
+                    bb.note("Couldn't get prompt, all I got was:\n%s" % text)
                     return False
                 console.write("ip addr show `ip route list | sed -n '1p' | awk '{print $5}'` | sed -n '3p' | awk '{ print $2 }' | cut -f 1 -d \"/\"\n")
                 (index, match, text) = console.expect([r"((?:[0-9]{1,3}\.){3}[0-9]{1,3})"],10)
-- 
1.8.3.1


