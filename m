Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 9A4366D5B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:56 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id x132so17577567itf.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=Bdu0iAs9gfxJrBXRya/dJ2FbZhzp31PK5eOdumrIfaY=;
	b=NJkejOU0C46CS9nxsAcNHgCP0D1GFgODRMc5dPN8svCNG6SMepYQwDC9SHd71+KeTG
	qW4amI16lXnocHGPjYYBL5HlbbOWt40XurnMHYguNnKMni2QjaJVmV7wywJjS5fqtaxk
	y1AJ/jkGgh5/IvWgV+tx9Oj+ah90njU5QEQ8rnCawe65bIWFan+3qiiyM2xBgST0pqyS
	aXPXJT7pLcl1+lovzHx0DT5T8pVUjp/d1flyn7c/ygvCz0gYs23MQMhw5q8zXeIec4Ya
	3SEXXa7ALwc3B3hi/+phJS3bQesjBbdcqcg/0KVJc16NWOv62j1h7P0GabjQHmBNyRl5
	AScg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=Bdu0iAs9gfxJrBXRya/dJ2FbZhzp31PK5eOdumrIfaY=;
	b=XYhMkN+1YJw5lJ63uCM6F+27twB4uwBuyvN0H595PXBQw68D2aRAXHcanj/viubM1o
	w3gXEIiGvKmcpjIQRUaHqImNY+nBavGc0KCY3LTtrT4yAKta8bKThMnRx2Eps8jvltTS
	FSSKlYSRzq8IF6RBZOtKvFqKSnNevwtMTsTuXgAtjz3VgqCG8cNPvEIRCFHZXccE/Oam
	ImlmIoB010MlagWbHm1KyYhFlFrJiovGLZGU95O07MmO1LriK6dNI/2t+EQ7pTrdBZiO
	b4mEeXcl7qde35pNB2saUBdgOx6i5jBJxDy0JfqP5eU5C9dHkcWY3pVVtHPHARRS03wN
	tOVA==
X-Gm-Message-State: APjAAAWPTgosj81sQNk9Xzd8Uoyb30jIV+b6G740A67ygXqfHKyzFXOx
	JF4UKtvNTRu2rBluxj1iGctZsOUa
X-Google-Smtp-Source: APXvYqxpVw2b++ySlbduYqGneXr1kb7ZcmR4ceeNb91Mu8hlKzvMEct0aPjNwB5r2oDL+BFzUB8cvQ==
X-Received: by 2002:a24:43cf:: with SMTP id
	s198mr13116286itb.113.1555936377381; 
	Mon, 22 Apr 2019 05:32:57 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.56
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:56 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:40 -0600
Message-Id: <1555936363-18793-4-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
References: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 3/6] ltp: add runtime test
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:56 -0000

This adds the framework for running ltp tests.

Here are some times:
math: 61
syscalls: 3957
dio: 18472
io: 29
mm: 551
ipc: 48
sched: 165
nptl: 46
pty: 37
containers: 52
controllers: 9625
filecaps: 27
cap_bounds: 27
fcntl-locktests: 29
connectors: 27
timers: 37
commands: 165
net.ipv6_lib: 30
input: 29
fs_perms_simple: 31
fs: 3476
fsx: 30
fs_bind: 28
fs_ext4: 28
cve: 675

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp.py | 124 +++++++++++++++++++++++++++++++++++++
 1 file changed, 124 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp.py

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
new file mode 100644
index 0000000..628494e
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -0,0 +1,124 @@
+# LTP runtime
+#
+# Copyright (c) 2019 MontaVista Software, LLC
+#
+# This program is free software; you can redistribute it and/or modify it
+# under the terms and conditions of the GNU General Public License,
+# version 2, as published by the Free Software Foundation.
+#
+# This program is distributed in the hope it will be useful, but WITHOUT
+# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+# more details.
+#
+import time
+import datetime
+import pprint
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.utils.logparser import LtpParser
+
+class LtpTestBase(OERuntimeTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        cls.ltp_startup()
+
+    @classmethod
+    def tearDownClass(cls):
+        cls.ltp_finishup()
+
+    @classmethod
+    def ltp_startup(cls):
+        cls.sections = {}
+        cls.failmsg = ""
+        test_log_dir = os.path.join(cls.td.get('WORKDIR', ''), 'testimage')
+        timestamp = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
+
+        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltp_log')
+        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
+        os.makedirs(cls.ltptest_log_dir)
+
+        cls.tc.target.run("mkdir -p /opt/ltp/results")
+
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+        cls.extras = cls.tc.extraresults
+        cls.extras['ltpresult.rawlogs'] = {'log': ""}
+
+ 
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['ltpresult.sections'] =  cls.sections
+
+        # update symlink to ltp_log
+        if os.path.exists(cls.ltptest_log_dir_link):
+            os.remove(cls.ltptest_log_dir_link)
+        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
+
+        if cls.failmsg:
+            cls.fail(cls.failmsg)
+
+class LtpTest(LtpTestBase):
+
+    ltp_groups = ["math", "syscalls", "dio", "io", "mm", "ipc", "sched", "nptl", "pty", "containers", "controllers", "filecaps", "cap_bounds", "fcntl-locktests", "connectors","timers", "commands", "net.ipv6_lib", "input","fs_perms_simple"]
+
+    ltp_fs = ["fs", "fsx", "fs_bind", "fs_ext4"]
+    # skip kernel cpuhotplug
+    ltp_kernel = ["power_management_tests", "hyperthreading ", "kernel_misc", "hugetlb"]
+    ltp_groups += ltp_fs
+
+    def runltp(self, ltp_group):
+            cmd = '/opt/ltp/runltp -f %s -p -q -r /opt/ltp -l /opt/ltp/results/%s -I 1 -d /opt/ltp' % (ltp_group, ltp_group)
+            starttime = time.time()
+            (status, output) = self.target.run(cmd)
+            endtime = time.time()
+
+            with open(os.path.join(self.ltptest_log_dir, "%s-raw.log" % ltp_group), 'w') as f:
+                f.write(output)
+
+            self.extras['ltpresult.rawlogs']['log'] = self.extras['ltpresult.rawlogs']['log'] + output
+
+            # copy nice log from DUT
+            dst = os.path.join(self.ltptest_log_dir, "%s" %  ltp_group )
+            remote_src = "/opt/ltp/results/%s" % ltp_group 
+            (status, output) = self.target.copyFrom(remote_src, dst)
+            msg = 'File could not be copied. Output: %s' % output
+            self.assertEqual(status, 0, msg=msg)
+
+            parser = LtpParser()
+            results, sections  = parser.parse(dst)
+
+            runtime = int(endtime-starttime)
+            sections['duration'] = runtime
+            self.sections[ltp_group] =  sections
+
+            failed_tests = {}
+            for test in results:
+                result = results[test]
+                testname = ("ltpresult." + ltp_group + "." + test)
+                self.extras[testname] = {'status': result}
+                if result == 'FAILED':
+                    failed_tests[ltp_group] = test 
+
+            if failed_tests:
+                self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+
+    # LTP runtime tests
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["ltp"])
+    def test_ltp_help(self):
+        (status, output) = self.target.run('/opt/ltp/runltp --help')
+        msg = 'Failed to get ltp help. Output: %s' % output
+        self.assertEqual(status, 0, msg=msg)
+
+    @OETestDepends(['ltp.LtpTest.test_ltp_help'])
+    def test_ltp_groups(self):
+        for ltp_group in self.ltp_groups: 
+            self.runltp(ltp_group)
+
+    @OETestDepends(['ltp.LtpTest.test_ltp_groups'])
+    def test_ltp_runltp_cve(self):
+        self.runltp("cve")
-- 
2.7.4


