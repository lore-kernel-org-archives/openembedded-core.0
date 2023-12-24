Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F6BC47074
	for <webhook@archiver.kernel.org>; Sun, 24 Dec 2023 23:09:50 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.35973.1703459388006952119
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Dec 2023 15:09:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Yql1miCp;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-40c31f18274so47030725e9.0
        for <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 15:09:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703459385; x=1704064185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MJy3gi83++rYc9rum6HKgcEEZle4oR4neaymuG/um8E=;
        b=Yql1miCpWbXCNBngrR4NXbusp2H7ibvsuy3xjI9tMJPlN8BVMkNjkN9azqnZmAINpH
         K5L1DGrzM3ciiwUbMCyp+5tgsbZxl582MxBV3UJveeKa/4oo/Zn1ES3F/EpJ8gNmAYca
         45qlTc60vmzAbKlKV0Tc/qpXjn8HKLlPQuZtk/3dTbc2vXuFRXlCYFMuhM0jxXTfjuEN
         Tp+JdkrvfnT06BDGGV6BXUBd2SlXLmzN2a4fYVhIQJ6GV03rHfuyNaJ2w1JuNY52mLny
         YIRK5kwUcVF8K5JdXKsUISykhdueRGdbMWDr7ikGhyEmrqEuWFCOzs98VqJcBuR8JUKe
         QQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703459385; x=1704064185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MJy3gi83++rYc9rum6HKgcEEZle4oR4neaymuG/um8E=;
        b=agoT4Ig6cJY9R6gVIf3neaGsDOd0Y01q8tIHcWL4i1LylZw2AYU0UezZFkz+OVi0lQ
         zDsJkPNdPILCk7WjCcSlymO1kJvAx3yAAhW6ouj18UG07YNA7hdovVNPomzJjqp+x/tj
         u1q1eFnGHYOrfA1UiexwS8wfKWQg7uD887Mqu5Unpd1/H0iIQBufGrrAnRO7ttUjI3Am
         CKUW0gEJMWSjkLAyIooXANYAyFuo99J6+mhCfP5MLBhGspFu4FTgZ49LEmFxxzkUfkkt
         IWBs/9SdAB89I1Y+3YdEXFuAh2f5ruiXxWpBG3AAUP/lT7w+8Igjox+Y7yiyIcQ1aX0I
         9o9A==
X-Gm-Message-State: AOJu0YxY02i3Otqodrlj3IssNRFzQJPH50irm47Q3jX7xcBC6P7Cu5f1
	ahg+CoP5IZ0ZvJ7o0Aed6TPtAmjo7VQ=
X-Google-Smtp-Source: AGHT+IF+rPd/t2XlLfdVyIz0W08+cBbZAlbx1xpdaqMc/IVro5mF/eyDFvFF0FlSkFE/78yn42++nw==
X-Received: by 2002:a05:600c:4f15:b0:40d:54a1:99cf with SMTP id l21-20020a05600c4f1500b0040d54a199cfmr722789wmq.86.1703459385108;
        Sun, 24 Dec 2023 15:09:45 -0800 (PST)
Received: from Zuma-000004PC.lan (cust18-dsl93-89-130.idnet.net. [93.89.130.18])
        by smtp.gmail.com with ESMTPSA id b6-20020adfee86000000b00336344c3c3fsm9122309wro.90.2023.12.24.15.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Dec 2023 15:09:44 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Frederic Martinsons <frederic.martinsons@gmail.com>,
	Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 6/6] rust: Upgrade 1.74.0 -> 1.74.1
Date: Sun, 24 Dec 2023 23:09:34 +0000
Message-Id: <20231224230934.831-7-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231224230934.831-1-alex.kiernan@gmail.com>
References: <20231224230934.831-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Dec 2023 23:09:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192900

https://blog.rust-lang.org/2023/12/07/Rust-1.74.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/{cargo_1.74.0.bb => cargo_1.74.1.bb} | 0
 .../rust/{libstd-rs_1.74.0.bb => libstd-rs_1.74.1.bb}           | 0
 ...t-cross-canadian_1.74.0.bb => rust-cross-canadian_1.74.1.bb} | 0
 .../rust/{rust-llvm_1.74.0.bb => rust-llvm_1.74.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.74.0.bb => rust_1.74.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.74.0.bb => cargo_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.74.0.bb => libstd-rs_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.74.0.bb => rust-cross-canadian_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.74.0.bb => rust-llvm_1.74.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.74.0.bb => rust_1.74.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.74.0.bb b/meta/recipes-devtools/rust/cargo_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.74.0.bb
rename to meta/recipes-devtools/rust/cargo_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.74.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.74.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.74.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.74.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.74.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.74.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.74.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index e8dafe59c9b0..83a0dbc15fae 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -11,7 +11,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://0005-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
             file://0001-Revert-Map-source-absolute-paths-to-OUT_DIR-as-relat.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "23705e38c1a37acfd7fbb921c5dd8772619476e80d0b3b39ac8eb45bc0c33187"
+SRC_URI[rust.sha256sum] = "b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.74.0.bb b/meta/recipes-devtools/rust/rust_1.74.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.74.0.bb
rename to meta/recipes-devtools/rust/rust_1.74.1.bb
-- 
2.39.0


