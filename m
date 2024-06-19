Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B3B4C2BC81
	for <webhook@archiver.kernel.org>; Wed, 19 Jun 2024 09:00:12 +0000 (UTC)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
 by mx.groups.io with SMTP id smtpd.web11.16263.1718787609837946923
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jun 2024 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lNmjSej2;
 spf=pass (domain: gmail.com, ip: 209.85.167.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-52bc29c79fdso8455592e87.1
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 02:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718787608; x=1719392408; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HqYb+3GUtc1GjdqrAPpGUb3TNPhs93SEBQPYYqoFBSA=;
        b=lNmjSej2aQ+d4QhX1A1W0BiiKnaAgaGoUllWYeZbMmnKJS+MmTyqDWHZZ3WEi7p9+8
         UVIZw9JjIrZK60RR0jwtE14Rbp5fmOh0048ZZEJKgKtuMz8rP0lWitN1qHTnzPJ4PfsI
         nQPjrH4E7JbJM5XD8bV8N7h1sYx1iGrJG+/lElosmQT1XZ+itAB+q3sEyhZLPDU8u0jQ
         oQuS1Ye74jzHL+CqwPPBFD3AwTeEGOSmJKvCjb2n8TGRwGHMDBa9DNbmX2vp/OKtovZp
         L6ObFUnTP7gO0gJH4RjbdbG8EBojDcxt9lnivcGzMU6Ym2smBe9SEIjiCGihm1EnEUxO
         wPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718787608; x=1719392408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HqYb+3GUtc1GjdqrAPpGUb3TNPhs93SEBQPYYqoFBSA=;
        b=Bsk1LSokCMufCkF4FpMa0Nm0aPGnzSjKkmDLOKxXswexY/oWJgPCKfFMDIkKdXQlRr
         jfNMQ5iCTZb0Cf7UaB01R5V9UN0kV0MiPYqVl5SiZQ3MXHHUE7MCpEI3ndOkfk0aa9S3
         WCcHEL2RtFZUQfQzlRVj7wqOtewVsMPNd1DF78w2ojfKVeXzpx/DlL9htwbYUILXea1A
         7q8OaW4L1YGuDJhH8WdW2jAT7CTyikgB7YQ+T+kp6ChIab4kgsR82bL4Z99uS9QxUfBs
         o4o6t76G0P1F5MPW44Ps2ubwe8d46Lq43YxpveJYuL1NSTXrbScUqrfrs0W73efISC2t
         nMyA==
X-Gm-Message-State: AOJu0YycZrFM138hr3+8q0hBlp0wGF3inIBx0xPkIR3A72/wCbt55h+h
	XT/ECCbbOm9rCtN6zKVGmzy/OG6jOpOyeO4H9w6PJO2soR63UhtvGDfXgQ==
X-Google-Smtp-Source: AGHT+IFYtb/i2TusPfEj68fwRIMddODn6MpT3fMYUrjd29d1nWyCaS+kdI3qBUlcK5R9tWa8Zqjc4Q==
X-Received: by 2002:a05:6512:3b9a:b0:52c:cdc8:bc78 with SMTP id 2adb3069b0e04-52ccdc8bd5bmr202854e87.19.1718787607939;
        Wed, 19 Jun 2024 02:00:07 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36076515a80sm16401876f8f.76.2024.06.19.02.00.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 02:00:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 12/15] automake: mark new_rt_path_for_test-driver.patch as Inappropriate
Date: Wed, 19 Jun 2024 10:59:54 +0200
Message-Id: <20240619085957.2787700-12-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240619085957.2787700-1-alex.kanavin@gmail.com>
References: <20240619085957.2787700-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jun 2024 09:00:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200898

From: Alexander Kanavin <alex@linutronix.de>

The patch is specific to how oe-core runs autotools-generated tests:
by cherry-picking needed bits from builddir and srcdir, then hacking
Makefile with sed until it runs.

As GNU is not interested in installable tests, they wouldn't be
interested in this patch either; and if they become interested,
it's probably going to be done in a whole different way.

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../automake/automake/new_rt_path_for_test-driver.patch         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
index 1f717223348..f92ec6b5487 100644
--- a/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
+++ b/meta/recipes-devtools/automake/automake/new_rt_path_for_test-driver.patch
@@ -5,7 +5,7 @@ Subject: [PATCH] Set relative to top_builddir path in Makefile to access
  test-driver
 
 Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [specific to oe-core target ptest installation]
 Bug-Report: http://debbugs.gnu.org/cgi/bugreport.cgi?bug=19042
 
 ---
-- 
2.39.2


