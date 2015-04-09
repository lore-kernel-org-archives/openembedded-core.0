Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B81CC73CC1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Apr 2015 08:02:10 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 09 Apr 2015 01:02:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.11,548,1422950400"; d="scan'208";a="692683875"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Apr 2015 01:02:11 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id C88EF6A408F;
	Thu,  9 Apr 2015 01:01:48 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Apr 2015 11:01:51 +0300
Message-Id: <1428566511-31895-6-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1428566511-31895-1-git-send-email-george.l.musat@intel.com>
References: <1428566511-31895-1-git-send-email-george.l.musat@intel.com>
Subject: [PATCH 6/6] oeqa/runtime/smart: Added new decorators for existing automated tests.
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
X-List-Received-Date: Thu, 09 Apr 2015 08:02:10 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/smart.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index dba3bd6..e978227 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -30,6 +30,7 @@ class SmartBasicTest(SmartTest):
     def test_smart_help(self):
         self.smart('--help')
 
+    @testcase(968)
     def test_smart_version(self):
         self.smart('--version')
 
@@ -77,12 +78,15 @@ class SmartRepoTest(SmartTest):
                 self.repolist.append(arch)
         self.smart('update')
 
+    @testcase(969)
     def test_smart_channel_help(self):
         self.smart('channel --help')
 
+    @testcase(970)
     def test_smart_channel_list(self):
         self.smart('channel --list')
 
+    @testcase(971)
     def test_smart_channel_show(self):
         self.smart('channel --show')
 
-- 
2.1.0


