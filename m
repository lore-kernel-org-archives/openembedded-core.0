Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F18C433F5
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:44 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.3418.1637741323829778619
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ltzVsijN;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id b12so2627995wrh.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=MjENPVpLkn/7/AYWWiGCCa/px26C8w+AaA8Fe4bqH5Y=;
        b=ltzVsijNYf56XKqHp5VfGds9NC6VB5VQhyg0GJ0VBGqYoqdlu6Er3z20vcU0BAerTv
         Y4nlOg8L0VjpRWQ2I40biEBeFUKBQ641+YR4ZtJ1jAlY26A9fibmPrglEtlRrrjzlH21
         KIwE2PZHKw7XIdeZjs93wJjsbKV3yLHkrPb1yyTVx+CMNF5O/939afFe75xLr3PeT09n
         o+uVuj6CqpiOaiElOitzIyQvuv3XuhBfokuFjioik3cYMw908Pc12COMCOTesSIJYYRy
         NUg9GvgbX/Zdm+wnsePS7Ys7vK83M5WrwsCurLzWIPEVDUV7t2JXU4ClCanXAm+6dYTt
         jg3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=MjENPVpLkn/7/AYWWiGCCa/px26C8w+AaA8Fe4bqH5Y=;
        b=q95GC+7idahoZzvAeN0y7um3QH7+MxH6t9v+YnN9tiW/NIgDPbhZAAJSqYgkGCo2+v
         bMY4VgeqRVYfCT0alvnDc8rT6GIiQb3PyixeKy3pqfLawApivgDLvWgopy4T40+t+njn
         datAYWuZJKOz3SRQvt23L6Z6UOs4WdJwvWud2wCnOjZ87hKNxL6wafZfLVisPmSx/bTh
         yQ/RiDufx+Bq1fyTZUqcAbQ36jo/4JYdNw6xfqnpD38a3zIrHKrIOOG22BxQt1KBC//c
         nNd3MP13N/U2vgqwhFRR/+Nie4dAzzOXRee9URGCEtxDyDP2EHTwKEZKIkB1kNack38t
         CEog==
X-Gm-Message-State: AOAM533Vv8TIcnUDAPhG6S1jKmJvWe09KYMmMw4xgeOPDRghfd3ctkMw
	YmJo0OzsVu1RVQyvb3jxeGLVLblDHTQ5yA==
X-Google-Smtp-Source: 
 ABdhPJx/mosYQvpZVcX9fW3gzwGxSIxUizQR70hOgfhfsLAZNnyH9ITLftXR18/SCew6ZEVuDmsafA==
X-Received: by 2002:a05:6000:1568:: with SMTP id
 8mr16459678wrz.76.1637741322431;
        Wed, 24 Nov 2021 00:08:42 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:42 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 14/21] gptfdisk: submit patch upstream
Date: Wed, 24 Nov 2021 09:08:21 +0100
Message-Id: <20211124080828.530981-14-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158670

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
index 9d0443e524..cbd1365080 100644
--- a/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
+++ b/meta/recipes-devtools/fdisk/gptfdisk/0001-gptcurses-correct-ncurses-6.3-errors.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex@linutronix.de>
 Date: Mon, 25 Oct 2021 17:27:51 +0200
 Subject: [PATCH] gptcurses: correct ncurses 6.3 errors
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [by email to rodsmith@rodsbooks.com]
 Signed-off-by: Alexander Kanavin <alex@linutronix.de>
 ---
  gptcurses.cc | 28 ++++++++++++++--------------
-- 
2.20.1


