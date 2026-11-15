Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4332.1794732566160302263
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2026 00:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=N11kLkQv;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-490f38e9688so1608419f8f.0
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 00:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794732564; x=1795337364; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cBZfcS7+NArJMXMIy8g0RLfH9/yRbnVQNm+NJiDfKdY=;
        b=N11kLkQvxytPoUsPY5I/AOulkvslB6bWgck/8VMInsRsKVl73QTajH41QDcbQISXWQ
         bIrCsbKDfoLMArK+qmhcid2rcEwn94wnfqj2TXY5moqcvLnUi/l+iiZsOIZmiKb+zCrs
         ywDlQ18m24UKPVluut6ULU44X7cXrLi4ugPpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794732564; x=1795337364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=cBZfcS7+NArJMXMIy8g0RLfH9/yRbnVQNm+NJiDfKdY=;
        b=rlYbKZJ5skb/GKIZsvw1dtj37j7WyZVV0MRuFHJjRdIwrYr74Bx6tl7a2u6Fv6AUar
         8hh2eOK+IXRgwnBgCN46DKfCL14yiQGXLn65TeH/EGC3TjJ0EsZON+MUMqkO2AqgHfMt
         XH2/O28lkKf3JVWSkhsvXYDtcJ9Hk9pLIwcbXAW7hSzJMcfRhcsLEAI9p41weAJvtw9h
         xkn4O3RA+ZBBAVqB+5KWRjqNNfBzr3/p1grIHNMfqSHIShbj8gmJALQ3Ey9ph7WvGD5v
         /FodXlmD8MVjtygzDKJ3qHTY5bzdU/n7olBdKSPrVeqOl2Mst0yMAeaJbM0zorxn5ns7
         URGQ==
X-Gm-Message-State: APuU4Z/h8jsxwDANNIt/2D8HUvcTxWlps6Aeu/1OwX0r81FAGYDWLCol
	ergq/ptbnxekXwv+yJDBWbndKoJFB9R/E7GYfvs1UMfPjdaNDt3+RAKDJ8111Wz2DEakWMdc716
	Hbqm+uNY=
X-Gm-Gg: AYBFou2rqM9c9hxt3NO6vmZ0v91R5NGnuKI1pjalHIVKL85yQLFZaAL9e1CXBAuFipK
	hDQfFcTYKInyEGJ3qQ6JZIQ4hkBDxEKzhN+cHo3OkS5gDrYZt13R5OwBJWbXexn5BP6dk7ksOPH
	UHOXQt+LdVvLvylEC7gu/xAx/YN4Nl+SUY1yjP5xxehIJAVI1n4tmt9Io1r638awDK/afx32n/M
	t2q+GJBe3kKSxTzcWX1gfyTMFqU6T+3rrXLhZr7/bduU8+N4fDgek7+9MTUV2HkWaTpbia9Q5kM
	FKmGwrzQ+23ofPjnITbdGbyI+EX10tQegXbEwqGZ+vkeJsENiD3mVWZv69DK0mQR63VYNXC3IHk
	hJm/0IsBUL926ipAuGw8zC29LRWTnY2UVrB45Dvi2h5rgoSpdiARcav3SolxEfKWwPLfd3qve6b
	AOaT5E5jmhqHfJaJyeDhINtus98hLfjGU9h3whzFSJoKmrwXZroIn8ng4yNhkm8NLW2V0eO1Lft
	ef1SFQwTnHmdQariCdpgRVlHkMX2j4qm6qU8rK9o2cGCimrplrWytzo02fyDCsJPU5PRTN2t6+D
	k38MXzTwcBg1qog1XszU4g1Z/18+Z707Nn/jgSf3AkCc7SPlX0j3tMPaoQ==
X-Received: by 2002:a05:6000:383:b0:48e:d40:a87c with SMTP id ffacd0b85a97d-49b023a7e61mr24815184f8f.16.1794732564315;
        Sun, 15 Nov 2026 00:49:24 -0800 (PST)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4b65:588d:a4ce:ce3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60f8d66esm13804452f8f.57.2026.11.15.00.49.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 00:49:22 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 22/41] oeqa/runtime/ltp: Share a single base class and fix tearDownClass failures
Date: Sun, 15 Nov 2026 08:48:25 +0000
Message-ID: <20261115084845.701136-22-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
References: <20261115084845.701136-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2026 08:49:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250253
Content-Type: text/plain; charset="utf-8"

ltp.py, ltp_stress.py and ltp_compliance.py each carried a copy of the
same setup/teardown base class, differing only in the log directory and
result names. Move it to oeqa/runtime/utils/ltp.py and set the names as
class attributes.

The teardown called cls.fail() from a classmethod, which passes the
message as self and raises "AttributeError: 'str' object has no
attribute 'failureException'" instead of reporting the failed LTP
groups. Raise cls.failureException directly.

Also import os explicitly rather than relying on it being available as
a builtin.

AI-Generated: Uses Claude Opus 5.5
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/runtime/cases/ltp.py            | 47 ++-------------
 meta/lib/oeqa/runtime/cases/ltp_compliance.py | 49 ++-------------
 meta/lib/oeqa/runtime/cases/ltp_stress.py     | 50 ++--------------
 meta/lib/oeqa/runtime/utils/ltp.py            | 59 +++++++++++++++++++
 4 files changed, 73 insertions(+), 132 deletions(-)
 create mode 100644 meta/lib/oeqa/runtime/utils/ltp.py

diff --git a/meta/lib/oeqa/runtime/cases/ltp.py b/meta/lib/oeqa/runtime/cases/ltp.py
index b855e76907f..4a7400cbc15 100644
--- a/meta/lib/oeqa/runtime/cases/ltp.py
+++ b/meta/lib/oeqa/runtime/cases/ltp.py
@@ -5,57 +5,18 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
 import time
-import datetime
 import pprint
 
-from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.utils.ltp import LtpTestBase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import LtpParser
 
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
-
 class LtpTest(LtpTestBase):
+    ltp_log_name = 'ltp_log'
+    ltp_result_prefix = 'ltpresult'
 
     ltp_groups = ["math", "syscalls", "dio", "mm", "sched", "nptl", "containers", "controllers", "fcntl-locktests", "commands", "net.ipv6_lib", "input","fs_perms_simple", "cve", "crypto", "ima", "net.nfs", "net_stress.ipsec_icmp", "net.ipv6", "numa", "uevent", "ltp-aiodio.part1", "ltp-aiodio.part2", "ltp-aiodio.part3", "ltp-aiodio.part4"]
 
diff --git a/meta/lib/oeqa/runtime/cases/ltp_compliance.py b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
index ba47c78fd46..f16750a791c 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_compliance.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_compliance.py
@@ -5,58 +5,19 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+import os
 import time
-import datetime
 import pprint
 
-from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.utils.ltp import LtpTestBase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.utils.logparser import LtpComplianceParser
 
-class LtpPosixBase(OERuntimeTestCase):
+class LtpPosixTest(LtpTestBase):
+    ltp_log_name = 'ltpcomp_log'
+    ltp_result_prefix = 'ltpposixresult'
 
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
-
-class LtpPosixTest(LtpPosixBase):
     posix_groups = ["AIO", "MEM", "MSG", "SEM", "SIG",  "THR", "TMR", "TPS"]
 
     def runltp(self, posix_group):
diff --git a/meta/lib/oeqa/runtime/cases/ltp_stress.py b/meta/lib/oeqa/runtime/cases/ltp_stress.py
index c902486eabf..e52d64c662b 100644
--- a/meta/lib/oeqa/runtime/cases/ltp_stress.py
+++ b/meta/lib/oeqa/runtime/cases/ltp_stress.py
@@ -5,59 +5,19 @@
 # SPDX-License-Identifier: MIT
 #
 
+import os
 import time
-import datetime
 import pprint
 
-from oeqa.runtime.case import OERuntimeTestCase
+from oeqa.runtime.utils.ltp import LtpTestBase
 from oeqa.core.decorator.depends import OETestDepends
 from oeqa.runtime.decorator.package import OEHasPackage
 from oeqa.core.decorator.data import skipIfQemu
 from oeqa.utils.logparser import LtpParser
 
-class LtpStressBase(OERuntimeTestCase):
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
-        cls.ltptest_log_dir_link = os.path.join(test_log_dir, 'ltpstress_log')
-        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
-        os.makedirs(cls.ltptest_log_dir)
-
-        cls.tc.target.run("mkdir -p /opt/ltp/results")
-
-        if not hasattr(cls.tc, "extraresults"):
-            cls.tc.extraresults = {}
-        cls.extras = cls.tc.extraresults
-        cls.extras['ltpstressresult.rawlogs'] = {'log': ""}
-
- 
-    @classmethod
-    def ltp_finishup(cls):
-        cls.extras['ltpstressresult.sections'] =  cls.sections
-
-        # update symlink to ltp_log
-        if os.path.exists(cls.ltptest_log_dir_link):
-            os.remove(cls.ltptest_log_dir_link)
-
-        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
-
-        if cls.failmsg:
-            cls.fail(cls.failmsg)
-
-class LtpStressTest(LtpStressBase):
+class LtpStressTest(LtpTestBase):
+    ltp_log_name = 'ltpstress_log'
+    ltp_result_prefix = 'ltpstressresult'
 
     def runltp(self, stress_group):
             cmd = 'kirk --run-suite %s --json-report /opt/ltp/results/%s.json -n -d /opt/ltp' % (stress_group, stress_group)
diff --git a/meta/lib/oeqa/runtime/utils/ltp.py b/meta/lib/oeqa/runtime/utils/ltp.py
new file mode 100644
index 00000000000..e3aea4ead2f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/utils/ltp.py
@@ -0,0 +1,59 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import datetime
+import os
+
+from oeqa.runtime.case import OERuntimeTestCase
+
+class LtpTestBase(OERuntimeTestCase):
+    """
+    Common setup and teardown for the LTP based test cases. Subclasses set
+    ltp_log_name, the name of the log directory symlink in the test log
+    directory, and ltp_result_prefix, the prefix of their extra test result
+    entries.
+    """
+    ltp_log_name = None
+    ltp_result_prefix = None
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
+        cls.ltptest_log_dir_link = os.path.join(test_log_dir, cls.ltp_log_name)
+        cls.ltptest_log_dir = '%s.%s' % (cls.ltptest_log_dir_link, timestamp)
+        os.makedirs(cls.ltptest_log_dir)
+
+        cls.tc.target.run("mkdir -p /opt/ltp/results")
+
+        if not hasattr(cls.tc, "extraresults"):
+            cls.tc.extraresults = {}
+        cls.extras = cls.tc.extraresults
+        cls.extras['%s.rawlogs' % cls.ltp_result_prefix] = {'log': ""}
+
+    @classmethod
+    def ltp_finishup(cls):
+        cls.extras['%s.sections' % cls.ltp_result_prefix] = cls.sections
+
+        # update symlink to the log directory
+        if os.path.exists(cls.ltptest_log_dir_link):
+            os.remove(cls.ltptest_log_dir_link)
+        os.symlink(os.path.basename(cls.ltptest_log_dir), cls.ltptest_log_dir_link)
+
+        if cls.failmsg:
+            # fail() is an instance method so can't be used from a classmethod
+            raise cls.failureException(cls.failmsg)
