Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7916011B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Apr 2018 08:49:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w3O8nn25030294
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 24 Apr 2018 01:49:53 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Tue, 24 Apr 2018 01:49:52 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Tue, 24 Apr 2018 16:57:28 +0800
Message-ID: <1524560248-9960-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] oeqa/selftest/case: fix typo
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
X-List-Received-Date: Tue, 24 Apr 2018 08:49:54 -0000
Content-Type: text/plain

s/meta-sefltest/meta-selftest/g

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 meta/lib/oeqa/selftest/case.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index e09915b..7a90a6b 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -213,31 +213,31 @@ to ensure accurate results.")
         ftools.remove_from_file(self.testinc_path, data)
 
     def recipeinc(self, recipe):
-        """Return absolute path of meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
+        """Return absolute path of meta-selftest/recipes-test/<recipe>/test_recipe.inc"""
         return os.path.join(self.testlayer_path, 'recipes-test', recipe, 'test_recipe.inc')
 
     def write_recipeinc(self, recipe, data):
-        """Write to meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
+        """Write to meta-selftest/recipes-test/<recipe>/test_recipe.inc"""
         inc_file = self.recipeinc(recipe)
         self.logger.debug("Writing to: %s\n%s\n" % (inc_file, data))
         ftools.write_file(inc_file, data)
         return inc_file
 
     def append_recipeinc(self, recipe, data):
-        """Append data to meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
+        """Append data to meta-selftest/recipes-test/<recipe>/test_recipe.inc"""
         inc_file = self.recipeinc(recipe)
         self.logger.debug("Appending to: %s\n%s\n" % (inc_file, data))
         ftools.append_file(inc_file, data)
         return inc_file
 
     def remove_recipeinc(self, recipe, data):
-        """Remove data from meta-sefltest/recipes-test/<recipe>/test_recipe.inc"""
+        """Remove data from meta-selftest/recipes-test/<recipe>/test_recipe.inc"""
         inc_file = self.recipeinc(recipe)
         self.logger.debug("Removing from: %s\n%s\n" % (inc_file, data))
         ftools.remove_from_file(inc_file, data)
 
     def delete_recipeinc(self, recipe):
-        """Delete meta-sefltest/recipes-test/<recipe>/test_recipe.inc file"""
+        """Delete meta-selftest/recipes-test/<recipe>/test_recipe.inc file"""
         inc_file = self.recipeinc(recipe)
         self.logger.debug("Deleting file: %s" % inc_file)
         try:
-- 
2.7.4


