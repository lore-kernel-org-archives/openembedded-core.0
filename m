Return-Path: <nikhilar2410@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE21CC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 06:14:26 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6456.1714716860449552699
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 May 2024 23:14:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Sw0OHv8l;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: nikhilar2410@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ecd9a81966so11127285ad.0
        for <openembedded-core@lists.openembedded.org>; Thu, 02 May 2024 23:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714716859; x=1715321659; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wOL9ulCLOlWB+OuPsMXjjCWBHZBb6AZU21DsdFf4AX8=;
        b=Sw0OHv8l9GWTC8QtvZYYUadcpcJ/DJhlAp7C6uYwWXgBUgSeW5f/nSe1v8aOFSD4cj
         QeDM2oaVG7Hva2pUXJw9wYWSh/B42B+6zWfV7ntoW+XqgJEdBKWP5xoEL2MF8JIPTWsF
         FRLQYBoTyaa18fg9zbQDK7ZZjyVrE4Mc++62ShS6tHm9Q8vzYbzE5BxjUJFCvWQLho+j
         AddgdYvK3kcXQnjQbMvnQuK4/LSTrmgRTw2W4Xs1JKzm4h4iOIDkCJtgfTB11uVS+lfh
         nv2xvYs2+6i823/6M4V3cQhoSsR60tTTF6fY21UCkZmqwHjtypXML7g0+QCYueSITUub
         g7hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714716859; x=1715321659;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wOL9ulCLOlWB+OuPsMXjjCWBHZBb6AZU21DsdFf4AX8=;
        b=LcsBTl59rdR/+Uqu8DSzaSk3nFGQa31+HwUJhK/6kQd1qu12d3f9MPrJYnERORVoRR
         wHE0vP9XDcxR/SKY6SY+PhBAWfOwnrvM7zWtFvSH2+dzKSmJyxpWAtlGnrZnc0gLnfhe
         frfLLMXoUgnnv+oHolGDDhHe3AHGSHTTdOW4k+YoqQHdR2LdCOooU8ZKRi/Wqy/vVA7j
         iBLpCmk5aZqeQiAkSNa3VMuJilRaRv3Da9gcMt8SunTNBIAGpTgeckHjXXLRVGhRCkFo
         XD7RdQ3WB0bTwMANalkTGSMlO1josizdUxMWknf7VD3mOPZRcABZZeVrRDeWUoCDV0uS
         vVTQ==
X-Gm-Message-State: AOJu0YwxarOXIq4qmZ6Q/bmSQU4y1y7QdHpnB9OoSLrtc364zLyoLdu9
	5lFHEOKiFZhD10aM2TzkK13L/2BadZe0GS5b9xWqw+WfCnBuQg1Bal27uorVOQ==
X-Google-Smtp-Source: AGHT+IHuYhRoBohlaUnuDJNwfNHzvy01RqTZWLA6MkEmVAucJb26LcdesnMWA/x88hIXVzDkc1qXUQ==
X-Received: by 2002:a17:902:6546:b0:1ea:691b:3692 with SMTP id d6-20020a170902654600b001ea691b3692mr6148381pln.17.1714716859079;
        Thu, 02 May 2024 23:14:19 -0700 (PDT)
Received: from L-17494.kpit.com ([103.189.135.234])
        by smtp.gmail.com with ESMTPSA id km6-20020a17090327c600b001ebf263d2fasm2427828plb.7.2024.05.02.23.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 23:14:18 -0700 (PDT)
From: Nikhil R <nikhilar2410@gmail.com>
X-Google-Original-From: Nikhil R <nikhil.r@kpit.com>
To: openembedded-core@lists.openembedded.org,
	bindu.bhabu@kpit.com
Cc: Nikhil R <nikhil.r@kpit.com>,
	Bhabu Bindu <bhabu.bindu@kpit.com>
Subject: [OE-core][kirkstone][PATCH] libpciaccess: Remove duplicated license entry
Date: Fri,  3 May 2024 11:44:11 +0530
Message-Id: <20240503061411.27610-1-nikhil.r@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 06:14:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198968

Remove duplicated MIT license entry for libpciaccess

Duplication was done as part of below commit:

Link: https://git.yoctoproject.org/poky/commit/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb?h=kirkstone&id=b0130fcf91daee0d905af755302fabe608da141c

Signed-off-by: Bhabu Bindu <bhabu.bindu@kpit.com>
---
 meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
index d55315efc2..445f3751fe 100644
--- a/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
+++ b/meta/recipes-graphics/xorg-lib/libpciaccess_0.16.bb
@@ -11,7 +11,7 @@ SRC_URI += "\
 SRC_URI[md5sum] = "b34e2cbdd6aa8f9cc3fa613fd401a6d6"
 SRC_URI[sha256sum] = "214c9d0d884fdd7375ec8da8dcb91a8d3169f263294c9a90c575bf1938b9f489"
 
-LICENSE = "MIT & MIT"
+LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=277aada5222b9a22fbf3471ff3687068"
 
 REQUIRED_DISTRO_FEATURES = ""
-- 
2.25.1


