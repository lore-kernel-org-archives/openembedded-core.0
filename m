Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id AE28A7E06F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 16:07:03 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id s11so2069552pfm.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 May 2019 09:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=+g3nFL9lNMxkPhx88gUdmTaVp8tfyfXYuV4nKSqplXU=;
	b=BuuR3T8906AsT+yR7rEsS1VGlsA8NXeSA/5q2gkTflDROU6xfZIQg+Jzww70L31UaA
	UEihPtYMdFcsinc/o4Ja/wot00hc6cflmtr39Ic5o5VIjVwQ3M4OoNAgnNVN2n95s7GF
	zP8D9SnD3pt6xUaO+f4bbbov+JGiQGefws33GYYj2/tN24HEabC4HA1whzeRSZcZjDop
	gDQk8TGjLq+eBoHd7t/ugD2L6R3uT+0fJ1H5iqxQWETc7t2z4nilGEQR5MYqBrtKzzWF
	yO4xaHF+I7C0RdftjHjJzAlbAXJBVFPta/pf4m2xkIDKGoEMptY2geE3KxqWjsP7DFw3
	/S1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=+g3nFL9lNMxkPhx88gUdmTaVp8tfyfXYuV4nKSqplXU=;
	b=kCls7r2GMVHsdAYRu5b3Qw4rGcFxgaOHg12nRfERUKJZe9KCgqkEUHgkvobPSABugS
	Qs5Kkc/5BVIvNr/qJjNVzCDwYWJgAEeLK5ABHoCSg4idUH0fJylvOkeAKvg8qBe2liEo
	9Fm0bj4NGk+iEOOQiWL3XyOMZeqs3qBJC+OutVb3oj1mJtVANf1zcvC7sDZ7BiGP55xv
	bo2/ri7w9cDmJ63p8kBPJc0keKurAMdKeVNun5fr8Xs5I1ewU02pUYtendBZoKesAFxp
	zReGlZc7YSc3mXX7ao8g3XRpSoBJfkYvrTDobu5uYxpvOH1+rBnQmzrKpG4upWhDO931
	iCig==
X-Gm-Message-State: APjAAAV6wC6S3CG2RlHMyxrtiGSskIuQJT8PXKJYNdSBcr15UiHi2QDk
	/nosRSY89Vd77Owr1Lt0WYRGsn/y
X-Google-Smtp-Source: APXvYqxV8W8jkxx0EAwMxI+5dr8ZedT4VTC9TzzETnD+qGroa4/FLcbqqOOkEHih5ZZ9GtceKAwthw==
X-Received: by 2002:a62:62c3:: with SMTP id w186mr53562592pfb.73.1558022824691;
	Thu, 16 May 2019 09:07:04 -0700 (PDT)
Received: from pahoa2.kama-aina.net (c-67-181-203-136.hsd1.ca.comcast.net.
	[67.181.203.136]) by smtp.gmail.com with ESMTPSA id
	q10sm6156148pgh.93.2019.05.16.09.07.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 May 2019 09:07:04 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 May 2019 09:07:00 -0700
Message-Id: <20190516160700.20685-3-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190516160700.20685-1-akuster808@gmail.com>
References: <20190516160700.20685-1-akuster808@gmail.com>
Subject: [PATCH 2/2] runtime ptest: run each ptest separately
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
X-List-Received-Date: Thu, 16 May 2019 16:07:03 -0000

resulttool still working

Recipe  | Passed    | Failed | Skipped | Time(s)
------------------------------------------------
openssh | 0         | 0      | 1      | 1
openssl | 146       | 1      | 8      | 80
python  | 0         | 0      | 0      | 21

[v2]
Lets pass ptest name to ptest-runner in the loop
Add check if test times out
Add saving raw info on per test bases {ptest}-raw.log.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ptest.py | 64 ++++++++++++++++++----------
 1 file changed, 41 insertions(+), 23 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ptest.py b/meta/lib/oeqa/runtime/cases/ptest.py
index fa95fefe011..de24a3586d4 100644
--- a/meta/lib/oeqa/runtime/cases/ptest.py
+++ b/meta/lib/oeqa/runtime/cases/ptest.py
@@ -5,6 +5,7 @@
 import unittest
 import pprint
 import datetime
+import bb
 
 from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
@@ -26,6 +27,7 @@ class PTestBase(OERuntimeTestCase):
     @classmethod
     def ptest_startup(cls):
         cls.failmsg = ""
+        cls.ptests = []
 
         cls.test_log_dir = cls.td.get('TEST_LOG_DIR', '')
         # The TEST_LOG_DIR maybe NULL when testimage is added after
@@ -46,6 +48,8 @@ class PTestBase(OERuntimeTestCase):
             cls.tc.extraresults = {}
 
         cls.extras = cls.tc.extraresults
+        cls.extras['ptestresult.rawlogs'] = {'log': ""}
+        cls.extras['ptestresult.sections'] = {}
 
     @classmethod
     def ptest_finishup(cls):
@@ -60,35 +64,23 @@ class PTestBase(OERuntimeTestCase):
             cls.fail(cls.failmsg)
 
 class PtestRunnerTest(PTestBase):
-
-    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['ptest-runner'])
-    def test_ptestrunner_check(self):
-        status, output = self.target.run('which ptest-runner')
-        msg = 'ptest-runner not installed .  %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
-    @OETestDepends(['ptest.PtestRunnerTest.test_ptestrunner_check'])
-    def test_ptests_installed(self):
-        status, output = self.target.run('ptest-runner -l')
-        msg = 'No ptests found.  %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
-    @OETestDepends(['ptest.PtestRunnerTest.test_ptests_installed'])
-    @unittest.expectedFailure
-    def test_ptestrunner(self):
-        status, output = self.target.run('ptest-runner', 0)
-        with open(self.ptest_runner_log, 'w') as f:
+    def run_ptest(self, ptest):
+        status, output = self.target.run('ptest-runner %s' % ptest, 0)
+        ptest_raw_log = os.path.join(self.ptest_log_dir, "%s-raw.log" % ptest)
+        with open(ptest_raw_log, 'w') as f:
             f.write(output)
 
         # Parse and save results
         parser = PtestParser()
-        results, sections = parser.parse(self.ptest_runner_log)
+        results, sections = parser.parse(ptest_raw_log)
         parser.results_as_files(self.ptest_log_dir)
 
-        self.extras['ptestresult.rawlogs'] = {'log': output}
-        self.extras['ptestresult.sections'] = sections
+        self.extras['ptestresult.rawlogs']['log']  = self.extras['ptestresult.rawlogs']['log'] + output
+        try:
+            self.extras['ptestresult.sections'][ptest]  = sections[ptest]
+        except KeyError:
+            bb.warn("ptest %s timedout or crashed for some reason. Check the log: %s" % (ptest, self.ptest_log_dir))
+            return
 
         trans = str.maketrans("()", "__")
         for section in results:
@@ -110,3 +102,29 @@ class PtestRunnerTest(PTestBase):
         if failed_tests:
             self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
 
+
+    @skipIfNotFeature('ptest', 'Test requires ptest to be in DISTRO_FEATURES')
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(['ptest-runner'])
+    def test_ptestrunner_check(self):
+        status, output = self.target.run('which ptest-runner')
+        msg = 'ptest-runner not installed .  %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ptest.PtestRunnerTest.test_ptestrunner_check'])
+    def test_ptests_installed(self):
+        status, output = self.target.run('ptest-runner -l')
+        msg = 'No ptests found.  %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+        # built ptest list
+        for ptest in output.split("\n"):
+            if ptest.startswith("Available"):
+                continue
+            self.ptests.append(ptest.split()[0])
+
+    @OETestDepends(['ptest.PtestRunnerTest.test_ptests_installed'])
+    @unittest.expectedFailure
+    def test_ptestrunner(self):
+        for ptest in self.ptests:
+            self.run_ptest(ptest)
-- 
2.17.1


