Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7288C433FE
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:20:47 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.26833.1643278846942647756
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=F4XFq0Z1;
 spf=pass (domain: gmail.com, ip: 209.85.221.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id u15so3836154wrt.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YoGtMzaVoYVOUnTGy/m97sFCM5t4vit17xWU0fOMfTw=;
        b=F4XFq0Z1chFTR6jXXtGb4j6RGezBltBWPMqugv4vEnDbPVWws9Jru1X6UxnqCThKQO
         nlk1J1emSVl0EnO67n5LJTj/OaFZoPm5rUdnTFh4tlO8T4rrg9gchvLPGBLJfKDBPff6
         qVttyw5q/MNgylRFxEsSXmEvTQ50UwYBfsxgXvua1t1wXysOpViqFvkEG71nlsvnxwb+
         0RDudIuvKCeglsRUUQwmVuHYZU/xz9AE7kHYLFd9StSsLH4Sh/rMKlgXvXgc7haMeunq
         38ElD/DLWRhJbY+tqUJUUJMll0MohFkABwVb0Zc3siBScU1KFMALWbquAixomOFrTQ2Q
         L6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YoGtMzaVoYVOUnTGy/m97sFCM5t4vit17xWU0fOMfTw=;
        b=GjLrqryq3247tMrYOgvgNA1xVuQ9kUryobAIWOX8sN4zR4bDxTq7TM01Ry7qBd0il0
         3PwC8OaPPSmGNn1QEfvA7niU62mWEd2NTRQJB4c8uQNxWc/9NYz/yIr310DU40Pdk93W
         +d+hVguKKAc3oPoKqvGiZyKdN84TZ3vyxoLdChAYBfSmHvj+eK6E4IqaP9BcOYRj78kS
         x79UR4qBUNx/M1T0zGO4XYw3DTQfMgvQ7fcnLPDFKuYPKfJfi1RoDAi2T1ZeQcORZbGY
         tb9qgUUGsKtXMRWzt02A9ZNKUn4kLBKLE9a+Qc5IdV3BsmFWlf6atQQQCnFRSVYnKr8S
         A9AA==
X-Gm-Message-State: AOAM530m5opMaVRO8VgcRzPNflAyN8f/K+uMRLJRkS7sekSJp1TTa72m
	bv4ZAH/sHiJWaSTBepq20BbSUFpAK0U=
X-Google-Smtp-Source: 
 ABdhPJzTHZwMVblxG8O+fWEw2brnWqYKths1m5yhVG5eL08UdgAFc7askihpH5iTHLS/cgZaNcNDxQ==
X-Received: by 2002:a05:6000:2a7:: with SMTP id
 l7mr2534174wry.170.1643278845576;
        Thu, 27 Jan 2022 02:20:45 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 t14sm4060849wmq.43.2022.01.27.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 02:20:44 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/17] rust: update 1.58.0 -> 1.58.1
Date: Thu, 27 Jan 2022 11:20:00 +0100
Message-Id: <20220127102005.3050843-12-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220127102005.3050843-1-alex@linutronix.de>
References: <20220127102005.3050843-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 10:20:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161034

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-cross-canadian_1.58.0.bb => cargo-cross-canadian_1.58.1.bb} | 0
 .../recipes-devtools/cargo/{cargo_1.58.0.bb => cargo_1.58.1.bb} | 0
 .../rust/{libstd-rs_1.58.0.bb => libstd-rs_1.58.1.bb}           | 0
 ...t-cross-canadian_1.58.0.bb => rust-cross-canadian_1.58.1.bb} | 0
 .../rust/{rust-cross_1.58.0.bb => rust-cross_1.58.1.bb}         | 0
 .../rust/{rust-llvm_1.58.0.bb => rust-llvm_1.58.1.bb}           | 1 +
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 ...s-canadian_1.58.0.bb => rust-tools-cross-canadian_1.58.1.bb} | 0
 meta/recipes-devtools/rust/{rust_1.58.0.bb => rust_1.58.1.bb}   | 0
 9 files changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-devtools/cargo/{cargo-cross-canadian_1.58.0.bb => cargo-cross-canadian_1.58.1.bb} (100%)
 rename meta/recipes-devtools/cargo/{cargo_1.58.0.bb => cargo_1.58.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.58.0.bb => libstd-rs_1.58.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.58.0.bb => rust-cross-canadian_1.58.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross_1.58.0.bb => rust-cross_1.58.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.58.0.bb => rust-llvm_1.58.1.bb} (99%)
 rename meta/recipes-devtools/rust/{rust-tools-cross-canadian_1.58.0.bb => rust-tools-cross-canadian_1.58.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.58.0.bb => rust_1.58.1.bb} (100%)

diff --git a/meta/recipes-devtools/cargo/cargo-cross-canadian_1.58.0.bb b/meta/recipes-devtools/cargo/cargo-cross-canadian_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo-cross-canadian_1.58.0.bb
rename to meta/recipes-devtools/cargo/cargo-cross-canadian_1.58.1.bb
diff --git a/meta/recipes-devtools/cargo/cargo_1.58.0.bb b/meta/recipes-devtools/cargo/cargo_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/cargo/cargo_1.58.0.bb
rename to meta/recipes-devtools/cargo/cargo_1.58.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.58.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.58.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.58.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.58.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.58.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.58.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross_1.58.0.bb b/meta/recipes-devtools/rust/rust-cross_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross_1.58.0.bb
rename to meta/recipes-devtools/rust/rust-cross_1.58.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.58.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb
similarity index 99%
rename from meta/recipes-devtools/rust/rust-llvm_1.58.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.58.1.bb
index 222c20ad3c..5b94e22f7b 100644
--- a/meta/recipes-devtools/rust/rust-llvm_1.58.0.bb
+++ b/meta/recipes-devtools/rust/rust-llvm_1.58.1.bb
@@ -3,3 +3,4 @@
 LLVM_RELEASE = "13.0.0"
 require rust-source.inc
 require rust-llvm.inc
+
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 63ba02b299..92b1535130 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "37dce222b82a438e550ccd5e45ca9bad1c57aa7acc7adfec6a897c4ff94b6485"
+SRC_URI[rust.sha256sum] = "2b3643a48e7087053b0268971ec4154350342508922a8acb0707aaf94deb4469"
 
 RUSTSRC = "${WORKDIR}/rustc-${PV}-src"
 
diff --git a/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.58.0.bb b/meta/recipes-devtools/rust/rust-tools-cross-canadian_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-tools-cross-canadian_1.58.0.bb
rename to meta/recipes-devtools/rust/rust-tools-cross-canadian_1.58.1.bb
diff --git a/meta/recipes-devtools/rust/rust_1.58.0.bb b/meta/recipes-devtools/rust/rust_1.58.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.58.0.bb
rename to meta/recipes-devtools/rust/rust_1.58.1.bb
-- 
2.20.1


