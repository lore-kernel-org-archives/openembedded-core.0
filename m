Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 791B8C4321E
	for <webhook@archiver.kernel.org>; Wed, 17 Nov 2021 15:35:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web09.8802.1637163347719521626
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=p6++01Qp;
 spf=pass (domain: gmail.com, ip: 209.85.128.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id
 n33-20020a05600c502100b0032fb900951eso5132987wmr.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Nov 2021 07:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R7CVFse3h/4Aa8zT38o+A5GVi0qiwNgea55m3vPOMnM=;
        b=p6++01QpDWhFTjD9F5RsQEycMw4c6jRikYKExV4VnXrS2OetQ4oB8HAwj7rOrgJx3K
         1rRAEWcQsDEfPoeZlE8RW33KEiDhn29YJa8uOCURkZnh4Ap1tWPGoD/4ybFOP4HZxQ4e
         9gwLY3n0SZ/Q4H4WqOa/0a0YKfuvefdMXjHimMvr59HunYoCg22HuosHvUXbG9S7IirR
         PJF+EeIIUMyZQzVWgwtpDi6QpZWgZ0HalHxClsbpKlci9gZXQfr9Ou8b531LUm4DgvrB
         Jat4VyP6KU3bHX4/LBVyngmj8l3keWXOGrtqZYpBRTNXDpV7ODUMIwRcEEKuPZt9S40A
         IAwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R7CVFse3h/4Aa8zT38o+A5GVi0qiwNgea55m3vPOMnM=;
        b=vkpjXT0ibMZhQTPTylQDZKkEs62jjR7AY0+NFLF0+qxZQSYO0Pnm0ZnPVM4Pj2ZMLp
         oL61dZzaGY1XgNJelfiqArUX/5PfSYaulMgRnqnEOjZf428d84nJ9CTCsO+qeMSq53Hg
         4WEL+iW3QAFZGrMHoX9dwuHoQYc28/H+7jz5Zaza8xuSZ91mt/zX3wo9LBLznjFTxao6
         SKR+Ievq7QKeU2mT06q3FRjQMGV1EWjnHrcXP5yhfdkn4kC77XqeYBIYozMIB5VU+HOR
         ESyqL5rK0/gFEB8neU9SISz0n2cIxw4CjKTkTm/VKUCwxOSl5Ba1IeJjkFS1sJUws1XB
         R4QA==
X-Gm-Message-State: AOAM531YDChyxc+W+AYKz45326rK4TwI5tuw+V6hIOkPNEKK3EIGVfq+
	hFzSD8RTNMgdpdpmsj4YlPmVMMOuiMI=
X-Google-Smtp-Source: 
 ABdhPJzLUUnAKMBjEeStGAX0akrOkLnJsbyg4IeLd0luvVQTsDcYyk1ZOt5PEnBGr9nvcQgjHx6S2w==
X-Received: by 2002:a7b:c409:: with SMTP id k9mr591826wmi.173.1637163346330;
        Wed, 17 Nov 2021 07:35:46 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id o9sm221272wrs.4.2021.11.17.07.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Nov 2021 07:35:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 28/36] libnl: add missing Upstream-Status tag
Date: Wed, 17 Nov 2021 16:35:17 +0100
Message-Id: <20211117153525.257146-28-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211117153525.257146-1-alex@linutronix.de>
References: <20211117153525.257146-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Nov 2021 15:35:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158423

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-support/libnl/files/enable-serial-tests.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/libnl/files/enable-serial-tests.patch b/meta/recipes-support/libnl/files/enable-serial-tests.patch
index 8ea53f8748..db774ad821 100644
--- a/meta/recipes-support/libnl/files/enable-serial-tests.patch
+++ b/meta/recipes-support/libnl/files/enable-serial-tests.patch
@@ -5,6 +5,7 @@ Subject: [PATCH] Add ptest for libnl
 
 serial-tests is required to generate those targets.
 
+Upstream-Status: Inappropriate [oe-specific]
 Signed-off-by: Eric Xu <chi.xu@windriver.com>
 ---
  configure.ac | 2 +-
-- 
2.20.1


