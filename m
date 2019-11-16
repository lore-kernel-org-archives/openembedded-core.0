Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
	[209.85.214.170])
	by mail.openembedded.org (Postfix) with ESMTP id 640496D728
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 23:38:03 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id s10so7319175plp.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Nov 2019 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=QUBCnmW9mkc7l6VhKia9LNY11g1XQGvIHi3QoTOoPd0=;
	b=iJf15HvJs43f7RcF5Q27YZkqKVm6yRbF+Et9tiB/YHk3bC+UYWraYgbGTTl22AQllA
	owmKOis042s0IgbHXJdJ1plz5gxLNIqCDPqQi1mJ4ytgfpV5+Cux8oYjN/Tfexa4xmit
	QF9PZVn21ko3DW7z9ydYTqMJEdwKjpGMqiOa8McfXz811ZQZTF8CoG7zi3x4jGwc+52Q
	W2UkDKuJYJkLksxjjsBMRmbRHFpxGlPbkk4RNQK0QP+JDdvPzn/40SYoLbcklNGshWQE
	DlbyvW7iacNTQG+xKLY+09x5M26DSPCjznIyfzQCxyXyv7sm89l9hhJ4pY79cmxlIJd/
	x66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=QUBCnmW9mkc7l6VhKia9LNY11g1XQGvIHi3QoTOoPd0=;
	b=aiRaz03/lqeNPD2XKKY3Y/ctuodsJ9B6G14t45/D62/CVM1R3KObnyTvxXrCwwYsSk
	ayvOWN5BpfsFohxM6eXvixHXzKYhxZeMtH/HfFBN9HlO9Yhwdd8wgAlUEci1vrrW9N99
	CGLQT9Y0LOhbcgrv/faVuhRs4whl0hyL8yNsEaAo2LR3Dqd+rzt9MU5lJd0TBQMLSfZY
	pTZPyCYG3KLficO6z0WZzT9vgezMcTPaUE940+Zc0PXRrhnNWA77YTmlPm8tBB3q+00H
	S6KfyPGU96SyNI+qhry/8f0Z9b7lNh+Q84dFpDy/c7nBbSc0jNoTCBrLpxpgQAokinGO
	MHjw==
X-Gm-Message-State: APjAAAUJW72XOGG+i2f0wbeSSBM4SbiRbj9p3yQ7kZrhSI+00qgAIn0C
	SFOYzYc/okvIWCC8fKd0xFoumiW6
X-Google-Smtp-Source: APXvYqwwtE9zJq2djINvLoJBAenXl4ZhCy2dq4Bbp0pYY1AA1vhg6y588L0Y1CQ0aDPjiuLu8P08ug==
X-Received: by 2002:a17:90a:2a41:: with SMTP id
	d1mr30353935pjg.87.1573947484190; 
	Sat, 16 Nov 2019 15:38:04 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:994f:cb85:728d:a91c])
	by smtp.gmail.com with ESMTPSA id
	j5sm15929538pfe.100.2019.11.16.15.38.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 16 Nov 2019 15:38:03 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 16 Nov 2019 15:37:59 -0800
Message-Id: <1573947480-31325-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573947480-31325-1-git-send-email-akuster808@gmail.com>
References: <1573947480-31325-1-git-send-email-akuster808@gmail.com>
Subject: [PATCH 1/2] oeqa/manual/compliance-test: move crashme to runtime
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
X-List-Received-Date: Sat, 16 Nov 2019 23:38:03 -0000

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/runtime/cases/ltp_stress.py | 97 +++++++++++++++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/cases/ltp_stress.py

diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
new file mode 100644
index 0000000..98d65a7
--- /dev/null
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -0,0 +1,97 @@
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
+        self.runltp('crashme')
-- 
2.7.4


