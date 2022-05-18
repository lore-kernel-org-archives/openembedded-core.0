Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22234C43217
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 10:59:16 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.3488.1652871538844667500
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mKvebgAy;
 spf=pass (domain: gmail.com, ip: 209.85.208.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f47.google.com with SMTP id er5so2440169edb.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 18 May 2022 03:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1rLieyHStQRMYgpDUSVCZ0DSql+k2uXr7DOs54j7JfQ=;
        b=mKvebgAyp3V/Z/q3u1k3QHkcODZotivImRkMz60PWCoRceCWM3/K+Zc5d5fjqNzXrT
         iPWeZmkWreGpPRGQwuuag6lsOLs2iNvaX+IykGwEdIqADzf2aMLFMfvkYVAuae8kXICB
         BXZJe9N6Z4g2uQpgOr+BOgvb1MP9ooAr6gFrxjR70mnRh4WZk/tYlOI2sKtRmAb5VWAM
         rE6B+gm+ig7olWBgSPPacpdRRJYTHt95o72z2TeYXmuR4jl3EytXkRN0IxKHNp/wWjdp
         rKTwJmWzZLVapwcJxxtVr6gH33Ym1ylW7dzfsO5FAVbCf1LWGiI5wj0gd4trqUkl2ale
         gCpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1rLieyHStQRMYgpDUSVCZ0DSql+k2uXr7DOs54j7JfQ=;
        b=kZkVacHWVds32kp9LmA8lEu5yTdY3p1sah6lo/vW8JMDjLBH0lvVotX+/Vd39RahwX
         2xO5+1vYx/JFP8ToZYx5oepjxSW3FIYaok8UgcJhiBj7rl/g3zjSHH+TS9JY/dgFsfaF
         DXRbr0PncQWO8pdg0nHmN/JA3iK2oxxnl3tDRjMxdpE0Kx5PiqPlcw4nwvUJcuyl0jq4
         jYf+BUSxxC5zYDusyQLxAYv+lL/vaMMYK3lQAak+nvyIoeBTCIE8UZYLcc6BriaFa+s8
         wvNjvETH6P1UYhwwAdPbrCUYuOGnMqme83Dt7nnxUWbzA9CcWoQj1lrArlpw1DO7wc4e
         Oz5A==
X-Gm-Message-State: AOAM531bEgCb4NCbG359wu17wPip2RVdZXMPGAldmJaSylNHzRSngw9m
	0d4iIXiLyVf45u1MoIqf1bbm7vRigWU=
X-Google-Smtp-Source: 
 ABdhPJyDtSbKdok4ogCOCZN2Dphh+M3wQ4VXJh9txNLGdh5eJxa0nZAqrpa4pBGEzoxso69b+t+T8w==
X-Received: by 2002:a05:6402:613:b0:42a:b5be:6c40 with SMTP id
 n19-20020a056402061300b0042ab5be6c40mr14422315edv.254.1652871548271;
        Wed, 18 May 2022 03:59:08 -0700 (PDT)
Received: from Zen2.lab.linutronix.de.
 (ip-109-090-143-203.um36.pools.vodafone-ip.de. [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 qs24-20020a170906459800b006f3ef214da9sm861524ejc.15.2022.05.18.03.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 03:59:07 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 21/49] gstreamer1.0-plugins-base: upgrade 1.20.1 -> 1.20.2
Date: Wed, 18 May 2022 12:58:15 +0200
Message-Id: <20220518105843.3299331-21-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518105843.3299331-1-alex@linutronix.de>
References: <20220518105843.3299331-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 18 May 2022 10:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165818

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...ugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.1.bb => gstreamer1.0-plugins-base_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
index 0953261a98..e47851700a 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "96d8a6413ba9394fbec1217aeef63741a729d476a505a797c1d5337d8fa7c204"
+SRC_URI[sha256sum] = "ab0656f2ad4d38292a803e0cb4ca090943a9b43c8063f650b4d3e3606c317f17"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.30.2


