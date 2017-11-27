Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id EEEF677FF5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Nov 2017 12:07:21 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Nov 2017 04:07:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,464,1505804400"; d="scan'208";a="12423534"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga002.jf.intel.com with ESMTP; 27 Nov 2017 04:07:12 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Nov 2017 14:06:54 +0200
Message-Id: <315bd054e1d23139efdebca0bdfd46c77e14309e.1511784130.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
In-Reply-To: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
References: <cover.1511784130.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v8 10/16] oeqa/targetcontrol: add missing arg to SimpleRemoteTarget.__init__
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
X-List-Received-Date: Mon, 27 Nov 2017 12:07:22 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/targetcontrol.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/targetcontrol.py b/meta/lib/oeqa/targetcontrol.py
index d147a44480..da529e67a4 100644
--- a/meta/lib/oeqa/targetcontrol.py
+++ b/meta/lib/oeqa/targetcontrol.py
@@ -225,8 +225,8 @@ class QemuTarget(BaseTarget):
 
 class SimpleRemoteTarget(BaseTarget):
 
-    def __init__(self, d):
-        super(SimpleRemoteTarget, self).__init__(d)
+    def __init__(self, d, logger):
+        super(SimpleRemoteTarget, self).__init__(d, logger)
         addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set TEST_TARGET_IP with the IP address of the machine you want to run the tests on.')
         self.ip = addr.split(":")[0]
         try:
-- 
2.13.6


