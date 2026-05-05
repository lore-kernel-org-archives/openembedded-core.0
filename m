Return-Path: <sam.john.kent@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A43DACD3439
	for <webhook@archiver.kernel.org>; Tue,  5 May 2026 17:05:44 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1317.1778000738909911154
 for <openembedded-core@lists.openembedded.org>;
 Tue, 05 May 2026 10:05:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=P81foX9X;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: sam.john.kent@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d73352cf2so5026678f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 10:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778000737; x=1778605537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QWyhzVHkxYx4vi7DJmjCoDTQIufTHceXy+tKkIjZxeg=;
        b=P81foX9XOrVWsaqAhlj0nHIDCGm0Nr41R2og4LjxkBqCywmpC8XYnx/1inWQZV4aY0
         aFg68JRvQLWgZ4j2ymKBo+MT0psstDk2h4rtNbHgTDZMY906srZKPCrHUW2KpqqTajms
         kWTvcG5GfjfkPba4R1bxQdOsEwPKdOZMkeq7ATma55sRxaDW0p51BXMCi9MGCmspqONh
         5xcXNvqFLKVw+xUp447J1tiEGGVjFBgvahvBej1vH/iDdgfuUPbknqadOpcMNzKeDcU1
         ERVJHTbcKnU7q0HNAF8z4BPkOnJubYNEMJm5Ha0WWGh8r3QXQbzQSCiXKoGUbQdj8t/f
         5RDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778000737; x=1778605537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QWyhzVHkxYx4vi7DJmjCoDTQIufTHceXy+tKkIjZxeg=;
        b=jzl3euHTtmuU+wozhLaM++EcjmwDdLR8Ox/tzXnct+V8r8wz11AZzIXwvNe2s98xJp
         OYWDd0/a8+pVsLrXrHP0WpRY03I+mVb1fWDfJhgajxnCdPBLdOFGEfHgTQzodhnPFPei
         VhqUTzykuIG8iilOlxcV4wl7be4hacjJG6hp5HoIMeeIR+nd3BENCMJrYQNrSjYY3O27
         l1IUDomY0o6a5nePI9ST7qvQoH4vz5+lBUifp/wMdDJ4YYy0VP2JWDIJAkT7H0Ek9Cqp
         lXoa7SheNV1WsVJ4AQBlq855xCOx6YTs/FZ43++Wa39AG36Og86KJbUMmlQu4OJAKd9W
         PMCw==
X-Gm-Message-State: AOJu0YxA00YH+WnX6KonrztCPhZ+r10OVifOJQnc3Bt8RCU17A2pSfRK
	KwuetT8B53ae2xqJdU5OqQf68twPl5g0Sjf3v9+hc7dOmwNR5xk8w4aB95HOFcn0VZ+25g==
X-Gm-Gg: AeBDieuVe2NMRpsxV92p41e7pBXXah6QhYq9xepjrgtcgh5F2/H05OfqSmedW5UePkZ
	KziWjVi/7KtbOr8KtHxlAqtTA+jNs291AUYuwX1HxdgK67FCt8DeScKiO+7CKvKe6vuD5gitxXc
	zZmAZq+oQpFN/sYqd4qXps0Zzu/WX/KhZoVm/XrTOcabLXk9u0FtKt/siOg4F33FLiiK0ul1jAe
	S6H09DZeQLimOqZ7SnEVMa3a9PG2jgjIjuwCyfHHpCYe9Hz7aRfYLcJSHzUaOkwMONkaSksdRUF
	QGhiD73xFYol9wGof7Bb2E+0EbfWjwkBOa+Wtsvn2KenwpbswZD+uuUvQXsC3Ht5SLZrd2//Fg8
	tIo63RedrEAg7hZh8SPKuscb69f11pEW8j7Oc7h9TWFgH2vOtuaeGD7I2k4JOTQetlGpZ3xAnLh
	sfP/C9Gjizf2uRJMB+MfSgzOGbrNxvokb8BKx2EV/+3/ZPEZFhEo30URcE7f9s4PGbBjCOqnl1N
	vrMtgs=
X-Received: by 2002:a05:6000:40dd:b0:43b:5b25:67f8 with SMTP id ffacd0b85a97d-44bb5f26525mr25899159f8f.20.1778000736636;
        Tue, 05 May 2026 10:05:36 -0700 (PDT)
Received: from sam-ThinkPad-X1-Carbon-Gen-11.netbird.cloud ([45.12.242.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45055960902sm6521172f8f.28.2026.05.05.10.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 10:05:36 -0700 (PDT)
From: Sam Kent <sam.john.kent@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: mathieu.dubois-briand@bootlin.com,
	richard.purdie@linuxfoundation.org,
	Sam Kent <sam.john.kent@gmail.com>
Subject: [PATCH v4 2/3] oelib: add unit tests for kernel module detection helpers
Date: Tue,  5 May 2026 18:05:20 +0100
Message-Id: <20260505170521.1129945-2-sam.john.kent@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260505170521.1129945-1-sam.john.kent@gmail.com>
References: <20260429124524.2890648-1-sam.john.kent@gmail.com>
 <20260505170521.1129945-1-sam.john.kent@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 05 May 2026 17:05:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/236516

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


