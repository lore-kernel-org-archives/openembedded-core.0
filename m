Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1D3CE728EA
	for <webhook@archiver.kernel.org>; Fri, 29 Sep 2023 20:05:15 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.27824.1696017907145725978
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Sep 2023 13:05:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J+Qb1TVS;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-65af726775eso4872156d6.0
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 13:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696017906; x=1696622706; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PzyUiMJ5Jyw0G5BzG0MTpWN0ez09Q/0OEcWcjNsOHZc=;
        b=J+Qb1TVSx/3OuAQSqEGaoBrm+cAhh4xG+UiRZ8ZIUegrUZAvk8PvASvM/MyOsId25Z
         +zTp5JteYcOVhXBPjoWefTxmcM3txkLydl5DRQBCzerYqqsEZbzxjZ0Qw/SbwM8VxG4x
         a/GIY2z9KWkAv+1p+spBxP22i10avAxhsYZ8QANO0BajvJuaolrqc6d0GIczFda65wS+
         Al+dy/r5b038Cz2LLGpNnuv6B6ufVcSyZsRws+OzBggniqADgPFw0To0joAGpLxJpWwN
         MHjiM7URrtzU8ffjR/pvVck5nm0GjTB/Ehy3e7ba/F8806QU7HD/+r9Fkjt9ve+gTRnx
         25iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696017906; x=1696622706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PzyUiMJ5Jyw0G5BzG0MTpWN0ez09Q/0OEcWcjNsOHZc=;
        b=Gen36cCRvo/EWxELg19ozw3aj20ay4htH1E5MsVRQ7AvnibVuwmhDdP9il/ZD+wZFa
         tPgEqf3J38+U9Ier25lORoN2wv0h7ruvQO+Mhx+lgzbF2mLXMQFIIfUuBI+103MFvASU
         udw+awgMyvQmxUlPiOVMZyD4Bu5OW5SNaE8Wi4hL6ivYClAsHhnvIxB1Ew6MJ2un2IkL
         bxcfkrd4sCjI5wNKZA80tGMuKZY0ziHi6hhQjizVODo39BN6W59TklEWgtxfT0kJBSfy
         MAbd9sAJJJ1ZDxNz4/DCFSqAZKansqa+rY1VqcTRtNTtR9d1RO7dnIHq4L0dO3r71dVW
         gj2g==
X-Gm-Message-State: AOJu0YybUv4on+R0AL8egfWGkzW/1eHm/WdJCPei8dW4Qz6Z4SScU/M0
	Wxj2NNnSTczALte51LwuQbebYko7x//bqw==
X-Google-Smtp-Source: AGHT+IESUCHI5m6yf+GSpJfZYIQB0RhSMV0OnV/imm2T0dKsSxM81qEbA66lUF0mJVnGAvexrcjn4g==
X-Received: by 2002:a05:6214:268c:b0:63f:9130:4e9c with SMTP id gm12-20020a056214268c00b0063f91304e9cmr5953935qvb.26.1696017906149;
        Fri, 29 Sep 2023 13:05:06 -0700 (PDT)
Received: from build.lan ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id t28-20020a0cb39c000000b0065cffe12ae9sm2115848qve.36.2023.09.29.13.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 13:05:05 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 08/10] linux-libc-headers: uprev to v6.5
Date: Fri, 29 Sep 2023 16:04:52 -0400
Message-Id: <e472be128551f2c602a47d95d335e2fe29970570.1696017123.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1696017123.git.bruce.ashfield@gmail.com>
References: <cover.1696017123.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Sep 2023 20:05:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188426

From: Bruce Ashfield <bruce.ashfield@gmail.com>

The 6.4 kernel has been EOLd and 6.5 will be the newest reference
kernel.

So we bump our libc-headers to match

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../{linux-libc-headers_6.4.bb => linux-libc-headers_6.5.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-kernel/linux-libc-headers/{linux-libc-headers_6.4.bb => linux-libc-headers_6.5.bb} (83%)

diff --git a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb
similarity index 83%
rename from meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb
rename to meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb
index c52315499e..fa902741f2 100644
--- a/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.4.bb
+++ b/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.5.bb
@@ -12,6 +12,6 @@ SRC_URI += "\
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
-SRC_URI[sha256sum] = "8fa0588f0c2ceca44cac77a0e39ba48c9f00a6b9dc69761c02a5d3efac8da7f3"
+SRC_URI[sha256sum] = "7a574bbc20802ea76b52ca7faf07267f72045e861b18915c5272a98c27abf884"
 
 
-- 
2.34.1


