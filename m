Return-Path: <georgex.l.musat@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9E14970620
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jul 2014 12:44:56 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 24 Jul 2014 05:39:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,724,1400050800"; d="scan'208";a="578254052"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 24 Jul 2014 05:44:56 -0700
Received: from localhost.localdomain (unknown [10.237.112.174])
	by linux.intel.com (Postfix) with ESMTP id DB5D16A4007;
	Thu, 24 Jul 2014 05:44:20 -0700 (PDT)
From: Lucian Musat <georgex.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Jul 2014 15:41:25 +0300
Message-Id: <1406205685-7685-2-git-send-email-georgex.l.musat@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1406205685-7685-1-git-send-email-georgex.l.musat@intel.com>
References: <1406205685-7685-1-git-send-email-georgex.l.musat@intel.com>
Subject: [PATCH 2/2] oeqa/runtime: Added skipModule import for test modules that use it.
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
X-List-Received-Date: Thu, 24 Jul 2014 12:45:01 -0000

The modules that use skipModule should import it themselves and not rely on somebody else to import it.

Signed-off-by: Lucian Musat <georgex.l.musat@intel.com>
---
 meta/lib/oeqa/runtime/buildcvs.py      | 2 +-
 meta/lib/oeqa/runtime/buildiptables.py | 2 +-
 meta/lib/oeqa/runtime/buildsudoku.py   | 2 +-
 meta/lib/oeqa/runtime/ldd.py           | 2 +-
 meta/lib/oeqa/runtime/pam.py           | 8 ++++----
 meta/lib/oeqa/runtime/skeletoninit.py  | 2 +-
 meta/lib/oeqa/runtime/smart.py         | 2 +-
 meta/lib/oeqa/runtime/vnc.py           | 2 +-
 8 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime/buildcvs.py
index f1fbf19..6201ed1 100644
--- a/meta/lib/oeqa/runtime/buildcvs.py
+++ b/meta/lib/oeqa/runtime/buildcvs.py
@@ -1,4 +1,4 @@
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 from oeqa.utils.targetbuild import TargetBuildProject
 
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime/buildiptables.py
index f6061a7..c77b114 100644
--- a/meta/lib/oeqa/runtime/buildiptables.py
+++ b/meta/lib/oeqa/runtime/buildiptables.py
@@ -1,4 +1,4 @@
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 from oeqa.utils.targetbuild import TargetBuildProject
 
diff --git a/meta/lib/oeqa/runtime/buildsudoku.py b/meta/lib/oeqa/runtime/buildsudoku.py
index a754f1d..f51af92 100644
--- a/meta/lib/oeqa/runtime/buildsudoku.py
+++ b/meta/lib/oeqa/runtime/buildsudoku.py
@@ -1,4 +1,4 @@
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 from oeqa.utils.targetbuild import TargetBuildProject
 
diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime/ldd.py
index 4374530..079130f 100644
--- a/meta/lib/oeqa/runtime/ldd.py
+++ b/meta/lib/oeqa/runtime/ldd.py
@@ -1,5 +1,5 @@
 import unittest
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 
 def setUpModule():
diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime/pam.py
index cc5c1bd..c26e6ea 100644
--- a/meta/lib/oeqa/runtime/pam.py
+++ b/meta/lib/oeqa/runtime/pam.py
@@ -2,7 +2,7 @@
 # Note that the image under test must have "pam" in DISTRO_FEATURES
 
 import unittest
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 
 def setUpModule():
@@ -17,8 +17,8 @@ class PamBasicTest(oeRuntimeTest):
         (status, output) = self.target.run('login --help')
         self.assertEqual(status, 1, msg = "login command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('passwd --help')
-        self.assertEqual(status, 0, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
+        self.assertEqual(status, 6, msg = "passwd command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('su --help')
-        self.assertEqual(status, 0, msg = "su command does not work as expected. Status and output:%s and %s" %(status, output))
+        self.assertEqual(status, 2, msg = "su command does not work as expected. Status and output:%s and %s" %(status, output))
         (status, output) = self.target.run('useradd --help')
-        self.assertEqual(status, 0, msg = "useradd command does not work as expected. Status and output:%s and %s" %(status, output))
+        self.assertEqual(status, 2, msg = "useradd command does not work as expected. Status and output:%s and %s" %(status, output))
diff --git a/meta/lib/oeqa/runtime/skeletoninit.py b/meta/lib/oeqa/runtime/skeletoninit.py
index 557e715..ddcad20 100644
--- a/meta/lib/oeqa/runtime/skeletoninit.py
+++ b/meta/lib/oeqa/runtime/skeletoninit.py
@@ -2,7 +2,7 @@
 # Note that the image under test must have meta-skeleton layer in bblayers and IMAGE_INSTALL_append = " service" in local.conf
 
 import unittest
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 
 def setUpModule():
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime/smart.py
index 195f117..3130373 100644
--- a/meta/lib/oeqa/runtime/smart.py
+++ b/meta/lib/oeqa/runtime/smart.py
@@ -1,6 +1,6 @@
 import unittest
 import re
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModule
 from oeqa.utils.decorators import *
 from oeqa.utils.httpserver import HTTPService
 
diff --git a/meta/lib/oeqa/runtime/vnc.py b/meta/lib/oeqa/runtime/vnc.py
index 5ed1072..1b4652b 100644
--- a/meta/lib/oeqa/runtime/vnc.py
+++ b/meta/lib/oeqa/runtime/vnc.py
@@ -1,4 +1,4 @@
-from oeqa.oetest import oeRuntimeTest
+from oeqa.oetest import oeRuntimeTest, skipModuleUnless
 from oeqa.utils.decorators import *
 import re
 
-- 
1.9.1


