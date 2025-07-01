Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0D1C8303F
	for <webhook@archiver.kernel.org>; Tue,  1 Jul 2025 20:57:08 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.8017.1751403426315269658
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Jul 2025 13:57:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=giuSFWuu;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-23649faf69fso33551395ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 13:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751403425; x=1752008225; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=giuSFWuuKiz6AeK+lASn+J7Jxz7AFRPrmU2625y+1Vp63hFexUMNB0lxJgKmoMo/s5
         YhUrxyvkOoRrm65QQtWueg695e/4Nk7VRfAldYwHVtHrj70J8ADQYTiMD7JFHhnbtrq8
         o2Fi5dQzOWp37YMurkIvki7/kwPNlBtjQnOFxQtKxWB7tPm92gCJRbYE3qBIEY43CQhR
         5ZIgmLMaQlPkOep5O4RATabCJL3hYErbA2EYkWx/OGJUQChd/NpCKBgbMEdJhQmiOVak
         bsCj+waWUyUcBIbe1MW637oaBlaFy+m5L2/SATT6q/e0uaV5bArykon7tamjMAj+dSNZ
         E/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751403425; x=1752008225;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdXxI1PzvtCbloJr31Z+42X2RFFS02EnDFVgioTJXwA=;
        b=gT8nuTAHjnOVAd/vVXa7L1AVOGXJGfBOLnRtNARSE0pvvDhahPJ/hBDESuFRXdBRqi
         LGchZvrkg/N6H5mPlFdFLNxYvTfLJqQ8RMd0DuD/enFTNTmRJ126LVUwqb/BjN+FtCrO
         UUdkfgiNBNL9p/DPlYw2IlqhZGLQdlvrfuUHoGFglk9DC0ecppP+zUMiSs+Vg+KFH+wl
         WlHzc48/8SoJmRgqRHeTu24bqCPoswPb+CmxPaQahDlkClET3acwPZt67rjdK0GXW9NA
         kBmELvO31Gfld/kJaEYHzT9JQVyu322E+SsDpoC1WYQOV/DLFdSQkB3+YSAvs72T9Wfw
         RVxQ==
X-Gm-Message-State: AOJu0YxnP23HIufq/vKWTNGmw3PDpgSI3LW1+FMoaQmvl/Jrnmf1M3rN
	8a4wSJ6djLloYc3mi42/Yx412rsYK1Zj71kWrWTy21nH4JYRqF6wGujlxNw7uYh3
X-Gm-Gg: ASbGncsTj+5Khowe05DWAboZ2J9Sst29AhQQM2F8eBGQFIKMK2HEZjgMF2dQHwp04PZ
	orObqfkJ+QNfIUXD6zknjCpWRJscMD9Ih1WLu68uIh1o0CSRH66GXixiApbKG/WKeMQF0Su/ZAS
	81nYgMKE44h+gIwqkgCQevyVowWuQsiECYh6jksB9r1rskFaUpPuWMTfX4RpTizOh5TlPoOO+ll
	PoGwR2ykbJZQjxFCByzYv3s0EwxQB/IN0Ela8FbLorHA6pEQUYx/+PsuesfFnfEwSBQ4BpeU1O0
	j/mH8CqsvSKUDSCVPG+L/4JH1ethCcj8C9TBFPa+3KsTzxDxNogzXc5a8I3SHkF7
X-Google-Smtp-Source: AGHT+IGYJBL9GnJI3hqRD51bniSSqVWD1Vs8MCwDdMiVbbYgP5AqAR8vM5VPPXjwqzmB36cNBEYkgg==
X-Received: by 2002:a17:902:ef10:b0:234:d431:ec6e with SMTP id d9443c01a7336-23c6e48b6b0mr2531665ad.3.1751403425367;
        Tue, 01 Jul 2025 13:57:05 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::aa8c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3c7028sm111549705ad.222.2025.07.01.13.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 13:57:04 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/3] base.bbclass: Deferred inherit native toolchain class
Date: Tue,  1 Jul 2025 13:57:00 -0700
Message-ID: <20250701205701.3322308-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250701205701.3322308-1-raj.khem@gmail.com>
References: <20250701205701.3322308-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 01 Jul 2025 20:57:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/219722

use TOOLCHAIN_NATIVE variable for selecting native compiler

Default it to PREFERRED_TOOLCHAIN_NATIVE, a recipe which wants
to enforce a toolchain can do so with

for cross toolchains ( e.g. target, nativesdk )

TOOLCHAIN = "gcc"

For native

TOOLCHAIN_NATIVE = "gcc"

This helps build native recipe with clang as native compiler.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes-global/base.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/classes-global/base.bbclass b/meta/classes-global/base.bbclass
index ac145d9fd64..6be1f5c2df2 100644
--- a/meta/classes-global/base.bbclass
+++ b/meta/classes-global/base.bbclass
@@ -30,8 +30,9 @@ PREFERRED_TOOLCHAIN:class-crosssdk = "${PREFERRED_TOOLCHAIN_SDK}"
 PREFERRED_TOOLCHAIN:class-nativesdk = "${PREFERRED_TOOLCHAIN_SDK}"
 
 TOOLCHAIN ??= "${PREFERRED_TOOLCHAIN}"
+TOOLCHAIN_NATIVE ??= "${PREFERRED_TOOLCHAIN_NATIVE}"
 
-inherit toolchain/gcc-native
+inherit_defer toolchain/${TOOLCHAIN_NATIVE}-native
 inherit_defer toolchain/${TOOLCHAIN}
 
 def lsb_distro_identifier(d):

