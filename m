Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EC2496FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 19:42:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v52Jgqua028680
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 2 Jun 2017 12:42:52 -0700 (PDT)
Received: from fidler.wrs.com (172.25.44.7) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 2 Jun 2017 12:42:52 -0700
From: Randy MacLeod <Randy.MacLeod@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Jun 2017 15:42:46 -0400
Message-ID: <20170602194246.32113-1-Randy.MacLeod@windriver.com>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [PATCH] oeqa/core: Improve grammar in README and loader comments
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
X-List-Received-Date: Fri, 02 Jun 2017 19:42:52 -0000
Content-Type: text/plain

Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
---
 meta/lib/oeqa/core/README    | 37 ++++++++++++++++++-------------------
 meta/lib/oeqa/core/loader.py |  8 ++++----
 2 files changed, 22 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/core/README b/meta/lib/oeqa/core/README
index f67dff7..d4fcda4 100644
--- a/meta/lib/oeqa/core/README
+++ b/meta/lib/oeqa/core/README
@@ -2,34 +2,34 @@
 
 == Introduction ==
 
-This is the new (version 2) OEQA framework. Base clases are located inside the
-'oeqa/core' folder and subsequent components needs to extend from these.
+This is version 2 of the OEQA framework. Base clases are located in the
+'oeqa/core' directory and subsequent components must extend from these.
 
-The main design consideration was to implement the needed functionality
-on top of Python unittest framework. To archive the latter, the following
-modules are present:
+The main design consideration was to implement the needed functionality on
+top of the Python unittest framework. To achieve this goal, the following
+modules are used:
 
     * oeqa/core/runner.py: Provides OETestResult and OETestRunner base
-      classes extending the unittest ones. This class has the support for
-      export results to different formats currently RAW and XML.
+      classes extending the unittest class. These classes support exporting
+      results to different formats; currently RAW and XML support exist.
 
-    * oeqa/core/loader.py: Provides OETestLoader extending unittest ones,
-      also implements unified way for decorator support and for filtering test
-      cases.
+    * oeqa/core/loader.py: Provides OETestLoader extending the unittest class.
+      It also features a unified implementation of decorator support and
+      filtering test cases.
 
     * oeqa/core/case.py: Provides OETestCase base class extending
       unittest.TestCase and provides access to the Test data (td), Test context
       and Logger functionality.
 
-    * oeqa/core/decorator: Provides OETestDecorator a new class to implement
+    * oeqa/core/decorator: Provides OETestDecorator, a new class to implement
       decorators for Test cases.
 
-    * oeqa/core/context: Provides OETestContext a high-level API for
+    * oeqa/core/context: Provides OETestContext, a high-level API for
       loadTests and runTests of certain Test component and
       OETestContextExecutor a base class to enable oe-test to discover/use
       the Test component.
 
-In the other hand, a new 'oe-test' runner is located under 'scripts', allowing scans for components
+Also, a new 'oe-test' runner is located under 'scripts', allowing scans for components
 that supports OETestContextExecutor (see below).
 
 == Terminology ==
@@ -39,15 +39,14 @@ that supports OETestContextExecutor (see below).
     * Test data: Data associated with the Test component. Currently we use bitbake datastore as
       a Test data input.
 
-    * Test context: A context of what tests needs to be run and how to do it, additionally provides
-      access to the Test data and could have custom methods, attrs.
+    * Test context: A context of what tests needs to be run and how to do it; this additionally
+      provides access to the Test data and could have custom methods and/or attrs.
 
 == oe-test ==
 
-The new tool oe-test (located at scripts) has the ability to scan the code base for test
-components and provide a unified way to run test cases. Internally it scans folders inside
-oeqa module in order to find specific classes that
-implements a test component.
+The new tool, oe-test, has the ability to scan the code base for test components and provide
+a unified way to run test cases. Internally it scans folders inside oeqa module in order to find
+specific classes that implement a test component.
 
 == Usage ==
 
diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index bffb2da..51bfd9d 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -14,11 +14,11 @@ from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
 
 def _make_failed_test(classname, methodname, exception, suiteClass):
     """
-        When loading tests unittest framework stores the exception in a new
-        class created for be displayed into run().
+        When loading tests, the unittest framework stores any exceptions and
+        displays them only when the 'run' method is called.
 
-        For our purposes will be better to raise the exception in loading 
-        step instead of wait to run the test suite.
+        For our purposes, it is better to raise the exceptions in the loading
+        step rather than waiting to run the test suite.
     """
     raise exception
 unittest.loader._make_failed_test = _make_failed_test
-- 
2.9.3


