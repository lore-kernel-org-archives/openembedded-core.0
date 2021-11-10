Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ED82C433EF
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:59 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web09.375.1636573197611581652
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h5fog3e3;
 spf=pass (domain: gmail.com, ip: 209.85.128.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f44.google.com with SMTP id
 67-20020a1c1946000000b0030d4c90fa87so2796393wmz.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9NPWYxlCDNG97OpOXpxjB+X+cC9hmUPh6bbXNporr0w=;
        b=h5fog3e34aUvf5EPhNZu8tE8ugF+Av/XjVPxW+TaI7J4itmBTztlYkNuDhlR2pZpA2
         C6aMHTw3x5N2V7JvtgMjP/3fK1u+y/flDL31S9DCRzxiSEUGkQOuNGbIOHnHv3oQWTBQ
         4uQUfiBYxpOydWTEpB/zrGEpbs47dt5j6aNUAjOCT/1puBAGurbvsoonuvhbl/vQAiLS
         Ce3XjmYZqKI/Q5E0m4hnHORtE+GuZnx6yv48/wJqL7vP5MlquVtTqUgnRA1VjGdod00p
         AOy4VM4VilxKPxMikj8QOnj/BB1PxcGwgRTq62HFLP7CS341OZbNCCtSmb2KxfTzTpVA
         w/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9NPWYxlCDNG97OpOXpxjB+X+cC9hmUPh6bbXNporr0w=;
        b=SGyOOYPcX7cy5HpbgZclh9N6EIfd1Aw9U9hRLugPNWJybV1Arw1qXTaTfuKUkTqcOh
         jtBZ323Vs1YKmfaQxRv41Z2NSimVZktbWYjir6HKtPaPCDVleOybYCn+wZmkLxL79uE+
         H7oWMk64ornFymQuQzAUxLl/eJ4vREwhawZGJgCMIi6zpvOCtvWmnuPduFhFdV+3t2FQ
         syYcQzHUl73xkU1KypdcgCeQ1A4rxBv+5UV78sGSPsCGDQ0ZfSL4DUbN2nPystVxlrTn
         PC12vpfqWrdtIRKaoBI4gs9aAEiW1c4Ybg5gPg+leYJUpEB762Wb6p0927VsXsUqxwLB
         EoeQ==
X-Gm-Message-State: AOAM531pfB4Va0XKVOQkNzqcN7We8U+BeRWdG5UYSMZXC7NYMv8BdYw8
	ms38R2gioaquzDm1dB5GFzGRbGDMbT4=
X-Google-Smtp-Source: 
 ABdhPJy/HdfwsLImIiXKRin+KHeGkh5ZXhgqfZhsfLypr0aEi1jAsGc0U+FTUgCjYHK/yVII9K5nXw==
X-Received: by 2002:a1c:7313:: with SMTP id
 d19mr18940062wmb.183.1636573196243;
        Wed, 10 Nov 2021 11:39:56 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:55 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 19/24] libgpg-error: mark patch as non-upstreamable
Date: Wed, 10 Nov 2021 20:39:32 +0100
Message-Id: <20211110193937.2606747-19-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158103

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index ff15759309..6b9b623b54 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [gnupg upstream will not take this, it has been tried with other components]
 
 Rebase to 1.28
 
-- 
2.20.1


