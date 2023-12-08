Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E1A7C4167B
	for <webhook@archiver.kernel.org>; Fri,  8 Dec 2023 14:04:14 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web11.35957.1702044245154221855
 for <openembedded-core@lists.openembedded.org>;
 Fri, 08 Dec 2023 06:04:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NPeeU6pB;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: alex.kiernan@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-40c039e9719so24163565e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 06:04:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702044243; x=1702649043; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UAThUWJIJFE2T6AMVmrc5O5UMxoiTOfyJXFloITcfnY=;
        b=NPeeU6pBGZOFV8Z2x+oYdrxzus7rKGJBJftxcswdSnPeZYt5KwUT0amcLA/iFoDtIZ
         zRyhIf+c2bIqB/LnfaqJFG7pPnhBigq8Fj7DbXk5y9XPyXv1S4tWLtsEGoJ8mDhH0Mg2
         EZG20LooH7+wCtiBv6crKLkSHRrgKa7DgaZ+xwbJI6jDWiAs8foZqbCEomvfHorVQVZv
         Q63W6ycmjcENfHJQKS6rpYUhmcf5QFZV45NIMnyUpn7va1+w34mvz3v7Thv4/jgCvC3z
         EMNx+rOSFudgzQbXe1L0ZRyOPiCZP1IVzt33Ml6o/Dl9I3vfqST/wvFPDvmUmzmKiS5o
         bblA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702044243; x=1702649043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UAThUWJIJFE2T6AMVmrc5O5UMxoiTOfyJXFloITcfnY=;
        b=FIJ31wRfSGOtzGNMvAl5cSZ/pMxuDnN7jKn0cJmkYgDdGg3DzIywkSS68aXRv5BAg9
         rMQBkl92OqKF3jC5POdMuZh4Ti/2qjEzFyR4G2bEc8nyMP5JVvaPQYOCPGItWrWu1l9Z
         +HhBiXL+ZvrI7MSV02sRAgw3nvWZvoT+JxeTxIm8k3c0DfmpUwGd+SN3blkXPjAIMyx8
         EDJZoA3OSwaPgrJD2q5lcdCEl+UeapemSuwV+r16wsAckP9btgdi2rAeW1wHSp2ZGp30
         o+g988XQjZ3n0tPhJLrD0d6z/s7xBBjku+iSdWf8RY0nUT89FN3E+nOn9+3sgqTQLydK
         whjw==
X-Gm-Message-State: AOJu0YweMP73eOOn5XtG3TW0/LJiFKViQSvsiBqSwMXmjOBEk/mj9I31
	oypP1/5jYmmUlyRi2WFUNHZYNRRcy7g=
X-Google-Smtp-Source: AGHT+IHYRbWGQS05a2rXX62lsS9qx6ko1BTxyBJZQIYnCqVRYLaCljrNSCc2RzPLxam7sIuXb/ePCQ==
X-Received: by 2002:a05:600c:cf:b0:40c:2d85:3a13 with SMTP id u15-20020a05600c00cf00b0040c2d853a13mr1167064wmm.185.1702044242733;
        Fri, 08 Dec 2023 06:04:02 -0800 (PST)
Received: from Zuma-000004PC.lan ([2a02:390:9c57:0:f8f3:2d97:de04:e800])
        by smtp.gmail.com with ESMTPSA id s12-20020a05600c45cc00b0040b3632e993sm5223722wmo.46.2023.12.08.06.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Dec 2023 06:04:02 -0800 (PST)
From: Alex Kiernan <alex.kiernan@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alex Kiernan <alex.kiernan@gmail.com>
Subject: [OE-Core][PATCH 3/7] rust: Upgrade 1.71.0 -> 1.71.1
Date: Fri,  8 Dec 2023 14:03:45 +0000
Message-Id: <20231208140349.3576-3-alex.kiernan@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20231208140349.3576-1-alex.kiernan@gmail.com>
References: <20231208140349.3576-1-alex.kiernan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 08 Dec 2023 14:04:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192064

https://blog.rust-lang.org/2023/08/03/Rust-1.71.1.html

Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
---

 meta/recipes-devtools/rust/{cargo_1.71.0.bb => cargo_1.71.1.bb} | 0
 .../rust/{libstd-rs_1.71.0.bb => libstd-rs_1.71.1.bb}           | 0
 ...t-cross-canadian_1.71.0.bb => rust-cross-canadian_1.71.1.bb} | 0
 .../rust/{rust-llvm_1.71.0.bb => rust-llvm_1.71.1.bb}           | 0
 meta/recipes-devtools/rust/rust-source.inc                      | 2 +-
 meta/recipes-devtools/rust/{rust_1.71.0.bb => rust_1.71.1.bb}   | 0
 6 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/rust/{cargo_1.71.0.bb => cargo_1.71.1.bb} (100%)
 rename meta/recipes-devtools/rust/{libstd-rs_1.71.0.bb => libstd-rs_1.71.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-cross-canadian_1.71.0.bb => rust-cross-canadian_1.71.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust-llvm_1.71.0.bb => rust-llvm_1.71.1.bb} (100%)
 rename meta/recipes-devtools/rust/{rust_1.71.0.bb => rust_1.71.1.bb} (100%)

diff --git a/meta/recipes-devtools/rust/cargo_1.71.0.bb b/meta/recipes-devtools/rust/cargo_1.71.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/cargo_1.71.0.bb
rename to meta/recipes-devtools/rust/cargo_1.71.1.bb
diff --git a/meta/recipes-devtools/rust/libstd-rs_1.71.0.bb b/meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/libstd-rs_1.71.0.bb
rename to meta/recipes-devtools/rust/libstd-rs_1.71.1.bb
diff --git a/meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb b/meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-cross-canadian_1.71.0.bb
rename to meta/recipes-devtools/rust/rust-cross-canadian_1.71.1.bb
diff --git a/meta/recipes-devtools/rust/rust-llvm_1.71.0.bb b/meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust-llvm_1.71.0.bb
rename to meta/recipes-devtools/rust/rust-llvm_1.71.1.bb
diff --git a/meta/recipes-devtools/rust/rust-source.inc b/meta/recipes-devtools/rust/rust-source.inc
index 3a192e42db7d..0729db6f0b45 100644
--- a/meta/recipes-devtools/rust/rust-source.inc
+++ b/meta/recipes-devtools/rust/rust-source.inc
@@ -7,7 +7,7 @@ SRC_URI += "https://static.rust-lang.org/dist/rustc-${RUST_VERSION}-src.tar.xz;n
             file://zlib-off64_t.patch;patchdir=${RUSTSRC} \
             file://0001-musl-Define-SOCK_SEQPACKET-in-common-place.patch;patchdir=${RUSTSRC} \
 "
-SRC_URI[rust.sha256sum] = "5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7"
+SRC_URI[rust.sha256sum] = "371af0fbe04051e20a74dbea6d4e4e548f10f15309c49cae2688afb882b6c7f1"
 
 RUSTSRC = "${WORKDIR}/rustc-${RUST_VERSION}-src"
 
diff --git a/meta/recipes-devtools/rust/rust_1.71.0.bb b/meta/recipes-devtools/rust/rust_1.71.1.bb
similarity index 100%
rename from meta/recipes-devtools/rust/rust_1.71.0.bb
rename to meta/recipes-devtools/rust/rust_1.71.1.bb
-- 
2.39.0


