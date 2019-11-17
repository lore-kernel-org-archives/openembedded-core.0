Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id D9FA27F874
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Nov 2019 03:19:45 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id s8so530018pji.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 19:19:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=nD+iyFq/2KrI9ocG89Vwiu4UkASzruCFTiwgJ3FnUOY=;
	b=cbpr2+QNaoiX8eYojScOg8taHMQJ8KgY4fsMj8hcSxM0eIR0TxOPmr5BGvrjMqq1oU
	Flp4P4+2v4eN7Hs4G/kIZMGS1vrMTtNBq8KYCqf+hMkf/GmRaWKgFUjxifzGHcnghbTl
	8Tf3YIIDZ1YBgqXNRe7825QcNjCwg/fi0zgvxQEQvwDnU2XO1MVPrxe3B3hDrBWS0L6Z
	2dDsbcJdudkpUw+bfIRBkX8Yhg4BpIL+f7+wnRoBSx1yaIH8eHkFXb5LvLEfB+YNii/M
	HIuHJ5/sDpgb+1EfVbm71sA7h9btv3uSEwUvZn83O9HPMzuBVFczr3bQkQNpPJzrF+OH
	2rLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=nD+iyFq/2KrI9ocG89Vwiu4UkASzruCFTiwgJ3FnUOY=;
	b=KSq7X3xOHw+f54Z4FqL7FCLx43ZQWJ7wLAoSPq4ApnApVfXYefA60JCk3+EU/ZCLe8
	TE1VoyWwH679k0LXblsa04QAXeWd7VV9Fn3GN5+XJ8qFeVxva11s144cX7xdb9S8hlrP
	9Y8HdWt+lVwGCEk+zDcPwf+BPJaEHAmVhc3Jm2lfJ2O1dzZ7kgnk1l27y3rLuRJzbbJ/
	wRGl17mf2aKAcsyu61x9SaHUwE0evY3CoWLfzQE3WsEYYsopYl7QFH7GcP2GtzwY7seP
	V/6tBG/v4JzcBW8KC8NKsNkuIIg/7mNF32ScrYo/0FuwUpmTO6aC7yEAofwcqzo+NuaD
	Chdg==
X-Gm-Message-State: APjAAAU2K1WpsNHW1XfO+8JO/CIPxlGDvYRVwx+djVWF7k7ASNmFw+g9
	dRx51ZAmWLaFrvXSOpYfqBepp8gc
X-Google-Smtp-Source: APXvYqz3beOfMsNniKan64ufdv9jgsioqs8OzJ2z3IxrgFG0JrWrduY8k8mtsWkHeBEVacFr0pRKXQ==
X-Received: by 2002:a17:90a:b109:: with SMTP id
	z9mr29874545pjq.108.1573960786395; 
	Sat, 16 Nov 2019 19:19:46 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:a049:e40e:fb9e:4d3d])
	by smtp.gmail.com with ESMTPSA id h9sm15941108pjh.8.2019.11.16.19.19.44
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 19:19:45 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 19:19:43 -0800
Message-Id: <1573960783-3799-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [[v3][PATCH] oeqa/manual/compliance-test: move crashme to runtime
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
X-List-Received-Date: Sun, 17 Nov 2019 03:19:46 -0000

[v3]
remove fork12 from crashme. runs forever
missed in v2 resend

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp_stress.py | 98 +++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_stress.py

diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
new file mode 100644
index 0000000..2445ffb
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -0,0 +1,98 @@
+# LTP Stress runtime
+#
+# Copyright (c) 2019 MontaVista Software, LLC
+#
+# SPDX-License-Identifier: MIT
+#
+
+import time
+import datetime
+import pprint
+
+from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.core.decorator.depends import OETestDepends
+from oeqa.runtime.decorator.package import OEHasPackage
+from oeqa.core.decorator.data import skipIfQemu
+from oeqa.utils.logparser import LtpParser
+
+class LtpStressBase(OERuntimeTestCase):
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
+        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltpstress_log')
+        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
+        os.makedirs(cls.ltptest_log_dir)
+
+        cls.tc.target.run("mkdir -p /opt/ltp/results")
+
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+        cls.extras = cls.tc.extraresults
+        cls.extras['ltpstressresult.rawlogs'] = {'log': ""}
+
+ 
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['ltpstressresult.sections'] =  cls.sections
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
+class LtpStressTest(LtpStressBase):
+
+    def runltp(self, stress_group):
+            cmd = '/opt/ltp/runltp -f %s -p -q 2>@1 | tee /opt/ltp/results/%s' % (stress_group, stress_group)
+            starttime = time.time()
+            (status, output) = self.target.run(cmd)
+            endtime = time.time()
+            with open(os.path.join(self.ltptest_log_dir, "%s" % stress_group), 'w') as f:
+                f.write(output)
+
+            self.extras['ltpstressresult.rawlogs']['log'] = self.extras['ltpstressresult.rawlogs']['log'] + output
+
+            parser = LtpParser()
+            results, sections  = parser.parse(os.path.join(self.ltptest_log_dir, "%s" % stress_group))
+
+            runtime = int(endtime-starttime)
+            sections['duration'] = runtime
+            self.sections[stress_group] =  sections
+ 
+            failed_tests = {}
+            for test in results:
+                result = results[test]
+                testname = ("ltpstressresult." + stress_group + "." + test)
+                self.extras[testname] = {'status': result}
+                if result == 'FAILED':
+                    failed_tests[stress_group] = test 
+
+            if failed_tests:
+                self.failmsg = self.failmsg + "Failed ptests:\n%s" % pprint.pformat(failed_tests)
+
+    # LTP stress runtime tests
+    #
+    @skipIfQemu('qemuall', 'Test only runs on real hardware')
+
+    @OETestDepends(['ssh.SSHTest.test_ssh'])
+    @OEHasPackage(["ltp"])
+    def test_ltp_stress(self):
+        self.tc.target.run("sed -i -r 's/^fork12.*//' /opt/ltp/runtest/crashme")
+        self.runltp('crashme')
-- 
2.7.4


