Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 91A297600F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 18:33:16 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id h20-v6so16731803wmb.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 11:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=bDvTDeWBfEbRhvigVOZHVFyEytMGLbGNSnhw1h08v28=;
	b=Y60XKGkbIEwNKSP9nahWxsRPzJ3wQqO1KRhAR0USAntMsKxgIJQV6uZ5yOu8l9GIwq
	STzj7r+MFsugRG+LcAb/ECX0y73tXx17Dmdww8Sr6cP0EthHSyQ2UmZpS3imAb6/PEWF
	YKMOPoWpWvnpDbVfXjiUKpEeLdDqsnVipnF9IIkPuyeO+bKrXU7umn3lxForjGUG8Xv4
	VmePLPpVBtk6GBKAU206XlS+4E7bpfHJRI/hGwUwf4HrIgXLAel1gAhY9XFwE2dx6ry6
	FAy8JQU/cSDWJzl+7ahaaGII/3BH+/Ve7aeYBcaJZ3uZV/LBQ9fpWu+btJ7sKx6j8zjM
	cLTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bDvTDeWBfEbRhvigVOZHVFyEytMGLbGNSnhw1h08v28=;
	b=ICkIrlobI+h6fnYxD8xd4pjkvMhcuWgNixuJ8+OvMDFb9smRr9X4r58eckeLFkYB4S
	/2Ta45MxiPZG814COCwE7p0nu3NFZGr26OO9G+jV9LJ5g7D73FGVFzbGeKqmdxxVj9D1
	jZQI3pyLJRAUfMl3K19Z3wgQOD0QwaOKkYCyhbU37g2l//FySl+gF2Yw6OYC85H5KcZk
	f5d0ybPQtohJkE+TC+FfF6euS+nIXkQ+M9u0QsvlKddnqDGPuOXQZG2uwkmeJ846yr73
	LD9u6xFCPICvvuyaovafIFPVa6MoKXN774UY+WKkJ7WOtgAONGhpQ/mHAFQKU48Ey2at
	sBRA==
X-Gm-Message-State: AOUpUlEjENDjwP578S6m/xOT83xFZv3b5fAkukPee/x204m/nPa0gac2
	guCvUOHIgDkaGNHeGOUgCNk8yyZ7
X-Google-Smtp-Source: AAOMgpdBYnqedyuVu2I1+NNvl15uUYfkbjYaIW191hbWtjEy/GEpbrVp/mMPOp5Kqo94+qS/DrLV/Q==
X-Received: by 2002:a1c:9a15:: with SMTP id
	c21-v6mr170646wme.112.1531765996827; 
	Mon, 16 Jul 2018 11:33:16 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	c5-v6sm24538513wrh.36.2018.07.16.11.33.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 11:33:16 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Jul 2018 19:33:14 +0100
Message-Id: <20180716183314.30911-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] oeqa/sdk/python: clean up Python test
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
X-List-Received-Date: Mon, 16 Jul 2018 18:33:16 -0000

For the same reasons as the runtime Python test, clean up the SDK test.

Also port from Python 2 to Python 3, as that's what is supported now.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/files/test.py       |  6 ------
 meta/lib/oeqa/sdk/cases/python.py | 35 ++++++++++-------------------------
 2 files changed, 10 insertions(+), 31 deletions(-)
 delete mode 100644 meta/lib/oeqa/files/test.py

diff --git a/meta/lib/oeqa/files/test.py b/meta/lib/oeqa/files/test.py
deleted file mode 100644
index f389225d72d..00000000000
--- a/meta/lib/oeqa/files/test.py
+++ /dev/null
@@ -1,6 +0,0 @@
-import os
-
-os.system('touch /tmp/testfile.python')
-
-a = 9.01e+21 - 9.01e+21 + 0.01
-print("the value of a is %s" % a)
diff --git a/meta/lib/oeqa/sdk/cases/python.py b/meta/lib/oeqa/sdk/cases/python.py
index 72dfcc72bde..bd5f1f67be2 100644
--- a/meta/lib/oeqa/sdk/cases/python.py
+++ b/meta/lib/oeqa/sdk/cases/python.py
@@ -1,32 +1,17 @@
-import os
-import shutil
-import unittest
-
-from oeqa.core.utils.path import remove_safe
+import subprocess, unittest
 from oeqa.sdk.case import OESDKTestCase
 
 class PythonTest(OESDKTestCase):
     @classmethod
     def setUpClass(self):
-        if not (self.tc.hasHostPackage("nativesdk-python") or
-                self.tc.hasHostPackage("python-native")):
+        if not (self.tc.hasHostPackage("nativesdk-python3") or
+                self.tc.hasHostPackage("python3-native")):
             raise unittest.SkipTest("No python package in the SDK")
 
-        for f in ['test.py']:
-            shutil.copyfile(os.path.join(self.tc.files_dir, f),
-                   os.path.join(self.tc.sdk_dir, f))
-
-    def test_python_exists(self):
-        self._run('which python')
-
-    def test_python_stdout(self):
-        output = self._run('python %s/test.py' % self.tc.sdk_dir)
-        self.assertEqual(output.strip(), "the value of a is 0.01", msg="Incorrect output: %s" % output)
-
-    def test_python_testfile(self):
-        self._run('ls /tmp/testfile.python')
-
-    @classmethod
-    def tearDownClass(self):
-        remove_safe("%s/test.py" % self.tc.sdk_dir)
-        remove_safe("/tmp/testfile.python")
+    def test_python3(self):
+        try:
+            cmd = "python3 -c \"import codecs; print(codecs.encode('Uryyb, jbeyq', 'rot13'))\""
+            output = self._run(cmd)
+            self.assertEqual(output, "Hello, world\n")
+        except subprocess.CalledProcessError as e:
+            self.fail("Unexpected exit %d (output %s)" % (e.returncode, e.output))
-- 
2.11.0


