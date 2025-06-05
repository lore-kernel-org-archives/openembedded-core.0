Return-Path: <dixitparmar19@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA31BC5AE59
	for <webhook@archiver.kernel.org>; Thu,  5 Jun 2025 12:54:59 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.6800.1749128095817506926
 for <openembedded-core@lists.openembedded.org>;
 Thu, 05 Jun 2025 05:54:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=isPXLtGg;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: dixitparmar19@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2353a2bc210so8525405ad.2
        for <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 05:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749128095; x=1749732895; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rLubIFnrub2K02dhKpUDLhhb56JDVv3b5T3BbZXALA8=;
        b=isPXLtGgrIAMhapSYabsMXUgMZS3cPM/KlziT/NqzK0H26OU/oPycFKkB4Xp1CaYtZ
         4La8hdv42R5vUkGcdRRgeB7YAm2CcveU1GlVfWmh+3PVds4dGboz1yMdvl7RyrwmsBGz
         WUzuZBGv7rVe0wmy4A50V8UYu8IbDXyqtrrzRewHDtgeqtztDVD9MilwbBezq+d2jvj6
         Ofi07VX9IuPwi2q5p2orRyJsJHhLchqUr7kGQ3Wsp3EaYtYZqNrCdtlgOsdNYNUNpoJ2
         bxFxLs/wyh4TI18I4+hztaOa0XgO7pHng4a6FQk6uFrdvyrT1Bk+1n37dkhhd3a3Yrke
         rEQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128095; x=1749732895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rLubIFnrub2K02dhKpUDLhhb56JDVv3b5T3BbZXALA8=;
        b=HfhvjUvHjyRaIn2cpiWCRTQ3NlQMws7R8IcjlRZQEEPj2TsBDmvWceSbpvzj4TTXKI
         IzqJ9pB4d5Jucu0tw4AzpZPcXQGd+2Uh7UO4WafooieN3WFhPi/Ew4YMEPFgU3cw82Jr
         xfmplzWhNXMPDvqBJ+9R9eMeL4EWiwmtgbs/Po2TwfB+e6n+LmqhWEwasy0Di8QOOZWg
         ARCPeADEEeOLDupogjonJlNtM92M9sDVQhTi9Pmtm64IxEaUirREePfhnxvzUPznTVCv
         T2ClZZk7V1HIpLpolxYDBQ4Ho/BY9lDksj5uJavBSttHu30ofRZXRLrXIGqxgcCvADJF
         IA2Q==
X-Gm-Message-State: AOJu0YwWdGXl8tym1BLcSRt55DPDYQ1bmreNi+K2UhkrtH6O5L58yTMx
	7DkjKD3u8kTtzI5U+2VYutpgv+bgopfHIAbY8kA9iRoEzVtmWMnDHIHRs8KX2A==
X-Gm-Gg: ASbGnctUMRarljW5e7SXoCfJoyKaGbdhoCB6obhDm/p+54PFSg202LN1YFvzNl+8cs4
	WiLV1B8mWrdyacZPcB4wW5Q+76xs3046TcyHzjmqOt69AwLLjUloOeVgcv3itrCfCeCZftspEmg
	ft+1dhArvxmu0UYGJFUHZ4x7Fu7rxSr8Jifjvi2w5PHI/l/jrwN/Fcg+jQmgRUc5lVdX1hTEAYc
	mdeDM5UOE9se9XOGBqUbyUUVZjsVfbDstnKDjedQR9HTBAZRorczMMrfoGboTb1cY3Acegoa//z
	9xDo+ncNif9HhldcyRexCM6GPheWd9m+EOgB2Pq0b/p1v7sU6hks9tk=
X-Google-Smtp-Source: AGHT+IF3e5BGq/j/MmCYpGai6ud+wq9KbyR+zeaNn+UGqTRdRKwWF1n5ESL3oPAoiHHnmKeFb3UNCw==
X-Received: by 2002:a17:902:a9cc:b0:235:eca0:12d4 with SMTP id d9443c01a7336-235eca01601mr49917275ad.53.1749128094963;
        Thu, 05 Jun 2025 05:54:54 -0700 (PDT)
Received: from dixit.. ([2401:4900:1c44:a779:7fef:8c20:c62d:6de3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bdd0e9sm118978065ad.74.2025.06.05.05.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 05:54:54 -0700 (PDT)
From: Dixit Parmar <dixitparmar19@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Dixit Parmar <dixitparmar19@gmail.com>
Subject: [PATCH 2/2] oeqa/selftest: add test case for kernel-module-split
Date: Thu,  5 Jun 2025 18:24:35 +0530
Message-ID: <20250605125442.364888-2-dixitparmar19@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605125442.364888-1-dixitparmar19@gmail.com>
References: <20250605125442.364888-1-dixitparmar19@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 Jun 2025 12:54:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218013

Added testcase to validate kernel-module-split.bbclass functionality
based on the KERNEL_SPLIT_MODULES option values[enabled/disabled].
The test cases validates the generation of the kernel module
autoload/modconf .conf files.
Introduces two testcases:
kernel_module_split.KernelSplitAutoloadTest.test_split_modules_disabled
kernel_module_split.KernelSplitAutoloadTest.test_split_modules_enabled

Signed-off-by: Dixit Parmar <dixitparmar19@gmail.com>
---
 .../selftest/cases/kernel_module_split.py     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/kernel_module_split.py

diff --git a/meta/lib/oeqa/selftest/cases/kernel_module_split.py b/meta/lib/oeqa/selftest/cases/kernel_module_split.py
new file mode 100644
index 0000000000..24b74d9989
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/kernel_module_split.py
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: MIT
+
+import os
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.utils.commands import bitbake, get_bb_var
+
+class KernelSplitAutoloadTest(OESelftestTestCase):
+    """
+    Tests to verify the effect of KERNEL_SPLIT_MODULES on autoload config file creation
+    """
+
+    image = "core-image-minimal"
+    autoload_file = "etc/modules-load.d/hello.conf"
+
+    def setUp(self):
+        """
+        Apply shared configuration for kernel modules and autoload
+        """
+        super().setUp()
+        shared_config = f'''
+IMAGE_INSTALL:append = " kernel-module-hello"
+KERNEL_MODULE_AUTOLOAD:append = " hello"
+'''
+        self.append_config(shared_config)
+
+    def _run_test_with_split_modules(self, enable_split):
+        """
+        Common logic for both enable/disable tests
+        """
+        split_value = "1" if enable_split else "0"
+        self.append_config(f'KERNEL_SPLIT_MODULES = "{split_value}"')
+
+        # Build the image
+        bitbake(self.image)
+
+        # Get path to rootfs
+        rootfs_path = get_bb_var("IMAGE_ROOTFS", self.image)
+        autoload_path = os.path.join(rootfs_path, self.autoload_file)
+
+        # Check for existence or absence of the autoload file
+        self.assertTrue(
+            os.path.exists(autoload_path),
+            f"Autoload config file should exist at {autoload_path} incase of KERNEL_SPLIT_MODULES is enabled or disabled"
+        )
+
+    def test_split_modules_enabled(self):
+        """
+        Test with KERNEL_SPLIT_MODULES enabled — autoload file should exist
+        """
+        self._run_test_with_split_modules(enable_split=True)
+
+    def test_split_modules_disabled(self):
+        """
+        Test with KERNEL_SPLIT_MODULES disabled — autoload file should not exist
+        """
+        self._run_test_with_split_modules(enable_split=False)
+
+    def tearDown(self):
+        """
+        Clean up all config changes
+        """
+        super().tearDown()
+
-- 
2.43.0


