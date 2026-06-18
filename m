Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BB34CD98ED
	for <webhook@archiver.kernel.org>; Thu, 18 Jun 2026 16:50:47 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.24334.1781801442128940098
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Jun 2026 09:50:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=BifYfSqT;
 spf=pass (domain: gmail.com, ip: 209.85.167.182, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-4864a8e80bbso614198b6e.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 09:50:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781801441; x=1782406241; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxnLKSe+U84H+E798KYZ1vrCSh9Q/KwJtgJMVpjVg1Y=;
        b=BifYfSqTg6Cu3MWiR1mWFvaKqDtzJhgzs7E33ixNs2gE8xZLbP2ivBERL/ejTAhfIf
         mtoCgO+g/UBdBuACyaE42gnCEhtZZUjH4geDWayVYFkPUVPtGxETLTKU4xOzqB9AAzVx
         TBtX/JdbH3mOgN6et77ST/Dst+xii3zRxhsBfciGchZYpY72wnFR38wnhDOV0prZnWjt
         y0Nk0z1s433DU3DpQ+D6CiJtXqS60NaV0z8Yrv0urv6XJaTujbpRkQS6JbcfrvHhs5uX
         1Aq4kjBDSVVwLigIdEIx3gJGYaWuAYV1XpZtA9rih6Xiy67M92zMfOJEXpYF9O8uRxlt
         +YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781801441; x=1782406241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxnLKSe+U84H+E798KYZ1vrCSh9Q/KwJtgJMVpjVg1Y=;
        b=L5/9dCzTe261txriot48qgAQ+kFHQ0vsZUVr9Q5t4JO92MeUEjJL7iw9IqJ21VoBxO
         tTwfbbPOkHv/oSvOXr08sWlgZHsf3cqOoq9ms+Hu0s11Ais/FdnvIe5qTXyYeyELL2JY
         c5wK/Bq6KbTnv9fTD9pcZERTMxjcHb5bgsz7m2PdWmybAmJxzxtIm5fCtrnkG9QbR32Y
         K27syu3wlCxjd5CYNcUhdKtaLPKqDmTZ44/YZs7rIWTL5njh/2hgh6vd5Jusn/FIwUwp
         5hftTgOqBAPACnY1OGJ4Nfr4xnLJ6+dAmISneDNIQN77YYSyz/Pv/NRteTg1S0SaX/ru
         7IkQ==
X-Gm-Message-State: AOJu0YwBp0q1bCa9/OMVOqyDaMyJSmEKFXrtUCLGSMlwonWV9KeR8iL3
	lRPMdt/y4bBRs4/SBNMA6Fg1bsiURoBfs66YjlH9BFDX39rjWBMgOAlgxho9MQ==
X-Gm-Gg: AfdE7clJiT0SKWg9yXfvNUpih5u/lDq/5IT6VS+rXJ0VDf6Ut9W0jv/HuyQMd9G4Vbt
	fquJyXyXQewFrWdKn4X5rqYu+u1FCsYT8zHLXiEWu8mE59LIHIevuf5wurZiAlbaqh0jhqwCMxi
	QJbDGJEu15yQwiL+a/jyWYOObxrus2Ize4CBFKqDYcd7bMJAK242G2FiCvDAxPbDuIsL8LHPtXA
	6kS2PymFDif0ftjBvVN0VYf0jraUVPsp/MUjLUPXFezEfK+Npm4u1nvkVR9sSjWUQTDf4dDK9O/
	XVKDempt4H4CjfwR6iVM30Br/a9hSjSbnTd6QMvw6jXyzWtQ3yXTOXf1XL1ZtDRvZl61wm50St9
	UAhft8Jd2fwN4KeqsBm4cuftU+xu7Ru4ysbRNmXuB7BeOcQKNY/b3CWzitBOXCV/DlJHfCVwgcX
	v7XlJDn2aDtQ==
X-Received: by 2002:a05:6808:10ce:b0:489:441c:ca95 with SMTP id 5614622812f47-4896ac4d6b8mr132038b6e.34.1781801441017;
        Thu, 18 Jun 2026 09:50:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::8b4b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4875dda5ee5sm8732987b6e.2.2026.06.18.09.50.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 09:50:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 5/5] grub-efi: Change to MACHINE_ARCH
Date: Thu, 18 Jun 2026 09:38:45 -0600
Message-ID: <20260618165032.347436-6-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260618165032.347436-1-JPEWhacker@gmail.com>
References: <20260609222331.1293007-1-JPEWhacker@gmail.com>
 <20260618165032.347436-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Jun 2026 16:50:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239095

Machines can change EFI_PROVIDER which changes the way grub-efi is
built, meaning two machine may not build it the same way. As such, the
arch should be MACHINE_ARCH.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-bsp/grub/grub-efi_2.14.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-bsp/grub/grub-efi_2.14.bb b/meta/recipes-bsp/grub/grub-efi_2.14.bb
index e535d99710..8d8671614a 100644
--- a/meta/recipes-bsp/grub/grub-efi_2.14.bb
+++ b/meta/recipes-bsp/grub/grub-efi_2.14.bb
@@ -41,6 +41,8 @@ python __anonymous () {
     d.setVar("GRUB_IMAGE_PREFIX", prefix)
 }
 
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
 inherit deploy
 
 CACHED_CONFIGUREVARS += "ac_cv_path_HELP2MAN="
-- 
2.54.0


