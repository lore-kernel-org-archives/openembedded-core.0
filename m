Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83017C43219
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 14:16:20 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web10.13284.1668953777002864346
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 06:16:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=fBmB4/O4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id 4so8466026pli.0
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 06:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tlTQRtJN7M6xwBlIpmF3GxFuAe/T2bKCVhKbkGGWjrY=;
        b=fBmB4/O4unRI3s9Nw3sTVupijh7tRojrR1l9chMYwEiKRbjCrKxqO9TTPdTqunTLeN
         PBzw9hxlfN45ELgExEpgb2Prk+VESTU+N33o2SyDELf3GSmJsdOmLI/2BIO9xlZ7fgI7
         QWaSO4Xpz18+mIH0gzkU7EkWmenz20dXqxB5IpXjxNY0ergDHLzJpB3papOxudLPUo0Q
         8kt4w2YwcUi/xsL9uMMHMI7tyAlL2XQcfoOfjgYj1kcU7FkvvhQLv4vcYcMT+xBz1gIY
         i22SDlG2gbJT/ien//mh9nUbH728etYHYEo3x8VtGUSdDR9bjrxugXaduDON5FSjdc85
         18Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tlTQRtJN7M6xwBlIpmF3GxFuAe/T2bKCVhKbkGGWjrY=;
        b=FO/aSTTQa8bThPOzr+xJYUfOnAtKMbQnpWMdiWVatcVVFdUD8quQs8oA556aBRWtDP
         dh3RHR43bXk/w13JnSa2uNdTrOSoxYeMfLhV2MyowUB85WNVphhWBqpVeeo2EEHMG9C9
         3cHdHV9Y6nwNFx+XeP4tsN6/5EupMIoKSCtIKQVpRqwOAro0ywqq+nOEeO8rgdw66vNU
         vYIr1PR+5ZuUi/6hAaNaLPQGzPX7Vm9LubEBMjaL3zlEpCcUyxyKIAheG2X81mrZDcQ5
         R/ktZKaLOMt4FBYzsiLdma45ToYDr2+zNTJe8yMMCVbXc+SER/ifr0IAXIL7qzrojHsu
         sI8w==
X-Gm-Message-State: ANoB5pknqjGOOLxyv2BQ3rq5VOxiIDxE4xQJpuhI1uPJwePBBG+xhw04
	tBPHsFPMMsOyhaH0KrYdwlOYlfW09SV/Azx9OaY=
X-Google-Smtp-Source: AA0mqf5YIyRH7q1d8zyQBiDRInG8SoVxz9yIA4DeP5/J3/TUPL3OG9da74NdBypJyGHgXlqd9TXAXQ==
X-Received: by 2002:a17:903:3292:b0:188:ec14:e3a3 with SMTP id jh18-20020a170903329200b00188ec14e3a3mr4944177plb.154.1668953776032;
        Sun, 20 Nov 2022 06:16:16 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id x15-20020aa78f0f000000b0056be4dbd4besm6721379pfr.111.2022.11.20.06.16.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 06:16:15 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 21/35] tcl: correct patch status
Date: Sun, 20 Nov 2022 04:15:10 -1000
Message-Id: <ccb7df0d61792bbc6fd5ef62848035207a63cf5d.1668952942.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1668952942.git.steve@sakoman.com>
References: <cover.1668952942.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 14:16:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173621

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9f37e5b83db662bba92605c8741516108aad3c5e)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
index 44b2ce0a30..5a10c93a31 100644
--- a/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
+++ b/meta/recipes-devtools/tcltk/tcl/fix_non_native_build_issue.patch
@@ -1,4 +1,4 @@
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [upstream does not support installed tests]
 
 Index: unix/Makefile.in
 ===================================================================
-- 
2.25.1


