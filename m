Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C409EC4167B
	for <webhook@archiver.kernel.org>; Thu, 29 Dec 2022 16:01:32 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.206921.1672329684920598337
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Dec 2022 08:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=J5juwS8k;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id bg10so13445669wmb.1
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rahlXwVTxi2m/iYbNGNVPSGwK+Wn3T1+9hCIjuUEDCs=;
        b=J5juwS8kB6QecbisbSGATuepKtUFl5F3GFOAap8MpTDPqNcvdGcusY0vgIsojkkg+Y
         COv30o/fbBb95IV8yuRD+msUhKZjtmJVcI1bMB1PDwhHx/r1lnFDUTkBqGnnY12IAnGT
         vSHbg6Yh3Ri3cvFzOBtBZxXBi6uHolI1hKaWyQHYB8yVEMsJWPtmqLMvPBEhRh8qDsau
         l+ZxcByftV/v6hosMJcaNsrsh/F4l5T2jzMl6o6G1ONGlcA18Uzl1vNUWhAF4NX65HYn
         7yFiKeq+D0IQtcSY2pOt999fD+ihflM5dsZ3sX32uInLxGVKmCo/irym/K6dPw8e4KX3
         0lFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rahlXwVTxi2m/iYbNGNVPSGwK+Wn3T1+9hCIjuUEDCs=;
        b=kP9mAmFRT+mnNIJJRGK3pBW/01cpzi10dKlkiEwfAgEid6YagG+8dde8mI8iIXwSSG
         O1elJnsT/qXnUFD6IZaVWv4ms2oU0JISMfs/gDJm2rhHl4MzTjdSjGTxNVmD0gZqifRv
         bwV0IrcRgDPmFPplPrmpO3efG6UX5LqM+6pWm7HE45VW2mepCjQQ4mNkYu/16k69BbI7
         ESs0VQc67D6fzEPrH2q43OW5v3BztasU0x6BWIA+JHpeg56Kp/CCGPYv+ado3WxUH70/
         eUa6fq8Dvk5yLXxj2DTCW/myKkRxaQhU3nCpcErNboiOdZUL4EY590nhsg0uc6SaBxno
         DiMA==
X-Gm-Message-State: AFqh2kqeVo76WDBO2p/NufytSRYDFeehVepE2ZO6pBi9nRShruPruOhN
	s2HiLBZ/0F186qsNGczwCPx5Cn1P8aU=
X-Google-Smtp-Source: AMrXdXtT6kVq7j8MSznStvuQgHRuFvJ/8YJdpUyc+eWcYXNNaCpNQCuGuu4C8kvm6ke9ZukZFdsOhg==
X-Received: by 2002:a05:600c:2252:b0:3d3:5d8b:7af with SMTP id a18-20020a05600c225200b003d35d8b07afmr21441073wmm.41.1672329683457;
        Thu, 29 Dec 2022 08:01:23 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id bg12-20020a05600c3c8c00b003d1e34bcbb2sm28161735wmb.13.2022.12.29.08.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 08:01:23 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 09/10] vulkan-samples: update to latest revision
Date: Thu, 29 Dec 2022 17:01:09 +0100
Message-Id: <20221229160110.255775-9-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221229160110.255775-1-alex@linutronix.de>
References: <20221229160110.255775-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Dec 2022 16:01:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175115

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-graphics/vulkan/vulkan-samples_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
index d0b3458e1b..de90a88502 100644
--- a/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
+++ b/meta/recipes-graphics/vulkan/vulkan-samples_git.bb
@@ -12,7 +12,7 @@ SRC_URI = "gitsm://github.com/KhronosGroup/Vulkan-Samples.git;branch=master;prot
            "
 
 UPSTREAM_CHECK_COMMITS = "1"
-SRCREV = "74d45aace02d99d766126711a8aaa0978276ca00"
+SRCREV = "8b945bebf8b2fd987dcf0eeca048068adf4ea44d"
 
 UPSTREAM_CHECK_GITTAGREGEX = "These are not the releases you're looking for"
 S = "${WORKDIR}/git"
-- 
2.30.2


