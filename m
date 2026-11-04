Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11865.1793806542339566873
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=xnIky3Ro;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-483c607ccb4so538262fac.0
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806541; x=1794411341; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=xnIky3RoKlFw9fsYf/Ymg4a+FspZRub84Tof26ePiVxWGBmTPlC0d1QPDER2HAm8K5
         0HhGDx1iyM8nrwID6X5kIJwxNp17FyMa8dIgiJCy+EBiqaohhWSSLD83tIDFDpApGLex
         9Fm/s0GHuvtNWbT2oYE6talD72R+4zs4Y80V4u0cl9uOnPswFxcahdkSoOBCTjGIUR25
         roZlQ6G+TutLvNS84wHa3x16jJ7Txl5F42QqCpc9JVnDKHhZYWz5CVSG0mciI6/dc+yj
         LPDGtN1kxdVQEHa0vH7k7dBJm4l8IeAIadmdgIHR8NwbAvTYVgis/A4vnhNeQyO2GrnQ
         nYRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806541; x=1794411341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=NRmtZc4WMAGpA8+ZiYDFWjCnkw8yJFRc50XhQX/ITsm8VBVR9YfLhK7BpHBypVcAYk
         EowX1GXslHyJzD0E5hjcfO6hxw61+qXGDPJ30ldCsbCGhwH6RaOrNXnQYYJl0uhnizC9
         +tPPcjOgpRNydCgK9Ih0TiVTRFbYqOocKFN/PBVnS59HS/JwyeO8lDkDuFyUvnlKstk6
         em+e21m5AQPHVDLmoJTYda58wYwUKbT0WNrZ1YH1af5UvhfMWMiUmQNW679JCcYFUe9R
         WqcgRZlQA3aA292JGL5BmbLZ9769soDW+zY0Y67a5zM2oVXoeeEotWQTV1apIDQiTHF8
         MVwA==
X-Gm-Message-State: APuU4Z9v4t2T6D4IpJxCI8MZhA/hXFWGicV3QgsbmCAEnf8XytyqKxRm
	3yRopAP6zTlyhgAXQxjVJ1OMMZozTQy4fMrWV9i+2ZN8OW/z958f/ZkIci3OGw==
X-Gm-Gg: AYBFou29Hc/UUXCuWz0tuyAYzTIMW71hvrOuPf6GzB1yT0m7HFPTq34jVlb2c79TlY1
	tusbYe/xmPpaSRx4HKPg35z3AiJ3s5nIMoD83c0NAa2EIvekJAGc6smC5SvRxvLNXhay8f2X6N3
	KJAvqXxHi82apV0stxwG8NcuwE8BJWzN1sq80kQ6U/YKJULRFDCywRMDnUR9ROFs1uBsTH9bMb7
	P7rdsQHC29R2GUr0dU3R8hBUmRZrGgOtvbMTSISNwMajy1xXEKqC3DnWz/NbvcX/ur8ixsOZZBr
	nHUQuvSbAfitZ1cNsZ4hpbo0rgeJF8SEsrAbTV5dSSN8Px73LYQcnwhR9DtN4CQFKXk3GXs2HPu
	HP+G3/C4IniDCugihPuS2HXfpIhW7Dl9DYhsLRf9BS2PcPsMiTYzfavHmWaR35YoO61B5wOONhH
	HNnu92eK20n5ArTi9KXFrldKHDSW1boTtx5jf3PBhUWo/59tjjQz0XMBll3O3GlRXmIOWBaFgJJ
	6Gt8IyzMFQxpQ+pgAX1T94eQvEwxwtOVdDcvseBAm+eLXZjNT+y4kfS/N71p/s8AlFhPG3uxoE2
	+7dJS8cfo/UjqHrPMGMRULaRmoo=
X-Received: by 2002:a05:6808:181f:b0:4fb:a089:bf26 with SMTP id 5614622812f47-5640ddf687dmr10139740b6e.56.1793806541368;
        Wed, 04 Nov 2026 07:35:41 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:41 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 3/9] oeqa: Add SPDX deploy SBoM test
Date: Wed,  4 Nov 2026 08:33:56 -0700
Message-ID: <20261104153535.3184146-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249396
Content-Type: text/plain; charset="utf-8"

Adds a test that verifies that the deploy SBoM is created correctly

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index c900558b44..8cc51c1369 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -485,3 +485,14 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
         for candidate in objset.foreach_type(oe.spdx30.software_Package):
             self.assertIsNone(candidate.releaseTime)
+
+    def test_deploy_sbom(self):
+        kernel_recipe = get_bb_var("PREFERRED_PROVIDER_virtual/kernel")
+
+        objset = self.check_recipe_spdx(
+            "virtual/kernel",
+            f"{{DEPLOY_DIR_IMAGE}}/{kernel_recipe}-deploy-sbom.spdx.json",
+        )
+
+        # Document should be fully linked
+        self.check_objset_missing_ids(objset)
-- 
2.56.0

