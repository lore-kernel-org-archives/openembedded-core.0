Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 643C0C48BEA
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:38:56 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web08.22220.1659940735297606740
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=DW2MhRzj;
 spf=pass (domain: gmail.com, ip: 209.85.218.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id kb8so14814932ejc.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KalwwfOveWr7php+LDjFsk2GRiO2pXL/xGAOP9QNciM=;
        b=DW2MhRzj8/PKUz3e+x72PuJy2j+D+GkCuRmXBgcsDwm2gaDboIuO6VQaSPDNP2SJ8R
         Ga0r+H0P0e7Jqbw4+57MsexATkuhe5/6xFOxH4YtSdYwexrGiz1CriRPZCvFpar1Lyl8
         MZfSh+p/ho2mNBQFIWLgjIpvySPtNuwnFf4cg/se7hPAQEVZomHRSOs7nYQ4n0etP+gG
         wJ5blMvnk3uL1fODb7/MIo+u18wLv/YFP3H5JNGWn5k7lcNzb3fDoAMAJKoq4Kc74W+O
         p4A2c9PXFiNp8NF/JQgV/8sEVj+8BVfWKRYn6P0pkbAY7yxOaSvF0Zr2XZcIvnGmo8Nq
         uNfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KalwwfOveWr7php+LDjFsk2GRiO2pXL/xGAOP9QNciM=;
        b=oyawxqv1Yv52us1YF9c+vc/ZqlpXlQ+LhU/dZkiEIuG/Pm2uIUqjGsydHlfhHuVewn
         hGs6MEXr12TI14uMeOMwS8OiLqEQjLh0/OQsqFJ5JxvKp+aFg07eyH2x5eCU9Ju9Csil
         KmIqSJp+E+6xOh5tv2jZXNC9ymbMAQR90RwMYmXlYjLyuc+je4xNw6ibl7vRaZCK9beJ
         QXz/3o2tfv4MOt2X4hQmsLgVoHVZ7usGGfPReLKAqFiGJV2W5agZaztUFoNPGoKwatpW
         4n7Mr5tn8CwHMyU4D4FvW0ilYKlupm/dieqykU8BVbbSZAKcbs+GMv23Aj3AFFeLz4Eg
         2tOw==
X-Gm-Message-State: ACgBeo0iJ3zP5CZW8Fk7CnKDOiJ2ZIYY4zxMzaYX7WSD3n6yt/aTcz9m
	zKQmkywZcCnsDSr8IO6Iattv4ATk8dI=
X-Google-Smtp-Source: 
 AA6agR528CfhMK54X4lb9UdOjbJj7BVpXVXFbSe8+ZDiGNdxtYJumx0piLnSe4v9yprKKrREZ9lv0A==
X-Received: by 2002:a17:907:2e01:b0:730:9ecc:cd28 with SMTP id
 ig1-20020a1709072e0100b007309ecccd28mr12756831ejc.360.1659940733823;
        Sun, 07 Aug 2022 23:38:53 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 k22-20020aa7c056000000b0043ce5d4d2c3sm4092644edo.14.2022.08.07.23.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:38:53 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 06/45] rust: update 1.62.0 -> 1.62.1
Date: Mon,  8 Aug 2022 08:38:04 +0200
Message-Id: <20220808063843.3975130-6-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808063843.3975130-1-alex@linutronix.de>
References: <20220808063843.3975130-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:38:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169020

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-cross-canadian_1.62.0.bb => cargo-cross-canadian_1.62.1.bb} | 0
 .../recipes-devtools/cargo/{cargo_1.62.0.bb => cargo_1.62.1.bb} | 0
 .../rust/{libstd-rs_1.62.0.bb => libstd-rs_1.62.1.bb}           | 0
 ...t-cross-canadian_1.62.0.bb => rust-cross-canadian_1.62.1.bb} | 0
 .../rust/{rust-cross_1.62.0.bb => rust-cross_1.62.1.bb}         | 0
 .../rust/{rust-crosssdk_1.62.0.bb => rust-crosssdk_1.62.1.bb}   | 0
 .../rust/{rust-llvm_1.62.0.bb => rust-llvm_1.62.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 ...s-canadian_1.62.0.bb => rust-tools-cross-canadian_1.62.1.bb} | 0
 meta/recipes-devtools/rust/{rust_1.62.0.bb => rust_1.62.1.bb}   | 0
 10 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.62.0.bb => cargo-cross-canadian_1.62.1.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.62.0.bb => cargo_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.62.0.bb => libstd-rs_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.62.0.bb => rust-cross-canadian_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.62.0.bb => rust-cross_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-crosssdk_1.62.0.bb => rust-crosssdk_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.62.0.bb => rust-llvm_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.62.0.bb => rust-tools-cross-canadian_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.62.0.bb => rust_1.62.1.bb} (100%)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.62.1.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.62.0.bb b/meta/recipes-devtools/cargo/cargo_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.62.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.62.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.62.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.62.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.62.0.bb b/meta/recipes-devtools/rust/rust-cross_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.62.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb b/meta/recipes-devtools/rust/rust-crosssdk_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-crosssdk_1.62.0.bb
rename to meta/recipes-devtools/rust/rust-crosssdk_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.62.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index fda26534e8..0896020b6a 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"
+SRC_URI[rust.sha256sum] = "02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e"
 
 RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust_1.62.0.bb b/meta/recipes-devtools/rust/rust_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.62.0.bb
rename to meta/recipes-devtools/rust/rust_1.62.1.bb
-- 
2.30.2


