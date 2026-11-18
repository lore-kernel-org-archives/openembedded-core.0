Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.603.1795034969564966107
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Z4zaMfBy;
 spf=pass (domain: baylibre.com, ip: 209.85.160.175, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5363c8de563so16065281cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034968; x=1795639768; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcxphd9lINXzpSYuUGqxs05PmeHnSnKvebbqmnX0sMA=;
        b=Z4zaMfByAnWJCLCX8Zu0y1PDOwPBpctNcuvjHbAgliOAEMB+t+fo2a4j6YM8sdhg+s
         3yMnpdsPvyRin2YnN0bBllTTWQoXWwDjoH9+c51wzzKekD34CTfmWUlHXM8e6MfzRp5R
         99g77rAMl0YmUIUF3PUKOkmxAwqUTSq1B3hxFcZecRbC/Avt6maSKZ/qXLXRWr3Lh3s9
         qnJ6faj8cQ/NroT0ug4yoimhxFQDkCI7Z1MbkCcrBfmN4YW8k+OTsTTUNWOSC+cdEBxq
         PWA82ykrrmzuaiMvP6GSA3cLKx+vjANNzY95H9nLT0eujcoTtEywf2uaVNMqWkPJ5bmt
         SkNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034968; x=1795639768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mcxphd9lINXzpSYuUGqxs05PmeHnSnKvebbqmnX0sMA=;
        b=HUEicU0xJHeFRLa+wrafrrCCPt1GSHUginOjUZAvn1HATJp5JS+RFw/M9M7UH0kjY2
         2bjPrustina03MG2OZqO4Qk2LjhxJapahSxdjEhvRINahdAwFkQ/gsf/wIroTQSh1SBS
         pcbCIgpQbfHz4jV4kLH2fN3hvkKc1totb600pFLvROpXj1ZEdLIKMse/oaN5QlOmBzsv
         31/v9UWOOzRaAD3Vx2yBlqDw2/1VfBQAwJI5p8nYgBRqw9mLJlusqTK2kclqFTCHNZas
         p0wl8TCbnYx3Y9IT1OYMf5DeLoA3H47Ljh1xSj8imSughha3oAdHkF3Zq86cIfxlZhLp
         GyMg==
X-Gm-Message-State: APuU4Z81nWLDyKZEl1KkmuzX9ofjVR2Hez2RmGELbDf2FWUyyDxXV11B
	18Yxd5IQWLWIFG94b/BE6D7OJQikoocUAD0h4vzqUsdob6Rt2KVY3vLRMNtVlnhHt41fACOcf5Y
	9jjNs
X-Gm-Gg: AYBFou3INkKHArXP/GgWkeZRnXN8WF4qu/LUOrw+tHevaerzSAs0gdsgr9U/9yez9RX
	vmYMiTnESaAAyP9T3wf2BmxGoggaw0MAPESjDGviCXWUCOs516j61mP6mDrTXFPGaX2iFywib+b
	paEk6EtPmNd9wU7ZnRQNM5BsqkMuRyX5ZZdt9VirXu6FC5E3XsXqhqcTnBcuyqrjDLukbO3Ip4w
	3AZZAvo5WwMXJ2Q+/zJ19TFdyGn57ADP2tMDjp94q/w/vZ3oHh1FSKogcJMtyQofXy51474as+i
	TZ3GpadBkoKsujoUT4L8xaVXAQB7Kj0vaBto8TGlMB7sG7nK1yi104w1NAaXwY7Gh6GMCGiqqUE
	dROxrSrJAZCAu7HBQ5+2j1MyILlEo3dGu40IiPHkBnWpEHOaDLUReUfS9zyOr/Pa5dS6RRCTsE0
	0TQ/nBxLlDwlRS64miwqQC7PvA0buPP/Y/VWge3zRTtIKVUATOGFkqCc5OO82fMwQBOxnmSeQqu
	L/r4/zeSbWkvCUYnSr6/W2RPEr1XQTzclMo5AFo+5e1SF6ec1uGo/Y1Egsy0gUpqYPo12ZHYMJw
	YLN3FW1PE3iUqtDOLWAZLfYACRRpD/eRpm4NBuNXJdTZYmS60fDCeyge28pIDJLsglHJ0pF73RP
	VaPwl
X-Received: by 2002:ac8:59ca:0:b0:55d:35a5:5256 with SMTP id d75a77b69052e-55d5a30881bmr64506831cf.10.1795034968310;
        Wed, 18 Nov 2026 12:49:28 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:27 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 04/12] lib/oeqa/selftest/cases/oelib/tune.py: add selftests for lib/oe/tune.py
Date: Wed, 18 Nov 2026 15:48:45 -0500
Message-ID: <20261118204853.2155173-5-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250587
Content-Type: text/plain; charset="utf-8"

Add basic selftests for tune.py's riscv_isa_to_tune() function,
covering:

- Abbreviations of tune feature lists
- Explicit tuning mappings
- Whitespace as valid separators in tuning lists
- Duplicate extensions only appear once
- Extensions starting with z, s, or x are not shortened
- Non-RISC-V architecture strings don't result in valid RISC-V tunings
- Profile names and ISA strings are parsed the same
- Expected profile ISA string lengths
- Deltas between successive profiles' extension sets (e.g. RVA22 vs
  RVA20, RVA23 vs RVA22)

AI-Generated: Uses Claude Opus 5.5

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/oeqa/selftest/cases/oelib/tune.py | 81 ++++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta/lib/oeqa/selftest/cases/oelib/tune.py

diff --git a/meta/lib/oeqa/selftest/cases/oelib/tune.py b/meta/lib/oeqa/selftest/cases/oelib/tune.py
new file mode 100644
index 0000000000..e851876588
--- /dev/null
+++ b/meta/lib/oeqa/selftest/cases/oelib/tune.py
@@ -0,0 +1,81 @@
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
+from unittest.case import TestCase
+from oe.tune import RISCV_PROFILES, riscv_isa_to_tune
+
+def _features(isa):
+    return set(riscv_isa_to_tune(isa).split())
+
+class TestRiscvIsaToTune(TestCase):
+    def test_abbreviation(self):
+        self.assertEqual(riscv_isa_to_tune('rv32g'), 'rv 32 i m a f d zicsr zifencei')
+        self.assertEqual(riscv_isa_to_tune('rv64g'), 'rv 64 i m a f d zicsr zifencei')
+        self.assertEqual(riscv_isa_to_tune('rv64gc'), 'rv 64 i m a f d c zicsr zifencei')
+        self.assertEqual(riscv_isa_to_tune('rv32gcv'), 'rv 32 i m a f d c v zicsr zifencei')
+        # Single-letter extensions after g stay ahead of the multi-letter ones
+        self.assertEqual(riscv_isa_to_tune('rv64gcv_zba'), 'rv 64 i m a f d c v zba zicsr zifencei')
+
+    def test_explicit(self):
+        self.assertEqual(riscv_isa_to_tune('rv32imac_zicsr_zifencei'), 'rv 32 i m a c zicsr zifencei')
+        self.assertEqual(riscv_isa_to_tune('rv32ec'), 'rv 32 e c')
+        self.assertEqual(riscv_isa_to_tune('RV64IMAFD_Zicsr'), 'rv 64 i m a f d zicsr')
+        # riscv as well as rv
+        self.assertEqual(riscv_isa_to_tune('riscv64gc'), riscv_isa_to_tune('rv64gc'))
+
+    def test_separators(self):
+        self.assertEqual(riscv_isa_to_tune('rv64imac zicsr'), 'rv 64 i m a c zicsr')
+
+    def test_duplicates(self):
+        self.assertEqual(riscv_isa_to_tune('rv64imac_zicsr_zicsr'), 'rv 64 i m a c zicsr')
+
+    def test_multi_letter_prefixes(self):
+        # z, s and x extensions are all kept whole
+        self.assertEqual(riscv_isa_to_tune('rv64gc_xtheadba_svpbmt'),
+                         'rv 64 i m a f d c xtheadba svpbmt zicsr zifencei')
+
+    def test_not_riscv(self):
+        self.assertEqual(riscv_isa_to_tune('x86_64'), 'x86_64')
+        self.assertEqual(riscv_isa_to_tune('aarch64'), 'aarch64')
+        self.assertEqual(riscv_isa_to_tune(''), '')
+
+    def test_profile(self):
+        self.assertEqual(riscv_isa_to_tune('rva20u64'),
+                         'rv 64 i m a f d c ziccamoa ziccif zicclsm ziccrse zicntr zicsr zmmul za128rs zaamo zalrsc zca zcd')
+        for name, isa in RISCV_PROFILES.items():
+            with self.subTest(profile=name):
+                tune = riscv_isa_to_tune(name).split()
+                self.assertEqual(tune, riscv_isa_to_tune(isa).split())
+                self.assertEqual(riscv_isa_to_tune(name.upper()).split(), tune)
+                self.assertEqual(tune[:3], ['rv', '64', 'i'])
+                self.assertEqual(len(tune), len(set(tune)))
+                # Required by Linux, but not by the profiles
+                self.assertNotIn('zifencei', tune)
+
+    def test_profile_sizes(self):
+        self.assertEqual(len(_features('rva20u64')), 20)
+        self.assertEqual(len(_features('rva22u64')), 32)
+        self.assertEqual(len(_features('rva23u64')), 53)
+
+    def test_rva22u64_additions(self):
+        # Everything in RVA20U64 is in RVA22U64, except that the latter's za64rs
+        # (a reservation set of at most 64 bytes) replaces za128rs
+        rva20 = _features('rva20u64')
+        rva22 = _features('rva22u64')
+        self.assertEqual(rva20 - rva22, {'za128rs'})
+        self.assertEqual(rva22 - rva20,
+                         {'b', 'za64rs', 'zba', 'zbb', 'zbs', 'zfhmin', 'zic64b',
+                          'zicbom', 'zicbop', 'zicboz', 'zihintpause', 'zihpm', 'zkt'})
+
+    def test_rva23u64_additions(self):
+        rva22 = _features('rva22u64')
+        rva23 = _features('rva23u64')
+        self.assertLessEqual(rva22, rva23)
+        self.assertEqual(rva23 - rva22,
+                         {'supm', 'v', 'zawrs', 'zcb', 'zcmop', 'zfa', 'zicond',
+                          'zihintntl', 'zimop', 'zvbb', 'zve32f', 'zve32x',
+                          'zve64d', 'zve64f', 'zve64x', 'zvfhmin', 'zvkb', 'zvkt',
+                          'zvl128b', 'zvl32b', 'zvl64b'})
-- 
2.56.0

