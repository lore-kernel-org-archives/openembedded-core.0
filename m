Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B05A1C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 05:52:42 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web10.33443.1738821160174065396
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Feb 2025 21:52:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NLOymGa+;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4361b0ec57aso4844635e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 21:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738821158; x=1739425958; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=NLOymGa+CaWeXGPf6dzbCfqHzDENH1TYQYMs/mVUR1VfcjkDusjxu+6ijs28YeETVK
         3ndcF6gpt+65812dp3Gk4k1/FL7+rLT9vGASuJtCPx6/7HZPXXG39a6++fHwfF4clF32
         DMvUg+9qfu3VgUAaFlrUxJGb74/OfZwkap8TjYrRNqOzRMS6cHSu2YoSse23BBwk6iMZ
         EF2Qb3vQ3aya7tEvVYlhqPaja3aECkNCn1UgZhRVfX+GvCpXNEryqciMNKlJkPHOTs2a
         iUxdCOBRxoay6vyxjy5dnb2E+OE6rc84mWvj6NBelrk83Amzvb+kfYiesVigzB202Krc
         nPCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738821158; x=1739425958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTfvEU+fE4BHGbvdhuF8cxM6p4lUxcDUI+coObHyPiI=;
        b=e6ioLCTuMCvrl1YI9jrOWjRRP5EoNaY9uHoPOAT/C8vYLazrIkIBhb6HazQxGtly6L
         3iLorlnSEZcGJ6BiWgZTAlXWclUjTRGpmfkhf3l0Gim9IAu+nyI8tr492f+muCOjrazD
         RS5RLFPFLmCp5aiFpNE+TZvWsuxY4Wf+ahOxK6NumcYCruKZeqPtSMQP64AyTZOedbIj
         jZUs8oPuVKMjRS057BnwpIUIJ5l9FjZcOoVVs7N0MMsyFZXQ4kzZ/7Eb6lxGc98o7Cvz
         rN2zOiXrwAUjIxrLc9B30TxZEzhp+SlZ6E/BrPPZ72J2W/BZgtm/G/Y/tawSaYt91nXj
         JpxQ==
X-Gm-Message-State: AOJu0Yz3vwf+pJfAvtQKfSOtxnTY0GD9qy2BIjLDzO3+mSScngHT8E6a
	G1Q3Gl8dTtDpLpajh2zYgDStXjY13s0hqnx+6lr7f3zBAaQDxDK7Ttu/OQ==
X-Gm-Gg: ASbGncv2Ov5fZLpoiKxlU1zNjjWHrlT4qOL4NXXaZY1Z5603/Nqul6nAGbZLekR2sn1
	gpj1fjYS8bT2xDJoENaRqePQGnkSnWqo5m0P4XyPQZ0ieYiMApRlyUFJMShfUbOUDh46ZmVymUJ
	hZ/Z5tqIiwqZsICkl7D21oc6aR2D/n//EzdaKUtVYAJLHxSprRukKWB6D6cVX+LN3KUHfCB5zN5
	ulV9Iwhgdtgr1Inj2JHSP/vXbHacEP4DDl0Z91Y68UOh9U25DZ3M69vLWyTt7892UEFBq6peMms
	zFAhRPoCiENbY8lGZCfgUeuT15RMCsfNPPf32aZpQCWsvQ==
X-Google-Smtp-Source: AGHT+IHquqv+bRHmp0I9VpNUscLubbHnpm5eQUL2Gn3gqNAVAjp8z7Fof9CSVE1DqwYQDGwgbHLkAA==
X-Received: by 2002:a05:600c:138f:b0:434:a746:9c82 with SMTP id 5b1f17b1804b1-4390d42d7e4mr46830895e9.5.1738821158010;
        Wed, 05 Feb 2025 21:52:38 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0fe37sm777242f8f.69.2025.02.05.21.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 21:52:37 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v8 3/5] rpm: Set SEQUOIA_CRYPTO_POLICY in wrapped tools
Date: Thu,  6 Feb 2025 06:52:20 +0100
Message-ID: <20250206055222.3319167-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250206055222.3319167-1-zboszor@gmail.com>
References: <20250206055222.3319167-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 05:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210900

Point to the crypto policy file so RPM signing may work.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 meta/recipes-devtools/rpm/rpm_4.20.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-devtools/rpm/rpm_4.20.0.bb b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
index 6c995ff50c..d296c20d78 100644
--- a/meta/recipes-devtools/rpm/rpm_4.20.0.bb
+++ b/meta/recipes-devtools/rpm/rpm_4.20.0.bb
@@ -100,6 +100,7 @@ WRAPPER_TOOLS = " \
 do_install:append:class-native() {
         for tool in ${WRAPPER_TOOLS}; do
                 test -x ${D}$tool && create_wrapper ${D}$tool \
+                        SEQUOIA_CRYPTO_POLICY=${STAGING_DATADIR_NATIVE}/crypto-policies/back-ends/rpm-sequoia.config \
                         RPM_CONFIGDIR=${STAGING_LIBDIR_NATIVE}/rpm \
                         RPM_ETCCONFIGDIR=${STAGING_DIR_NATIVE} \
                         MAGIC=${STAGING_DIR_NATIVE}${datadir_native}/misc/magic.mgc \
-- 
2.48.1


