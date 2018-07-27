Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 04A8171BE5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 15:32:51 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id t25-v6so5882369wmi.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2018 08:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QCp+kK700XxPsqj3HMNn+CuFjXAmcwtWSaYKjLYy4ys=;
	b=1ZNop917tEID5qjMNpxAaSzBVW5fxxaFieC7FU4b/Vnxbo87Lv8zFupJ9tOXlJSKLw
	qQK3JGg8Pwp7nkxStdk0BfP4/ay9HmLBaII4Azq1UFkFXXxCzRxehKz/MAuMZUQqHITf
	mlMBR+jxI56PpWbFtpxwMbcEnIeE1e6gynLh8dQoHpfRZ875ZfBlbArlFUJ+wiWeact1
	RG9tOlMuozX58BDVuVNg5Bw3Nj5WeKvn3Sfqi+K3CuN7w4Ptk0FVY5bB1x4RFE70PGGc
	UjHlh1rR6CyG2LKx+IcpVVdTfMTAJLSCDhWDT0SIzt115hyNiWjpKSZlid56X8X9eSDO
	lcpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QCp+kK700XxPsqj3HMNn+CuFjXAmcwtWSaYKjLYy4ys=;
	b=l3X6z1vf2T9MW/GqJn2ytX//USrzyOWj30XwD5+gJF7XaXy6fUNggrvsPedcWUJtl4
	D3SUWKL8D/LWfEfOf96c0/Fr2hpEAyyk3hyAB8J6AoSiGq8eeYw6sPqsNV8PbBHwWwrt
	DNERIfyVQ0Ip6PEqkby3KDe7VtVqx3pCxRzczoNAOc98X4N+RJ32+03+xLQyaLIZcnJI
	YOAiqeZMbNuqtH06S5sQqOUYVE3M5kMtHfIGXqK7PkxuKSO6ZdRjhVe8pG0pbdK94MZQ
	63/uB0FybV09PM3sy4uayM3HR9ahF951rQ7ZLl7Zoibi9D1QlS89gkgFzXIzXcVajitk
	U4dw==
X-Gm-Message-State: AOUpUlGOl740LojKH+uRhEdlFAdNj/ImJ/VTYqFjW8tnyH269XjwfpzV
	JhKEVex2PDRJBI6RYsnU4jWG6WCRoTc=
X-Google-Smtp-Source: AAOMgpecZ6oaWBLflahWeS/hxIwkvq8EANlyNK4qOKwDwmknczmXr305x+kWsKE3raElg7+RdneQTg==
X-Received: by 2002:a1c:7ed8:: with SMTP id
	z207-v6mr4689670wmc.139.1532705572246; 
	Fri, 27 Jul 2018 08:32:52 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	z62-v6sm3804916wmc.10.2018.07.27.08.32.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Jul 2018 08:32:51 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2018 16:32:33 +0100
Message-Id: <20180727153248.22838-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH 01/16] oeqa/sdk: add test that CMake works
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
X-List-Received-Date: Fri, 27 Jul 2018 15:32:52 -0000

Add a new SDK testcase that builds assimp, a project that uses cmake.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 65 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 meta/lib/oeqa/sdk/cases/assimp.py

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
new file mode 100644
index 00000000000..8f5b0eb63a2
--- /dev/null
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -0,0 +1,65 @@
+import os, subprocess, unittest
+import bb
+from oeqa.sdk.case import OESDKTestCase
+from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
+
+from oeqa.utils.subprocesstweak import errors_have_output
+errors_have_output()
+
+class BuildAssimp(OESDKTestCase):
+    """
+    Test case to build a project using cmake.
+    """
+
+    td_vars = ['DATETIME', 'TARGET_OS', 'TARGET_ARCH']
+
+    @classmethod
+    def setUpClass(self):
+        if not (self.tc.hasHostPackage("nativesdk-cmake") or
+                self.tc.hasHostPackage("cmake-native")):
+            raise unittest.SkipTest("Needs cmake")
+
+    def fetch(self, workdir, dl_dir, url, archive=None):
+        if not archive:
+            from urllib.parse import urlparse
+            archive = os.path.basename(urlparse(url).path)
+
+        if dl_dir:
+            tarball = os.path.join(dl_dir, archive)
+            if os.path.exists(tarball):
+                return tarball
+
+        tarball = os.path.join(workdir, archive)
+        subprocess.check_output(["wget", "-O", tarball, url])
+        return tarball
+
+    def test_assimp(self):
+        import tempfile
+        import oe.qa, oe.elf
+
+        with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
+            dl_dir = self.td.get('DL_DIR', None)
+            tarball = self.fetch(testdir, dl_dir, "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+
+            sourcedir = os.path.join(testdir, "assimp-4.1.0") 
+            builddir = os.path.join(testdir, "build")
+            installdir = os.path.join(testdir, "install")
+            bb.utils.mkdirhier(builddir)
+
+            self._run("cd %s && cmake %s " % (builddir, sourcedir))
+            self._run("cmake --build %s -- -j" % builddir)
+            self._run("cmake --build %s --target install -- DESTDIR=%s" % (builddir, installdir))
+
+            elf = oe.qa.ELFFile(os.path.join(installdir, "usr", "local", "lib", "libassimp.so.4.1.0"))
+            elf.open()
+
+            (machine, osabi, abiversion, littleendian, bits) = \
+                oe.elf.machine_dict(None)[self.td['TARGET_OS']][self.td['TARGET_ARCH']]
+            self.assertEqual(machine, elf.machine())
+            self.assertEqual(bits, elf.abiSize())
+            self.assertEqual(littleendian, elf.isLittleEndian())
+
+    @classmethod
+    def tearDownClass(self):
+        self.project.clean()
-- 
2.11.0


