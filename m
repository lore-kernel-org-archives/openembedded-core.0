Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.599.1795034974721487563
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=P+Zah+4j;
 spf=pass (domain: baylibre.com, ip: 209.85.160.181, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55d03bfd477so15258791cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034974; x=1795639774; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c0usQ2KbYs6d5gYEhYZoYnkpE1b9uehK7b0NbfdSvik=;
        b=P+Zah+4jg7oarAYrnM05uNmxg1JwqH78ADAe8biU+uxi10UR5EYMVhQt+4lZG2h72U
         ktNEivuar8tstF2aapGl/9LE+7ytvueeYsWXPg0hv1ITRXfgw0NFbT2LJxKUPKFzBWwL
         A6hhz9dM+lBbdceBh5IAKDVP+382OsilzI/aBBo/dDsDKX7ZFnjVXqFvnvh50akrYCmQ
         20JyF1QW3ZGNLlVarLOMYZAu1T7nao8zNe1Y7EPJjqJ6ceHGDDpG3qav4n2ZUKSDUe+7
         LifnBB9DFCCSsqnmzNdessffLnYijwkI/YYRkJJGkk90/YbT+4lYwAa8oVLBpPCmObF1
         MH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034974; x=1795639774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c0usQ2KbYs6d5gYEhYZoYnkpE1b9uehK7b0NbfdSvik=;
        b=2cERUyOnfm4IhWO3j0Vc5H9UXlcEZ3p0cs78WeHPMVhsJoYLlG2xRjw2LyZfPwKdGu
         Xl3kQsGOWRd9tIE5b4mtLAfL6G48aflwfpeFWKLQ31xfd7paFaaLHMFLuvz2OTs8ubSt
         k5AQ3HdrE1xj6iJRHlz757iicd3jqg0aBcvYw8EQ9pzZ1C7ZzthVOKkLi0SZPxS03v3h
         fDtLLyVtob+2xLxTh+3eBZr7Ac0F3aAz+G+lcpJ3uvhVk1HZ3MVwwWjKbhYctjvksYei
         x708hNXHbG9AqDHoSu6LX8QNca7TthLEqV8MawFjXj+KKziKw1IFQfsHE7jFL5wZ/t4f
         WOcg==
X-Gm-Message-State: APuU4Z8TPmSLbSYr/kbgmsgMfsiVLNGyamnpX7kVOPsngg3hRXzwKJ2g
	W7DbADIvka+VPcWiC6HVvaz6txcZUs6fMnabJSHAJO7DdZrsSddUz5B6bxxTCfAKTeaKJmHrB3x
	XVBM8
X-Gm-Gg: AYBFou2ee15EZj1KScM7f5hnie+j8ouMAtM4NfxqBMVK+LGROHpfrCBrTgti5U9ISDj
	MQd9sh16MJXFwoipyGkyH0vbkXSdHGpYsxiU0tX9PIpyTNEJvPri5x+ahMLPVuqcb4yCK+R7Txy
	udk8AQ6xH5LqW0M4TMOcu4dSKfDsWMoezWD2pcZxd7GhIwWcWc/C5mXwzcWrV4mn1kOEsJ8OM7F
	vwwxmAeDZFp47pa8F+EVRQk9XADVSwdaht/6G7a2xNKp5Gt68Nj/KLMOkNMGObKHaeaRCaYZ3lk
	c4Fnuber0bl945fnsKtzgeBfZXtWL2a3Urt4J/M0/qLOy5IAPJQ1dyYNnF8AbiwoxHqHg5ufVav
	dftCE/kvCkRxXcHrJFKPSmQgc0riOF6VcNl5a0ya5cnjPEHFwAYvYGJEtvGFTaXDykXNWrsHskJ
	/77JhD3d4+fEcwZGXGlLwIk543QFv/ckrTHC6CGZD6RKL820J6yzDMVrD92zyysBzpL52Y0iLSS
	GLTgwbFRsibjz3iO68ShDCb8sqZKptPWDu81jbTaUsBJX7rJ9Q1254IS4qFPCklpsPhzDyit/un
	Lf4j294q+tk+sahIqe0kQsjXFwswQ8HjZ3mFoOfRJhXB/WBtTQLkSQhsxljd8q4vK12+qjIGpiF
	F4Oulk3G+OQWp+af9fGOzolkWcQ==
X-Received: by 2002:a05:622a:4109:b0:55d:99e:822f with SMTP id d75a77b69052e-55d5a6259e1mr57120501cf.46.1795034973402;
        Wed, 18 Nov 2026 12:49:33 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:32 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 07/12] arch-riscv.inc, tune-riscv.inc: add rva23u64 tune
Date: Wed, 18 Nov 2026 15:48:48 -0500
Message-ID: <20261118204853.2155173-8-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250590
Content-Type: text/plain; charset="utf-8"

Add TUNE_FEATURES for the extensions mandated by the RVA23U64 profile,
which weren't yet in arch-riscv.inc:

- zicond
- zihintntl
- zimop
- zawrs
- zfa
- zcb
- zcmop
- zvbb
- zvfhmin
- zvkb
- zvkt
- supm
- zve* and zvl* vector extensions

The zve*/zvl* extensions are only added to the package arch when v isn't
enabled, and zvkb, when zvbb isn't. As with other profiles, zifencei is
added to the extension set since it's required by Linux, making the
package arch 'rva23u64_zifencei'.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 89 +++++++++++++++++++
 .../conf/machine/include/riscv/tune-riscv.inc |  6 +-
 2 files changed, 94 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 0661c24e8e..ff14f94deb 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -84,6 +84,8 @@ TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 # Now the special Z extensions
 # zic64b, zicbop, zicboz, zihintpause, zihpm, za64rs, zfhmin and zkt are
 # mandatory in the RVA22U64 and later profiles
+# zicond, zihintntl, zimop, zawrs, zfa, zcb, zcmop, zvbb, zvfhmin, zvkb, zvkt
+# and supm, as well as v, are mandatory in the RVA23U64 and later profiles
 TUNEVALID[zic64b] = "Cache blocks are 64 bytes extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
@@ -121,6 +123,10 @@ TUNEVALID[zicntr] = "Base counters and timers extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
 
+TUNEVALID[zicond] = "Integer conditional operations extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicond", "_zicond", "", d)}"
+
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
@@ -129,6 +135,10 @@ TUNEVALID[zifencei] = "Instruction-fetch fence extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zihintntl] = "Non-temporal locality hints extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintntl", "_zihintntl", "", d)}"
+
 TUNEVALID[zihintpause] = "Pause hint extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
@@ -137,6 +147,10 @@ TUNEVALID[zihpm] = "Hardware performance counters extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
 
+TUNEVALID[zimop] = "May-be-operations extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zimop", "_zimop", "", d)}"
+
 # zmmul, zaamo, zalrsc, zca and zcd are subsets of single-letter extensions
 # above (m, a, c and c with d), which compilers enable along with them. They
 # are only passed on when listed in TUNE_FEATURES, so that -march doesn't
@@ -164,6 +178,14 @@ TUNEVALID[zalrsc] = "Load-reserved/store-conditional extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zalrsc", "_zalrsc", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zalrsc", bb.utils.contains("TUNE_FEATURES", "a", "", "_zalrsc", d), "", d)}"
 
+TUNEVALID[zawrs] = "Wait-on-reservation-set instructions extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zawrs", "_zawrs", "", d)}"
+
+TUNEVALID[zfa] = "Additional floating-point instructions extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfa", "_zfa", "", d)}"
+
 TUNEVALID[zfhmin] = "Minimal half-precision floating-point extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
@@ -172,10 +194,18 @@ TUNEVALID[zca] = "Compressed integer instructions extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zca", "_zca", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zca", bb.utils.contains("TUNE_FEATURES", "c", "", "_zca", d), "", d)}"
 
+TUNEVALID[zcb] = "Additional compressed instructions extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcb", "_zcb", "", d)}"
+
 TUNEVALID[zcd] = "Compressed double-precision floating-point instructions extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", bb.utils.contains("TUNE_FEATURES", "c d", "", "_zcd", d), "", d)}"
 
+TUNEVALID[zcmop] = "Compressed may-be-operations extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcmop", "_zcmop", "", d)}"
+
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
@@ -196,6 +226,65 @@ TUNEVALID[zkt] = "Data-independent execution latency extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
 
+TUNEVALID[zvbb] = "Vector basic bit-manipulation extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvbb", "_zvbb", "", d)}"
+
+# The zve* and zvl* extensions are subsets of v, like zmmul is of m above, so
+# they are only added to the package arch when v isn't enabled. Other extensions
+# also imply them (e.g. zvbb implies zvkb, zve32x, and zvl32b), which the
+# compilers handle but the package arch doesn't. Tunes using them without v
+# should set RISCVPKGARCH:tune-<name>.
+TUNEVALID[zve32f] = "Embedded vector (32-bit integer and floating-point) extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve32f", "_zve32f", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve32f", bb.utils.contains("TUNE_FEATURES", "v", "", "_zve32f", d), "", d)}"
+
+TUNEVALID[zve32x] = "Embedded vector (32-bit integer) extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve32x", "_zve32x", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve32x", bb.utils.contains("TUNE_FEATURES", "v", "", "_zve32x", d), "", d)}"
+
+TUNEVALID[zve64d] = "Embedded vector (64-bit integer, 64-bit floating-point) extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve64d", "_zve64d", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve64d", bb.utils.contains("TUNE_FEATURES", "v", "", "_zve64d", d), "", d)}"
+
+TUNEVALID[zve64f] = "Embedded vector (64-bit integer, 32-bit floating-point) extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve64f", "_zve64f", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve64f", bb.utils.contains("TUNE_FEATURES", "v", "", "_zve64f", d), "", d)}"
+
+TUNEVALID[zve64x] = "Embedded vector (64-bit integer) extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve64x", "_zve64x", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zve64x", bb.utils.contains("TUNE_FEATURES", "v", "", "_zve64x", d), "", d)}"
+
+TUNEVALID[zvfhmin] = "Vector minimal half-precision floating-point extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvfhmin", "_zvfhmin", "", d)}"
+
+# zvkb is a subset of zvbb
+TUNEVALID[zvkb] = "Vector cryptography bit-manipulation extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvkb", "_zvkb", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvkb", bb.utils.contains("TUNE_FEATURES", "zvbb", "", "_zvkb", d), "", d)}"
+
+TUNEVALID[zvkt] = "Vector data-independent execution latency extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvkt", "_zvkt", "", d)}"
+
+TUNEVALID[zvl128b] = "Minimum vector length of 128 bits extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvl128b", "_zvl128b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvl128b", bb.utils.contains("TUNE_FEATURES", "v", "", "_zvl128b", d), "", d)}"
+
+TUNEVALID[zvl32b] = "Minimum vector length of 32 bits extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvl32b", "_zvl32b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvl32b", bb.utils.contains("TUNE_FEATURES", "v", "", "_zvl32b", d), "", d)}"
+
+TUNEVALID[zvl64b] = "Minimum vector length of 64 bits extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvl64b", "_zvl64b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zvl64b", bb.utils.contains("TUNE_FEATURES", "v", "", "_zvl64b", d), "", d)}"
+
+# Supervisor-level extensions, which come after all of the Z extensions
+TUNEVALID[supm] = "User-mode pointer masking extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "supm", "_supm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "supm", "_supm", "", d)}"
+
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:
 #   -march=rv32imac -mabi=ilp32
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 6aad54ae97..d2657d8dad 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,7 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf rva20u64 rva22u64"
+AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf rva20u64 rva22u64 rva23u64"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
@@ -48,3 +48,7 @@ PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${RISCVPKGARCH:tune-rva20u64}"
 TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
 RISCVPKGARCH:tune-rva22u64 ?= "rva22u64_zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${RISCVPKGARCH:tune-rva22u64}"
+
+TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")} zifencei"
+RISCVPKGARCH:tune-rva23u64 ?= "rva23u64_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${RISCVPKGARCH:tune-rva23u64}"
-- 
2.56.0

