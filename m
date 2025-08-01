Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 717B9C87FDB
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 04:22:55 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.80418.1754022169168665681
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Jul 2025 21:22:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cMjd4KVu;
 spf=pass (domain: gmail.com, ip: 209.85.210.181, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7426c44e014so1667225b3a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 31 Jul 2025 21:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754022168; x=1754626968; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vjfLz8IBKhB9/c41F6nHzT3BQSi5SS4EQ1n486ylgcw=;
        b=cMjd4KVudvn3sc3NrimOiP64LidCqSRwBDj+Ua4mIi6cnXrNr/7mzbcZ94Tw3DRsyW
         Kpei76SnKVK2H9yHaYK33MqEYMPnZJVW2/4bkG7wPYJAXYgrn8HdrUS5s8daqRnbG1+B
         rOStdYbjo1FkUg7vB6dnkJs5xkaOaiX6P5e9Grc9+LBzXcMuOnm184RmOgth4f8RAkRN
         h59fJJQn2r8x3h7hh3lqFxpdI5lPohlgZEqjUOF2/RkZ7cVIkJ/1ryy4zJWsY4gZ91Mr
         +pKv3Ox29/2n2mr0X4YCJQzoNrFI9wFavMcvmPNEG4G6DrwHndOEWfzdXc66dW8159N0
         Ke9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754022168; x=1754626968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vjfLz8IBKhB9/c41F6nHzT3BQSi5SS4EQ1n486ylgcw=;
        b=FTtzmwd/9DjP89eHzfcXVfVZEz0Mer7zV99JVqypFr02/nbVuogT1coapnl4kWaOJs
         mTbgASVVmblG+L5NNuxL42LVbmZnLHS+RwdFbpiMIHX/LV5fdpyQnsR0zG6fXCNyNTQp
         5snv4p9DLBGhJv5GrHgfT3TIF+nF2oD9jEnxL4DDRJuCJ+m/SMaPb6u/dOw0Us2potSi
         +ZMzg23GyCA279YzzSZE+QZDM8oAEWCcZ+YgvFT8fKPuVn1EBntnOP5K68VICr/MtA1E
         pEUzNRR70IzmjO47noJ/x3OTmcI8GR6ZO92hBYUKLBa9BwXHAsaUD2/ozejyKJnzdxhq
         nvng==
X-Gm-Message-State: AOJu0YwyEOuFrfIQHGsnqcVMfOGwmznm2s0mLusEFt/Qwf1mNJb5R21C
	sFoJeKRPWjUYMhPPo9JboPXZ/gzlJ4pbR1QVALOGK4IbF3qbwT7DNXt33fk/qf1u0QU=
X-Gm-Gg: ASbGncsU8WADDEzQ12JEFkHtCdmohJUkFlJ9EekEuz2C36biWHy7AfyguUdFxxJgpKq
	yh0uVJJrREonYGxOM1HmBI60nY5cLmGJoxp682cFxhlZ1KPmvs5+myrhCShe0jEJXBiR+Qv1+nG
	tlq5F47VlvBH4YaZ+JtXHUTxNPNytgbKabke2VzxEyEy/u5FzHt1ZjpKX6+psp1o+nMrXTXFZuj
	gnxdninU5HJTaD5lxIi7Lp6PY8sprFTCNaZuj30uwpvTJErNMk4+Zj5jJCU8mybPlAVKVE2Wsha
	m+Q5reOQCdGkgHvZMuAtdICUldYbtZMvoc8aFBBwW0z9uHA7NRj5Z9F36ruRiaOz2gFOAs3HjOR
	Bou67I1df8660ig==
X-Google-Smtp-Source: AGHT+IGE/p8VFL23M79Kzix3spss8s8hPxNoPgtpkfIJfS32fEbNsXBZrZyVXw3c1Y93Ic7tqJfEiA==
X-Received: by 2002:a05:6a00:3c86:b0:76b:c626:cedf with SMTP id d2e1a72fcca58-76bc626d03emr8861265b3a.11.1754022168222;
        Thu, 31 Jul 2025 21:22:48 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::a237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76bccfe9003sm2950780b3a.125.2025.07.31.21.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 21:22:47 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 5/7] gzip: Always use GNU ld for linking
Date: Thu, 31 Jul 2025 21:22:39 -0700
Message-ID: <20250801042242.3076232-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801042242.3076232-1-raj.khem@gmail.com>
References: <20250801042242.3076232-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 04:22:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221217

Linking does not yet work with LLD

Fixes
aarch64-yoesdk-linux-ld.lld: error: undefined symbol: gzopen
>>> referenced by minigzip.c
>>>               minigzip.o:(main)

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/zlib/zlib_1.3.1.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/zlib/zlib_1.3.1.bb b/meta/recipes-core/zlib/zlib_1.3.1.bb
index e62c50c5df7..96b7a5821ff 100644
--- a/meta/recipes-core/zlib/zlib_1.3.1.bb
+++ b/meta/recipes-core/zlib/zlib_1.3.1.bb
@@ -20,6 +20,7 @@ SRC_URI[sha256sum] = "9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b
 PREMIRRORS:append = " https://zlib.net/ https://zlib.net/fossils/"
 
 CFLAGS += "-D_REENTRANT -fPIE"
+LDFLAGS:append = " -fuse-ld=bfd"
 
 RDEPENDS:${PN}-ptest += "make"
 

