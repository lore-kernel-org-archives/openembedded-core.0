Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
	[209.85.128.46])
	by mail.openembedded.org (Postfix) with ESMTP id C251A7D95E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:37 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id o25so2549497wmf.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=4au0VT+4MpE827bj5cYzxYLnGiGOKkwGVqGqMOyAe9w=;
	b=BZrRS8it8++00pxnwgTwWGW4BR08arBgR/w16JQZ3JoZpng9Cp9OksWORsntqMVU4V
	Lsi+SGUv9SOVplrJoY8CMwrBh3SodeboImKUCwcaA1Ci/CORceC8xqsJ11NiyCTK1yPp
	UzUMqKk8WjduGz2kG/8hHLblRqW/42+U189rGxkIFBH2Dd02EOD5NuPHhSAfKsMAozQj
	PfT79FoXlFnPnye9ltKwfhOBqZgvhnotGivSGavOX0fCZ94pBCi8NhxGkz7d0m14Z/N+
	1NXbEEkw8OZ0t9FmWhyfepm4z59eshsgpy4jc6txJdQX9Lfq1g7UpT4o3t1VUJt9SwuL
	oJ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=4au0VT+4MpE827bj5cYzxYLnGiGOKkwGVqGqMOyAe9w=;
	b=VynFtqJb6dcfG/MKdecgMH/kP2eQcaLETOTIdI6nd6Dnz/5iQ7xvymGAYhjWuY5Zho
	01wiliwEghII5wENZ+vryzNfkLLPXQjjEFIvnyzZMbtGf4VGxXGUQjwH31dyXNBMfCpP
	JVryxQ/lQTVijGA4de/met1BdGZl/DyIzpnFjWWH9hW9wdvR/7zwk56EApwKbqECT3pH
	5Xb9ZnIqfKDeM3bdQStFH2jx4FymU39G6NiD91CCQ1+mGBAJB+smMhn1u2tnqZXwblR3
	kpUoK1t6R0MHkv8bPz/qO02/VUkzWTEQ5UrpyEieRp3myl60UXlm/o+gTAdPOUevcRb8
	1LFg==
X-Gm-Message-State: APjAAAUxremV6JJ9a3nGrxwm0Z0NtJlS9N6dNz9ZxWtNvyc/vF2LA+ZN
	dZvxI16aBZH83eh5jBzF9IXgTjAwNyc=
X-Google-Smtp-Source: APXvYqyFKx+bE9BcqOpQHR+QmrlhyvE6fkbeeJEvv3j8eom1zB7mwDh2idwNw5m1nmlFn0x1QLXTbg==
X-Received: by 2002:a1c:4844:: with SMTP id v65mr2761146wma.139.1554901958312; 
	Wed, 10 Apr 2019 06:12:38 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.37
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:37 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:51 +0530
Message-Id: <85c1b6fb516aae58240330a0aca659bfafcd3883.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 32/33] oeqa: Default to buffer mode for tests
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:38 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Currently some tests run in buffer mode and some don't. Those that don't can
corrupt stdout/stderr. Switch to using buffer mode everywhere so we're consistent.

If there is useful output on stdout/stderr, it will be displayed if the test
fails.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/lib/oeqa/core/context.py                    | 2 +-
 meta/lib/oeqa/core/runner.py                     | 5 -----
 meta/lib/oeqa/selftest/cases/devtool.py          | 2 --
 meta/lib/oeqa/selftest/cases/efibootpartition.py | 1 -
 meta/lib/oeqa/selftest/cases/imagefeatures.py    | 2 --
 meta/lib/oeqa/selftest/cases/runqemu.py          | 2 --
 6 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index ef00845..cd6db23 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -58,7 +58,7 @@ class OETestContext(object):
         self.suites = self.loader.discover()
 
     def runTests(self, skips=[]):
-        self.runner = self.runnerClass(self, descriptions=False, verbosity=2)
+        self.runner = self.runnerClass(self, descriptions=False, verbosity=2, buffer=True)
 
         # Dinamically skip those tests specified though arguments
         self.skipTests(skips)
diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index f8bb23f..0e6d215 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -43,11 +43,6 @@ class OETestResult(_TestResult):
         self.tc = tc
 
     def startTest(self, test):
-        # Allow us to trigger the testcase buffer mode on a per test basis
-        # so stdout/stderr are only printed upon failure. Enables debugging
-        # but clean output
-        if hasattr(test, "buffer"):
-            self.buffer = test.buffer
         super(OETestResult, self).startTest(test)
 
     def logSummary(self, component, context_msg=''):
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 627bc65..99bfcd3 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -78,8 +78,6 @@ def tearDownModule():
 
 class DevtoolBase(OESelftestTestCase):
 
-    buffer = True
-
     def _test_recipe_contents(self, recipefile, checkvars, checkinherits):
         with open(recipefile, 'r') as f:
             invar = None
diff --git a/meta/lib/oeqa/selftest/cases/efibootpartition.py b/meta/lib/oeqa/selftest/cases/efibootpartition.py
index 0c83256..c6f39d5 100644
--- a/meta/lib/oeqa/selftest/cases/efibootpartition.py
+++ b/meta/lib/oeqa/selftest/cases/efibootpartition.py
@@ -11,7 +11,6 @@ from oeqa.utils.commands import bitbake, runqemu, get_bb_var
 class GenericEFITest(OESelftestTestCase):
     """EFI booting test class"""
 
-    buffer = True
     cmd_common = "runqemu nographic serial wic ovmf"
     efi_provider = "systemd-boot"
     image = "core-image-minimal"
diff --git a/meta/lib/oeqa/selftest/cases/imagefeatures.py b/meta/lib/oeqa/selftest/cases/imagefeatures.py
index 09e0b20..cdfd74b 100644
--- a/meta/lib/oeqa/selftest/cases/imagefeatures.py
+++ b/meta/lib/oeqa/selftest/cases/imagefeatures.py
@@ -10,8 +10,6 @@ class ImageFeatures(OESelftestTestCase):
     test_user = 'tester'
     root_user = 'root'
 
-    buffer = True
-
     @OETestID(1107)
     def test_non_root_user_can_connect_via_ssh_without_password(self):
         """
diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 8f4084d..a23a1d8 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -15,8 +15,6 @@ class RunqemuTests(OESelftestTestCase):
 
     image_is_ready = False
     deploy_dir_image = ''
-    # We only want to print runqemu stdout/stderr if there is a test case failure
-    buffer = True
 
     def setUpLocal(self):
         super(RunqemuTests, self).setUpLocal()
-- 
2.7.4


