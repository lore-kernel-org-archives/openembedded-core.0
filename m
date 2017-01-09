Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BAB171B58
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Jan 2017 17:39:29 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP; 09 Jan 2017 09:39:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="51794779"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.142])
	by fmsmga006.fm.intel.com with ESMTP; 09 Jan 2017 09:39:28 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jan 2017 11:45:53 -0600
Message-Id: <fb66f893c7b561250a4bb27bfb49964c0f6b6136.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1483983534.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH V3 3/4] selftest: runtime-test: skip image-install test for poky-tiny
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
X-List-Received-Date: Mon, 09 Jan 2017 17:39:29 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

poky-tiny cannot build full-cmdline image, so skip this test in this case.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/runtime-test.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/runtime-test.py b/meta/lib/oeqa/selftest/runtime-test.py
index 20caa97..c0e283f 100644
--- a/meta/lib/oeqa/selftest/runtime-test.py
+++ b/meta/lib/oeqa/selftest/runtime-test.py
@@ -95,6 +95,8 @@ class TestImage(oeSelfTest):
         Product: oe-core
         Author: Mariano Lopez <mariano.lopez@intel.com>
         """
+        if self.distro == 'poky-tiny':
+            self.skipTest('core-image-full-cmdline not buildable for poky-tiny')
 
         features = 'INHERIT += "testimage"\n'
         features += 'TEST_SUITES = "ping ssh selftest"\n'
-- 
2.1.4


