Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6395C2BB43
	for <webhook@archiver.kernel.org>; Mon,  8 Aug 2022 06:43:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.22615.1659940987326358523
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kewDdaKz;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id w3so10112354edc.2
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Aug 2022 23:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EK/54j6IjqX0ipcUW2RiU7rUFQm490xC7yU/5lBvFeI=;
        b=kewDdaKzgnLLd/UGS1n5IfaexC02mvot8up9/5hu2n7kfEdMbi5aKG8mwx0s25MnlR
         GlxFiGOb15xZSCJFEWLrejcxoOrcaQIE2hZ0tapfGfswfJ/xKznd9RlWavsWRaPyBbyU
         lq2nTWVk6ol0ffebD6A8BBCdB6RH6D8Bc5WeLIMZrNoCWAcfo8Nflj4V3pEada3Ixepj
         CQTKOaE0hjNCjQgCDD3kbnDNj95COa/oXcMIMRPdFIHEc2yozUCuXn8RrcwEiXxrNRwS
         wcm+OWS8tGpw4fZ0Kj6WD++X5OcONyPvaBXqNaFujk/J/090C6YxSX1aOirzksfNyjCB
         Bfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EK/54j6IjqX0ipcUW2RiU7rUFQm490xC7yU/5lBvFeI=;
        b=i6lERFvowOX4Gj/S23+D/5R9+AWXFClHjecWHwwVrkhlghO2fR/sNnG2oUZHXJgoN9
         eeXZjP8UNsET2YfJXHXJwEt+NyyoaAXv8Qg6Z9uppcdY3/5yEWPFWdhy5uzrRxpaQtnW
         IjT0rpGYVR6wlIx1n89cwP29k9w5SfACs/HuD9TZUWOWyx4tod8hPqDA8KpHWNqDxr1e
         4upmrtforpbKl+8Awute/mK5onc46VaNHQdZbWue8PrI8jIXNe+CVlLApFzYv1SZNT3Q
         jI4oneYInrCvlNglBVvlKu/yHLkDl/QhY9AmXVaw80K54Ck05KnB+r1fc+AiNBW/VsoE
         o72w==
X-Gm-Message-State: ACgBeo07g+z/t68pD15aGBAlIHIP2QvOBCDURuqqR8UKRyPvXVn7VM2y
	/Fbl4soPgpbqpdD5u0d0JbMPrRgG54U=
X-Google-Smtp-Source: 
 AA6agR6LTgJsLKbLpQIBvrRbbqsBpy0zIF/fWyBMDKxTvSmSMNTYgl/OhaomWXABdE8NzqUehj0AnA==
X-Received: by 2002:a05:6402:2499:b0:440:942a:40c2 with SMTP id
 q25-20020a056402249900b00440942a40c2mr4792347eda.37.1659940985848;
        Sun, 07 Aug 2022 23:43:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 q19-20020aa7da93000000b0043bd2a79311sm4153477eds.37.2022.08.07.23.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Aug 2022 23:43:05 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 28/44] mobile-broadband-provider-info: upgrade 20220511 ->
 20220725
Date: Mon,  8 Aug 2022 08:42:21 +0200
Message-Id: <20220808064237.3975347-28-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220808064237.3975347-1-alex@linutronix.de>
References: <20220808064237.3975347-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 08 Aug 2022 06:43:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169053

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../mobile-broadband-provider-info_git.bb                     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index e6f216e5cb..2cc92b7b47 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -5,8 +5,8 @@ SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
 
-SRCREV = "3d5c8d0f7e0264768a2c000d0fd4b4d4a991e041"
-PV = "20220511"
+SRCREV = "fe19892a8168bf19d81e3bc4ee319bf7f9f058f5"
+PV = "20220725"
 PE = "1"
 
 SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
-- 
2.30.2


