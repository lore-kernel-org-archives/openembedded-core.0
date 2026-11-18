Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.592.1795034965699198219
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UkFYe9Tz;
 spf=pass (domain: baylibre.com, ip: 209.85.160.176, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-55bd96affd2so2814431cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034964; x=1795639764; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JfbLiMnfeI0Q8DFY8T6IxuDvwVUHfeh+M9zgixKK7Es=;
        b=UkFYe9TzZHujz5Z4zwrsK7H4/sXFRXHdfnXUUeA+48h4TvHG7iCI5mxBIFRWjR9C19
         VjmZbZZKm7T+igNUscIlzms+sAMqgsaRI+B8M5YdmcuBMb4uePQR9+H/TmWJZb8rLfjs
         vnIH5lAA8JJnNbNKXbIo9bdyrZGeCTZNnnlG8EgVZCY/yYpTLh0gzaE6iBylSlgT828e
         zWMFP3SNs8S9/AsUk7QJH9N0duksIkuroiO8RHq8WvfMwCRtDfPIIeKbieuv0QdLCcuL
         aQtAT3jrJvUbMG4wZ9rnTUOKz0tEnXeFLlBSI7fXy5JNPDeiJb4GG46ggqHPi7yDTyr7
         YDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034964; x=1795639764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JfbLiMnfeI0Q8DFY8T6IxuDvwVUHfeh+M9zgixKK7Es=;
        b=e4Nwijl5CpG3rq1orXjEBG2i4vpdCwwm39MD4FZVt0twOAVL6LqLNy8YOugjlwZ3kQ
         LS7RQ6GUacW9vDRIb1kqJ47X0MOylVXwm3sWsH47XLVNVs9TsUeCDNrxnUWmWEvBDyQs
         NJxav0m8jNzkXUh+3wmBJyFeVbx3pW+JylsmZHZg5LvyxCm78NPs3nXP97knFI+RV40I
         TOFfMo7KOjCZxaX8wRPR4yPcK25hv2WT4c1/1suGGidB/8N4EYto/7UVubvnNDpq20H3
         s8ZQACkOTXVubvOdw3bMEsCvtzXm+IuqtuHHohCr6taUvoq3ETmFCTBgyNCn2aWsa3A+
         KFeA==
X-Gm-Message-State: APuU4Z+ZfinGdIZ2JNfPYEH3Ox72LcxWwa5yXz1cp/Ft6f3AkMsKKcz+
	0Ic7WnaVhT+exTQcapccW5V42dI1WwEAj0t8QXs1iYkBSU0QV+P0xo2zTam/1AEaN0GzAZtzYuq
	eqzKl
X-Gm-Gg: AYBFou2LSim6+T/Y0Jc9EFis7MRlfll1X37Ja4YJRVIqdsiOEV3S5m/8BbMJWWbHJ9C
	xsm60OfHczRhXeASeIKTpdiLamwr6nVD/InSqJipUIZQ5LOXR9DcDMDbPZsmkKVF4wBRUcIIXYJ
	c2lZvaYt6vRPMslcb3U0E5ZgA6G6CKqLKjaVoyub4WqvemMC0OjuhnvsJucYSA4hRUu6bD59tXk
	pU4Y/+9UsaMjQv1jLXHRWQQGGyBdpTNIlCZnjSfyOhfDF22cccdMsY7zcJ00VYMIrMyzuk4vTNu
	4EaBnhWlLAK+N8NIMi+6fxlZ9E+IhHP5ya1e+jTztPolz4sa+/5FwJvEEU9s/bA8OJ4SA7wyYt8
	QHNHLXAYOS+CIcRkrGNuq18d7r4rrZPWFNHe4qqLqRnpr1tl68UKdCrThRdGU4h/TLLOlcqP+ml
	cfGeh3SzT6Qr0hmsLVguJ6tzvduHdSxRktW9EgXeZlicmb1xD0CxFgBUsxdspCnKL/ywN0OBAYc
	v/CjaSGXCmd8IaI+G0Yr5NEn1scNvRNQPUWC896GidKNrZQjqCDbJpNXdBLewnnViZcrpbkCfNv
	5IWUkM6wVdDjPmzywxS2ONz+7Iagb8NQSqGst1IHeTM1mYgKxLM8NBfpEBX88IqQusaZhfLnQsB
	cvHFiE202BzFp57IkQ8y1jDWSgg==
X-Received: by 2002:a05:622a:5e14:b0:55c:aee9:4f69 with SMTP id d75a77b69052e-55d6839e453mr11990051cf.5.1795034964323;
        Wed, 18 Nov 2026 12:49:24 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:23 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 01/12] arch-riscv.inc, tune-riscv.inc: add RISCVPKGARCH
Date: Wed, 18 Nov 2026 15:48:42 -0500
Message-ID: <20261118204853.2155173-2-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250584
Content-Type: text/plain; charset="utf-8"

Set each generic RISC-V tune's package arch as a literal in
RISCVPKGARCH:tune-<name>, matching how we do so for ARM and ARMPKGARCH.
Include a fallback to TUNE_RISCV_PKGARCH for tunes that don't set
RISCVPKGARCH:tune-<name>.

No package arch changes.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/README        | 10 ++++++++--
 .../conf/machine/include/riscv/arch-riscv.inc |  8 ++++++--
 .../conf/machine/include/riscv/tune-riscv.inc | 20 +++++++++++++------
 3 files changed, 28 insertions(+), 10 deletions(-)

diff --git a/meta/conf/machine/include/riscv/README b/meta/conf/machine/include/riscv/README
index beef68f523..b17c86c814 100644
--- a/meta/conf/machine/include/riscv/README
+++ b/meta/conf/machine/include/riscv/README
@@ -87,7 +87,13 @@ TUNE_RISCV_ABI - This is the generated ABI that corresponds to the ARCH and
                  ISA variation.  The ISA affects the ABI when the 'e', 'f'
                  and 'd' extension are used.
 
-TUNE_RISCV_PKGARCH - This is the generated PKGARCH value.
+TUNE_RISCV_PKGARCH - This is the PKGARCH value generated from TUNE_FEATURES.
+
+RISCVPKGARCH - This is the package arch actually used.  As with ARMPKGARCH
+               on arm, each tune sets it as a literal in
+               RISCVPKGARCH:tune-<name>, so that it only changes when
+               deliberately changed.  Tunes that don't set it fall back to
+               TUNE_RISCV_PKGARCH.
 
 The standard variables are defined as:
 
@@ -99,7 +105,7 @@ not adequate for some reason.  It is expected that most, if not all,
 implementations will use the default behavior.
 
 TUNE_ARCH = "${TUNE_RISCV_ARCH}"
-TUNE_PKGARCH = "${TUNE_RISCV_PKGARCH}"
+TUNE_PKGARCH = "${RISCVPKGARCH}"
 
 The above two will always base their setting off the standard TUNE_FEATURES.
 
diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 6f9b74974d..b2a9aa8952 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -121,9 +121,13 @@ TUNE_CCARGS = "${@ '-march=${TUNE_RISCV_MARCH} -mabi=${TUNE_RISCV_ABI}' if not d
 TUNE_ARCH = "${TUNE_RISCV_ARCH}"
 
 # Construct TUNE_PKGARCH
-# This should result in a package are like:
+# As with ARMPKGARCH on arm, each tune sets its package arch as a literal in
+# RISCVPKGARCH:tune-<name>, so that it only changes when deliberately changed.
+# Tunes that don't set it fall back to TUNE_RISCV_PKGARCH, which is built from
+# TUNE_FEATURES above, e.g.:
 #    riscv32imac
-TUNE_PKGARCH = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH = "${@d.getVar('RISCVPKGARCH:tune-${DEFAULTTUNE}') or d.getVar('TUNE_RISCV_PKGARCH')}"
+TUNE_PKGARCH = "${RISCVPKGARCH}"
 
 # Misc settings
 # Fix: ld: unrecognized option '--hash-style=sysv'
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index ed71dc06ba..88c9184c8b 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -6,27 +6,35 @@ AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64n
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH:tune-riscv64gc ?= "riscv64imafdc_zicsr_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${RISCVPKGARCH:tune-riscv64gc}"
 
 TUNE_FEATURES:tune-riscv64gcv := "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH:tune-riscv64gcv ?= "riscv64imafdcv_zicsr_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${RISCVPKGARCH:tune-riscv64gcv}"
 
 TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH:tune-riscv32gc ?= "riscv32imafdc_zicsr_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-riscv32gc = "${RISCVPKGARCH:tune-riscv32gc}"
 
 # Compatibility aliases so that layers using old tunes don't break
 TUNE_FEATURES:tune-riscv64 := "${TUNE_FEATURES:tune-riscv64gc}"
+RISCVPKGARCH:tune-riscv64 ?= "${RISCVPKGARCH:tune-riscv64gc}"
 PACKAGE_EXTRA_ARCHS:tune-riscv64 = "${PACKAGE_EXTRA_ARCHS:tune-riscv64gc}"
 TUNE_FEATURES:tune-riscv32 := "${TUNE_FEATURES:tune-riscv32gc}"
+RISCVPKGARCH:tune-riscv32 ?= "${RISCVPKGARCH:tune-riscv32gc}"
 PACKAGE_EXTRA_ARCHS:tune-riscv32 = "${PACKAGE_EXTRA_ARCHS:tune-riscv32gc}"
 
 # No float
 TUNE_FEATURES:tune-riscv64nf := "${@oe.tune.riscv_isa_to_tune("rv64imac_zicsr_zifencei")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64nf = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH:tune-riscv64nf ?= "riscv64imac_zicsr_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-riscv64nf = "${RISCVPKGARCH:tune-riscv64nf}"
 
 TUNE_FEATURES:tune-riscv32nf := "${@oe.tune.riscv_isa_to_tune("rv32imac_zicsr_zifencei")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv32nf = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH:tune-riscv32nf ?= "riscv32imac_zicsr_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-riscv32nf = "${RISCVPKGARCH:tune-riscv32nf}"
 
 # no compressed
 TUNE_FEATURES:tune-riscv64nc := "${@oe.tune.riscv_isa_to_tune("rv64imafd_zicsr_zifencei")}"
-PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "${TUNE_RISCV_PKGARCH}"
+RISCVPKGARCH:tune-riscv64nc ?= "riscv64imafd_zicsr_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "${RISCVPKGARCH:tune-riscv64nc}"
-- 
2.56.0

