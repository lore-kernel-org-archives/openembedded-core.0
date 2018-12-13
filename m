Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
	[209.85.215.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6700671E5A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:33 +0000 (UTC)
Received: by mail-pg1-f173.google.com with SMTP id j10so443273pga.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=0eZCwujlyC+WESyjBapxX4MBXGoNn7z+mNWD4Vvlfhg=;
	b=W9/AFjnz2uhrrhWumz2beWDA0wajz5RGQhNdOxae2KTW0CDvJUUxIXyk7mQDy4S4rD
	7DLEHd+C6OhbUahvi0hNU2yo5cVl40Zex0XC4/+SFXuEZE4Q1EkKPt44lB/pIEcwFRM8
	sd25UOxEU8RVYP6ulOx1uuRdcnZDVmI7Y0UK3BXRS0+0QEGSi8ljbKXdUElKxilck8oR
	7BiEAd3ovU4SM6BtooPS2JWbgY6jLSCxU7ZD9UFQUBnJawUf/gctCrn040a/PK/QEZg7
	aUbSqL77ojLlwmzJsyrNrKHWXwUNNV3WHeLHeZxhZTTAf19uhZ4QY9RlyjnSC00Xi1N9
	D9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=0eZCwujlyC+WESyjBapxX4MBXGoNn7z+mNWD4Vvlfhg=;
	b=Y7xG7Sox+uScNA/1RA+yelsm5SsogtlVtGbfSZRc1hx+yNU26xxa0K0pK3ZzKi9X+Z
	NyvtJ1VQ5XPtVVaW5GLWZLG0KmlOMyR7AYV8/UwzY0hHrgp2g/QIXoIHv6DU/DbzE7VD
	boerFf9Ad76BVbYw+/Kg+aoAhO+cOKEd2fLghO5wYr7VQSZa6l4er8Bu68zxKcQGXD7e
	isl5YPSvmEr0AqQAceYIkvkysycolmHYLXwsdwchQ5bGHQjKe8K908uzbvNJxvyZTCfR
	f3Vta/DxT69tPk1kF8GNKRMuYixIn2LAHGF+dCiL6jHhRFpqV/NyK9Ut/yB0kaL+Y93J
	eSLA==
X-Gm-Message-State: AA+aEWa+pD4aXPdurolmkz6OA+K2XteSZt5PItCNNxt63ZY727m0NeF0
	HT7/qh4YcMRG2b0eSmfY+WcgDU5X
X-Google-Smtp-Source: AFSGD/V0D2zxGy2j9qYGe8cC5VR0OUSvlh3ZG+H1WqLSNbq08bvVIMd4ixPhB/ce8BI3IE6B6n0glg==
X-Received: by 2002:a62:15c3:: with SMTP id 186mr428712pfv.240.1544737174169; 
	Thu, 13 Dec 2018 13:39:34 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:33 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:36 -0800
Message-Id: <8f719055d99291edfefd7f66b817044ea19897f4.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 28/45] oeqa/runner: Simplify code
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:33 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

There doesn't appear to be any reason we need this _results indirection
any more so remove it.

(From OE-Core rev: b618261811c48ff3b98eab1b340a8cd09ef183c6)

(From OE-Core rev: ab271b49d9b55ea271d519c3a4da0b639a07f0bb)

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/context.py           |  1 -
 meta/lib/oeqa/core/decorator/depends.py |  4 +---
 meta/lib/oeqa/core/runner.py            | 15 +++++----------
 meta/lib/oeqa/core/tests/test_data.py   |  4 ++--
 4 files changed, 8 insertions(+), 16 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index acd5474..ef00845 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -27,7 +27,6 @@ class OETestContext(object):
         self.logger = logger
         self._registry = {}
         self._registry['cases'] = collections.OrderedDict()
-        self._results = {}
 
     def _read_modules_from_manifest(self, manifest):
         if not os.path.exists(manifest):
diff --git a/meta/lib/oeqa/core/decorator/depends.py b/meta/lib/oeqa/core/decorator/depends.py
index 99eccc1..69c604d 100644
--- a/meta/lib/oeqa/core/decorator/depends.py
+++ b/meta/lib/oeqa/core/decorator/depends.py
@@ -63,12 +63,10 @@ def _order_test_case_by_depends(cases, depends):
     return [cases[case_id] for case_id in cases_ordered]
 
 def _skipTestDependency(case, depends):
-    results = case.tc._results
-
     skipReasons = ['errors', 'failures', 'skipped']
 
     for reason in skipReasons:
-        for test, _ in results[reason]:
+        for test, _ in getattr(case.tc.results, reason):
             if test.id() in depends:
                 raise SkipTest("Test case %s depends on %s and was in %s." \
                         % (case.id(), test.id(), reason))
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 374d30c..50122f2 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -44,8 +44,10 @@ class OETestResult(_TestResult):
 
         self.successes = []
 
+        # Inject into tc so that TestDepends decorator can see results
+        tc.results = self
+
         self.tc = tc
-        self._tc_map_results()
 
     def startTest(self, test):
         # Allow us to trigger the testcase buffer mode on a per test basis
@@ -55,13 +57,6 @@ class OETestResult(_TestResult):
             self.buffer = test.buffer
         super(OETestResult, self).startTest(test)
 
-    def _tc_map_results(self):
-        self.tc._results['failures'] = self.failures
-        self.tc._results['errors'] = self.errors
-        self.tc._results['skipped'] = self.skipped
-        self.tc._results['expectedFailures'] = self.expectedFailures
-        self.tc._results['successes'] = self.successes
-
     def logSummary(self, component, context_msg=''):
         elapsed_time = self.tc._run_end_time - self.tc._run_start_time
         self.tc.logger.info("SUMMARY:")
@@ -73,7 +68,7 @@ class OETestResult(_TestResult):
             msg = "%s - OK - All required tests passed" % component
         else:
             msg = "%s - FAIL - Required tests failed" % component
-        skipped = len(self.tc._results['skipped'])
+        skipped = len(self.skipped)
         if skipped: 
             msg += " (skipped=%d)" % skipped
         self.tc.logger.info(msg)
@@ -81,7 +76,7 @@ class OETestResult(_TestResult):
     def _getDetailsNotPassed(self, case, type, desc):
         found = False
 
-        for (scase, msg) in self.tc._results[type]:
+        for (scase, msg) in getattr(self, type):
             # XXX: When XML reporting is enabled scase is
             # xmlrunner.result._TestInfo instance instead of
             # string.
diff --git a/meta/lib/oeqa/core/tests/test_data.py b/meta/lib/oeqa/core/tests/test_data.py
index 320468c..21b6c68 100755
--- a/meta/lib/oeqa/core/tests/test_data.py
+++ b/meta/lib/oeqa/core/tests/test_data.py
@@ -21,7 +21,7 @@ class TestData(TestBase):
 
         tc = self._testLoader(modules=self.modules)
         self.assertEqual(False, tc.runTests().wasSuccessful())
-        for test, data in tc._results['errors']:
+        for test, data in tc.errors:
             expect = False
             if expectedException in data:
                 expect = True
@@ -34,7 +34,7 @@ class TestData(TestBase):
 
         tc = self._testLoader(d=d, modules=self.modules)
         self.assertEqual(False, tc.runTests().wasSuccessful())
-        for test, data in tc._results['failures']:
+        for test, data in tc.failures:
             expect = False
             if expectedError in data:
                 expect = True
-- 
2.7.4


