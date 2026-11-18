Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.612.1795034983958883527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=JM4ijkHB;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55d360ca878so11410251cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034983; x=1795639783; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7JkTliFzS5WvPJhDVP5EAgraUaPezqqRb0XRZ+in6E=;
        b=JM4ijkHBiByBHbUD78bFUAS4Htmq/k/qRpoZSTfb9S3guMEZj4mcYsa9yKXqa0dFCx
         Ccez8j+u9FlTCcY32acQKCHPjEXhJbYacCYBoD1KNFvCfTGJJH/oRJ+/cdKWdql12gLE
         SIUtw22oDdmloLLeIhOudCmSfkLvAq2McE6JtEKkTXIkHWl0SYI6IEFVuOYex5GIbbXC
         ZyhuMceaYoIKtH//D7Yimw/BnzPmZeV8Ado1UBvjh9LlIy5ZoQWbGKuoLFA5KFPZlFtt
         7Ku04shlKONPSO5vdLlGQLTbMqG1UhgDw4GYL4xAF1u6DjT8+TPBNJcCYa5DXInvPPXH
         ajCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034983; x=1795639783;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7JkTliFzS5WvPJhDVP5EAgraUaPezqqRb0XRZ+in6E=;
        b=Rb1/nzqXswo0PyHeJ2daWFHD/r9OfqFnP2mSO4HbdtiUnnPsls39vVAytGJZeiN2QM
         xcsuUnuFwb+8nh+AcMsXPzypixKX8SsQ02YHW0GryIS+D6c4Zv1nEepT3DG5aWMwSveQ
         QmibQ2rLTmBgxWJDLcht3fiOfxQbaTCsv+s2sIwdcEThWHDpku7i/4r8h0tJT78B0NKs
         0N7HzcVQ3u7K4nRL3xSxHV+jyhJE7JJOhRawAqKYbQLIgJjU1UEO1Xbj9rew+YnpL6YD
         3bhU608yDdcDiftKcZqdhldYeiY4RaeLhHgIHER/5e86WrfnKHkspC7PBTVnQb09cVq7
         52eA==
X-Gm-Message-State: APuU4Z84lBB9YXKnDbaDslMF0MVETW+HfiP4169SimwitIBJLNPRDDi/
	fKV5988Jx6wEJBiFpzdaGXE1Nq+KI2aypza4TTpKI3su69I/wQBa9HqekbPC0hRarpnw+54lgQj
	fLUxw
X-Gm-Gg: AYBFou2EKC8x/NIC0jfBACR5j0187gLwk9uZAfUjas2WSbjk0YyucJ7Uw5PAdhn9q+k
	1+4BrpqAI2G0OfToPlxgLvywP4TTkCiQS88sTvHK84usAXYwNVeVcydpwUEP+LTlcTSK6KcoxBY
	svL/k73ZzGF1WAWE4UECtJDC1+goVas8/OVcJZ6BGnEvYTozPDvgBnrHWaqU16AY+KJhfmzLplv
	oS8eXDLo3Nz/peXE/CfHSHR5iyyUL3KvwGVOGiAX1QyZrZgklB5qVDL2drVkGceToNG9nYwS/Gn
	opBLmfwt/VSamQd5ne6gnNXOAGsnMztms8sONjBKLyi/3yjr3hQp9ibInlVZNJykUXV8kh4+Tx5
	VZQCqNzvZwKoNzQg9CmnbG3N7WkFZIzZuCcQ2YNIGYsrIz4eoiUQiQoZhdo1tyrgSafJsXZCYqt
	f+r1zeBtEr1AT26Qip7lCDzxnDIrO6k2W9293DoO8nkdcyv0+hXXzfi0YolyQVi7ISMij9wMd8c
	y/qO2tYKNE7W2Km55OrpGmn14GiSm5/C0Z2N/vpHyuGOMaQ57EUcvCpHBV1k0CerwZXTa3cAVRu
	T/0NHbM3noD7ksuYhEPZbL9YmgZKwakye1gZhhIca1+L2uM2Gklr3WzoR4ofMTQCM0rA/U1euQy
	iD+Vj
X-Received: by 2002:a05:622a:647:b0:55c:cdb4:9e73 with SMTP id d75a77b69052e-55d5a6333cbmr62065561cf.48.1795034982769;
        Wed, 18 Nov 2026 12:49:42 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:41 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 12/12] lib/oeqa/selftest/cases/riscvtunes.py: test Rust target features
Date: Wed, 18 Nov 2026 15:48:53 -0500
Message-ID: <20261118204853.2155173-13-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250595
Content-Type: text/plain; charset="utf-8"

Add test_riscv_rust_target_features(), which generates the Rust target
spec for hello-rs with the 'riscv64gc' and 'rva23u64' tunes, then checks
that its 'features' pass each extension in TUNE_FEATURES to LLVM in
order. Also check that riscv64gc's feature set remains unchanged.

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/riscvtunes.py | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/riscvtunes.py b/meta/lib/oeqa/selftest/cases/riscvtunes.py
index daee22a51e..b2ff2cc739 100644
--- a/meta/lib/oeqa/selftest/cases/riscvtunes.py
+++ b/meta/lib/oeqa/selftest/cases/riscvtunes.py
@@ -4,6 +4,9 @@
 # SPDX-License-Identifier: MIT
 #
 
+import json
+import os
+
 from oe.tune import riscv_isa_to_tune
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import bitbake, get_bb_var, get_bb_vars
@@ -146,3 +149,26 @@ class RiscvTunesTests(OESelftestTestCase):
                 # small, and compiled with TUNE_CCARGS. It has no do_build, and
                 # populate_sysroot also writes an sstate object.
                 bitbake('libgcc-initial -c populate_sysroot')
+
+    def test_riscv_rust_target_features(self):
+        """
+        Check that the Rust target spec passes every extension in the tune's
+        TUNE_FEATURES on to LLVM, in TUNE_FEATURES order.
+        """
+        for tune in ['riscv64gc', 'rva23u64']:
+            with self.subTest(tune=tune):
+                self.write_config(self._machine_config() + 'DEFAULTTUNE = "%s"\n' % tune)
+                # hello-rs is a small cargo recipe in meta-selftest, and
+                # do_rust_gen_targets runs right after do_patch, so neither
+                # the toolchain nor Rust has to be built
+                bitbake('hello-rs -c rust_gen_targets')
+                v = get_bb_vars(['WORKDIR', 'RUST_TARGET_SYS', 'TUNE_FEATURES'], 'hello-rs')
+                with open(os.path.join(v['WORKDIR'], 'rust-targets', v['RUST_TARGET_SYS'] + '.json')) as f:
+                    features = json.load(f)['features'].split(',')
+
+                # Everything but the base ISA and its width
+                expected = ['+' + e for e in v['TUNE_FEATURES'].split() if e not in ('rv', '64', 'i')]
+                self.assertEqual(features, expected)
+                if tune == 'riscv64gc':
+                    # The features of the existing tunes must not change
+                    self.assertEqual(features, ['+m', '+a', '+f', '+d', '+c', '+zicsr', '+zifencei'])
-- 
2.56.0

