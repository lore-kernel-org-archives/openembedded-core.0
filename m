Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73819C25B0F
	for <webhook@archiver.kernel.org>; Thu, 11 Aug 2022 19:58:21 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.2520.1660247892807032417
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lD9Odzht;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id fy5so4520713ejc.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Aug 2022 12:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=D/e7UyDuQ5UUla6aoOhnEmXy2PZabYT5UIUQOBzWMfE=;
        b=lD9Odzht4yf2vksp2Mka3BpWYruK9BX+6IwfNxJli6PQDD22hvYr/ja3QM2rEIBAFw
         IUH86fgvm4xQOHardouiTxggobMlStaOe5wnfxlnzcz+iFx6RcpGQ4ZEvg82genIJeTM
         E3fBwicsmrGM/mziBZeDV5MgaOKPeZvIwAxrR6jOgdzTwFZ58udDV7hacvDxG4M0qJ71
         rcZHbmT9etQEv3GnhU7oPQzVp8MiEDg/i2RE9RKqgCjEwsvjMooJ0ZhwOtryhYHOyGid
         PUMjhoDSQ4d2EI3ToayLIcZg6KefJmIh2Py0ipLx+cdW/jaPre6XFHquCz1mMfl/PtdN
         fJ1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=D/e7UyDuQ5UUla6aoOhnEmXy2PZabYT5UIUQOBzWMfE=;
        b=f+e3DRxVug/YtXWiHzz+JccUHtjP36S/RwESSrFKwxq6Nmjw0oe6/8H0NQ83/LtnET
         3FNUYyVXw2/xgs3uTNqm3TKSinqUqcLkFiQyh8QKcjW+mr1ZlriuYRtovYecQg80mfzN
         n1yRT6T6iWgCN3I5Nn7XZ8KszzVzlzp9IZSwxQTO0aKBWTuEhm+i8oJnGBYZL4L9IaPD
         E5TZtuLQvhhN2PDG5NWvEZf5clnYyRNEBmWCiarcorIUcvqBAozk4e59JC4K5JjLsSzU
         CpwMWY7PmZdmCGAQr41n3FJ+OtdqVnf7PdC22jCq9AF4/JA/oqkQrx4GxtkH45njmUp/
         kpQw==
X-Gm-Message-State: ACgBeo2nKc3zl9c5o6Td638ql8YfsR66SVt+H5SESjsbv4elqbuXpo2w
	MBxMnB0LV9JRYB0jq0sGbdNw+mJXzng=
X-Google-Smtp-Source: 
 AA6agR7crI/gPZHia8mDMnLS0VuiMSuX8PciGZbT/F3QU/WRbQPthBqLOpihUl2NIRTK7fNI+8zA0w==
X-Received: by 2002:a17:907:8687:b0:730:7c7b:b9ce with SMTP id
 qa7-20020a170907868700b007307c7bb9cemr434230ejc.656.1660247891379;
        Thu, 11 Aug 2022 12:58:11 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 fu18-20020a170907b01200b007308bdef04bsm22010ejc.103.2022.08.11.12.58.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 12:58:10 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 2/7] rust: update 1.62.0 -> 1.62.1
Date: Thu, 11 Aug 2022 21:58:01 +0200
Message-Id: <20220811195806.1571221-2-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811195806.1571221-1-alex@linutronix.de>
References: <20220811195806.1571221-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Aug 2022 19:58:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169264

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../recipes-devtools/cargo/{cargo_1.62.0.bb => cargo_1.62.1.bb} | 0
 .../rust/{libstd-rs_1.62.0.bb => libstd-rs_1.62.1.bb}           | 0
 ...t-cross-canadian_1.62.0.bb => rust-cross-canadian_1.62.1.bb} | 0
 .../rust/{rust-llvm_1.62.0.bb => rust-llvm_1.62.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.62.0.bb => rust_1.62.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cargo/{cargo_1.62.0.bb => cargo_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.62.0.bb => libstd-rs_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.62.0.bb => rust-cross-canadian_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.62.0.bb => rust-llvm_1.62.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.62.0.bb => rust_1.62.1.bb} (100%)

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
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.62.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.62.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.62.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index b814574e55..dbcef2cbc2 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -1,5 +1,5 @@
 SRC_URI += "https://static.rust-lang.org/dist/rustc-${PV}-src.tar.xz;name=rust"
-SRC_URI[rust.sha256sum] = "6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e"
+SRC_URI[rust.sha256sum] = "02066a93c2f6596cc046a897d5716c86e3607c1cd0f54db9a867ae8c8265072e"
 
 SRC_URI:append:class-target:pn-rust = " file://hardcodepaths.patch"
 SRC_URI:append:class-nativesdk:pn-nativesdk-rust = " file://hardcodepaths.patch"
diff --git a/meta/recipes-devtools/rust/rust_1.62.0.bb b/meta/recipes-devtools/rust/rust_1.62.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.62.0.bb
rename to meta/recipes-devtools/rust/rust_1.62.1.bb
-- 
2.30.2


