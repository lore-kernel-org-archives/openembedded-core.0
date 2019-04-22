Return-Path: <akuster808@gmail.com>
Received: from mail-it1-f175.google.com (mail-it1-f175.google.com
	[209.85.166.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6A307748D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 12:32:59 +0000 (UTC)
Received: by mail-it1-f175.google.com with SMTP id s3so17592558itk.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Apr 2019 05:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=PDotNg4EIf7hltG/+1mmcWN6LMvTRtsG/C3i/P6i3oc=;
	b=Ry9jJV0KY+8Yku1HjARFXvIO/t4mxIhAuGG+Vagk1x992+vTpWMOqgaLnxAqtA5src
	pNr6vpVZAWKP5u9n1bPgtTQRh/aBzdJRxcqjSfvmNE01uVLE2l8kbXG1zJF8j/kwdfnD
	0VQliJ8a46KYHzRXqnQyjyG0Y8/3rsCEUfnLN3sHE73pVArTrLeiA9K9frZsZA8nOcjC
	m0yobKUCkiQWxo2SsNLjBQmNlPtGJVsXZVdXU/nIBaE3JPbgYuv19u1lt5CQN5aLk4im
	0+0pv6/7vmHQr853tu613eWWL6eu2gLjgftbC0Kz8MJ6Xv4EHRAI8HhomjsVaDhTDoSm
	KMwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=PDotNg4EIf7hltG/+1mmcWN6LMvTRtsG/C3i/P6i3oc=;
	b=kbGcSRJFDkigoMZQ6YJdZdNYqAmcPB6v9UVZJ0dKeRigvQ91A+pHgAo9Fs+H62j4fd
	DxD6zPk7R1FuK+yZ2Z0uHlZzEN1mvqzSTR30sQjRwDYlbn2Aj6ZPgVIqMDS+SD7j7rM0
	CkVR/uoAp6YtyJ6cLaQzSMwINlm61Fb3OYq2KGOJWYOLG2bCcNltXPDjy6NB0Dk2cDVe
	C8poM8E/ZiTBl+f7mO9YzMOHX0fBz1C9v9qdt4FPxB/Lzr3OBxDpOP2R6EG/ogP+Pstr
	+Obs363xIm5HjkIDzM4kqeFYP6ri1aU6ERJdLrnn4YUSk7+cbr75S0jFPBrVFlwBswUG
	GSpw==
X-Gm-Message-State: APjAAAWYCdJzaS1FV2gkh6S/aDUyzBK+lMIMjNDXNL1u1ioLEATbQ+y6
	jO2gNgxEHQLtQ+ZocCy7Q1XVCkSg
X-Google-Smtp-Source: APXvYqzHRkTUvhrm+KCzYAYg93Up9OzC5yttuhtRVI7VJo6voR3PEaa1sxTNLUhXU6On63v52orMTQ==
X-Received: by 2002:a24:7a8b:: with SMTP id
	a133mr12834513itc.118.1555936380308; 
	Mon, 22 Apr 2019 05:33:00 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	(75-163-235-80.clsp.qwest.net. [75.163.235.80])
	by smtp.gmail.com with ESMTPSA id 19sm5889536itm.6.2019.04.22.05.32.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Apr 2019 05:32:59 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Apr 2019 06:32:43 -0600
Message-Id: <1555936363-18793-7-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
References: <1555936363-18793-1-git-send-email-akuster808@gmail.com>
Subject: [QA][PATCH 6/6] ltp_compliance: add new runtime
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
X-List-Received-Date: Mon, 22 Apr 2019 12:32:59 -0000

test runtimes in sec.
AIO: 14
MEM: 94
MSG: 89
SEM: 30
SIG: 194
THR: 399
TMR: 867
TPS: 23

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp_compliance.py | 104 ++++++++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_compliance.py

diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
new file mode 100644
index 0000000..be9a9a3
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -0,0 +1,104 @@
+# LTP compliance runtime
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
+
+import time
+import datetime
+import pprint
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.utils.logparser import LtpComplianceParser
+
+class LtpPosixBase(OERuntimeTestCase):
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
+        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltpcomp_log')
+        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
+        os.makedirs(cls.ltptest_log_dir)
+
+        cls.tc.target.run("mkdir -p /opt/ltp/results")
+
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+        cls.extras = cls.tc.extraresults
+        cls.extras['ltpposixresult.rawlogs'] = {'log': ""}
+
+ 
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['ltpposixresult.sections'] =  cls.sections
+
+        # update symlink to ltp_log
+        if os.path.exists(cls.ltptest_log_dir_link):
+            os.remove(cls.ltptest_log_dir_link)
+
+        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
+
+        if cls.failmsg:
+            cls.fail(cls.failmsg)
+
+class LtpPosixTest(LtpPosixBase):
+    posix_groups = ["AIO", "MEM", "MSG", "SEM", "SIG",  "THR", "TMR", "TPS"]
+
+    def runltp(self, posix_group):
+            cmd = "/opt/ltp/bin/run-posix-option-group-test.sh %s 2>@1 | tee /opt/ltp/results/%s" % (posix_group, posix_group)
+            starttime = time.time()
+            (status, output) = self.target.run(cmd)
+            endtime = time.time()
+
+            with open(os.path.join(self.ltptest_log_dir, "%s" % posix_group), 'w') as f:
+                f.write(output)
+
+            self.extras['ltpposixresult.rawlogs']['log'] = self.extras['ltpposixresult.rawlogs']['log'] + output
+
+            parser = LtpComplianceParser()
+            results, sections  = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % posix_group))
+
+            runtime = int(endtime-starttime)
+            sections['duration'] = runtime
+            self.sections[posix_group] =  sections
+ 
+            failed_tests = {}
+            for test in results:
+                result = results[test]
+                testname = ("ltpposixresult." + posix_group + "." + test)
+                self.extras[testname] = {'status': result}
+                if result == 'FAILED':
+                    failed_tests[posix_group] = test 
+
+            if failed_tests:
+                self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+
+    # LTP Posix compliance runtime tests
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["ltp"])
+    def test_posix_groups(self):
+        for posix_group in self.posix_groups: 
+            self.runltp(posix_group)
-- 
2.7.4


