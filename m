Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D5A4273659
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Feb 2015 17:44:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 20 Feb 2015 09:44:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,616,1418112000"; d="scan'208";a="669192687"
Received: from marazel-mobl2.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.23.180])
	by fmsmga001.fm.intel.com with ESMTP; 20 Feb 2015 09:44:28 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Feb 2015 17:44:07 +0000
Message-Id: <a8ea5f6f9c848e789d5ad33edd2461d5ff921baa.1424454072.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1424454072.git.paul.eggleton@linux.intel.com>
References: <cover.1424454072.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1424454072.git.paul.eggleton@linux.intel.com>
References: <cover.1424454072.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/3] lib/oeqa/selftest/bblayers: use dashed subcommands
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
X-List-Received-Date: Fri, 20 Feb 2015 17:44:29 -0000

bitbake-layers subcommands with underscores are the old syntax; the
dashed form has been supported (and displayed in the help text) for
quite a while now, and the old syntax is about to be unsupported, so use
the dashed form in the tests.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/bblayers.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/bblayers.py b/meta/lib/oeqa/selftest/bblayers.py
index 1ead8e8..449c17e 100644
--- a/meta/lib/oeqa/selftest/bblayers.py
+++ b/meta/lib/oeqa/selftest/bblayers.py
@@ -18,17 +18,17 @@ class BitbakeLayers(oeSelfTest):
 
     @testcase(83)
     def test_bitbakelayers_showlayers(self):
-        result = runCmd('bitbake-layers show_layers')
+        result = runCmd('bitbake-layers show-layers')
         self.assertTrue('meta-selftest' in result.output)
 
     @testcase(93)
     def test_bitbakelayers_showappends(self):
-        result = runCmd('bitbake-layers show_appends')
+        result = runCmd('bitbake-layers show-appends')
         self.assertTrue('xcursor-transparent-theme_0.1.1.bbappend' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
 
     @testcase(90)
     def test_bitbakelayers_showoverlayed(self):
-        result = runCmd('bitbake-layers show_overlayed')
+        result = runCmd('bitbake-layers show-overlayed')
         self.assertTrue('aspell' in result.output, msg='xcursor-transparent-theme_0.1.1.bbappend file was not recognised')
 
     @testcase(95)
-- 
1.9.3


