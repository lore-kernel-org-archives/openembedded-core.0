Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63C7FC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Jun 2022 14:39:15 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web12.32707.1654526352988404146
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=XjU6vnHb;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id 123so2698287pgb.5
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Jun 2022 07:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=2okwH6kziW7zUaGN+18/QSvhT3obrkdRk9fNN6ekuI8=;
        b=XjU6vnHb3SkrYcSPTjkHtxZLYhCTN6qIC7mSHjKJOgBBimR2njO+Z2NDs7pnI4bE3u
         wgsFRi19hv1FHV1Btv4dyTNJkBSZPOrUVhFmXXNVEeJQzfbEzI7EyBytnFa71yjnGQ4b
         +UY081u0LVArX6Y2KK3diOX2AhNQtLY+Nu5sC2r5/F3mAFPuK6PqS+UozpeoH5Cd162k
         zUyW2Q3XdkhQw5Fdid+fTDWkyFPhWdmV62Pw5gI0KSYr5FDajtxgqHkPWyCp9lr52r8j
         y/nFEF85tbYhj5u3H6WKzW8jUO9/cGC4N1ZbPdkcZv+hsbLd8rWh0TAQNqC8vP0Vvbga
         T0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2okwH6kziW7zUaGN+18/QSvhT3obrkdRk9fNN6ekuI8=;
        b=wgajWx9l4A5jY+4CCG7bWhC/ir4w/kr7gMrSIkeIDAyAYdd3x8tFs8DXkt+kr0adYs
         NhXu02whxKZVhE08tt9ohZOmX4UY7nu4ayHI2fydeEc79vvQyW7YzNV4hIZQpbrD71Q3
         Y6cCqIJyUJ+lp1JPdfbXsqDBO2qdBNSoGYeseq6w1g9vKq31qcsCWxqwr8CmKx2sdoVA
         bjWtuv01sPmzCjTfNdW9yMcgq7Lub4mPSNKsEivnhDdye7JckBbJqlgS2jaMefhj0F4A
         fq9dkkjk+zu25rwcK5eSnV1enpa2ywvV8Bom0i+MUuNz0PQ0blo11KsSNdwWEKB7k0zQ
         PxQw==
X-Gm-Message-State: AOAM531zNN9Bd3ElDRSwwQShXHcTcu8UNn/DqOR201KTjN9JQ1kG8nYK
	xX8qrr7KwBCGOqoCq7ueky+WVdgZGPTzNiZ7
X-Google-Smtp-Source: 
 ABdhPJzHaIAJ53EjelBDvo84yInuGePCr/IvwXE45IZg/sHZQRlTFqGzrHR/x/wEnQLBinkImElLeA==
X-Received: by 2002:aa7:83d0:0:b0:50c:eb2b:8e8a with SMTP id
 j16-20020aa783d0000000b0050ceb2b8e8amr91096514pfn.31.1654526352019;
        Mon, 06 Jun 2022 07:39:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a5-20020a1709027d8500b0015ea3a491a1sm10544112plm.191.2022.06.06.07.39.10
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 07:39:11 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/13] bash: submit patch upstream
Date: Mon,  6 Jun 2022 04:38:27 -1000
Message-Id: 
 <b2ad59506c6083d12bbfa9491992200c9ea1c4b5.1654526060.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1654526060.git.steve@sakoman.com>
References: <cover.1654526060.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Jun 2022 14:39:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166642

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 424f1c24c569afd245463b02ca10c40dad3f8a0c)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-extended/bash/bash/makerace2.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/bash/bash/makerace2.patch b/meta/recipes-extended/bash/bash/makerace2.patch
index 43cdd04157..abb51a5086 100644
--- a/meta/recipes-extended/bash/bash/makerace2.patch
+++ b/meta/recipes-extended/bash/bash/makerace2.patch
@@ -11,7 +11,7 @@ moved or are being rewritten.
 
 See [YOCTO #14227]
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://savannah.gnu.org/patch/index.php?10210]
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Index: bash-5.1.8/builtins/Makefile.in
-- 
2.25.1


