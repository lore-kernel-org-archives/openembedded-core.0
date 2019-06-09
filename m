Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 169757E517
	for <openembedded-core@lists.openembedded.org>;
	Sun,  9 Jun 2019 14:54:17 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id u22so3815714pfm.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2019 07:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=8paNzoIn7zavbNuK12+JDvDX2lax+TtBhbaC7iL9t90=;
	b=O9NEnpQc31wWCpPkvHPSsj8dadWJF3sPVpXComNUAg9CicsQbWi14kjPyjYdGWisvQ
	jWWZcsiFO7qlbS6Kyfs1ZompqWN9FZrsC7DYnqoUP6Fhg0aixlUksbPCFksAEs+t8/Wf
	FXRBnVPJjSDUTE4qLsPwOQUMOReHEYYtidNn01x7FPV6aY28KsUmpj4xH32qbEV/BGo1
	qCNqTd36XJA+yMsA+gAvztPeEqvF83uz5+PCKIKl4/vhMlb3LIJrHEeJnczYNw8bzUKx
	GMxeUqbvwmvBvnhwvHRxzpzxW6n6YqN75AZu0XB6HpRvde1bxAnv5rnI1awtRFGoDw2g
	qn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=8paNzoIn7zavbNuK12+JDvDX2lax+TtBhbaC7iL9t90=;
	b=OQOcLR0IBBuhBnwkSiMTJZvXDsf+yco7ymQ1fUT3GuMV/M4s7gXBnE/EgXNEN6f67K
	BtAZjTBZdvMqRld6NE5yvSgqZclvDSPiit76Q5qwqlq9xoDp0BLCh6OZoXYacY20gRpA
	Mu9xbdvFY6BX2zST+m45JkZSkzI9P/jZ8anzFePCkqqAURTidj1HkbZGIM5EvVABIgSO
	ZG5vomOMFvKUOmI+pZ88Jfvj7pE/g3v0W7076a6iM1bPxNkQzcA7Isz0B7bIzUn6fxXQ
	Ad2rrdW1f79QMM6U/G6ezXcLkRrDYzVOn8DP6L/EvjUCzWOgvRqDaDKOGJIJIOifPMlu
	RZtw==
X-Gm-Message-State: APjAAAVmRylg84eIql37NZY+598aV760KvGtjCK/rYExTNz2yrfDfq1S
	eRkOU2tyZJdL1NkfstaCa7k8055b
X-Google-Smtp-Source: APXvYqwEUpld8bCXQMa5+JbFL9/uvU6bvoY4rOrmFsXQb+ZSPlllWBGHP8hDvOUMKeYMykGDr4mefg==
X-Received: by 2002:a17:90a:23ce:: with SMTP id
	g72mr16583954pje.77.1560092058772; 
	Sun, 09 Jun 2019 07:54:18 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:50d3:300:d9ff:2f1d])
	by smtp.gmail.com with ESMTPSA id d6sm7072188pgv.4.2019.06.09.07.54.18
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 09 Jun 2019 07:54:18 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  9 Jun 2019 07:53:50 -0700
Message-Id: <de75d7928392d70895c7cc5461eb955284b43046.1560091882.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560091882.git.akuster808@gmail.com>
References: <cover.1560091882.git.akuster808@gmail.com>
Subject: [Warrior-next 15/27] ltp_compliance: add new runtime
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
X-List-Received-Date: Sun, 09 Jun 2019 14:54:18 -0000

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
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
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


