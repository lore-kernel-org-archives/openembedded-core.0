Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
	[209.85.214.171])
	by mail.openembedded.org (Postfix) with ESMTP id 375A97FCE6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 23:51:15 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id bb5so5607231plb.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 24 Nov 2019 15:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3wMagoqWbFx2DzvGcSBlx9MLibObTsq8ai8bDDw0nL4=;
	b=F32d5WsrULySBany9y5BQYY5zIc5BKRodknGDQYdOh33SWWtKykXIQm+WJRq3SjRKk
	iPcDBVPNAB2ufPEN11B2Awsi7leNEWpnSaY9mdVvONQNofDBVHMfxODe2rFP8uOMzv+K
	DAJtHsPy2GMjGCv0wznvLpXzlrmKDcme/majy0GkimLqbxcZjPTozRH7DFwnIVitjd4P
	vXkR2qoH9Cg+SXFmqjBiJvX+Mz+3I+J6T5Up/4dstHT1kuzC6NIS4C+6C9YYl6XDivDh
	9y2wDMBlfImdo7dWfI+xDeIKWFDuzwn8zIZquEL39bzVrJPt2CQcrfnchpqAvhY1QCL2
	X1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3wMagoqWbFx2DzvGcSBlx9MLibObTsq8ai8bDDw0nL4=;
	b=VL1MX5ldzAgjIY3QSIhk7Z1tNza8fCiZub51+HIjt6C0M3fyyLutyYhg7N79hykPow
	3iicU2O0ATo3RiEOK+R1+Xnv2yiOYI8bwAIRD9jpnQ5POvVZ0ALbwswUg5py0BhXshfx
	p9uMz9F4LTekDLUrjZ6PrFyW7cAdx3fiZFAXVc8ruhtXsbeNNeRbHqn/tNw0pCeeBoj8
	rgGURRuOaSGCiIHmMJDSKzxh6/tA9mP+BiVGsp75Dp3grx2GSMmIJsi8qUuLVL41ZtCO
	ehW7dq2d3GLC+MUIMY5IYzE3UjHmiuo4NnG40gnJjXZbo1o9EpMelfpa7/7r6uerh55f
	NWpg==
X-Gm-Message-State: APjAAAXGF7865s+bfMsyVjXDxvdCVVsZVkMNIM000eDxK2NP7DYg+Nk8
	fAvEdIPdLKwNdQMkO0IqOH5oBxJK
X-Google-Smtp-Source: APXvYqyCwaRhd6rUWPk4HxHDFkRAeK0iEbCG2vNIF2ap09cGB7oKkordmG9nDRjMmPTPyTjKF8708g==
X-Received: by 2002:a17:90a:bd0c:: with SMTP id
	y12mr35274891pjr.108.1574639476042; 
	Sun, 24 Nov 2019 15:51:16 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:69ac:e4d2:e89f:98da])
	by smtp.gmail.com with ESMTPSA id
	q200sm5619783pfq.87.2019.11.24.15.51.15
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 24 Nov 2019 15:51:15 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 24 Nov 2019 15:50:40 -0800
Message-Id: <b57ab03376fffd2546e55596ec03bc595e320fa1.1574639349.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1574639349.git.akuster808@gmail.com>
References: <cover.1574639349.git.akuster808@gmail.com>
Subject: [zeus 35/35] oeqa: reproducible: Add option to capture bad packages
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
X-List-Received-Date: Sun, 24 Nov 2019 23:51:15 -0000

From: Joshua Watt <JPEWhacker@gmail.com>

Adds an option that can be used to copy the offending packages to a temp
directory for later evaluation. This is useful on the Autobuilder to
investigate failures.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/selftest/cases/reproducible.py | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/reproducible.py b/meta/lib/oeqa/selftest/cases/reproducible.py
index c235c13..a911056 100644
--- a/meta/lib/oeqa/selftest/cases/reproducible.py
+++ b/meta/lib/oeqa/selftest/cases/reproducible.py
@@ -5,11 +5,16 @@
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_bb_vars
+import bb.utils
 import functools
 import multiprocessing
 import textwrap
 import json
 import unittest
+import tempfile
+import shutil
+import stat
+import os
 
 MISSING = 'MISSING'
 DIFFERENT = 'DIFFERENT'
@@ -74,6 +79,7 @@ def compare_file(reference, test, diffutils_sysroot):
 class ReproducibleTests(OESelftestTestCase):
     package_classes = ['deb', 'ipk']
     images = ['core-image-minimal']
+    save_results = False
 
     def setUpLocal(self):
         super().setUpLocal()
@@ -117,9 +123,18 @@ class ReproducibleTests(OESelftestTestCase):
         self.extrasresults['reproducible']['files'].setdefault(package_class, {})[name] = [
                 {'reference': p.reference, 'test': p.test} for p in packages]
 
+    def copy_file(self, source, dest):
+        bb.utils.mkdirhier(os.path.dirname(dest))
+        shutil.copyfile(source, dest)
+
     def test_reproducible_builds(self):
         capture_vars = ['DEPLOY_DIR_' + c.upper() for c in self.package_classes]
 
+        if self.save_results:
+            save_dir = tempfile.mkdtemp(prefix='oe-reproducible-')
+            os.chmod(save_dir, stat.S_IRWXU | stat.S_IRGRP | stat.S_IXGRP | stat.S_IROTH | stat.S_IXOTH)
+            self.logger.info('Non-reproducible packages will be copied to %s', save_dir)
+
         # Build native utilities
         self.write_config('')
         bitbake("diffutils-native -c addto_recipe_sysroot")
@@ -176,6 +191,11 @@ class ReproducibleTests(OESelftestTestCase):
                 self.write_package_list(package_class, 'different', result.different)
                 self.write_package_list(package_class, 'same', result.same)
 
+                if self.save_results:
+                    for d in result.different:
+                        self.copy_file(d.reference, '/'.join([save_dir, d.reference]))
+                        self.copy_file(d.test, '/'.join([save_dir, d.test]))
+
                 if result.missing or result.different:
                     self.fail("The following %s packages are missing or different: %s" %
                             (c, ' '.join(r.test for r in (result.missing + result.different))))
-- 
2.7.4


