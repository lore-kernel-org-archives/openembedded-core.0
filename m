Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8311.1793225176388702884
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 15:06:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eck/ux55;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-854e904005cso102193a34.1
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 15:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793225175; x=1793829975; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=eck/ux55L4JAx8unbyW02M+c/TGhZFypydLto+YvGraZ0yapgRAMvyduW5o6/oKFVT
         x3mE3oLPyMasi8Vr/b8+i57gk7dEPhwQvbzpj0Lms8NNgCbLqX3rhhhUrymvVuKNx59/
         8HPRS/MPhne6lo86a57yILmaKDfb81qq/0+3Mq0FX8v8x5pzTQpt5HcW67ideAv5TiHK
         uZ2TpIaZavf7/7G9/K/fuoDLZo49bLofb/DEeRgrlzEoBtG9LgCa0ekSYkNNaPGR2U+B
         H9l4G89V04+m1jI8mvm8BcI9Ea0bTSzc9VnngXeU6bsj2BNKA8eXeUC6LDcp8fVNK76P
         mmxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793225175; x=1793829975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=KCzCGsr4FLf9NcQkkEeiS/ZNbXtk/YswKIDzuRhyRW+/gvAPn3y678yknDCC99RnMA
         I2fMdf8k6aCwY5YAEs1YArFcc3onDviwOyDRQ1HI9rBzyWh49kRuOH+VYgGrtoo+PNPU
         k1EGeNeViz6Y2bY0rq5r+T9d8mMGXqlp4y+8bcaRPgdpG7eBK8CNKmzfyHsZzcgJ92ZD
         IGckP8RGRt9vCiBoFL0ItoYTGXP5WuRMkmm79f2ZzlA3bnoikfDdIFWUpLk84j9sK847
         hkB6RhIJ7UU/ym6Rrhl9ueW1K9JihN1YnPjtfFrVY7sRJT0JCw5qSRktrauRJ8nj7OEe
         AXpA==
X-Gm-Message-State: AFq9FYKYyF2+OVbNYUSlnLWuhaEIukd+CSc1YebZbkR0oes+ZvzxORX/
	4Ko5YvOscqZsgNMDIwPppCBU87ptqsLhF/cz1sNly43u8tUeg+6sPR2GWzPhZw==
X-Gm-Gg: AYBFou26zpE9TQdUQRMSkWuLCGfZ+cxkapqXK0J68ULf0x7e4BbYK1c6YZAAn3EzW1M
	DMuFskXceRid/vBWsNPfWQAd2lQvzZuwSH0Cp0LyYVkvEzIFjWeiABAAbEjpaIcEcjEdCpC1bgR
	0IuiZ0wL7H7wXQ1azdwTAveIsFf66qRSf9QggAxs4L49ukz8GNmUKj9lqSCq004W6sEkFSnrr96
	ewHFXI6DLzc5DJYbO+aTdbo/oWhp10VHM9rJ3feQEAxOWB1v0MLAeOA8kW6vZTkGFVDP7DLgovX
	PxzxugIuazBNtBAzhh8IrE5XDgvDewQSlcsNY0GqExCan7oXv9ttWuJcxd6e8eq+GzTkqzR+Juc
	v8wMM9zaurjlIzr13v36DOQs2/lc1VRcQdg4P4mzgGzGk3b/oCWpBcMS5SjGegrkm34regxz+8g
	8EGZg9PWfI+niZlQXxerKYDNz/oadOn0XM7dYzHFbqNeQxd3s0UNNIgh4yiYBVcjfE0nPwL0+VM
	xZWqQZXTF6ynDmXjBl+s7+sC5nSKl8tmGkwAylmyF7xI+kErmJxxBAbXc2ONsL6lswx6EZjz+kN
	T+kQJ6wKtlaQc6qj0z/BDmttX4k=
X-Received: by 2002:a05:6820:1c8c:b0:70b:1217:4ab0 with SMTP id 006d021491bc7-714ddce6251mr564658eaf.5.1793225175480;
        Wed, 28 Oct 2026 15:06:15 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::8aac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b77abffcsm3527597fac.4.2026.10.28.15.06.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 15:06:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v7 3/8] oeqa: Add SPDX deploy SBoM test
Date: Wed, 28 Oct 2026 16:04:34 -0600
Message-ID: <20261028220609.1348489-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261028220609.1348489-1-JPEWhacker@gmail.com>
References: <20261027224931.385138-1-JPEWhacker@gmail.com>
 <20261028220609.1348489-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 22:06:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248840
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

