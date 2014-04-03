Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B909A6F84D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Apr 2014 08:23:06 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 03 Apr 2014 01:23:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,785,1389772800"; d="scan'208";a="513945478"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 03 Apr 2014 01:22:39 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 4FF8B6A4083;
	Thu,  3 Apr 2014 01:22:23 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  3 Apr 2014 13:26:07 +0300
Message-Id: <1396520767-12910-1-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] selftest/sstatetests.py: Added 'populate_lic' to ignore_patterns
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
X-List-Received-Date: Thu, 03 Apr 2014 08:23:06 -0000

Because the sstate-cache-management script does not remove populate_lic
sstate files, we should ignore them when checking for removed files.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/selftest/sstatetests.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/sstatetests.py b/meta/lib/oeqa/selftest/sstatetests.py
index 27561ca..35ff28b 100644
--- a/meta/lib/oeqa/selftest/sstatetests.py
+++ b/meta/lib/oeqa/selftest/sstatetests.py
@@ -153,7 +153,7 @@ class SStateTests(SStateBase):
         target_config = []
         global_config.append('')
         target_config.append('PR = "0"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config)
+        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_pr_2(self):
         global_config = []
@@ -162,7 +162,7 @@ class SStateTests(SStateBase):
         target_config.append('PR = "0"')
         global_config.append('')
         target_config.append('PR = "1"')
-        self.run_test_sstate_cache_management_script('m4', global_config,  target_config)
+        self.run_test_sstate_cache_management_script('m4', global_config,  target_config, ignore_patterns=['populate_lic'])
 
     def test_sstate_cache_management_script_using_pr_3(self):
         global_config = []
-- 
1.8.3.2


