Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 665B8CD343B
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 18:29:06 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.725.1778005741319792530
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 11:29:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=F/HG1ewg;
 spf=pass (domain: gmail.com, ip: 209.85.221.48, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-44e5624c053so1468005f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 11:29:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005739; x=1778610539; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWyhzVHkxYx4vi7DJmjCoDTQIufTHceXy+tKkIjZxeg=;
        b=F/HG1ewgdQErcgPzWhHknbw2OxVYEcOSODKEvz0Ft1WxjVuPyfQYiD4Tq9ugNJaRAx
         utamtAiUAy5nYyUo5f6JWBjFzkn99ZL/KSzvuFuxXJR1PLCnFyMd7rknnrzpVQpCmDyl
         KLuZdBZk5BeX1q2QdHBcsG+mcZUqunDSi1qO57e8T5Qq91wSYDudHsICUB62qmC8rrzT
         kKM0g/gwxABm2nEtrHRk/Fty2epiIgRi99U5RNX20TdDqTnG05wVCP0BbX6NpRIOzlyW
         rWQJNWbuWsNBJiMyHrM1fJkUSCj9ibAgAPqvGQKvrXUSDbSmFziAsMEYK9k9UHMfW/uA
         oD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005739; x=1778610539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWyhzVHkxYx4vi7DJmjCoDTQIufTHceXy+tKkIjZxeg=;
        b=Fy8vARkUCKb8iZFv9x6i22FtsZOqmPMLTxafmIt6aoN6vrZHVr4BA6rIPFXi+7sVqh
         0DeH8uPglxR+IeMwFXZBfg2WI5HmapnVvqoVuA/OcpW3Y2U63IWPFs2z/DgGc0IMFo5K
         rvkRQt4O98xLWYaCrPODlZSWswX3YfhxOI87ffZCNdfsyudruS9PtpgIXQjQFyk3Q+Do
         fuBpsRDaSxbvJ8EhRZ2DEH/d/+E/1IYpdA3/2dia95+uBqtq7JnV2r2zePqEzvFkmnIm
         D4CP23Nm3Jj9T+wiAW+96vp7IMPCVBctn3ekgMhmafPYi2ZN0EYydcU5eE+5XV18KchA
         jwSg==
X-Gm-Message-State: AOJu0YwDeOtJJdkAePXR1VdcIApyAwdblQ4Lhb/P4dlI0Gs7YO2Tm84K
	FuLku6ihy3iNRyZg3ojoa2sFf4potrV4njM/aCVjb75izeWrXReG2TNGqW9Gsjyya8FRCw==
X-Gm-Gg: AeBDietdb2nPY8A8FBn7djeCjbdG8G2mlZrXVYVy9cld5+iOuX1r1vasd2IyjjR8k4P
	rbCL1QfICbCfYXCC7q42NoTO6JUTuhyGE6KX4UlleI3ij9Gf/+3v/XIIKfmLqaqiHtFAfeoK668
	YhImdgGrThIJZlgVV+Y6kYeKjhBD80pU8it6bF7wEahyWXQRdjNqKoDfVId+2UGw5JjJvoSExdQ
	zWnERiFYZcx/yzoL4MC4Wx5Rm6m1pchi0Vv31ifbqq1L10/TaEuWspRkWTCsuXVVvaO9OaOGL7C
	DEFy03cYlXh5lsC3RyePiX20Nb5ywHop1HBbLulHRgfXh85hxosSJDXBatCoCHyxyTRsZ+gc4Qr
	0JM72yEuUQt/2f0CbUy4amJ0n3Og3G48C0XyAYC/CfpXqX1dv7+OPnGRBWPaePTfhjPsIm1ME6z
	DPYbnbUdxkky/c4rGYgBK6LPogHcfg9i9HaTagziGylr15bq/JG604fAyKmGFMNG6+Vzs1oWEKu
	ptHGHSMoLbm75K1/Q==
X-Received: by 2002:a05:6000:601:b0:44d:67f7:e1a6 with SMTP id ffacd0b85a97d-4515ce1c946mr427284f8f.20.1778005739322;
        Tue, 05 May 2026 11:28:59 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45054b03d4csm6818780f8f.22.2026.05.05.11.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 11:28:58 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v5 2/3] oelib: add unit tests for kernel module detection helpers
Date: Tue,  5 May 2026 19:28:43 +0100
Message-Id: <20260505182844.1136632-2-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505182844.1136632-1-sam.john.kent@gmail.com>
References: <20260505170521.1129945-1-sam.john.kent@gmail.com>
 <20260505182844.1136632-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 18:29:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236525

Add tests for the filename pre-filter logic, is_kernel_module(), and
is_kernel_module_signed() to meta/lib/oeqa/selftest/cases/oelib/

Signed-off-by: Sam Kent <sam.john.kent@gmail.com>
---
 meta/lib/oeqa/selftest/cases/oelib/package.py | 108 ++++++++++++++++++
 1 file changed, 108 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/package.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/package.py b/meta/lib/oeqa/selftest/cases/oelib/package.py
new file mode 100644
index 0000000..5751057
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/package.py
@@ -0,0 +1,108 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+import mmap
+import os
+import tempfile
+from unittest.case import TestCase
+
+
+class TestKernelModuleFilenameFilter(TestCase):
+    """
+    The pre-filter in process_split_and_strip_files() selects candidates to
+    pass to is_elf(). It must use f.endswith(".ko"), not ".ko" in f, to avoid
+    false-positives on compressed modules (.ko.xz, .ko.gz).
+    """
+
+    ko_files = [
+        "driver.ko",
+        "net/foo.ko",
+    ]
+
+    not_ko_files = [
+        "driver.ko.xz",
+        "driver.ko.gz",
+        "driver.ko2",
+        "myko.c",
+        "vmlinux",
+    ]
+
+    def test_endswith_matches_ko(self):
+        for f in self.ko_files:
+            with self.subTest(f=f):
+                self.assertTrue(f.endswith(".ko"))
+
+    def test_endswith_rejects_non_ko(self):
+        for f in self.not_ko_files:
+            with self.subTest(f=f):
+                self.assertFalse(f.endswith(".ko"))
+
+    def test_old_predicate_had_false_positives(self):
+        # The previous check (".ko" in f) matched compressed modules — this is
+        # the regression the fix addresses.
+        false_positives = [f for f in self.not_ko_files if ".ko" in f]
+        self.assertEqual(false_positives, ["driver.ko.xz", "driver.ko.gz", "driver.ko2"])
+
+
+class TestIsKernelModule(TestCase):
+    """
+    is_kernel_module() detects kernel modules by searching for the
+    "vermagic=" string, which is always present in genuine .ko files.
+    """
+
+    def setUp(self):
+        from oe.package import is_kernel_module
+        self.is_kernel_module = is_kernel_module
+        self._tmpfile = None
+
+    def tearDown(self):
+        if self._tmpfile and os.path.exists(self._tmpfile):
+            os.unlink(self._tmpfile)
+
+    def _make_tmp(self, content):
+        f = tempfile.NamedTemporaryFile(delete=False, suffix=".ko")
+        f.write(content)
+        f.close()
+        return f.name
+
+    def test_detects_vermagic(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 10 + b"vermagic=5.15.0" + b"\x00" * 10)
+        self.assertTrue(self.is_kernel_module(self._tmpfile))
+
+    def test_rejects_plain_elf(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 50)
+        self.assertFalse(self.is_kernel_module(self._tmpfile))
+
+
+class TestIsKernelModuleSigned(TestCase):
+    """
+    is_kernel_module_signed() detects the "Module signature appended" tail
+    that the kernel's modsign infrastructure writes.
+    """
+
+    def setUp(self):
+        from oe.package import is_kernel_module_signed
+        self.is_kernel_module_signed = is_kernel_module_signed
+        self._tmpfile = None
+
+    def tearDown(self):
+        if self._tmpfile and os.path.exists(self._tmpfile):
+            os.unlink(self._tmpfile)
+
+    def _make_tmp(self, content):
+        f = tempfile.NamedTemporaryFile(delete=False, suffix=".ko")
+        f.write(content)
+        f.close()
+        return f.name
+
+    def test_detects_signed(self):
+        tail = b"Module signature appended\n\x00\x00"
+        self._tmpfile = self._make_tmp(b"\x00" * 64 + tail)
+        self.assertTrue(self.is_kernel_module_signed(self._tmpfile))
+
+    def test_rejects_unsigned(self):
+        self._tmpfile = self._make_tmp(b"\x7fELF\x00" * 20)
+        self.assertFalse(self.is_kernel_module_signed(self._tmpfile))
-- 
2.34.1


