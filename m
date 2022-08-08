Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77A0AC2BB41
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:42:56 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.22449.1659940967993206961
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MQ5rUlxM;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id b16so10073963edd.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KalwwfOveWr7php+LDjFsk2GRiO2pXL/xGAOP9QNciM=;
        b=MQ5rUlxMwf8Sw+lNpSCn+wAEHeABOqjIWiTGoAPQG/X3U2+XmRik6Xdt+MhaSzsBxG
         v8dN/2R4uONJBpiEuwaDhSYQaQctKcTXvv4UKpCvWYTtYpkR7eC1E5eIihUuZNnnEd4s
         Vk9s9QW0emqbwc3fS9wWViAfN4vuMzvOxBKS26DbP+Jrhsh5RoXg4aTqRcdJYnXLoCCx
         widEYFHoOmjoAfZqIqxP2tT8HVJWv2c74ejdiHnbTSLVS4WCWp66iqwxOZP6ltCbfuzu
         XeujAQZiSPEyzGKwqPw0PiQp+Slb7Wa8xKjR/IcjBt5B/ltuSK1CUrVzSAl/MuIOVF4/
         TSBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KalwwfOveWr7php+LDjFsk2GRiO2pXL/xGAOP9QNciM=;
        b=PzY2AOTfaxsoOUjNXdxl/D/rKdgNhkjTZ/zuPEPwL/+gnfJSxSG5TyQrT3tZsYFCR2
         tXYSH6RjTarVYwauKJYka4nbb80zBEYEj4srVMN4bTigefkpV995PrGVwEVPUfrAamtY
         w1ZNAh0pYWuc/hPYqzim2Dzxq0M2MKu6DoMe7JDqQhaj0W9qssq3dXDcTWDor9bDrx5T
         /QwhTwbaGULPRdAPxRSt+yeT4O1h594KxL+815nsO7w42cyWBIvwgfFo+7pqW3tJHHuz
         0UFLjVH18MgfYtTuOcLXbcIa/cem6enCYZOY9T+a3J7wdhiSjxGNfZgnpcbSmc+kEQmH
         9xwg==
X-Gm-Message-State: ACgBeo0U+tJTYUAWxAJdhZF3UG5ZiUDWrmYlpIwlYuM3fCbgkb4UsnRy
	DdyLonmoA4/2dKjXIpvST/ykCLv6zsc=
X-Google-Smtp-Source: 
 AA6agR6qBeM6R8LKxpBSjzC1yPWFKd1yLFriNzkkf0QtT/fjOK9o14goxkMW0HNz867pCC/+hax5MA==
X-Received: by 2002:a05:6402:270d:b0:43a:67b9:6eea with SMTP id
 y13-20020a056402270d00b0043a67b96eeamr16518520edd.94.1659940966519;
        Sun, 07 Aug 2022 23:42:46 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:42:46 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 05/44] rust: update 1.62.0 -> 1.62.1
Date: Mon,  8 Aug 2022 08:41:58 +0200
Message-Id: <20220808064237.3975347-5-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:42:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169029

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


