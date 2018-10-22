Return-Path: <anibal.limon@linaro.org>
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
	[209.85.210.178])
	by mail.openembedded.org (Postfix) with ESMTP id 161E4746AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 20:29:00 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id g21-v6so13473248pfi.7
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 13:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TDgX0MT/UfHkbNGjy05NHJytDijDRTxVLYVnoYyGEok=;
	b=jwhepvSoC+WzpLkDBF4Lpe5ceSHIJPNedKfCz2NcuaLlyjHWaH990FcO+u4Y3fhdSH
	PPMKi63F5GhCILVoiNsVIhXXJMYyC7QoIob0+CWwko3cmUpfRFZgBRSizxkrubtm4j4n
	AljtzD9SgV314nqx1yNOcp3KIu97czt6fiql0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=TDgX0MT/UfHkbNGjy05NHJytDijDRTxVLYVnoYyGEok=;
	b=D0cxe1+Lp8SGtYqsG+4gRLpUkWkbfK0nfAnGJybrSdzxf8mvJtd4Rr+UKq+D5igKss
	x+LZ8Kwgv2NNkTp8xikvN5fbHF09hDNcUBudxT66FNIxFFkmzkBvKd4qkM+god055dO4
	d/RbmG8gaeU7aibkytD2yZh5HqQJbclyMgTXPUi+Hp2VQj4ZN1+xlU6vxAdOBd9gR+rS
	rP6inf0nI4te7sSrz+QCLOntbR/R+epCtXRXfkiVB2I1X+JPsL87Z84Y/b6lXWzNQPbW
	WIJ4/kMeea6LFE53kuZ+h1TL6l5M8JhPDvQbxMAtOw5De5KVwiDDIAUbYaVcm/GQ005F
	1KLQ==
X-Gm-Message-State: ABuFfohWzBgM8WdbmdF+dW9J5HsFKBNgAFUVb9dNebEJZ+gbP3dlzrnP
	NWVvJ9LNxWuGwbbSglzPmGk6NtukjgU=
X-Google-Smtp-Source: ACcGV603LYRzGuNu7oKz2Vp2sS7ZcVY0RruXMaO0WJYoT+8Bz5s6ws87HgGMMT/dwfNWvQ5IsW2/+g==
X-Received: by 2002:a62:e414:: with SMTP id
	r20-v6mr47191322pfh.25.1540240141711; 
	Mon, 22 Oct 2018 13:29:01 -0700 (PDT)
Received: from blackbox.Home ([200.68.141.5]) by smtp.gmail.com with ESMTPSA id
	u62-v6sm41483539pfu.69.2018.10.22.13.28.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 Oct 2018 13:29:01 -0700 (PDT)
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linaro.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Oct 2018 15:28:53 -0500
Message-Id: <20181022202853.11552-1-anibal.limon@linaro.org>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Subject: [PATCHv2] meta/classes/testexport: Use manfiest filenames for package and testdata
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
X-List-Received-Date: Mon, 22 Oct 2018 20:29:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Is clear to know for what image and machine the testexport package
manifest and testdata was build. The oe-seltest case was update.

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
---
 meta/classes/testexport.bbclass              |  4 ++--
 meta/lib/oeqa/runtime/context.py             |  9 +++++++--
 meta/lib/oeqa/selftest/cases/runtime_test.py | 14 ++++++++++++--
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 59cbaefbf9..f38d093e81 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -128,8 +128,8 @@ def copy_needed_files(d, tc):
     tdname = "%s.testdata.json" % image_name
     test_data_path = os.path.join(export_path, 'data')
     bb.utils.mkdirhier(test_data_path)
-    shutil.copy2(image_manifest, os.path.join(test_data_path, 'manifest'))
-    shutil.copy2(tdname, os.path.join(test_data_path, 'testdata.json'))
+    shutil.copy2(image_manifest, os.path.join(test_data_path, os.path.basename(image_manifest)))
+    shutil.copy2(tdname, os.path.join(test_data_path, os.path.basename(tdname)))
 
     for subdir, dirs, files in os.walk(export_path):
         for dir in dirs:
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index a7f3823996..31dba75784 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -2,6 +2,7 @@
 # Released under the MIT license (see COPYING.MIT)
 
 import os
+import glob
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
@@ -42,11 +43,15 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_cases = os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases')
     default_data = None
-    default_test_data = 'data/testdata.json'
+    m = glob.glob('data/*.testdata.json')
+    if m:
+        default_test_data = m[0]
     default_tests = ''
 
     default_target_type = 'simpleremote'
-    default_manifest = 'data/manifest'
+    m = glob.glob('data/*.manifest')
+    if m:
+        default_manifest = m[0]
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
     default_host_dumper_dir = '/tmp/oe-saved-tests'
diff --git a/meta/lib/oeqa/selftest/cases/runtime_test.py b/meta/lib/oeqa/selftest/cases/runtime_test.py
index 906e460d4f..b57f9d91cd 100644
--- a/meta/lib/oeqa/selftest/cases/runtime_test.py
+++ b/meta/lib/oeqa/selftest/cases/runtime_test.py
@@ -6,6 +6,7 @@ import os
 import re
 import tempfile
 import shutil
+import glob
 
 class TestExport(OESelftestTestCase):
 
@@ -45,8 +46,17 @@ class TestExport(OESelftestTestCase):
         with runqemu('core-image-minimal') as qemu:
             # Attempt to run runexported.py to perform ping test
             test_path = os.path.join(testexport_dir, "oe-test")
-            data_file = os.path.join(testexport_dir, 'data', 'testdata.json')
-            manifest = os.path.join(testexport_dir, 'data', 'manifest')
+
+            data_file = ''
+            m = glob.glob("%s/*.testdata.json" % os.path.join(testexport_dir, 'data'))
+            if m:
+                data_file = m[0]
+
+            manifest = ''
+            m = glob.glob("%s/*.manifest" % os.path.join(testexport_dir, 'data'))
+            if m:
+                manifest = m[0]
+
             cmd = ("%s runtime --test-data-file %s --packages-manifest %s "
                    "--target-ip %s --server-ip %s --quiet"
                   % (test_path, data_file, manifest, qemu.ip, qemu.server_ip))
-- 
2.19.1


