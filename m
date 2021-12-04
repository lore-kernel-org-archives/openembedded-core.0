Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17789C433EF
	for <webhook@archiver.kernel.org>; Sat,  4 Dec 2021 07:13:37 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.22346.1638602015579805660
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TV354C9S;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id j3so10602347wrp.1
        for <openembedded-core@lists.openembedded.org>;
 Fri, 03 Dec 2021 23:13:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7nS+Z/2ogzchOwPPfrKMVguGoRT2JH655blWKlVWjI=;
        b=TV354C9Sa+VJ/4RFBVd5z60SqAGnXPAdxT16NifyeTHCKvEw71W9RlcQMfPCeYhAla
         Ty64W8NOOwetfAL7S2umaYYT98WmrlSe5XToObZgKKHbPmhBkklcLwObu6keTvlpqMBM
         fuVJjSDtLknhsLfyLQLEISD1Bc+2gu+3xmqGg3SigaExKCY90MUjmCiAk94AMndHvH+J
         iF4RByHNvXPpDu3P6l//dkUxMKflecn6j5+hxU0LzVnBXmHd1biHoxRraJeB27pDpKUy
         JkhdzkcRhtTPcuKSj5VOYwkkX1byowLnQHp2Y5I9hIXZmxm94IYczci6N2YYXmL/LOrm
         NS/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7nS+Z/2ogzchOwPPfrKMVguGoRT2JH655blWKlVWjI=;
        b=guDkwNrzoAhx0ZYoV2YfekXtWumDagDrRIO7PUfMQvHdtHDQbWYPP6VBDixjw0PiNF
         0JnuFn0RJlOdMppTXX4QL/4HaM0874eTMUrp0EZcCg2jb+9/n8GSZMqXO853rYjuzF/U
         NXyEAYyqKSoNXl52YmU9eb7fJgCeWzpHR2yH6SBBGskYin5gmgQY4VDtClztVgq8yY9B
         crMIyXpBMeKnFjbNqwSA3P4tgWaEp5MvHOxqMgYjLs9HQPO3vxdwgeLsPOvuPa9MtdLL
         xn88bdhvYl186pZVMe1nXVJK+eIftlJzg/uJV73dvpHpo7jQsb66ltnhwI7mPw6nVA/C
         i0vQ==
X-Gm-Message-State: AOAM533u52Kl9kTpKHJ2bHkpJcdnDT6RC8jDX/2eMv2y9vezS8w7vYQG
	h+hBt9uzd6OVMPYbX6LLomOSYFPO7+z1cA==
X-Google-Smtp-Source: 
 ABdhPJwBV3SXVAp+Gq4pCWbK7xC4kK7IivGQ8TH3yUg1QjoRDO2xmKmldcnthhEmDoKscl7VGK7PCg==
X-Received: by 2002:a5d:61ca:: with SMTP id
 q10mr25814013wrv.102.1638602014266;
        Fri, 03 Dec 2021 23:13:34 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 y15sm5837992wry.72.2021.12.03.23.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 23:13:34 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/26] stress-ng: submit patch upstream
Date: Sat,  4 Dec 2021 08:13:07 +0100
Message-Id: <20211204071323.2480163-10-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211204071323.2480163-1-alex@linutronix.de>
References: <20211204071323.2480163-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 04 Dec 2021 07:13:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159157

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...1-Do-not-preserve-ownership-when-installing-example-jo.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
index 2ee0be54ba..107b83d20b 100644
--- a/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
+++ b/meta/recipes-extended/stress-ng/stress-ng/0001-Do-not-preserve-ownership-when-installing-example-jo.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Tue, 30 Jul 2019 18:38:03 +0200
 Subject: [PATCH] Do not preserve ownership when installing example jobs
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/ColinIanKing/stress-ng/pull/162]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.20.1


