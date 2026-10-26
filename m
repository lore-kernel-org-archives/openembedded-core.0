Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5898.1793051193209008374
 for <openembedded-core@lists.openembedded.org>;
 Mon, 26 Oct 2026 14:46:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=nl4XTfEe;
 spf=pass (domain: gmail.com, ip: 209.85.210.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8490a7d6696so2093222a34.3
        for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 14:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793051192; x=1793655992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=nl4XTfEeB5raKKD1WQ75pmgmaz7gTNzfnw1cvp3QhKkWZ5KKtUpFF7Y68eJmmQBHMy
         jvf4Vzja1tPKjUTm2MtHA3QFebwp47YS0onTJi8PsFiUCSMgLybN+09LwOMUKcwGL745
         WESOU6Peh2knYKVOSrZHhOmnB4p+pePK7A8lHV7+c581TrXi+hNuQSDS5blVLO3zmAS8
         jeBKkExtsDk7M5PagyYPjqfi45TA691HJzV+dSc1+HJhTdWtfeQUEdRR9nCNksK8Ol7m
         C26Z3HQzj1YMjFVi0/s8Lxo+/FRIFbtDQgs9hzdUF3PV0R9YMPGAOzKeGTcIl/7v8oSa
         7DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793051192; x=1793655992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=fyvlQdyqu6Yvj8V0AUsIqKSiy0wAKLFQtgWxQ0Mc3XszToNo7PLwoq43B2A8ojF9LW
         5q5lmwwMo80LIk1oYBRhfGzwoGoeNCEJyv6rA3aIGeWCmmPesiv243QKaQimevzQB3DK
         XMRDsWL3ZszIZ892BXPj2vRPvUva5+iZ6/Wh3bysywUmUKuR4doez7bKOO8YDyCVhPWS
         yZfamJMZ6t7kvo2my7dFz7FJ1mqS+1pjKgTfyGBMG5e4hGGraj0nXrKrx76uwoD8dNsj
         J6hviXK6yIMWJ9YX1PE8VTxqg5UoxEr9ic6w05vwxMhJgVsSMPNa1oOKIWaJLWuTnEFQ
         NtAw==
X-Gm-Message-State: AFq9FYJC8Il1M9PXaO89WY5V05Q/9av3TwFWmgnfkG98Yxv79AWNuh23
	z5RPVx/9UVh0aqtO/m0bediETTYr0aFDz8YtoaYK/NNpdPggrdY3yoJt9qBudQ==
X-Gm-Gg: AYBFou0y+iMKOt3gun38ypJiB/wVoveEU6d1N/LUqcnO/ZIpDNb0p3z9koxZlJoNp6P
	Q2ZqX47bxXrgcVaEZRakddkg7tByZzkOBVvldrD2X/LvFzWUjM+X+BXDoGPe+CdrtAsR8VWthvh
	ybnQShsNjvN3wdMZk5tbiPWG3ePZ3PJvJRcnGe4Y9NfsNI+ZF3IoAo0j5PpDMtJwSOBRC8hS+1l
	4iAYeKM+hy5+1BzFH7nUCwxTZumZ9K6AL5FPDbQpnttUEpPcZBbfKmvySABGKlbJd9EfWOpAbJC
	XJQ526GHC99Dv4/j3p3b40TJXTv8cdq/+zUjAgEwMfHcEPEqc7HGsLjItFz22EYj0cK2saa+2vk
	KqnlqcyQRozhVztLI5j9Rzgxv8uRSvMHcIagrkTyXtuL5XNEC7w9smfJBCA5c0d80mphBYEqC+N
	5DQmXLNoAQwkODm/8K7V6IQ2E+Ip9so/YRVMVowgc/UiE5FWfZRfqmi97Uvz9skKSrKdUyRiITH
	Hp2B3VRmMA0cq3j7JQ4Lp5HF+C+z36WGk0CZfV/CjGanxQOTR95g8/3ekCr6AMdRPfNpwqjQHc=
X-Received: by 2002:a05:6808:4fdf:b0:4f0:a3f9:9f89 with SMTP id 5614622812f47-55c0020a86emr6247328b6e.18.1793051192353;
        Mon, 26 Oct 2026 14:46:32 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::283f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c0424a05dsm6304219b6e.4.2026.10.26.14.46.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 14:46:32 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v5 3/6] oeqa: Add SPDX deploy SBoM test
Date: Mon, 26 Oct 2026 15:45:23 -0600
Message-ID: <20261026214627.2388650-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261026214627.2388650-1-JPEWhacker@gmail.com>
References: <20260630210422.1903245-1-JPEWhacker@gmail.com>
 <20261026214627.2388650-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 26 Oct 2026 21:46:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248696
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

