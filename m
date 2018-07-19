Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E121578AB2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 23:46:23 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id v25-v6so7783319wmc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 16:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=BgTrUv/joxymPCGTBwcGidaiMj6CUuzjQmVtx2Mgn2Y=;
	b=VYqyj7fh9UcVGknfcRz0ebagK0vTU4NM7hgcoSbIGtOr3ZYEGDeTIZrB1J6PvBxxZA
	My2Xz+zkztijS7nakm+Dmuiywe4eorVXgIN19E3+F1uC/ci5QUWvz00S0V+aFWgWi5D4
	9KvRpPwPZmrL+v6Rr5X4U/E/gltw5frsBR25GDPqzPqgcNsmH3TRdQotQ6MFBePc78uE
	cbOEfkVPjR6ulXTFKvepTyifkg2HPHHymSNwoQ5yu+mGU995wE4V6qIx09u7MDP//Idr
	KCXtvYwt8SAWUVMEAGxNC9MrajZiRCqNhhrbeG4VJ/GiBWPQXhAN/BpxEvo2a8eyE9nP
	eaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=BgTrUv/joxymPCGTBwcGidaiMj6CUuzjQmVtx2Mgn2Y=;
	b=GehRr8rt7B5dSGE9dc/ZDLX9FZdP3sS+spALXaYlGaWlDWkA8viWBo5oT/+xSlZYu2
	pxi7T/px6bK7lsVi/S00nH1jrm7X8rh9lwmtik0FO4ZxMrDogipEKW4VPykmwm02kkRl
	z7lVyMqPVOev9YQHQXQJGb3t3UBgvHQx+suWYTcUaDjYmVcXEK3m/k7QrJ5BgGGCW1OC
	6+dTP63tuxxTlyfT/zbqUb+0PoWYFV34RG93tLpRvIFbG3oMgf5g8iRYjMJcK33FZigu
	B375Oym0XblgoCLUtT2weD98pUIf+25TXQ1RCvD1VZGs7EZATVPqJkWvmgOYHL429Hky
	YbjQ==
X-Gm-Message-State: AOUpUlEWjPAwxzZ1LV2blUHpKjrZ5rzmDcSI7n6yDITTKW/QlOnJawc7
	yhJYK+6GwK/DzPVkumR4GCLqF6sOyyk=
X-Google-Smtp-Source: AAOMgpeyDdRVrSd5nkP3PRn/1pgGrilmjO5GGDU/96cUhyansPrn7rij/qksOvM8YikrYetCztrXHA==
X-Received: by 2002:a1c:57c1:: with SMTP id l184-v6mr77434wmb.16.1532043984277;
	Thu, 19 Jul 2018 16:46:24 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	64-v6sm384397wrj.50.2018.07.19.16.46.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 Jul 2018 16:46:23 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jul 2018 00:46:21 +0100
Message-Id: <20180719234621.26804-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa: rationalise Perl tests
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
X-List-Received-Date: Thu, 19 Jul 2018 23:46:24 -0000

As with the Python test, this can be both better and faster.  No need to copy a
file, just run a one-liner.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/files/test.pl         |  2 --
 meta/lib/oeqa/runtime/cases/perl.py | 32 ++++----------------------------
 meta/lib/oeqa/sdk/cases/perl.py     | 25 +++++++------------------
 3 files changed, 11 insertions(+), 48 deletions(-)
 delete mode 100644 meta/lib/oeqa/files/test.pl

diff --git a/meta/lib/oeqa/files/test.pl b/meta/lib/oeqa/files/test.pl
deleted file mode 100644
index 689c8f16355..00000000000
--- a/meta/lib/oeqa/files/test.pl
+++ /dev/null
@@ -1,2 +0,0 @@
-$a = 9.01e+21 - 9.01e+21 + 0.01;
-print ("the value of a is ", $a, "\n");
diff --git a/meta/lib/oeqa/runtime/cases/perl.py b/meta/lib/oeqa/runtime/cases/perl.py
index d0b7e8ed925..afeeb180e24 100644
--- a/meta/lib/oeqa/runtime/cases/perl.py
+++ b/meta/lib/oeqa/runtime/cases/perl.py
@@ -1,37 +1,13 @@
 import os
 
 from oeqa.runtime.case import OERuntimeTestCase
-from oeqa.core.decorator.depends import OETestDepends
 from oeqa.core.decorator.oeid import OETestID
 from oeqa.runtime.decorator.package import OEHasPackage
 
 class PerlTest(OERuntimeTestCase):
-
-    @classmethod
-    def setUpClass(cls):
-        src = os.path.join(cls.tc.files_dir, 'test.pl')
-        dst = '/tmp/test.pl'
-        cls.tc.target.copyTo(src, dst)
-
-    @classmethod
-    def tearDownClass(cls):
-        dst = '/tmp/test.pl'
-        cls.tc.target.run('rm %s' % dst)
-
-    @OETestID(1141)
-    @OETestDepends(['ssh.SSHTest.test_ssh'])
-    @OEHasPackage(['perl'])
-    def test_perl_exists(self):
-        status, output = self.target.run('which perl')
-        msg = 'Perl binary not in PATH or not on target.'
-        self.assertEqual(status, 0, msg=msg)
-
     @OETestID(208)
-    @OETestDepends(['perl.PerlTest.test_perl_exists'])
+    @OEHasPackage(['perl'])
     def test_perl_works(self):
-        status, output = self.target.run('perl /tmp/test.pl')
-        msg = 'Exit status was not 0. Output: %s' % output
-        self.assertEqual(status, 0, msg=msg)
-
-        msg = 'Incorrect output: %s' % output
-        self.assertEqual(output, "the value of a is 0.01", msg=msg)
+        status, output = self.target.run("perl -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'")
+        self.assertEqual(status, 0)
+        self.assertEqual(output, "Hello, world")
diff --git a/meta/lib/oeqa/sdk/cases/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
index 8085678116c..ff50b468006 100644
--- a/meta/lib/oeqa/sdk/cases/perl.py
+++ b/meta/lib/oeqa/sdk/cases/perl.py
@@ -1,8 +1,4 @@
-import os
-import shutil
 import unittest
-
-from oeqa.core.utils.path import remove_safe
 from oeqa.sdk.case import OESDKTestCase
 
 class PerlTest(OESDKTestCase):
@@ -12,17 +8,10 @@ class PerlTest(OESDKTestCase):
                 self.tc.hasHostPackage("perl-native")):
             raise unittest.SkipTest("No perl package in the SDK")
 
-        for f in ['test.pl']:
-            shutil.copyfile(os.path.join(self.tc.files_dir, f),
-                    os.path.join(self.tc.sdk_dir, f))
-        self.testfile = os.path.join(self.tc.sdk_dir, "test.pl")
-
-    def test_perl_exists(self):
-        self._run('which perl')
-
-    def test_perl_works(self):
-        self._run('perl %s' % self.testfile)
-
-    @classmethod
-    def tearDownClass(self):
-        remove_safe(self.testfile)
+    def test_perl(self):
+        try:
+            cmd = "perl -e '$_=\"Uryyb, jbeyq\"; tr/a-zA-Z/n-za-mN-ZA-M/;print'"
+            output = self._run(cmd)
+            self.assertEqual(output, "Hello, world")
+        except subprocess.CalledProcessError as e:
+            self.fail("Unexpected exit %d (output %s)" % (e.returncode, e.output))
-- 
2.11.0


