Return-Path: <juro.bystricky@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2E2E7770C4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Mar 2016 19:36:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Mar 2016 11:36:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,530,1449561600"; d="scan'208";a="899663929"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.145])
	by orsmga001.jf.intel.com with ESMTP; 02 Mar 2016 11:36:32 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Mar 2016 11:23:25 -0800
Message-Id: <1456946605-29739-2-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456946605-29739-1-git-send-email-juro.bystricky@intel.com>
References: <1456946605-29739-1-git-send-email-juro.bystricky@intel.com>
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH 2/2] sdk_update.py: Enable local sdk-update tests
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
X-List-Received-Date: Wed, 02 Mar 2016 19:36:33 -0000

Testing of local sdk updates was commented out.
Local sdk updates are functional now, so the tests should be re-enabled.

Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
---
 meta/lib/oeqa/sdkext/sdk_update.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/sdkext/sdk_update.py b/meta/lib/oeqa/sdkext/sdk_update.py
index 16f5b10..7a2a6fe 100644
--- a/meta/lib/oeqa/sdkext/sdk_update.py
+++ b/meta/lib/oeqa/sdkext/sdk_update.py
@@ -30,8 +30,8 @@ class SdkUpdateTest(oeSDKExtTest):
     def test_sdk_update_http(self):
         output = self._run("devtool sdk-update \"%s\"" % self.http_url)
 
-#    def test_sdk_update_local(self):
-#        output = self._run("devtool sdk-update \"%s\"" % self.publish_dir)
+    def test_sdk_update_local(self):
+        output = self._run("devtool sdk-update \"%s\"" % self.publish_dir)
 
     @classmethod
     def tearDownClass(self):
-- 
1.9.1


