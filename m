Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B775FC4167D
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 05:06:23 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.7359.1651727163245965653
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZsgxVX3C;
 spf=pass (domain: gmail.com, ip: 209.85.208.43,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id z19so3886434edx.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 22:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nBaHIwFSwZ9a9jjVLYw+xqxGLW65eK0pA6U3tauZkxA=;
        b=ZsgxVX3CyJXx3GbCpr4RsGY1KorCziiPMF72hpTSjoOTPj7OXrCcSm+sOYomKlmx2W
         8CN6RVC8vX9wpNNarpHvxrbprEvjNrlFGMDszmTuheirvDEWAS+T5lKq4fqf2aL35oyZ
         WsPTxjWydfu4oi6jBCQ7CILmW99XcHeGAyC1feTtpDmCdlA9lD1nqBAZY8xGseIeKykM
         1AhiRznE6Gpo1xAow+ZpUNxbXbxxzJKYJRGGTxDZFHkx+O8ngDw6o92uKJbd9/QfYe6M
         rIIM4s0va0WhUErKntKXhmvI7yFAnMvw29267e0PbrplZ04JUnKCFQbb06KcDueXavnw
         5twQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nBaHIwFSwZ9a9jjVLYw+xqxGLW65eK0pA6U3tauZkxA=;
        b=ZTWNz8DtXL+idYCk4LMQCU5IwV5EYTaUJF3b+eXTNSskLNWUX59SIfgAs1Y6BxkmvY
         VpqTCItL/59KQ7qGX/1oFm4ZR5XZptfbtiWiHZymx+aaOmp31jgLD+7Xmw0amZDc7YG1
         NxsygvP8Itn6ZCVMPyWpqVKUy/lFvURalNjk4a6AL0RA1mEX/VPrMkUxqEyvy+pdO7rg
         990J2LR/6llwsrYLvYyv+pk02/hMAnpb/YNV60YL06SSES9HGH30eVuheHWlB+7Atz22
         tmuHfEdagGibuwgHLCwtOmoMIdSygQ2wxWGjfCQGhoDAevgziqvvwJrpe/c/arAQLRbH
         Bx0g==
X-Gm-Message-State: AOAM532QmhTyl1JFzsxr5T3j9Hp42sLBkY6Po+0IH8F39iSd6KrBu7EU
	y0nUAKLXvqUWBVq0o5KBa7vLVna+o+Q=
X-Google-Smtp-Source: 
 ABdhPJz6M84VvCP7HoO5nzovrkQ+rW5mr5/ZCtg6cXWlEBfWnjiA85gACDWEXxx32DjkfrvTpqDaDA==
X-Received: by 2002:a05:6402:518c:b0:426:32d4:87 with SMTP id
 q12-20020a056402518c00b0042632d40087mr27484610edd.394.1651727178028;
        Wed, 04 May 2022 22:06:18 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 gg19-20020a170906899300b006f3ef214dfbsm313386ejc.97.2022.05.04.22.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 22:06:17 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 39/61] python3-pygobject: upgrade 3.42.0 -> 3.42.1
Date: Thu,  5 May 2022 07:05:22 +0200
Message-Id: <20220505050544.651895-39-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220505050544.651895-1-alex@linutronix.de>
References: <20220505050544.651895-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 05 May 2022 05:06:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165267

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...{python3-pygobject_3.42.0.bb => python3-pygobject_3.42.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-pygobject_3.42.0.bb => python3-pygobject_3.42.1.bb} (93%)

diff --git a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb b/meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
similarity index 93%
rename from meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
rename to meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
index 360996dbb7..443605ae26 100644
--- a/meta/recipes-devtools/python/python3-pygobject_3.42.0.bb
+++ b/meta/recipes-devtools/python/python3-pygobject_3.42.1.bb
@@ -18,7 +18,7 @@ SRC_URI = " \
     http://ftp.gnome.org/pub/GNOME/sources/${SRCNAME}/${@gnome_verdir("${PV}")}/${SRCNAME}-${PV}.tar.xz \
     file://0001-Do-not-build-tests.patch \
 "
-SRC_URI[sha256sum] = "9b12616e32cfc792f9dc841d9c472a41a35b85ba67d3a6eb427e307a6fe4367b"
+SRC_URI[sha256sum] = "1f34b5f7624de35e44eb5a7eb428353285bd03004d55131a5f7f7fa9b90f3cc9"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.30.2


