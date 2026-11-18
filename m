Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.606.1795034977858593268
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=eJuM5zwS;
 spf=pass (domain: baylibre.com, ip: 209.85.160.171, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5366ae57896so13423991cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034977; x=1795639777; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mq4aAE39ze15y6ddcOUaHNDq0p4WKNeQGdMB1DuxGqg=;
        b=eJuM5zwSsmUR5eEXm/KVSce9+ATgsH5DRNV+68WTgTek9XrZEB4jskM2LFc9jIDHpP
         8l9rkA8P70EZVxhFnjC7KkCyHfqgcVhI1x/2vePUh7Lbu7OmB44t+0eFukeMRllzH3du
         6tQ4cINdnzRKZ8z0X90HoMuCvFntBMsslCsI5lDgbwJ8n+5nXs88fgHH0rgBr+DL0Y0L
         Kb/8xyRMuNuq71+1+3evkUTK/sWx1Y4xRyhaOyQTbY9HBAN02q/iTu54usPHfb/rw3X3
         n4p6wM3wEFeWogNEs9RvIx5dv3wvrsCD58uDOuC06C2DTk9deMbdG15J1xD1ZRjzqyUx
         gJAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034977; x=1795639777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mq4aAE39ze15y6ddcOUaHNDq0p4WKNeQGdMB1DuxGqg=;
        b=Jqmt/hWHmGTwy4kzAJhj+AuCOFGBeYTVxnat31z8IOVsOll6LzSTyWyoONhYHzffpg
         nzrjC3cni51rsSOHbgWFkI1kRBUcejHM+NetbKWqvyn4U1/DQfBh1Y8/JEFs0pk7AIRs
         VDUjty5SPaUX1O9m912WdKbWqubfrju0/zQGEQonF45yO0nfNGLSEG5WvbTH15h8uJOK
         Tmm8viWquvsBVdtF1s+JvOJEij5DH5k6wGTI5Uc/Wfl7ViAdJy5JUWQxJa+yPru6Fkh6
         +Mqvng+RdLW1zPksa9yB8xvQKjbtNB2xglJsYQYYrYwAfISR4rmIexqNYRMdUREi9yUj
         /4Xw==
X-Gm-Message-State: APuU4Z+RrW2KAz+orWlSCO/sJlQBDOOnBtJ6jeHJltKwjTjUR8Xuj2bo
	srjkWd/EbhV6l/IMv4WpCT6UbUQjbkjrR/hSP342k0WR0Fm4wzNVLwDON0W2hI3bAQev2h7qysF
	P898P
X-Gm-Gg: AYBFou2lK9Mn+H+oIMnNW2ymZGDhKcAKA6WW6uCHnK47CwBDeU8MCQ5MKd3yztgZklH
	EJR1AooxXY26FFXNPI+D7WtxpURT2Nc+PQShG+/RSlo7eStUM0h1xbOdnHRsmE/HVU8DiA3h95l
	ga8zxZMGohws7bFEypuof5rzVDOT2aFl8xct5UJb8B7JfDnsNKfiaBoLc9SiziDSau3wpcbRPaW
	qO/bYyRPHbzjFfZLCQCk1PoLS5ciHM/k0dN/q6LoYXpisxQXuJPpGY64KKuNgbkhre4PNDNtsQg
	CH175Gyfyez/DfiqC/Qp/yKcMp7GRj6ttoip61ZHOBbXmhw92QrrhgprjZpKxwAfn/N6K9ZubA5
	8hFJJdtqmUDqmfggAPSA0yizVJ7s05xpOK4n/CRJ5K4VJNulDwfd5IATgA9kKAQJ8teoNKCJHPr
	Dibi+hSd/KnM+KQKy1BDhIhTGgQSPz2Acn9f24jdAyWTSP2WT/tToypJNNd33WElzszgxyG/Ymj
	jh/sJGyQypF9xIK+azPsos4HC83sOGFu/1RNtIN2m3L1XeZLfbqFnVpYwCWA/c+KVyHe4WTDAFZ
	XmHiX89bmhbvVXpbOPSa8d6UW3JE8xB27Pw1UmEnzYHczqGE5reWM8q2dKg5aAelwEqY57TDuMK
	nQDyp
X-Received: by 2002:a05:622a:313:b0:535:864:82cf with SMTP id d75a77b69052e-55d5a321ae4mr63317911cf.10.1795034976546;
        Wed, 18 Nov 2026 12:49:36 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:35 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 08/12] tune-riscv.inc: set PACKAGE_EXTRA_ARCHS for supersets
Date: Wed, 18 Nov 2026 15:48:49 -0500
Message-ID: <20261118204853.2155173-9-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250591
Content-Type: text/plain; charset="utf-8"

For each tune, list the package archs it is a superset of in
PACKAGE_EXTRA_ARCHS, with the lowest priority tunes first (like ARM
tunings). This allows (for example) a 'riscv64gcv' machine to install
'riscv64gc' packages, and an 'rva23u64' machine to install packages
built for:

- riscv64gc
- riscv64gcv
- rva20u64
- rva22u64

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/conf/machine/include/riscv/tune-riscv.inc | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/meta/conf/machine/include/riscv/tune-riscv.inc b/meta/conf/machine/include/riscv/tune-riscv.inc
index d2657d8dad..496dbdd722 100644
--- a/meta/conf/machine/include/riscv/tune-riscv.inc
+++ b/meta/conf/machine/include/riscv/tune-riscv.inc
@@ -11,7 +11,7 @@ PACKAGE_EXTRA_ARCHS:tune-riscv64gc = "${RISCVPKGARCH:tune-riscv64gc}"
 
 TUNE_FEATURES:tune-riscv64gcv := "${@oe.tune.riscv_isa_to_tune("rv64gcv")}"
 RISCVPKGARCH:tune-riscv64gcv ?= "riscv64imafdcv_zicsr_zifencei"
-PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${RISCVPKGARCH:tune-riscv64gcv}"
+PACKAGE_EXTRA_ARCHS:tune-riscv64gcv = "${PACKAGE_EXTRA_ARCHS:tune-riscv64gc} ${RISCVPKGARCH:tune-riscv64gcv}"
 
 TUNE_FEATURES:tune-riscv32gc := "${@oe.tune.riscv_isa_to_tune("rv32gc")}"
 RISCVPKGARCH:tune-riscv32gc ?= "riscv32imafdc_zicsr_zifencei"
@@ -41,14 +41,18 @@ PACKAGE_EXTRA_ARCHS:tune-riscv64nc = "${RISCVPKGARCH:tune-riscv64nc}"
 
 # RISC-V profiles. zifencei isn't mandatory in them, but Linux requires it, so
 # it's added on top of each profile's mandatory extensions.
+#
+# Each profile tune's PACKAGE_EXTRA_ARCHS lists the package archs of the tunes
+# that it's a superset of (with the same lp64d ABI), lowest priority first.
 TUNE_FEATURES:tune-rva20u64 := "${@oe.tune.riscv_isa_to_tune("rva20u64")} zifencei"
 RISCVPKGARCH:tune-rva20u64 ?= "rva20u64_zifencei"
-PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${RISCVPKGARCH:tune-rva20u64}"
+PACKAGE_EXTRA_ARCHS:tune-rva20u64 = "${PACKAGE_EXTRA_ARCHS:tune-riscv64gc} ${RISCVPKGARCH:tune-rva20u64}"
 
 TUNE_FEATURES:tune-rva22u64 := "${@oe.tune.riscv_isa_to_tune("rva22u64")} zifencei"
 RISCVPKGARCH:tune-rva22u64 ?= "rva22u64_zifencei"
-PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${RISCVPKGARCH:tune-rva22u64}"
+PACKAGE_EXTRA_ARCHS:tune-rva22u64 = "${PACKAGE_EXTRA_ARCHS:tune-rva20u64} ${RISCVPKGARCH:tune-rva22u64}"
 
 TUNE_FEATURES:tune-rva23u64 := "${@oe.tune.riscv_isa_to_tune("rva23u64")} zifencei"
 RISCVPKGARCH:tune-rva23u64 ?= "rva23u64_zifencei"
-PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${RISCVPKGARCH:tune-rva23u64}"
+# Unlike rva20u64 and rva22u64, rva23u64 is a superset of riscv64gcv
+PACKAGE_EXTRA_ARCHS:tune-rva23u64 = "${PACKAGE_EXTRA_ARCHS:tune-riscv64gcv} ${RISCVPKGARCH:tune-rva20u64} ${RISCVPKGARCH:tune-rva22u64} ${RISCVPKGARCH:tune-rva23u64}"
-- 
2.56.0

