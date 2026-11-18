Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.593.1795034966797514843
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=UFfIYnTZ;
 spf=pass (domain: baylibre.com, ip: 209.85.160.173, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-53644ab1f7bso11731111cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034966; x=1795639766; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zK75qA3J7DNQEmMb6IF9UszkGrjC5CT8DpROWalXV2o=;
        b=UFfIYnTZ45BaY5gqLM6eRjiyM/yFIhNa1lt0KQJGjmrbUVHyw2X4Do0dZ2WTfCPZhA
         62KrtHbm04SQllomwHhwVia7xRaQfPOTVBTXIitjsYcHDc0SXlxznCitNKs9zOdBjNdl
         pWvMT6Rrg8Ut6dbSIo1xC0ulFpPzZVfKJwAi2piVFi55IX3nVoC/7qeTRRwDG6BXKZGX
         Ks4zUIMudiaanYuxfcANz3GSAjWbL0CF5PlcSDSnsre1Xyc6PGnXdktxpXWYpw3KL3GF
         /hziDO9zoi09TmulQ/XhVOx2giKCnJ+2vlsXsPjivOp/b2SCwQTDF1pkux2izqjcSFki
         F6XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034966; x=1795639766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zK75qA3J7DNQEmMb6IF9UszkGrjC5CT8DpROWalXV2o=;
        b=FpiMUrofDgiU95EbbCtG2y2Oq6w/MJCBFy7zoMJX+HcjKQ25Uo7JxJ14qRuZLX04z5
         kR2OmqJb8w9tmhckdY5yBf8ESz4EHTOCjMG5dUCBaFyoG8fyLy4pkioKR82lhPiOe5/K
         y2J1YdnloUhCajYLnksi2Rm3Ivu4PqhTwdfoZ8SuyxtAGkDsHqlYbgEdu2Tjo+rrRsDt
         gLwwA86KJDBwjV1uwrUQFMRL9u2dYXDrSDMy5KyjKgyceUaOqZQTE+yL2wKNcYoi+OOs
         HCl4e2oNbYa4yfRDo/fA+gSD5d+10fbK/KzbBAmg8FEI9lsG5WRXmZ2lvMy4R2lYiE9h
         1bzw==
X-Gm-Message-State: APuU4Z8SphTZy59a01823PYAOdl3qfDEcC0oPHCPlNZ9Rwe01bilcG02
	XMqkLfH2hr4umyYDvI7IHkb0O7Q96vJsr7I96lGMKQlVrZrI5nZxqYfgtnTTlkLKpXs1wi5asJ2
	eBP1t
X-Gm-Gg: AYBFou0NCfrX0inc3s655LUp+6cBl9iHsVDAv8ley0WK5JGp7+n/mFn2Uap1A5OZik5
	Bvyab5RaN5OZ0jRKuJlH4fDX4YaEfITagMt2OgydMKsfmSJxWXs9JLVe0Xize/BDNbzKyJH3T4w
	xqYd3YTKKEUL/NOAbmZ4sUbVQIfIm3a+I8hxssnxPyo2cM44GkgVb8jrW1rO/GNH5TnNGtPYrqQ
	DsWhn4LrHu5+qiyPQzcX8Jqu73v75eVpIN7f4YBWyFisSF2mVJJ6E+n+z5GeHTUzPX+WOxh9H9y
	cdrmdnlfi+ItnBJbpEH79WZfXqNGsme7STt3Zg/9PbARuZmGsvrrdBIqDvXACuiKKyntf3ORF3B
	BL+CJlQ9MrUGBh1o9td1yC2uJD3iRBt4bAU96PZn7jKVk7HelCqhrJEk6oX9oj4EZ30d7oYiYPO
	Wy2aU+esi/6UvrL2bD557D5srfz0VsLY6Mf3j2b5PIbHUpeK/5vBqBhLwHPjGCpgMnp+nr76Fob
	/DniA/yC/D+oWBbUF7+PF+t6avYH/Xp7lsaEh0Yz0Y3/4wq55jvoHBcmKVy9rCUTvB/BjhJtC9G
	Cb0ukemOpVaQzG0f3PfN2Z3OZLWySS0yexjcuRfowNlHsTmRPXvRvSFDoVPMcdMm5TseVuPnrWo
	kjhwv
X-Received: by 2002:ac8:5994:0:b0:535:1368:4582 with SMTP id d75a77b69052e-55d5a612c80mr62583831cf.46.1795034965594;
        Wed, 18 Nov 2026 12:49:25 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:24 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 02/12] arch-riscv.inc: add zmmul, zaamo, zalrsc, zca, zcd
Date: Wed, 18 Nov 2026 15:48:43 -0500
Message-ID: <20261118204853.2155173-3-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250585
Content-Type: text/plain; charset="utf-8"

Add TUNE_FEATURES for the zmmul, zaamo, zalrsc, zca, and zcd extensions,
which are enabled by compilers with m, a, c, and c with d:

|tgamblin@megalith ~/workspace/git/linux (master)$ riscv64-linux-gnu-gcc -march=rv64gc -mabi=lp64d -Q --help=target | grep march
|  --print-supported-extensions          -march=help
|  -march=                               rv64imafdc_zicsr_zifencei_zmmul_zaamo_zalrsc_zca_zcd
|  -march=help                           [disabled]
|  -print-supported-extensions           -march=help

Only pass them to '-march' when TUNE_FEATURES lists them, so that
'-march' doesn't change for existing tunes. Also add them to the
generated package arch, so that e.g. 'rv64ia_zmmul' doesn't share a
package arch with 'rv64ia', but only when the extension that they're a
subset of isn't enabled, so that e.g. 'rv64ima_zmmul' still shares one
with 'rv64ima', as the code is the same.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../conf/machine/include/riscv/arch-riscv.inc | 25 +++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/meta/conf/machine/include/riscv/arch-riscv.inc b/meta/conf/machine/include/riscv/arch-riscv.inc
index b2a9aa8952..6883e39a5f 100644
--- a/meta/conf/machine/include/riscv/arch-riscv.inc
+++ b/meta/conf/machine/include/riscv/arch-riscv.inc
@@ -94,6 +94,31 @@ TUNEVALID[zifencei] = "Instruction-fetch fence extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zifencei", "_zifencei", "", d)}"
 
+# zmmul, zaamo, zalrsc, zca and zcd are subsets of single-letter extensions
+# above (m, a, c and c with d), which compilers enable along with them. They
+# are only passed on when listed in TUNE_FEATURES, so that -march doesn't
+# change for existing tunes, and only added to the package arch when the
+# extension they're part of isn't enabled.
+TUNEVALID[zmmul] = "Integer multiplication (without division) extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zmmul", "_zmmul", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zmmul", bb.utils.contains("TUNE_FEATURES", "m", "", "_zmmul", d), "", d)}"
+
+TUNEVALID[zaamo] = "Atomic memory operations extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zaamo", "_zaamo", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zaamo", bb.utils.contains("TUNE_FEATURES", "a", "", "_zaamo", d), "", d)}"
+
+TUNEVALID[zalrsc] = "Load-reserved/store-conditional extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zalrsc", "_zalrsc", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zalrsc", bb.utils.contains("TUNE_FEATURES", "a", "", "_zalrsc", d), "", d)}"
+
+TUNEVALID[zca] = "Compressed integer instructions extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zca", "_zca", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zca", bb.utils.contains("TUNE_FEATURES", "c", "", "_zca", d), "", d)}"
+
+TUNEVALID[zcd] = "Compressed double-precision floating-point instructions extension"
+TUNE_RISCV_MARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", "_zcd", "", d)}"
+TUNE_RISCV_PKGARCH .= "${@bb.utils.contains("TUNE_FEATURES", "zcd", bb.utils.contains("TUNE_FEATURES", "c d", "", "_zcd", d), "", d)}"
+
 TUNEVALID[zba] = "Address bit manipulation extension"
 TUNE_RISCV_MARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
 TUNE_RISCV_PKGARCH .= "${@bb.utils.contains_any("TUNE_FEATURES", "b zba", "_zba", "", d)}"
-- 
2.56.0

