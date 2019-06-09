Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by mail.openembedded.org (Postfix) with ESMTP id 1529B7E555
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:16 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id k187so3165641pga.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=RR1E4rqkJRm44DVwTYLTjPbWomK7Bu82EeVH9By61yM=;
	b=WdVM1ovHbmnkrEFomegPsw1URu6wK38swPJHQ8PGdkJ9ld4qqF1bK5vVCcCSrQgsn0
	YhrDvAVcVnxLO+FDTKvguCqZRKCoEaq8hBEk1MtRJpOqkzHbscV28/AaHmIxmyM5Qi7P
	S0jFMLzBrcOiQ873DYDSQjluNTHOMpC+sdOyU3k/YkaL8fUrXEianvYd9vT7AAoObCDZ
	5a7Q72jvnoXCNrvGvCwbniMJenCWx5xI2pg5jwatYoro5uSS5USjjplwzWvc8Pxqp1/e
	8DKOAqUUVHJ0ULIYZfYAaIImCxrap7JHArZoU2AqECNDqDXFQvm4SLHYpxD93e/cv3hZ
	9USA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=RR1E4rqkJRm44DVwTYLTjPbWomK7Bu82EeVH9By61yM=;
	b=a1VvB2HhD2syNxvJWgJahOkvdjnp6kwkMR0nbnT0/JLReCEbr18BjY9J9jl9Hw7qdD
	NBbNseQXAJv39qXalk7Re6XLhefAPjwCRjaPoxBMpJ5t/0lRaAfbJasup4Ij8zffjbeK
	0pQ3two4A/18RWlJv5ILvkzXHq6rwBmeB+jo7Irq7n2s9JkptBwsYTgoHVDKiUPfsj1c
	eEK/htPdG10AO2GoLSEPABkbN/hKgUODvKHoW6fvI/7vuAdh8yM62oDW1Xurv8cgA1Hy
	joNhrr1AghCFEpQ8+NrKoY+3LA59IgdX1LbVN1mne/E6EbW8MZMXpBlfoN4vnwQqA7n2
	RCrQ==
X-Gm-Message-State: APjAAAUS2Vi869yNhTkRJ0tVScFXc1EhTPbgCw60PuJ46P5/tXvbGO0r
	EkcOOrm9mJVJQ8hRFwQTJStLeGKz
X-Google-Smtp-Source: APXvYqwZQ3X5aALGMNkGKYOXB1GVZvlVyYyCf2A1FbwQdgVsalCpoSR8hVmDjuH5KoGbANUWyTM9DQ==
X-Received: by 2002:a17:90b:8d8:: with SMTP id
	ds24mr16380586pjb.135.1560092057951; 
	Sun, 09 Jun 2019 07:54:17 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:17 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:49 -0700
Message-Id: <51af1ac1a25a2541f823539028aedf79ac9cf833.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 14/27] ltp: add runtime test
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:17 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


