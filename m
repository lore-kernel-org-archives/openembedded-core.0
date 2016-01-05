Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C3AF60762
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jan 2016 09:39:11 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jan 2016 01:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,524,1444719600"; d="scan'208";a="720461373"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 05 Jan 2016 01:39:12 -0800
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 6B5826A4004;
	Tue,  5 Jan 2016 02:27:10 -0800 (PST)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jan 2016 11:42:13 +0200
Message-Id: <1451986933-28051-1-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH] selftest: Added testcase decorators for 2 tests
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
X-List-Received-Date: Tue, 05 Jan 2016 09:39:12 -0000

1391 for test_devtool_add_fetch_simple from devtool
1392 for test_recipetool_create_simple from recipetool

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/devtool.py    | 1 +
 meta/lib/oeqa/selftest/recipetool.py | 1 +
 2 files changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index 1eadd6b..f6471bd 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -333,6 +333,7 @@ class DevtoolTests(DevtoolBase):
         checkvars['SRCREV'] = checkrev
         self._test_recipe_contents(recipefile, checkvars, [])
 
+    @testcase(1391)
     def test_devtool_add_fetch_simple(self):
         # Fetch source from a remote URL, auto-detecting name
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
diff --git a/meta/lib/oeqa/selftest/recipetool.py b/meta/lib/oeqa/selftest/recipetool.py
index 00f415b..6a7ef9d 100644
--- a/meta/lib/oeqa/selftest/recipetool.py
+++ b/meta/lib/oeqa/selftest/recipetool.py
@@ -401,6 +401,7 @@ class RecipetoolTests(RecipetoolBase):
         inherits = ['autotools', 'pkgconfig']
         self._test_recipe_contents(recipefile, checkvars, inherits)
 
+    @testcase(1392)
     def test_recipetool_create_simple(self):
         # Try adding a recipe
         temprecipe = os.path.join(self.tempdir, 'recipe')
-- 
2.1.0


