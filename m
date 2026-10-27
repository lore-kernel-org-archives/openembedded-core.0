Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com [209.85.160.44])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31417.1793141379779390106
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2026 15:49:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=aG/yRyGE;
 spf=pass (domain: gmail.com, ip: 209.85.160.44, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-49ddddefadbso186169fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 15:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793141379; x=1793746179; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=aG/yRyGEBoAN7y7OdI9F/R7Spj0sUEQ0cFwaY88YCM5AFH5qzmKRmvabYBRfwe/FtK
         W+8jvTLDXRM+T6LZbT9eh9JA5XNmzFThGF1ARpCKxqqmDTATE/m9Nk4eB6csyHG+69kP
         1Hn7bjYX4T/I6/OvGPMkLXFW3SsVbgxuWZF7W7kXPLYTD7C4udkWcx/OHZoHWXZVdhYn
         QRO8Vn5QhD6mICjDVvhQRk09ymYKBAeeRQ0zO4OIpvo9clJPhywQq5ma2bggZl2rtXOL
         g/rL+9J1i4BoAgY7oqemvjnD1xg10OtxjmwTqdpZwoWBhL+TmK/BCesUrVnCgfSMGO3S
         ivOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793141379; x=1793746179;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z1y3RBDJoDIw4KgYSPBJM4umu5zeYQMe7A/eNaaMe0w=;
        b=lxEIlzuRgEY+lRR4UchBZNEoica5Zzp9xW3eE6BG2NeuFA7BSgqacKD/CjyTRxnJ1e
         v+sTQlFG+hWVDohZ24k8UAq/n9+XTqlnHM8g4cTO+h9IS4hIOP0IVjTR6gRbrknL3bS3
         dLlLGwk0LRSdcqTN1Qp2GyVf9GbUWus8m68KWa6o2qig0IT1RyFT/gkMR2kFVh64Ih8p
         p4/HnuM09EHkvSXILhxt86P/HNDwSLmSXGQNecQ0ok16GY8SMeCAq5dRWYrWZUZ5ltVV
         zkWK6hT92EfntNBz2cgc1FehfSY5GZ8GPpqWBSnlbGrWvMQFlkBgzGEOTUAEhWQeKlYk
         smWA==
X-Gm-Message-State: AFq9FYIkxZCch2qojW62TcjHOcXP+R2NBO0c2AGQqqFNGgP8VQ9gvkGI
	plQaoHJwezHPDkLDqhv9RQtTCDk4cDT7l+7INvD73z7IJpmeNS+3olf3cadKKQ==
X-Gm-Gg: AYBFou1iSnXSYOF1F/br501F223VGffwVstggeysy27moWplbmdACgvz8ITOOJeFDgh
	a1WJe5qqXh0aqO7lVLDCIA5sAnGjcvKCTSwdUsI57jeoOVrwKs8xLe45jZuBvvZdkEkNGaJwmR7
	PCm34if6A4vSeaW7l9U+hL+Cma2IG6bWoQp4ujXF31VTC5KV0JadLZ4HYVgE4Jy5/Oe2kF9aBNW
	9GlH350HpyOYlSmqA2F0+RSKwcKIxUVm/+oR7oWNnDR0ZDO8sjixv+hP9Qgg/k40+nbt3NyFOQw
	VoT82JPJ6FmGwZI5Yz0goy9aQXEzo9bfIGYSj+qmLDjmavyZFW6Ib+p+m8E/KJ7PGprn6HLbi+5
	1c7pcGbLH2LtOlb41Vj0f+Z3llAbXeD3M+AjjkOZzM+CdUtsTLXliWcU4ihpKy/+df16XABGT+H
	uJvsyJXUl7T8lPMGHRL9hdlRZ26bQDwox+3JexZSr95E9WNkRx4f2YgfQyZaAUM9IoD6WYtDjbQ
	cmGVkS96GfF93LnDj4BevcVQW2XdOu9eJ4oCEy0ZVpytM6QniqmlA==
X-Received: by 2002:a05:6870:3345:b0:491:8db3:58bf with SMTP id 586e51a60fabf-4a8bb1963a5mr793878fac.8.1793141378986;
        Tue, 27 Oct 2026 15:49:38 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1109])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a8b7979514sm1111037fac.17.2026.10.27.15.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 15:49:38 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v6 3/7] oeqa: Add SPDX deploy SBoM test
Date: Tue, 27 Oct 2026 16:47:17 -0600
Message-ID: <20261027224931.385138-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261027224931.385138-1-JPEWhacker@gmail.com>
References: <20261026214627.2388650-1-JPEWhacker@gmail.com>
 <20261027224931.385138-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2026 22:49:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248767
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

