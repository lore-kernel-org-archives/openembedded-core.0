Return-Path: <ross.burton@intel.com>
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
	[209.85.128.44])
	by mail.openembedded.org (Postfix) with ESMTP id D4C537BF0E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jan 2019 16:38:38 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id f81so1533139wmd.4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Jan 2019 08:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=wCMkiKqT7kKw9qeoRZAFsGg7VPWuG6LCe7XUKZnIyqE=;
	b=NygoYRtbnoo/IIV57qLIH9Cgyc1Zvg/Fzm20ADaoU9KfslaDAGEAawfbhBilfOfVMr
	kTTGzWpMW11yQKwSTo9nKT8ClWK1GCRsfDH3Eslp+Qi28Q2/ixn6+xhDbcWFlq95LSm+
	QYX91sWseitQ8nnxqV1HjLzitgbmyt8C31GaaZ08VjeKdMxUGv1kX5qcr2yKx7dMT38/
	j26CbSS8QL+yolL7olBr390KD/h/1g0ipSTgVFKgvNvQTK0Yc/S8bTogPmVdr7XTtOhC
	w5E8DcZTDQXpkSkHfiR2kzEgvA/tot1j1keD9ORK0qME8bmFs0n74STMp13/Ix4uvkYp
	deow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=wCMkiKqT7kKw9qeoRZAFsGg7VPWuG6LCe7XUKZnIyqE=;
	b=pwGHS30T3AG6d4/qIs6wLA+XkVXr7h5Vj+zpu0gnzOlIwtf8l4Mys7yypSLvBHRBs/
	rXJRHhUcAWAi8ahvNBIFWVIaI8YR6ZzM1LfTz4PQezL5pQ7mBYzdgu1EGMdC+wGgJvE6
	mJ7TsOW+Z9bLEmM3sUx8FGn7C3Zf90RU4kXePUcZKoM7eKSdd2XMjFsGqbbn3O/UYxE+
	o9zYckM7JiMwjheN5H+tDoXs/5/4lNA/GkuJrNsm8GhbZP+eo1fICDxiPEQmuoQgOr8N
	iXo0OpEjtK9hjIJ55yS0aVC0VhI30uPRPC3GbhR0gsPG7rWqjWLT5YOg6AOJ+WNrvJRy
	K95g==
X-Gm-Message-State: AJcUukek3QqfkJMcFIE/RazI64f/ANcsErvhbo9SzI1TLyaW80D8qoDh
	rPuGhzGGHRsr0p95Mgt81NBpMDQG1gY=
X-Google-Smtp-Source: ALg8bN6aR35yybst+ksLZhtHZxiig8FPpc93JNHjrBFrwpVxYGTqA3O8skEhTkBDiwSodyJCLhqNDQ==
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr9868425wmg.53.1546879119355; 
	Mon, 07 Jan 2019 08:38:39 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	o5sm13918958wmg.25.2019.01.07.08.38.38
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 08:38:38 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Jan 2019 16:38:22 +0000
Message-Id: <20190107163823.31816-6-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190107163823.31816-1-ross.burton@intel.com>
References: <20190107163823.31816-1-ross.burton@intel.com>
Subject: [PATCH 6/7] oeqa/sdk/assimp: cleanup
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
X-List-Received-Date: Mon, 07 Jan 2019 16:38:39 -0000

Unify style with the other tests.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/lib/oeqa/sdk/cases/assimp.py | 30 ++++++++++++++++--------------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/meta/lib/oeqa/sdk/cases/assimp.py b/meta/lib/oeqa/sdk/cases/assimp.py
index 595f3834894..a6000103993 100644
--- a/meta/lib/oeqa/sdk/cases/assimp.py
+++ b/meta/lib/oeqa/sdk/cases/assimp.py
@@ -1,5 +1,7 @@
-import os, subprocess, unittest
-import bb
+import os
+import subprocess
+import tempfile
+import unittest
 from oeqa.sdk.case import OESDKTestCase
 
 from oeqa.utils.subprocesstweak import errors_have_output
@@ -10,25 +12,25 @@ class BuildAssimp(OESDKTestCase):
     Test case to build a project using cmake.
     """
 
-    td_vars = ['DATETIME', 'TARGET_OS', 'TARGET_ARCH']
-
     def setUp(self):
         if not (self.tc.hasHostPackage("nativesdk-cmake") or
                 self.tc.hasHostPackage("cmake-native")):
             raise unittest.SkipTest("Needs cmake")
 
     def test_assimp(self):
-        import tempfile
         with tempfile.TemporaryDirectory(prefix="assimp", dir=self.tc.sdk_dir) as testdir:
             tarball = self.fetch(testdir, self.td["DL_DIR"], "https://github.com/assimp/assimp/archive/v4.1.0.tar.gz")
-            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
 
-            sourcedir = os.path.join(testdir, "assimp-4.1.0") 
-            builddir = os.path.join(testdir, "build")
-            installdir = os.path.join(testdir, "install")
-            bb.utils.mkdirhier(builddir)
+            dirs = {}
+            dirs["source"] = os.path.join(testdir, "assimp-4.1.0")
+            dirs["build"] = os.path.join(testdir, "build")
+            dirs["install"] = os.path.join(testdir, "install")
+
+            subprocess.check_output(["tar", "xf", tarball, "-C", testdir])
+            self.assertTrue(os.path.isdir(dirs["source"]))
+            os.makedirs(dirs["build"])
 
-            self._run("cd %s && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON %s " % (builddir, sourcedir))
-            self._run("cmake --build %s -- -j" % builddir)
-            self._run("cmake --build %s --target install -- DESTDIR=%s" % (builddir, installdir))
-            self.check_elf(os.path.join(installdir, "usr", "local", "lib", "libassimp.so.4.1.0"))
+            self._run("cd {build} && cmake -DCMAKE_VERBOSE_MAKEFILE:BOOL=ON {source}".format(**dirs))
+            self._run("cmake --build {build} -- -j".format(**dirs))
+            self._run("cmake --build {build} --target install -- DESTDIR={install}".format(**dirs))
+            self.check_elf(os.path.join(dirs["install"], "usr", "local", "lib", "libassimp.so.4.1.0"))
-- 
2.11.0


