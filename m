Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9E24C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:31 +0000 (UTC)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web08.53377.1638136770550322915
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Hlkaz0CK;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id l190so13876708pge.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=fyADzIP/pCa3rM4Bo3mMe/GgF/x+Bs3bDEVMlt53EGc=;
        b=Hlkaz0CKCFFHuLhlgus5iLtOa3AFdb7gx2SMcN2OlmHHY6soB6rxBlzi7IXihI4/IC
         cSPbhTqiQMJFv1Ee5TRa6ffxz5Wk0B6LZAEUVN5AVIsEsZttD5uCNQapBsL9/dTLkHt0
         dz0DwVTmpnvM+H/842wsRkkQbcHf6CrVNH2+tIKWt1zDI9XfW/vlDKR7hdVrwn8R+KlG
         FZUxWLJaofTJIbQWZW4gIBKMZVZnGqXkEHlZu6CCj3Oqx8gXAMa934lLsn+CXsCZKF+X
         aisWZvRz3Vw7a5MKxSGYwA2ucms6yFnJyJ5yl4Gdw9Qq8t+YtkQ+ReBVhFopA03ke9sv
         RIFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fyADzIP/pCa3rM4Bo3mMe/GgF/x+Bs3bDEVMlt53EGc=;
        b=vOqdTFyGdnVONSQfl+LFOmTpMImGLKd7vXlyRe+pHWPlWGqtwmyqJVvMUoKJRKNvgd
         fqBkTbLm2d9Ry9lmSH2aB4s6f1VulxzZC3P5aKAGifvoK7JJ16QdRtr3pMpWOloTq1rj
         sBT5CNqAgok9sOaipfPI54YVYcAj+Cus42/VJL8LR7UG6b+QMhg3OgpX07uVlYsKwNm4
         HnnJaIemXbapVnHp4dv10SNkGLVeaObA+RlwmqYNuCre5G8IswzntMZRhwRY+eNLZuxE
         atjspe8KqVSP2GwEk/yKT77Z2C4Qw8yM8vsNwILql0MyUsKTQ112TskFoX3iW4jK93pL
         cxBg==
X-Gm-Message-State: AOAM533Bo9ZcyC69aWNmnBVCXtHjc3C0DkY7zik9OC4CV3k0UoQg2XXS
	5anolVBT44naPIRFY+C+D1mAQ3uThNrw2k59o0A=
X-Google-Smtp-Source: 
 ABdhPJzBkM/0p+4R4sKHcU7rRDK0W13i7OOXJkb3ld5Q8oFZud4C7vvj8wkbFE+dVTsgMVsdXhEeuw==
X-Received: by 2002:a63:904a:: with SMTP id a71mr2841237pge.241.1638136769484;
        Sun, 28 Nov 2021 13:59:29 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:28 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 28/42] libgpg-error: mark patch as non-upstreamable
Date: Sun, 28 Nov 2021 11:57:40 -1000
Message-Id: 
 <5a6841333070698546412ac90f873b193f164b48.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158910

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit b01c20ac79ebe84090ee260a9d153d8398df6c88)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
index ca5f6b5c25..9c9d5463a4 100644
--- a/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
+++ b/meta/recipes-support/libgpg-error/libgpg-error/pkgconfig.patch
@@ -3,7 +3,7 @@ From: Hongxu Jia <hongxu.jia@windriver.com>
 Date: Thu, 29 Mar 2018 15:12:17 +0800
 Subject: [PATCH] support pkgconfig
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [gnupg upstream will not take this, it has been tried with other components]
 
 Rebase to 1.28
 
-- 
2.25.1


