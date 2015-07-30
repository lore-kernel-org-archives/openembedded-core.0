Return-Path: <costin.c.constantin@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 2983760167
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:25:01 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2015 04:25:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,577,1432623600"; d="scan'208";a="773172275"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 30 Jul 2015 04:25:01 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id EB9E06A4005;
	Thu, 30 Jul 2015 04:24:15 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jul 2015 14:35:43 +0300
Message-Id: <1438256143-29857-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/sstatetests.py: add annotator to test_sstate_32_64_same_hash [YOCTO #6006]
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
X-List-Received-Date: Thu, 30 Jul 2015 11:25:07 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 9258b53..2599e0b 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -203,6 +203,7 @@ class SStateTests(SStateBase):
         target_config.append('')
         self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
+    @testcase(1270)
     def test_sstate_32_64_same_hash(self):
         """
         The sstate checksums for both native and target should not vary whether
-- 
2.1.4


