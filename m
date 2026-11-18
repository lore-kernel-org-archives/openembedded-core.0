Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.602.1795034968214989667
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=e0UZvaKv;
 spf=pass (domain: baylibre.com, ip: 209.85.160.179, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5430f70c827so20543621cf.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034967; x=1795639767; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pyB8Lq0JyUc8t5nQ+HZiOlReXCqlNwgyqNb6K2jq2sM=;
        b=e0UZvaKvt+TE0wPzhosk9GDlK5DKt6ouSsnxrwUEgc2kavXL33UVGbfGG6+a4jDJuE
         n2hPa4EVTyM0c4nxrcsv4mAGccJZaQ2brHn/IFKDLaxE8FVnAdQYsxYAlP7f7LBi3lSH
         1kHcEEiVYL9JQeTNpveDvfoqYVUV9rtlUUY9F+CqbgYUrdtCRMhiGc18LM04P8abjN9h
         AptjYO8JoK4cREjb4QiJZ8DfgCC1JPDjnp0QY/0utXL8E1Opz7fhGo5fE6fCaR43Tpai
         RjPrnf7rTUPWHNyBdclcarAKGHbeDM/ZYr0JbSpwFZkfqPQl1hccv5D6Ca+KgmhPYiZ0
         kkYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034967; x=1795639767;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pyB8Lq0JyUc8t5nQ+HZiOlReXCqlNwgyqNb6K2jq2sM=;
        b=ixYL9aQKGglBWzfosSQPbWaN+z1yPwtTQbaby3JTtkck8+VPg5y/zeOzrRs8fRcazJ
         zk6TpE9M8eE+OYRmuIWlVf3qN3NQVt5xfZtcWCy9mTBvVzuYt8jEFDdb7i+O0OFzP38F
         FE/1w2gu93ZkQZwp/OcQufnHaecbkVbR2Qoc3pJHkGPvk/jxiQdcT2zQ0kMaRgQf1z40
         X12FA8nWx9BXtnjnj4ik3OXhsQA77xrbEa9ufcIRyiQy2+ZNndRhRrVW3Waa+DXMbpwP
         YeLuq5ZyTFuTgQRjz+thOCYW+j8u2d78SZ4o3emf6axK0llcJk/6WnhFE79AXfEYvva5
         Xhcw==
X-Gm-Message-State: APuU4Z/aYS9Fl0ntPBfDXDyQBDM50499JFzEIXN+l7AIWyd3+rZixPpX
	BIMlqqf9SnC4YwvqzN1+A30yucDaIrQFzjni24gpfnbTbSkhDNQ09M43PrEmaLbcDqrom7RMJ+g
	2DSHg
X-Gm-Gg: AYBFou2C4sgnZ55HM+U92ryw469dai2q8l03lhtbi91BRlnX3q1wdKHL0rlbboa4Q4A
	gMYZjDs+jQSRkJc9wGecWegsZOFsKIx+gZ3aZCgCnBZHgDIG2Nt2TbRZjoMGFrOC+DoATkMPQYc
	HFteEMPZAtodudPLc/lLQYka7XWEsQ3q8KEoI9BFSJiZL37NuphDbzxs6t5Ogn2HUE4VpDjQBJy
	KO18s58MZp4Lo1iaXd+TEpNflJ9C4WgZFcJnzmMmElOK5PkAhgI5MOEi1Qa3SVrk8LNuJuWyc9S
	ze8949lgp4bcNtpTEaG/XpaO8pX5771t50Q/aKuY4dsyIr25+Y8wGZatvrhK02sQXnV/L++qZIc
	NPNUGBbLdiSn+N0T0G94Rwzm3+wsFLb+ilRPHCkylDs0pCD4Bv3wSW/C7KInITDsXHDUuQaENRt
	qCX/CPoAepe6xXVGA8uexslK+5t1OyvYKEeKzZ06dC+wz9C44V32jfa8knlavFwVsS8aZsRMjTk
	xgZOn/TuDUx1Th+1HIpGEK52XJUoAsH4W3DSLygNWKMaca05RLXbAqXBIFSKyXjVN4wja8r+9W1
	GS8C3WTI9gftJ9gQprHUeRIb4GqkRfEJs4bmdFalyInvcTVuDRLdeqWgN0cD6Ci9/TDAYyWjedW
	RbWUy
X-Received: by 2002:a05:622a:1a90:b0:536:352d:65f6 with SMTP id d75a77b69052e-55d5a62eb65mr58668611cf.64.1795034966948;
        Wed, 18 Nov 2026 12:49:26 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:26 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 03/12] lib/oe/tune.py: support RISC-V profiles in riscv_isa_to_tune()
Date: Wed, 18 Nov 2026 15:48:44 -0500
Message-ID: <20261118204853.2155173-4-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250586
Content-Type: text/plain; charset="utf-8"

Add RISCV_PROFILES for mapping the rva20u64, rva22u64, and rva23u64
profile names to their extension sets according to the RISC-V Profiles
specification. riscv_isa_to_tune() now accepts them in addition to ISA
strings, for tunes based on a profile.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/README |  3 +++
 meta/lib/oe/tune.py                    | 21 +++++++++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machine/include/riscv/README
index b17c86c814..ef7a484f25 100644
--- a/meta/conf/machine/include/riscv/README
+++ b/meta/conf/machine/include/riscv/README
@@ -126,3 +126,6 @@ rv32g -> rv 32 i m a f d zicsr zifencei
 The helper can be called using oe.tune.riscv_isa_to_tune("<ISA>") such as
 oe.tune.riscv_isa_to_tune("rv64gc") which would return:
  rv 64 i m a f d c zicsr zifencei
+
+The RISC-V profile names listed in RISCV_PROFILES in lib/oe/tune.py, such as
+rva22u64, are also accepted, and return the profile's mandatory extensions.
diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 7fda19430d..580c84d4fa 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -4,16 +4,33 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
+# RISC-V profile name -> equivalent ISA string, i.e. the mandatory extensions of
+# each profile as ratified in the RISC-V Profiles specification
+# (https://github.com/riscv/riscv-profiles):
+#   RVA20U64, RVA22U64: RVA20/RVA22 Profiles, version 1.0
+#   RVA23U64: RVA23 Profiles, version 1.0
+# plus the extensions those imply (e.g. zmmul, zaamo, zca, zve*).
+#
+# Do not regenerate these from compiler output (e.g. gcc's -march expansion);
+# a newer compiler, or clang, may expand a profile differently. For example,
+# gcc's rva22u64 leaves out zihpm, which the specification makes mandatory.
+RISCV_PROFILES = {
+    'rva20u64': 'rv64imafdc_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zmmul_za128rs_zaamo_zalrsc_zca_zcd',
+    'rva22u64': 'rv64imafdcb_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicsr_zihintpause_zihpm_zmmul_za64rs_zaamo_zalrsc_zfhmin_zca_zcd_zba_zbb_zbs_zkt',
+    'rva23u64': 'rv64imafdcbv_zic64b_zicbom_zicbop_zicboz_ziccamoa_ziccif_zicclsm_ziccrse_zicntr_zicond_zicsr_zihintntl_zihintpause_zihpm_zimop_zmmul_za64rs_zaamo_zalrsc_zawrs_zfa_zfhmin_zca_zcb_zcd_zcmop_zba_zbb_zbs_zkt_zvbb_zve32f_zve32x_zve64d_zve64f_zve64x_zvfhmin_zvkb_zvkt_zvl128b_zvl32b_zvl64b_supm',
+}
+
 # riscv_isa_to_tune(isa)
 #
 # Automatically translate a RISC-V ISA string to TUNE_FEATURES
 #
 # Abbreviations, such as rv32g -> rv32imaffd_zicsr_zifencei are supported.
 #
-# Profiles, such as rva22u64, are NOT supported, you must use ISA strings.
+# The profile names in RISCV_PROFILES, such as rva22u64, are also supported,
+# and are translated to the profile's mandatory extensions.
 #
 def riscv_isa_to_tune(isa):
-    _isa = isa.lower()
+    _isa = RISCV_PROFILES.get(isa.lower(), isa).lower()
 
     feature = []
     iter = 0
-- 
2.56.0

