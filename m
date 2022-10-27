Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20CE7FA374D
	for <webhook@archiver.kernel.org>; Thu, 27 Oct 2022 20:16:40 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web10.2221.1666901791662738069
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Oct 2022 13:16:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ilb1yzMY;
 spf=pass (domain: gmail.com, ip: 209.85.208.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id y69so4776279ede.5
        for <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 13:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=izywyyPF/LskgHbWY5TzJmyYRXYM8FdIhdKbaR4tPAQ=;
        b=ilb1yzMYwayxXHyTelvMnAj9PvBRcB5pCf8EO91X1QLJxYfUjOASvRGxKYPOpoQbEw
         lBhhbiJHqHJgsTUtaTWyVW4UVRSMWplMoVZc/pjsUPEE7m+fTUN+76IHfESSIV8BXi3q
         fTx058Rr7Hv1Z1Q8rl4Fp38JK7Ak6CJGmIr2tncInSU3IOfvgVlMlCh2HFGx8kxJjyT5
         VGp7JgGwTF//H+ToSIVi+w0oJhQnmm5w49Wxy71ZDgGfI2HO6jrNsA4RbDVMh4rWmDq2
         n2sbCPY4odW6m+S0dMWc0Q6i3z3PQEMzZIIIwlXdgeGZRTA+DZ7/X+Fa7fuVyoX5ur24
         YE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=izywyyPF/LskgHbWY5TzJmyYRXYM8FdIhdKbaR4tPAQ=;
        b=WIcGvsHxqHWYmlVoxJB4qxAadV3m9UowpjRHdywHbtWRiCKSXVsFxGTLo3hltmflh2
         fUTkiQsO9zQhLnJgPuuAi4Mqg1YxzurcHpFJYHK66Gy6hXCdPLwAs++AmpzLlhIPdi7J
         unI07Dt/n/tGWTVtBjjfBu+zm+a7K9qt4LXUl7oJJOVCLl8fUdfjOycwD6jCX61qDoYI
         QmUbNOI2GZJRPyE5jQlRjBs6+AJPdBLCDmxuv3CwiHK02YzfPJZxoEPRoXJXznlmjO8e
         wDkVMjcgIt5w9pNd3vaKfJ1redADgKuGRBekmJIbTAfxCz6wDjttqFUd3d3N9o0jhVIk
         0BVg==
X-Gm-Message-State: ACrzQf2GNM4mHslSz8yuc6kXN+7CAGf4l7soIjEQ3al6IwbeHgout6p+
	ugxq6/qa4fvzHBteKWP5w5HSE7o4wcXOLA==
X-Google-Smtp-Source: AMsMyM4jbUF5v2mqMnAMGLIbGkoCzaidsH9Vf3f334ZvbOulLW9KysxJXBsbHMFU4T9by2mUQDgnqw==
X-Received: by 2002:a05:6402:430a:b0:462:2e05:30b5 with SMTP id m10-20020a056402430a00b004622e0530b5mr13186480edc.246.1666901790182;
        Thu, 27 Oct 2022 13:16:30 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id la19-20020a170907781300b0077b2b0563f4sm1267225ejc.173.2022.10.27.13.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Oct 2022 13:16:29 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 10/23] libxft: update 2.3.4 -> 2.3.6
Date: Thu, 27 Oct 2022 22:15:58 +0200
Message-Id: <20221027201611.3644334-10-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221027201611.3644334-1-alex@linutronix.de>
References: <20221027201611.3644334-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Oct 2022 20:16:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172213

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../xorg-lib/{libxft_2.3.4.bb => libxft_2.3.6.bb}              | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta/recipes-graphics/xorg-lib/{libxft_2.3.4.bb => libxft_2.3.6.bb} (90%)

diff --git a/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb b/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb
similarity index 90%
rename from meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb
rename to meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb
index 12636914dd..23c7ece3ab 100644
--- a/meta/recipes-graphics/xorg-lib/libxft_2.3.4.bb
+++ b/meta/recipes-graphics/xorg-lib/libxft_2.3.6.bb
@@ -20,7 +20,8 @@ PROVIDES = "xft"
 
 PE = "1"
 
-SRC_URI[sha256sum] = "57dedaab20914002146bdae0cb0c769ba3f75214c4c91bd2613d6ef79fc9abdd"
+XORG_EXT = "tar.xz"
+SRC_URI[sha256sum] = "60a6e7319fc938bbb8d098c9bcc86031cc2327b5d086d3335fc5c76323c03022"
 
 XORG_PN = "libXft"
 
-- 
2.30.2


