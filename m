Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.597.1795034971373440220
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=ZOS3F/u7;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5363c8de563so16065991cf.0
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034970; x=1795639770; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bv5/WQimG6ogNJygDRHxWwu24aCUR+1M/7Oiw7vZxa4=;
        b=ZOS3F/u7kUm+6iQqnIM3W5FSauduBOgPQc2qMTTap979xJugMkjKNGy+x9WvYlVkzA
         az+3ylGA4wA1bezCUnKthqQeNz7ZXFD2axwNGb13lrDDT793dNwzgzV+M8Tmg6+2IGR7
         OsqtzJ97qgwjKidq+9jOe1RILNLB+gyO/vu64M36mQBYuajYVGD+OTtMl7oLqRD7byAV
         t84UyVzzFmKQSi5cgUZAR/fz0buty79dkBGTdaCaYOJwP2gRiJDJzPGP7Tbz5VeWSq++
         IoRTGY9/Uh2UsBrp8VDLjIwfcMkAjALeSsTN7SEqyi1oo0nXx8NRdy4MTnwdg8vL6NXv
         lirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034970; x=1795639770;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bv5/WQimG6ogNJygDRHxWwu24aCUR+1M/7Oiw7vZxa4=;
        b=aKMIi6xSPAApOPNIAboyMG6U2BcZZ73mq5TAfepUtAxtW5hJYTqe71k67iIZaOIlJg
         GGksAP4lajWkw7w2vgTeup2MRXZDZ1cUFcO+bRKK5Og9cx2Kwh5L1W6549wMXHibRpA6
         4clKiT6kt2+BocBJeFzINQj3jW688IKwJqORMTsA7Iidj9Ywr9TSPQVeWwZOEkCFkMRH
         N/A1gW54E6yINXkG5eQlW25U3k4oG0AsnPxTF8zUimK1VfWi7mCwH4hbOs2/b9FTK7KN
         ARutozpzu2omFFR30QwajK8Vw8iiM++iaBH5eLbg5r2cXtshAYEH4mxH4CLGrno3uLYV
         VZAQ==
X-Gm-Message-State: APuU4Z9zU7xP/GJBWXO08X/YRdgk397P+hc6lSbfY2sm523ncwPvFXso
	g3vLPnG9pPkZShQgjJCB1zyaQSEk2TJEXRLw+pMPcV86DQ26J3rAKjI1bXHkcu5TWqef5aSli7s
	jzeqg
X-Gm-Gg: AYBFou15lGxE+wfZe/qhtDBpbgxZ2bke/MSdklblQhW37JQRBgfGiuudnDmcP9GNk0u
	jbDfpNn+Ye4a3r8klczsMrkhsqzEmR+FSYHDyCvr/fsOravaXkPiDr63Os4zvB/UNao9Y9X+mba
	hYvAy1hk0lhVkEztbTkd5FlZIji51ZRlOR6DZxGh/W38EJMimllEh8WOcIQPoC9eMWbvlT4o1dS
	nzT/gLJCrxeJ/AMWZQ2BmdbaaGw1Mf7ImOm5MgfQu06MnKj0yNjBKRQNVQvU/TU4hLII8wxlbMg
	8SqFFDpHMj51BxawS/th860iOFDzE63vs8YWThqVuznb4jlVkI1FOHWLOhqk4zmqKo6nGuRxGY/
	ZvJGSkNlaudSQoXN0pAXX8RNd4AiOSVClGb1+vCOmVEKvJVlqxrINL2mJLQniv6ZQT3fksqiCIH
	UF2g3lEviMWNEPUyG9oD/4CHDZL54io75VTVjpbLok9PuTEErN4J19NFW7AUZ+jTfpgGwX0cCEn
	Om1scGW6ZEhdAqPa81/lEurVX6odzfZRUAiffRpx5AuOsVUkr72sg+p9OhXi4bcbUVjYJcdDxat
	hqlE5zvRK7HR7/eBfmZlemnsGlhvbMoEY0qLm3cJ3AJB7tFT+szCGzwYfpdS444AYyEd34PhQn4
	QWKf/
X-Received: by 2002:a05:622a:4806:b0:54d:ac62:b7f5 with SMTP id d75a77b69052e-55d5a308b57mr54556631cf.3.1795034970092;
        Wed, 18 Nov 2026 12:49:30 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:29 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 05/12] arch-riscv.inc, tune-riscv.inc: add rva20u64 tune
Date: Wed, 18 Nov 2026 15:48:46 -0500
Message-ID: <20261118204853.2155173-6-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250588
Content-Type: text/plain; charset="utf-8"

Add TUNE_FEATURES for the extensions mandated by the RVA20U64 profile
which weren't yet in arch-riscv.inc:

- ziccamoa
- ziccif
- zicclsm
- ziccrse
- zicntr
- za128rs

Then, add an 'rva20u64' tune which uses them. Zifencei isn't mandatory
in the profile, but it is added on top of the profile's extensions since
it's required by Linux, making the package arch 'rva20u64_zifencei'.

Also update the tune.py notes to be clear about the ABI claim being
made, since the profiles there are now being used by package archs.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 26 +++++++++++++++++++
 .../conf/machine/include/riscv/tune-riscv.inc |  8 +++++-
 meta/lib/oe/tune.py                           |  5 ++++
 3 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index 6883e39a5f..26b8940f15 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -86,6 +86,27 @@ TUNEVALID[zicbom] = "Cache-block management extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicbom", "_zicbom", "", d)}"
 
+# The following are mandatory in the RVA20U64 and later profiles
+TUNEVALID[ziccamoa] = "Main memory supports all atomics in A extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccamoa", "_ziccamoa", "", d)}"
+
+TUNEVALID[ziccif] = "Main memory supports instruction fetch with atomicity requirement extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccif", "_ziccif", "", d)}"
+
+TUNEVALID[zicclsm] = "Main memory supports misaligned loads/stores extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicclsm", "_zicclsm", "", d)}"
+
+TUNEVALID[ziccrse] = "Main memory supports forward progress on LR/SC sequences extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "ziccrse", "_ziccrse", "", d)}"
+
+TUNEVALID[zicntr] = "Base counters and timers extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zicntr", "_zicntr", "", d)}"
+
 TUNEVALID[zicsr] = "Control and status register access extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "zicsr f d", "_zicsr", "", d)}"
@@ -103,6 +124,11 @@ TUNEVALID[zmmul] = "Integer multiplication (without division) extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zmmul", "_zmmul", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zmmul", bb.utils.contains("TUNE_FEATURES", "m", "", "_zmmul", d), "", d)}"
 
+# Mandatory in the RVA20U64 profile
+TUNEVALID[za128rs] = "Reservation set size of at most 128 bytes extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "za128rs", "_za128rs", "", d)}"
+
 TUNEVALID[zaamo] = "Atomic memory operations extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zaamo", "_zaamo", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zaamo", bb.utils.contains("TUNE_FEATURES", "a", "", "_zaamo", d), "", d)}"
diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index 88c9184c8b..bce345f684 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -2,7 +2,7 @@ require conf/machine/include/riscv/arch-riscv.inc
 
 DEFAULTTUNE ?= "riscv64gc"
 
-AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf"
+AVAILTUNES += "riscv64gcv riscv64gc riscv32gc riscv64 riscv32 riscv64nc riscv64nf riscv32nf rva20u64"
 
 # Default
 TUNE_FEATURES:tune-riscv64gc := "${@oe.tune.riscv_isa_to_tune("rv64gc")}"
@@ -38,3 +38,9 @@ PACKAGE_EXTRA_ARCHS:tune-riscv32nf = "${RISCVPKGARCH:tune-riscv32nf}"
 TUNE_FEATURES:tune-riscv64nc := "${@oe.tune.riscv_isa_to_tune("rv64imafd_zicsr_zifencei")}"
 RISCVPKGARCH:tune-riscv64nc ?= "riscv64imafd_zicsr_zifencei"
 PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "${RISCVPKGARCH:tune-riscv64nc}"
+
+# RISC-V profiles. zifencei isn't mandatory in them, but Linux requires it, so
+# it's added on top of each profile's mandatory extensions.
+TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
+RISCVPKGARCH:tune-rva20u64 ?= "rva20u64_zifencei"
+PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${RISCVPKGARCH:tune-rva20u64}"
diff --git a/meta/lib/oe/tune.py b/meta/lib/oe/tune.py
index 580c84d4fa..f44043c605 100644
--- a/meta/lib/oe/tune.py
+++ b/meta/lib/oe/tune.py
@@ -11,6 +11,11 @@
 #   RVA23U64: RVA23 Profiles, version 1.0
 # plus the extensions those imply (e.g. zmmul, zaamo, zca, zve*).
 #
+# The profile names are also used in package archs, so each entry here is an
+# ABI claim: packages built for e.g. "rva22u64_zifencei" must keep meaning
+# exactly this extension set. Changing an entry changes what existing package
+# feeds mean.
+#
 # Do not regenerate these from compiler output (e.g. gcc's -march expansion);
 # a newer compiler, or clang, may expand a profile differently. For example,
 # gcc's rva22u64 leaves out zihpm, which the specification makes mandatory.
-- 
2.56.0

