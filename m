Return-Path: <sgw@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 3914D6AF9F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 20:20:27 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 21 Nov 2013 12:16:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.93,746,1378882800"; d="scan'208";a="412630795"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.149])
	by orsmga001.jf.intel.com with ESMTP; 21 Nov 2013 12:20:26 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 Nov 2013 12:20:25 -0800
Message-Id: <1385065225-31557-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] ethtool: add actual test names to make
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
X-List-Received-Date: Thu, 21 Nov 2013 20:20:28 -0000

Automake does not seem to be generating the correct target for buildtest-TESTS, which
the recipe was using.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/ethtool/ethtool_3.12.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
index 19bca2f..6615009 100644
--- a/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
+++ b/meta/recipes-extended/ethtool/ethtool_3.12.1.bb
@@ -16,7 +16,7 @@ inherit autotools ptest
 RDEPENDS_${PN}-ptest += "make"
 
 do_compile_ptest() {
-   oe_runmake buildtest-TESTS
+   oe_runmake test-cmdline test-features
 }
 
 do_install_ptest () {
-- 
1.8.3.1


