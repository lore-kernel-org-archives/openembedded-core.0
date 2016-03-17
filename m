Return-Path: <daniel.alexandrux.istrate@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7D0EF6FEF5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 10:33:20 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Mar 2016 03:33:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,349,1455004800"; d="scan'208";a="926105003"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 17 Mar 2016 03:33:21 -0700
Received: from fedora-ws.localdomain (unknown [10.237.112.240])
	by linux.intel.com (Postfix) with ESMTP id 943656A4006;
	Thu, 17 Mar 2016 04:21:05 -0700 (PDT)
From: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Mar 2016 12:37:29 +0200
Message-Id: <1458211050-21152-2-git-send-email-daniel.alexandrux.istrate@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
References: <1458211050-21152-1-git-send-email-daniel.alexandrux.istrate@intel.com>
Subject: [PATCH 2/3] selftest/buildoptions: Renamed one test case
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
X-List-Received-Date: Thu, 17 Mar 2016 10:33:21 -0000

'test_layer_git_revisions_are_displayed_and_do_not_fail_without_git_repo'
was renamed to 'test_layer_without_git_dir' which is shorter.

fix for [YOCTO #9243]

Signed-off-by: Daniel Istrate <daniel.alexandrux.istrate@intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 1a427f1..491ce50 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -139,7 +139,7 @@ do_install_append_pn-gzip () {
         self.assertTrue(line and line.startswith("WARNING:"), "WARNING: QA Issue: nfs-utils message is not present in bitbake's output: %s" % res.output)
 
     @testcase(1421)
-    def test_layer_git_revisions_are_displayed_and_do_not_fail_without_git_repo(self):
+    def test_layer_without_git_dir(self):
         """
         Summary:     Test that layer git revisions are displayed and do not fail without git repository
         Expected:    The build to be successful and without "fatal" errors
-- 
2.1.0


