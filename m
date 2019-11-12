Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id 51A8F7FBEF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2019 04:33:45 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id z4so12378622pfn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 20:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=YLugs5DumTtG8ajuhy/NPp8A7M5V8jpFXJff3qwFJQs=;
	b=NiEmGp271HvHnXqRg925j32cFUXpHvfOTmN3Q3eHxdRerkn7LoZ6tV4lh40igraXmN
	rrlna0n5tc2PncQ+kIROy5Vws7UyLvpoaHixKmm+9MskJeQfW6sCgAiHzHbuswTquEmA
	fkryp2g4iTPCnXAg8xYIqja4/TggbIe8+zW4e1xBLriRntlFj8GYCVZLJpLVhTaX7Zz6
	8JvSwtIhmW/BLbBiuT8XU0SPS/+FFk+qapQnrAjxRamBLeSasqxRja926sYxJC/lVHMC
	7ktKrB6Bp9QsGt+Ih1u1tvdb9LKn6YdP/vQf0yDIbVI3CcXBkw7BEfT43fW6MD1iBJw3
	lOOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=YLugs5DumTtG8ajuhy/NPp8A7M5V8jpFXJff3qwFJQs=;
	b=CNtHe7cit+n22SCeOdgGCFJ+6Ah6rK7gjEgMy19fVYk6omqQJ7TN+xFg0Ytq3zuPpD
	8Ooth568xBNpX/BPIVWJVqFSXpwD5lxuBUaGVzqTfU3Zq/FFmT+rsNJgOfXthp8wTdt+
	fy3wcyAiTIRt4F/gtKoeZqy12+I/Dg/PygOD4/BuS8noItQLPAxoZbwdo6O+ag4IfycE
	DSSOR8e5nyHK4/zza591vte5Xgw9cmdlJ9wsoKfVN9fFhR4r96aERGHct7qp5yuABif8
	PrIjtSPkUq6wpC29t+1o/HXET7DWf+dDaW9QMjtzrX10AvOVQIzcll1zfI4Xv78vnnRQ
	pRug==
X-Gm-Message-State: APjAAAWFVvxsVum/dHqHhRs59JO5n7Tcl97lh78mOFHgpKtVCYbu0jJq
	czXSpxY6ckFQErSeRXTrhmkWy46c
X-Google-Smtp-Source: APXvYqyxAGs1b/0qTycGm1uz9vw5Fql+P7WIzmRp8yVkZLfzTOoG1aQ2esV0ilusatPwIY0DmmZn/Q==
X-Received: by 2002:a63:1057:: with SMTP id 23mr2055926pgq.171.1573533226222; 
	Mon, 11 Nov 2019 20:33:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:2cf9:53ea:e6ab:d378])
	by smtp.gmail.com with ESMTPSA id
	q12sm5212109pgl.23.2019.11.11.20.33.45
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Nov 2019 20:33:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 20:33:23 -0800
Message-Id: <d7989c4c53d9d41354b45316063b44b0d3162f2c.1573532188.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1573532188.git.akuster808@gmail.com>
References: <cover.1573532188.git.akuster808@gmail.com>
Subject: [PATCH 04/20] OEQA: update ltp runtimes to use new structure
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
X-List-Received-Date: Tue, 12 Nov 2019 04:33:46 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py            | 85 ++-------------------------
 meta/lib/oeqa/runtime/cases/ltp_compliance.py | 73 +----------------------
 2 files changed, 7 insertions(+), 151 deletions(-)

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index 3054864..bc6df6b 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -9,51 +9,10 @@ import time
 import datetime
 import pprint
 
-from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import LtpParser
-
-class LtpTestBase(OERuntimeTestCase):
-
-    @classmethod
-    def setUpClass(cls):
-        cls.ltp_startup()
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.ltp_finishup()
-
-    @classmethod
-    def ltp_startup(cls):
-        cls.sections = {}
-        cls.failmsg = ""
-        test_log_dir = os.path.join(cls.td.get('WORKDIR', ''), 'testimage')
-        timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-
-        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltp_log')
-        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
-        os.makedirs(cls.ltptest_log_dir)
-
-        cls.tc.target.run("mkdir -p /opt/ltp/results")
-
-        if not hasattr(cls.tc, "extraresults"):
-            cls.tc.extraresults = {}
-        cls.extras = cls.tc.extraresults
-        cls.extras['ltpresult.rawlogs'] = {'log': ""}
-
- 
-    @classmethod
-    def ltp_finishup(cls):
-        cls.extras['ltpresult.sections'] =  cls.sections
-
-        # update symlink to ltp_log
-        if os.path.exists(cls.ltptest_log_dir_link):
-            os.remove(cls.ltptest_log_dir_link)
-        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
-
-        if cls.failmsg:
-            cls.fail(cls.failmsg)
+from oeqa.utils.ltp import LtpTestBase
 
 class LtpTest(LtpTestBase):
 
@@ -64,42 +23,6 @@ class LtpTest(LtpTestBase):
     ltp_kernel = ["power_management_tests", "hyperthreading ", "kernel_misc", "hugetlb"]
     ltp_groups += ltp_fs
 
-    def runltp(self, ltp_group):
-            cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
-            starttime = time.time()
-            (status, output) = self.target.run(cmd)
-            endtime = time.time()
-
-            with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
-                f.write(output)
-
-            self.extras['ltpresult.rawlogs']['log'] = self.extras['ltpresult.rawlogs']['log'] + output
-
-            # copy nice log from DUT
-            dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
-            remote_src = "/opt/ltp/results/%s" % ltp_group 
-            (status, output) = self.target.copyFrom(remote_src, dst)
-            msg = 'File could not be copied. Output: %s' % output
-            self.assertEqual(status, 0, msg=msg)
-
-            parser = LtpParser()
-            results, sections  = parser.parse(dst)
-
-            runtime = int(endtime-starttime)
-            sections['duration'] = runtime
-            self.sections[ltp_group] =  sections
-
-            failed_tests = {}
-            for test in results:
-                result = results[test]
-                testname = ("ltpresult." + ltp_group + "." + test)
-                self.extras[testname] = {'status': result}
-                if result == 'FAILED':
-                    failed_tests[ltp_group] = test 
-
-            if failed_tests:
-                self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
-
     # LTP runtime tests
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["ltp"])
@@ -111,8 +34,10 @@ class LtpTest(LtpTestBase):
     @OETestDepends(['ltp.LtpTest.test_ltp_help'])
     def test_ltp_groups(self):
         for ltp_group in self.ltp_groups: 
-            self.runltp(ltp_group)
+            self.cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
+            self.runltp(ltp_group, 'ltpresult')
 
     @OETestDepends(['ltp.LtpTest.test_ltp_groups'])
     def test_ltp_runltp_cve(self):
-        self.runltp("cve")
+        self.cmd = '/opt/ltp/runltp -f cve -p -q -r /opt/ltp -l /opt/ltp/results/cve -I 1 -d /opt/ltp'
+        self.runltp('cve')
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index ba47c78..8b09c0a 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -13,85 +13,16 @@ from oeqa.runtime.case import OERuntimeTestCase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import LtpComplianceParser
-
-class LtpPosixBase(OERuntimeTestCase):
-
-    @classmethod
-    def setUpClass(cls):
-        cls.ltp_startup()
-
-    @classmethod
-    def tearDownClass(cls):
-        cls.ltp_finishup()
-
-    @classmethod
-    def ltp_startup(cls):
-        cls.sections = {}
-        cls.failmsg = ""
-        test_log_dir = os.path.join(cls.td.get('WORKDIR', ''), 'testimage')
-        timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
-
-        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltpcomp_log')
-        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
-        os.makedirs(cls.ltptest_log_dir)
-
-        cls.tc.target.run("mkdir -p /opt/ltp/results")
-
-        if not hasattr(cls.tc, "extraresults"):
-            cls.tc.extraresults = {}
-        cls.extras = cls.tc.extraresults
-        cls.extras['ltpposixresult.rawlogs'] = {'log': ""}
-
- 
-    @classmethod
-    def ltp_finishup(cls):
-        cls.extras['ltpposixresult.sections'] =  cls.sections
-
-        # update symlink to ltp_log
-        if os.path.exists(cls.ltptest_log_dir_link):
-            os.remove(cls.ltptest_log_dir_link)
-
-        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
-
-        if cls.failmsg:
-            cls.fail(cls.failmsg)
+from oeqa.utils.ltp import LtpPosixBase
 
 class LtpPosixTest(LtpPosixBase):
     posix_groups = ["AIO", "MEM", "MSG", "SEM", "SIG",  "THR", "TMR", "TPS"]
 
-    def runltp(self, posix_group):
-            cmd = "/opt/ltp/bin/run-posix-option-group-test.sh %s 2>@1 | tee /opt/ltp/results/%s" % (posix_group, posix_group)
-            starttime = time.time()
-            (status, output) = self.target.run(cmd)
-            endtime = time.time()
-
-            with open(os.path.join(self.ltptest_log_dir, "%s" % posix_group), 'w') as f:
-                f.write(output)
-
-            self.extras['ltpposixresult.rawlogs']['log'] = self.extras['ltpposixresult.rawlogs']['log'] + output
-
-            parser = LtpComplianceParser()
-            results, sections  = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % posix_group))
-
-            runtime = int(endtime-starttime)
-            sections['duration'] = runtime
-            self.sections[posix_group] =  sections
- 
-            failed_tests = {}
-            for test in results:
-                result = results[test]
-                testname = ("ltpposixresult." + posix_group + "." + test)
-                self.extras[testname] = {'status': result}
-                if result == 'FAILED':
-                    failed_tests[posix_group] = test 
-
-            if failed_tests:
-                self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
-
     # LTP Posix compliance runtime tests
 
     @OETestDepends(['ssh.SSHTest.test_ssh'])
     @OEHasPackage(["ltp"])
     def test_posix_groups(self):
         for posix_group in self.posix_groups: 
+            self.cmd = "/opt/ltp/bin/run-posix-option-group-test.sh %s 2>@1 | tee /opt/ltp/results/%s" % (posix_group, posix_group)
             self.runltp(posix_group)
-- 
2.7.4


