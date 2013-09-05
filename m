Return-Path: <mihaix.lindner@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 991E36C6B6
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 15:52:54 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga101.ch.intel.com with ESMTP; 05 Sep 2013 08:52:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,847,1371106800"; d="scan'208";a="391553082"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 05 Sep 2013 08:52:47 -0700
Received: from mlindnex-mobl1.ger.corp.intel.com (unknown [10.237.105.34])
	by linux.intel.com (Postfix) with ESMTP id 7B6682C8001
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 08:52:45 -0700 (PDT)
From: Mihai Lindner <mihaix.lindner@linux.intel.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Thu,  5 Sep 2013 18:52:40 +0300
Message-Id: <7586572e5b35a3bc9d5f1f9b3fb1e6c066d930b8.1378396260.git.mihaix.lindner@linux.intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
References: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
In-Reply-To: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
References: <cover.1378396260.git.mihaix.lindner@linux.intel.com>
Subject: [PATCH 1/3] oeqa/oetest: oeRuntimeTest: enable long messages
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
X-List-Received-Date: Thu, 05 Sep 2013 15:52:55 -0000

Set longMessage to True for all tests derived from oeRuntimeTest, in
order to have somewhat info on assertions with cryptic or no messages.

Signed-off-by: Mihai Lindner <mihaix.lindner@linux.intel.com>
---
 meta/lib/oeqa/oetest.py        | 2 ++
 meta/lib/oeqa/runtime/smart.py | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index c9dc5dc..529abdc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -37,6 +37,8 @@ def runTests(tc):
 
 
 class oeRuntimeTest(unittest.TestCase):
+
+    longMessage = True
     testFailures = []
     testSkipped = []
     testErrors = []
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 59083ca..468e047 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -12,8 +12,6 @@ def setUpModule():
 
 class SmartTest(oeRuntimeTest):
 
-    longMessage = True
-
     @skipUnlessPassed('test_smart_help')
     def smart(self, command, expected = 0):
         command = 'smart %s' % command
-- 
1.8.3.2


