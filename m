Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7508EC63686
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web09.8109.1650463752395112178
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=S21QiAaH;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id q1so691173plx.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sRtQqjcCjRPk9RcDoTzzkmTNnWXmqWD+phZLXn/0IQc=;
        b=S21QiAaHRSIFgcOIv+3ru63Np5MyAGH1ezvtuSJNxvlWHfax2fXWXqGDNuj/mFOj+n
         RdzVjmv0MkNHHCUAiCBes/wKThF6N60RosTK0tAHZKj0EkSGFOGoksBpt2NTZbwEToRs
         kMDinZ1kzq8btvV8M3fgvsRyL2vI18ICM7+5Wl8VvpLPQ2hmfoXKdPzfcliT84UQm5Hj
         oLHZ7q9g7ecEgYuid7x/nBbpoLnj1X7J7Ru7x1j4b6f5vm8xzvgvCrPP48T+0MKHb8c2
         gVY3nrth4h3szjzjORi9Uxr/BuB2t9s70xDqzdxvCV+X6CmX9AU2GhBuwAqMEKvkHi9f
         o6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sRtQqjcCjRPk9RcDoTzzkmTNnWXmqWD+phZLXn/0IQc=;
        b=fQn4+JFQdsLrTTrQIeaWJwX37cQhlYKK1sFMSbZZhZQ4dMWcv/1P0+plivmUNerxRq
         tOkj7brz8fvgkJrB92scDNqtGqzmf7Ese1O2gDjWaTaIPiwx6f9ml9dfcT9P8WimROvL
         +2fRKg8XHr+nVx46tUcuWqU0NjXXgVhbHZs/HuyZMbQ8AqkHVxoFkqzflwr4Ba+Nidfm
         +er4aO+N5YCvjD52MhgtL01oaB7RWQLKpnEaJXHtQTdI6ehvu3kwSHi+xpKp22yrp7fQ
         r1/IIc7S9gskIywCwI3cE9//QpLyOJyn4LMQkQ/zJh1THG3GABJDYOCvgSAaMjSo1S/Y
         THWA==
X-Gm-Message-State: AOAM533DCwp++OFLm/imBZ6NS236qITJHeIZTZv1bnGho/RS2/Ky29n+
	F3t+dQnLX/eP5NPWOuHhm/KxwIwRCT9u0enlWis=
X-Google-Smtp-Source: 
 ABdhPJxTST++lENtMXYlqh5kmwvLdVhDl8MgxJumR0H6JcCpkZ2JXjNvHcpnGg+iSLMBDh/7U74oRg==
X-Received: by 2002:a17:90a:3d02:b0:1ca:7f92:1bf1 with SMTP id
 h2-20020a17090a3d0200b001ca7f921bf1mr4702656pjc.177.1650463751503;
        Wed, 20 Apr 2022 07:09:11 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.09.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:09:10 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 14/27] webkitgtk: adjust patch status
Date: Wed, 20 Apr 2022 04:08:02 -1000
Message-Id: 
 <14b13673c40884d6b84bb53c006b0ee01f896051.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650463004.git.steve@sakoman.com>
References: <cover.1650463004.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164682

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e43558d5357aadf08521e7fb6170ad0bfd69f3f3)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...indGObjectIntrospection.cmake-prefix-variables-obta.patch | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
index bccf74d9c9..2379924cc9 100644
--- a/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
+++ b/meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
@@ -4,7 +4,10 @@ Date: Tue, 27 Oct 2015 16:02:19 +0200
 Subject: [PATCH] FindGObjectIntrospection.cmake: prefix variables obtained
  from pkg-config with PKG_CONFIG_SYSROOT_DIR
 
-Upstream-Status: Submitted [https://bugs.webkit.org/show_bug.cgi?id=232933]
+See discussion at https://bugs.webkit.org/show_bug.cgi?id=232933 for
+reasons why this is not approproiate for upstream submission.
+
+Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
-- 
2.25.1


