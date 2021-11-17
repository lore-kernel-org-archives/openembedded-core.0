Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72846C4332F
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.8739.1637163349302720039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LFPF0Ye4;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so5521716wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6qlaija0dnlZ19Y3a2X+7lCTF65PgA3YAjkbK3rzfVw=;
        b=LFPF0Ye4eTcwWzo1J2UTz2ALM3IZ+tRr68BeC3hUzWfy/ljbD4XNrU9JvnWUdozR9t
         uE8dr+SUAYXrj7ievfaTlsAYTc+fTrNOzk5I33cbQ22THNfcW4aay2CmVmffj7WGFpma
         G3cLvI8bAkNrCxDAg5Uro8magykHwpLHjeLkh+CNUJuAuYadaKush1C4XCGMeT7KKysT
         3jyHtZduhdzAtHyeNiaw9PiPIpqeOwg88CU6R63Bhg1FQAp16tPYH4ick6KTnzK8O+i7
         jtnQCCyso8m3HkRxWF5YW/zgv1iQbw1Z2mCabsnpNv1qmzpasT3TimsJAG12tDztSRUu
         AIZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6qlaija0dnlZ19Y3a2X+7lCTF65PgA3YAjkbK3rzfVw=;
        b=wtyBEaQo2WeP1T3S7rif4ce1dXJxwN+52Q9a0t5F839oCik7DGZypuwj9DzC0HYssG
         4amcFVQo61TJkNL/bt3ed/gNNLXaNCp8eRxbBrqE9X9Ee7i2p3Aa1S2G5WgJNg09o3rc
         y9HI9CVz0vVlCbmuXfa1wqh1ro7c01ARLZhPKCxdOCkwLhfmk1GeMGcO61CPNYJjKrhL
         yHRhCTOuQgWTNcWqEcu2U0v09em8PHeunU0wZGENTXtpAZXryQ+Z+C/RaYd5CRD51IlG
         HoyBAb5XWDbA9baWNyn88+jklj1CDxo0TXZ31EkGRKD4uZ2uPovmK2uThdQBt1y7QjfX
         ZK8Q==
X-Gm-Message-State: AOAM532rV1BCNMc/qtjYG2kJPuN7r/6Ah2/bXdhQzTvkgE4UufjQ36Hb
	unG1dhNC1pcH42BbaDzsLf9HHaHry6k=
X-Google-Smtp-Source: 
 ABdhPJzb9ofWjmJy04h+9mITyBqsCEw9HociXthEkXJP60uNzEXFXWhSZ30W0NcTdZBRoaknVP0qYA==
X-Received: by 2002:adf:e2c5:: with SMTP id d5mr21545421wrj.338.1637163347850;
        Wed, 17 Nov 2021 07:35:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:47 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 30/36] rust-hello-world: add missing Upstream-Status to a
 patch
Date: Wed, 17 Nov 2021 16:35:19 +0100
Message-Id: <20211117153525.257146-30-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158425

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../rust-hello-world/rust-hello-world/0001-enable-LTO.patch      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch b/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
index 56ef9e73e6..f319545ee1 100644
--- a/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
+++ b/meta/recipes-example/rust-hello-world/rust-hello-world/0001-enable-LTO.patch
@@ -3,6 +3,7 @@ From: Dan Callaghan <dan.callaghan@opengear.com>
 Date: Fri, 5 Feb 2021 08:56:34 +1000
 Subject: [PATCH] enable LTO
 
+Upstream-Status: Pending
 ---
  Cargo.toml | 3 +++
  1 file changed, 3 insertions(+)
-- 
2.20.1


