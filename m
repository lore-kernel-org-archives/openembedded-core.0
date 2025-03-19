Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37683C36007
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.2926.1742372192844682372
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JYuLnnST;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-223a7065ff8so37242625ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372192; x=1742976992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=JYuLnnSTzy9+pQcxBOdgFxrVC2g7BQcWrnlyJwYXX7w/vbfnH6bhzjlyBBCQlh44/x
         VnCsWkYM5gMbwG5JNau3mg+kWeHJ9ViK4bRJKMZudkt7xa4Ungo3UU3UPdnzJsyPbrnn
         cEHOfZ6v0IjQtDfLLSPkvgsxCUPlEeqGa+tGONe5x51eF1ZSyQw6hkUwdZ2cAyiTPQ7x
         HiRz53K+rIgCfMmVK+UiH8eIVA1UDRHrOU9DI3PZKZloirxjU4Pvq0rxVNbFsDTxJX+6
         tVsCbsxiw6xgcsMfmkKOHPFOEEVcr6lp5MY4JIV/izmeon0xnjx/CMyTCyNAIRW3aiCq
         YGKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372192; x=1742976992;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z8htbS5eHG54cm53T1cvh9m41VKMDCvM1oYLBVAL5ck=;
        b=eFLP2zvzaWPZRM8K1d+O2cgqkcYT/6YgUV5IYTxwEf+2M7+M78dRWaR3T44kaaCHZ1
         WQj+3ZABNOkvlakeE1JkWasEeKJDU7Fedus+CC7nA9RA+Bnai8662PZTm1r37ROsRrdH
         kzqr6Uypml9eZ4Rk3Kp3LwR8h4JWKB4HQrCPx9CTHIWy2zpy9nw/5aWBo6PpXhC5+MO7
         YctOmmo3m9+DYDIytpAbrUktnivd7yKjFIKtVY8/uro8+EtWzmP/97lkQzHclWlPqRXV
         EhGIJ1wV8xQzN17Wv5qfNbKRnSr+mvtgDexpR26PTnBrmVesyMEiCaEelkru9ivvQWOQ
         OI/g==
X-Gm-Message-State: AOJu0YwhPtDe2tKlln/YQZXXSmmDurVVfkBqfmszqHAb4L0cPymWZ569
	gehEfs3kf3cwSQWZSiOpM6fdgvoRgWJwBUU0nSlxz0XpH5XGQi05ljGCEobP
X-Gm-Gg: ASbGncuZPJp+lFjiPKPRwKX0XVJZ4SkIbEZ4MBOVHA48E/rYOPFPXSiYo58F3geZUeU
	2PGjKzTy370aNLY7kxvLYYUJXIZfupsD9TFiKR3m4nQGVjDDvpHDEluhl4Bol2rkVqz3bBtC/rt
	VUGCCcBx4f7a9W05CBXj9H5bHkna09bRCVxZvhEWjIdd4tysceo8JMCBR9IUYdGh2RXzQbBumgy
	SQGmwxohRxkvIQT25UUYnDC+RHTetc5iNgaiqG9NvG2xpnFCcKw7iakLeZHUXv64Dp5gelETuCO
	//dWkPLz3YriVs/T9ABvGc61CB06LSwdhxvM
X-Google-Smtp-Source: AGHT+IFUvbZedk3YHqDB6CPfb5m7iqfDTjUtm37b+R6v4Nvy7MCDAkc+kezFUIUue9liAf7EkCEgjg==
X-Received: by 2002:a05:6a00:ac8:b0:737:e73:f64b with SMTP id d2e1a72fcca58-7376d5e9c29mr2388466b3a.1.1742372192026;
        Wed, 19 Mar 2025 01:16:32 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 17/27] cpio: Pin to use C17 std
Date: Wed, 19 Mar 2025 01:15:50 -0700
Message-ID: <20250319081610.3536475-22-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213288

Fixes build with GCC-15 which is defaulting to C23

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/cpio/cpio_2.15.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-extended/cpio/cpio_2.15.bb b/meta/recipes-extended/cpio/cpio_2.15.bb
index bfaf5c31c37..b081bd53db5 100644
--- a/meta/recipes-extended/cpio/cpio_2.15.bb
+++ b/meta/recipes-extended/cpio/cpio_2.15.bb
@@ -20,6 +20,8 @@ CVE_STATUS[CVE-2023-7216] = "disputed: intended behaviour, see https://lists.gnu
 
 EXTRA_OECONF += "DEFAULT_RMT_DIR=${sbindir}"
 
+CFLAGS += "-std=gnu17"
+
 do_install () {
     autotools_do_install
     if [ "${base_bindir}" != "${bindir}" ]; then

