Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.26482.1795547434458102912
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 11:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=oEk5RKKg;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cdac6d19ddaso1885529a12.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 11:10:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795547434; x=1796152234; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=89TS6ayp3/hAsVwmGplolQ+a/dBUhMXBbpFvX9Ijj5U=;
        b=oEk5RKKghHtpLqALJJKDD7iJay7UGgHqyeyVp7eJQ+zFRbqPHivN1Pf+IN1bS4h9wE
         b8Xa2CbTKF7YhtOY8LbtP9um2iSqT+0zKJH8qGv1kLLgrLa4iZn1nhcWApO5tgmRPwRc
         JtcI7Je5fUJc1l+2orexCYjo/T5CbzglthI7f3xY2fnXNMCB2ZsxkbmjWwvr8HShGoOL
         uW/43CX3DpiScosKU4zmLcjXuw0e0zxmslqnVGY7bcH0VI8Flg2j2M6F6BAa2Hj984dv
         tgDQBeFOt5adKXj2j25loJ/rNBj+dec4pFpD9R7uog5atpGnS0u5dtHr9DPatpKJpCt2
         zD4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795547434; x=1796152234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=89TS6ayp3/hAsVwmGplolQ+a/dBUhMXBbpFvX9Ijj5U=;
        b=1ZCriw5Zgwt5IWCOu2fcABhldz1ia0ovMtzWVMW7qHZuz2zxl0LQl9LXD6/GXQjgtt
         U6SdDPmsR6KGd7MaPTrcFZpG5LTJ3hxIO7vij8sgPeQSNQTi+60+QohLk+8BPOHcIDzi
         98D5mlSDPXyVKXXl/Vx+y6AO+Su5FpFOtDJ7fCphC3dw8fTaP4TGf3BPlSAZ8p1S+KrI
         J6eLMfyP/jgC0oalp9z2mp8m99WOaxnMXw6PBsoAhqFZdLj9A1uzMKQw0co73ED3aM/4
         Oy/w8j4YxRn7/b/3XXX6PgweoQ8/LJAlb4xbaDlkBCnqGSI+69Zw7eP7H5Up5DXYBUyr
         cjfg==
X-Gm-Message-State: APuU4Z/L6gdlyGymL76949Zl8NRmlAOy3XEOpS9scxCQNsZc9DyS5kw7
	Ozk9kj6Q6mVQ0Ua20ojrxPJceZgCk6jJjWygR7CUy+ltLK7vmVR0+K8pqXmareC3cKY=
X-Gm-Gg: AZFdTZfaRq7zszsDoXPSQmQRyJU6T2pV5s6RvyNK3SftK30t41AiDLnvrJzpDSyYtTX
	cJkqcSqbW3HCKZyuz/+oICIILw+DnFZd2JzSy1L0nBsaFeWAC7RjBYFIh5YghVeQQbcd0z4R4gv
	AvkWTBOIllgNdecF/3epplRvyp2naa3wEQAgR2CDE4p1rYQ6VkDMlPpHQkTwzLdwdQ7iZMOsDk3
	xjgOYtPiLAEtXWfHjltJpuvRndKQao6YEMx9D6fnnGjvipxx5+PBvpTkOhIUJIdLHH1IaadYBzd
	eC/EwOhP0Y5g9E+R1uIl3St6l+++MT1i1FhOMhXDqXPyZEKisDpDwJo3wV3mRTX9mKNsYZkLltK
	XilBfcFT05YMQpHiJJFMpf/+1kJYqpa9fadiCStRLO1ZQSKSE3lKGwjPRYCmFdXZ/NBdvhCDCUq
	v5+rvqCM0SwKO/kyrglGRK5I3cKad9m4Z9f2/uZ64O/KsLC8YRMyccQWTz282DUaWpvpuXQCT1k
	+XtW7skYt4MnQTAllN6fBRpDo+tAYeZlVMX5DrR9UGyfnaznj3fqkiZOFvIqVIqF9NUe6+m+5Dj
	oqAYbdiKelYULsBEfx/GA9yDoqnhen60SL8bnHxypaCGcqX9yqm2KeXyYA==
X-Received: by 2002:a17:90b:2f8c:b0:3ab:3437:554f with SMTP id 98e67ed59e1d1-3b41c92a519mr14007935a91.29.1795547433693;
        Tue, 24 Nov 2026 11:10:33 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([65.7.19.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b48b41928esm13564044a91.9.2026.11.24.11.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 11:10:33 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <paul@pbarker.dev>,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: [PATCH] oeqa/selftest/oescripts: add a test for oe-init-build-env under set -u
Date: Tue, 24 Nov 2026 19:10:32 +0000
Message-ID: <20261124191032.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DN2HD431V6TX.3GQ0CXC17IQLQ@pbarker.dev>
References: <DN2HD431V6TX.3GQ0CXC17IQLQ@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 19:10:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251075
Content-Type: text/plain; charset="utf-8"

Add a test that sources oe-init-build-env from bash and dash with
'set -u', to catch a regression of 81df4c8650 ("oe-init-build-env: fix
unbound variable errors under 'set -u'"). Both fail with that commit
reverted.

[YOCTO #15469]

Suggested-by: Paul Barker <paul@pbarker.dev>
AI-Generated: Uses Claude (claude-opus-5-5)
Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 26 +++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 3e0bd6f4ec..342e6531df 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -7,6 +7,7 @@
 import os
 import shutil
 import importlib
+import tempfile
 import unittest
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var
@@ -103,6 +104,31 @@ class OEGitproxyTests(OESelftestTestCase):
             self.skipTest("No \"dash\" found on test system.")
         self.run_oegitproxy(custom_shell=dash)
 
+class OEInitBuildEnvTests(OESelftestTestCase):
+
+    @classmethod
+    def setUpClass(cls):
+        super().setUpClass()
+        cls.corebase = get_bb_var('COREBASE')
+
+    def run_oe_init_build_env(self, shell):
+        # The environment oe-selftest runs in already sets some of the
+        # variables the script reads, so start from an empty one
+        with tempfile.TemporaryDirectory(prefix="oe-init-build-env-") as builddir:
+            script = 'set -u; . ./oe-init-build-env && echo "BUILDDIR=$BUILDDIR"'
+            result = runCmd([shell, '-c', script, shell, builddir],
+                            cwd=self.corebase, env={'PATH': os.environ['PATH']})
+            self.assertIn('BUILDDIR=' + os.path.realpath(builddir), result.output)
+
+    def test_oe_init_build_env_nounset_bash(self):
+        self.run_oe_init_build_env('bash')
+
+    def test_oe_init_build_env_nounset_dash(self):
+        dash = shutil.which("dash")
+        if dash is None:
+            self.skipTest("No \"dash\" found on test system.")
+        self.run_oe_init_build_env(dash)
+
 class OeRunNativeTest(OESelftestTestCase):
     def test_oe_run_native(self):
         bitbake("qemu-helper-native -c addto_recipe_sysroot")
-- 
2.43.0

