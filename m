Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.598.1795034973081007192
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=Jf3WGBW8;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5364d86f7f0so17215131cf.1
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034972; x=1795639772; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dY1++kw6FewzDjCLhQ1asRVYp+wsExy49aP8gt1T3d0=;
        b=Jf3WGBW8oprUfRIDKuGmGrwJ3RSm9XVcuLIsTr9KF5X2je+X4t1Lty2naEb/tFthlq
         xDyJ4R9SaOgni0pmmBAhVZLBoh5VU0s4Od3gvvz5Y6zUkFqaBs/zG8ztoRcfE16jl2G5
         6N6ddp3DP6sTm/vW3Cy+KQJkuqz2uxhU4JyIcnWb7f1VvGk4p2mLXa8lvuNc54ybRBYo
         F275sNV5iQUBq7XchsP10a7+M0I4SowJd8YzM/FB2TPt9fwAVP9yG4nlX2wbYJvtvNvS
         MWsn0yZxrZ534B+Pqi6sRBcG1V34hOJDykKEFd9U4ON38y172+Tjw9NzJOes70qD7apy
         A7mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034972; x=1795639772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dY1++kw6FewzDjCLhQ1asRVYp+wsExy49aP8gt1T3d0=;
        b=AC5ngfEIbAOv2moRZmDBIGQx6Y6V4yYRUJFco5G4PTzzt/0KEjTA2YMd7uIXg2/4vU
         EhQOiRNwH9ikwQJ1dROPOK14hJcYHxXzwtPlt0yE+SqJXLFnVi/v5FlK3LOsRqXaCANc
         AjVERVkqRM9rjB+JnccyLDEz3GdtwH+XkpjSJBg8BchIsHyRBbs0kFr3n5CGVLfpjs8o
         VW7nyERi2lgRs8QHG8AvO4T6cLy3jnDn/5vqINGDlWodHAcCS9e7doElhU+oamwKlPGu
         jbRvmQ84uJwgzGgX4lQdvObXgve20y0oMuYkfuWTviy6j2Bk5QqR+ei5T7kKtqUC01js
         E34w==
X-Gm-Message-State: APuU4Z//zgKvSPQhAfva7mfjhvS7ExddmrcdCLPW64s8OTJsR0qVt3Mj
	TvYVyeZqSZH+M8n2k59ITeiW5aUhZfjBdSN+uaEWj8XkCJA6gsY+Rq/hP5z7XW0icthdsekeAcr
	VjHDS
X-Gm-Gg: AYBFou3efRyNdT+JdMxtz+e31UZLOc4cChnHDRol9DYI0rSaH1EfaxtTNoV5YIKBa47
	CTO3y+A+rbgKPRSY/NKSZSsKsYI1LrF3YgghS3IXUoQ6NCBZZ5smRzqfXpSqWtr5kG5O8ec5x+y
	WhFfbkcO73k4gm1hALj8GlCYuFd3K5NUSp7mlEdtVXlBclJMH49KzTBpOirJpHr9kWpJkWIWMHf
	DBn6IHWjaFoThDFO/jG/trWO0A4ZBm6A2WVd60GiIJwvWG/ED9MUFF2C+Gmh59P2jZpOm6CcD5/
	SbhuCQga47B8YacLSBh3k2qC9C08UpMR89HZnUoo1KvkvwhpNldvZr0+chKi2B9btWarlHzn5PJ
	jd4L9n+LcFJcdfB2k/4lvmrVQg6RuXJg08tdDJpkMGtsQDp9xefZ0dmzTxRLnZBf9oW/QzIEJCo
	9s9iseoZyL+STTPsV9eDKkzp3BXI4LTHc1aEk3sOD0WKUBIQlUJ+URK5rtbNWQ4v4sqt5c0UV8l
	ftKrM+j6i0h19Xr3VHP+NaF0RHw4FVxCF+mFMdNf5sdE63a1ckB5xsf1wtuQxubyB+tVABMaBbr
	kI0DjKzAHlSLzc3+tJlTK/Z+b3uKymMaun5S4wueMMkfoKZR9uMTOxPzvHnVhREEsON2uK2SEt7
	vxMAT
X-Received: by 2002:ac8:5d48:0:b0:536:72b4:b835 with SMTP id d75a77b69052e-55d5a5fc199mr60978561cf.46.1795034971829;
        Wed, 18 Nov 2026 12:49:31 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:30 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 06/12] arch-riscv.inc, tune-riscv.inc: add rva22u64 tune
Date: Wed, 18 Nov 2026 15:48:47 -0500
Message-ID: <20261118204853.2155173-7-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250589
Content-Type: text/plain; charset="utf-8"

Add TUNE_FEATURES for extensions mandated by the RVA22U64 profile but
not yet included in arch-riscv.inc:

- zic64b
- zicbop
- zicboz
- zihintpause
- zihpm
- za64rs
- zfhmin
- zkt

It also mandates the following, which were already in oe-core:

- b
- zicbom
- zba
- zbb
- zbs

Then, add an 'rva22u64' tune using them. Zifencei isn't mandatory in the
profile, but it is added on top of the profile's extensions since Linux
requires it, making the package arch 'rva22u64_zifencei'.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 37 ++++++++++++++++++-
 .../conf/machine/include/riscv/tune-riscv.inc |  6 ++-
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 26b8940f15..0661c24e8e 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -82,10 +82,24 @@ TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "v", "v", "", d)}"
 
 # Now the special Z extensions
+# zic64b, zicbop, zicboz, zihintpause, zihpm, za64rs, zfhmin and zkt are
+# mandatory in the RVA22U64 and later profiles
+TUNEVALID[zic64b] = "Cache blocks are 64 bytes extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zic64b", "_zic64b", "", d)}"
+
 TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
+TUNEVALID[zicbop] = "Cache-block prefetch extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicbop", "_zicbop", "", d)}"
+
+TUNEVALID[zicboz] = "Cache-block zero extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicboz", "_zicboz", "", d)}"
+
 # The following are mandatory in the RVA20U64 and later profiles
 TUNEVALID[ziccamoa] = "Main memory supports all atomics in A extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
@@ -115,6 +129,14 @@ TUNEVALID[zifencei] = "Instruction-fetch fence extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+TUNEVALID[zihintpause] = "Pause hint extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihintpause", "_zihintpause", "", d)}"
+
+TUNEVALID[zihpm] = "Hardware performance counters extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zihpm", "_zihpm", "", d)}"
+
 # zmmul, zaamo, zalrsc, zca and zcd are subsets of single-letter extensions
 # above (m, a, c and c with d), which compilers enable along with them. They
 # are only passed on when listed in TUNE_FEATURES, so that -march doesn't
@@ -124,11 +146,16 @@ TUNEVALID[zmmul] = "Integer multiplication (without division) extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zmmul", "_zmmul", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zmmul", bb.utils.contains("TUNE_FEATURES", "m", "", "_zmmul", d), "", d)}"
 
-# Mandatory in the RVA20U64 profile
+# Mandatory in the RVA20U64 profile. Later profiles require za64rs (below),
+# which is stricter, instead.
 TUNEVALID[za128rs] = "Reservation set size of at most 128 bytes extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
 
+TUNEVALID[za64rs] = "Reservation set size of at most 64 bytes extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za64rs", "_za64rs", "", d)}"
+
 TUNEVALID[zaamo] = "Atomic memory operations extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zaamo", "_zaamo", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zaamo", bb.utils.contains("TUNE_FEATURES", "a", "", "_zaamo", d), "", d)}"
@@ -137,6 +164,10 @@ TUNEVALID[zalrsc] = "Load-reserved/store-conditional extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zalrsc", "_zalrsc", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zalrsc", bb.utils.contains("TUNE_FEATURES", "a", "", "_zalrsc", d), "", d)}"
 
+TUNEVALID[zfhmin] = "Minimal half-precision floating-point extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zfhmin", "_zfhmin", "", d)}"
+
 TUNEVALID[zca] = "Compressed integer instructions extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zca", "_zca", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zca", bb.utils.contains("TUNE_FEATURES", "c", "", "_zca", d), "", d)}"
@@ -161,6 +192,10 @@ TUNEVALID[zbs] = "Single-bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zbs", "_zbs", "", d)}"
 
+TUNEVALID[zkt] = "Data-independent execution latency extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zkt", "_zkt", "", d)}"
+
 # Construct TUNE_CCARGS
 # This should result in a CCARG similar to:
 #   -march=rv32imac -mabi=ilp32
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index bce345f684..6aad54ae97 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,7 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf rva20u64"
+AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf rva20u64 rva22u64"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
@@ -44,3 +44,7 @@ PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "${RISCVPKGARCH:tune-riscv64nc}"
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
 RISCVPKGARCH:tune-rva20u64 ?= "rva20u64_zifencei"
 PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${RISCVPKGARCH:tune-rva20u64}"
+
+TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
+RISCVPKGARCH:tune-rva22u64 ?= "rva22u64_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${RISCVPKGARCH:tune-rva22u64}"
-- 
2.56.0

