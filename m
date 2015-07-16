Return-Path: <costin.c.constantin@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 89AD46013D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jul 2015 13:10:01 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 16 Jul 2015 06:10:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,488,1432623600"; d="scan'208";a="607384168"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 16 Jul 2015 06:10:00 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 7BE226A4005;
	Thu, 16 Jul 2015 06:09:18 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jul 2015 16:20:24 +0300
Message-Id: <1437052824-5068-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/recipetool: add useful failure messages to test cases
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
X-List-Received-Date: Thu, 16 Jul 2015 13:10:04 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/lib/oeqa/selftest/recipetool.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 08ff4f1..12c6b25 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -50,7 +50,7 @@ class RecipetoolTests(DevtoolBase):
         bbappendfile = self._check_bbappend(testrecipe, recipefile, templayerdir)
         # Check the bbappend contents
         with open(bbappendfile, 'r') as f:
-            self.assertEqual(expectedlines, f.readlines())
+            self.assertEqual(expectedlines, f.readlines(), "Expected lines are not present in %s" % bbappendfile)
         # Check file was copied
         filesdir = os.path.join(os.path.dirname(bbappendfile), testrecipe)
         for expectedfile in expectedfiles:
@@ -109,7 +109,7 @@ class RecipetoolTests(DevtoolBase):
         # But file should have
         copiedfile = os.path.join(os.path.dirname(bbappendfile), 'coreutils', testfile2name)
         result = runCmd('diff -q %s %s' % (testfile2, copiedfile), ignore_status=True)
-        self.assertNotEqual(result.status, 0, 'New file should have been copied but was not')
+        self.assertNotEqual(result.status, 0, 'New file should have been copied but was not %s' % result.output)
 
     @testcase(1178)
     def test_recipetool_appendfile_binary(self):
-- 
2.1.4


