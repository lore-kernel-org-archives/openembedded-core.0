Return-Path: <georgex.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 96CA171401
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Sep 2014 11:32:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Sep 2014 04:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,465,1406617200"; d="scan'208";a="568250776"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 04 Sep 2014 04:32:30 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id 7B3576A4087;
	Thu,  4 Sep 2014 04:31:47 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Sep 2014 14:27:24 +0300
Message-Id: <1409830046-28375-1-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH 1/3] oeqa: Added package installer to oetest to aid in future automatic install of packages
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
X-List-Received-Date: Thu, 04 Sep 2014 11:32:40 -0000

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/oetest.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index ed8b3b2..0b7e7dc 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -66,6 +66,13 @@ class oeRuntimeTest(oeTest):
         self.target = oeRuntimeTest.tc.target
         super(oeRuntimeTest, self).__init__(methodName)
 
+    #TODO: use package_manager.py to install packages on any type of image
+    def install_packages(self, packagelist):
+        for package in packagelist:
+            (status, result) = self.target.run("smart install -y "+package)
+            if status != 0:
+                return status
+
 class oeSDKTest(oeTest):
     def __init__(self, methodName='runTest'):
         self.sdktestdir = oeSDKTest.tc.sdktestdir
-- 
1.9.1


