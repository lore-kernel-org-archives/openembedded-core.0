Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1704CDE005
	for <webhook@archiver.kernel.org>; Wed, 24 Jun 2026 14:17:18 +0000 (UTC)
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8326.1782310633385970246
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Jun 2026 07:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lhloCiox;
 spf=pass (domain: gmail.com, ip: 209.85.161.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6a11c68ae41so540033eaf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 07:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782310632; x=1782915432; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Z2EPDVyBQGcOUVHtdSyMrcOgnpxSNgURZL34IR3pSk=;
        b=lhloCiox1LM8VB6WFBrAMKS3V6LSo3WAOZOKRb40EesGEJgoVru1KhRS5kw8YVrC0y
         wjxDLM9om3X5a7lsQVOuu0firiDM7h73YUnPgKnCgJcJyyjrhKP7CG+Kd7FlzcMJ/14a
         kvBsGnnyrcYcBWQ26f9NBrq2m5mKu7rr4PmjiNx0lrR5R8ThpO1dBu4nEay6QM+KwqbZ
         AYCH0+hh0okqJkXttKYTs2/nAj6JdoJ6iLMYnD1AcCeXhcflFuE48ouXwbNeDLYPpOe9
         sxnM3MSHQOR5+JhAqaHz4sLIPpkoYlG2300klZOz+E47H2ZN9f+4YBEmoFn+wZGOEDqn
         hg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782310632; x=1782915432;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Z2EPDVyBQGcOUVHtdSyMrcOgnpxSNgURZL34IR3pSk=;
        b=LKcbBa3jRmK/5D03+jvHl3Z6UFBYCjCK1qOS4GDFFd/Qxm4BAQnbLW+tFLFPUkXD8m
         CnZh4IVUheT7gFzslPnJx5nl4bioGtiFKyF3Rp1Ujzjgk3MvIhUi3G3RjMPvNfi0KuUL
         0cH13aiR06kgtlKk6KDlj8qGiOCmWsSO5GXzJ0WFXZgEqIR4VHuP3ndb36WaHZj0WKNY
         ACuhM6PaQc4wZtuBTHTPAO/RkujZQugnEWmxZSrcV0brFxkm/AghRGN9N/ijujnfVjRc
         k31YF8CqepQsOACFnwHibbwcrGtdn6SMRcbieYwbF/8T9a3OilZaBamo3kqaSJY0mqb5
         w7eA==
X-Gm-Message-State: AOJu0YwLUncgn2iPyLxvz2ZikqmVvR5yqCrvPh02F+97oNGDMAq9OWO+
	w7zO17Uy9Xi2TBu3k4dNax73ZFn72M1covXsw59WFW0p6B4fqqR1ya1RsaSOQQ==
X-Gm-Gg: AfdE7ckb65G7e1c2GGGUq5/h/PohdQXuwdCXXtsiZRTtIRobNxhYhbmGVfMr0HGabjj
	oYpv0OjjotlYhS7loZm4ZqGk/ha6rEib4rqZFRFJkOq513EEJn1uSvlD1OooYljM0YKZZgMmr8J
	ykewa72FbEL3mO63QnSk3wBiC2tdSVJivx+gG7FIC/Pj7b9WDmy7EUTUC8VDtYCPWHnn4udLJtI
	7thhc/9ZJKCzzD+f1gvfm5Yasica1hyhhER+Gt3sVY7tL2AlrK7cjP+3FQ2TCXK1tKYByLMmTfJ
	Jc1fy162wvMlAlyVGDTiDfcMNyhnelP1RD19ZK+Mq/VRIbIQJVccYi5LfqR4oyibU44Bjr7h45T
	MdOtzP0qgH/vzTsn67jil3tuXwTRd0txxt6/B9XENl5VTMa3qxCoW1f19iwZNj5x/U2caHbl5WD
	aTxaOjyXqtIw==
X-Received: by 2002:a05:6820:190d:b0:69e:3e2a:a83f with SMTP id 006d021491bc7-6a122e1066amr2310881eaf.9.1782310632394;
        Wed, 24 Jun 2026 07:17:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::87cd])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6a0e9f2a4e9sm8946149eaf.2.2026.06.24.07.17.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:17:12 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v3 3/8] oeqa: Add SPDX deploy SBoM test
Date: Wed, 24 Jun 2026 08:15:20 -0600
Message-ID: <20260624141706.2164567-4-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624141706.2164567-1-JPEWhacker@gmail.com>
References: <20260618165032.347436-1-JPEWhacker@gmail.com>
 <20260624141706.2164567-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Jun 2026 14:17:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239512

Adds a test that verifies that the deploy SBoM is created correctly

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8285189382..af2a9dc236 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -443,3 +443,14 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain digits"
             )
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
2.54.0


