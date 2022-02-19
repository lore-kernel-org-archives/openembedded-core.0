Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C040C433EF
	for <webhook@archiver.kernel.org>; Sat, 19 Feb 2022 20:15:52 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web08.13922.1645301750843511736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=N0UU2Zt4;
 spf=pass (domain: gmail.com, ip: 209.85.221.49,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id m27so8346747wrb.4
        for <openembedded-core@lists.openembedded.org>;
 Sat, 19 Feb 2022 12:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ufqe3qDVP8rPjeI0a0gJ/NBW9bCcXTSdwnD3x5/yjM8=;
        b=N0UU2Zt40cakmXEIN/ODQfczjB4qJrrOCBwbsUN8CIfii7uDbnFGePpqq6tHEZDpwc
         rlAsjRPtDGNVlOQN2McSgyl3CKXGKSK671v81scQ/TpCunStTWVeW0VdB07iNWz97WQJ
         pOEv/bkApFyRykqhfPxBuGpz03zMuXMAzSFxafITP4tlv2En+yP+PUG7cvzTaE6lZH8u
         6syRrFTk7kprReGNzmzAhEIKvKtWMbZaZy5zCOq6AR0HdzwOCiyfOGuyyBDbeQidlv3y
         Qaf8HOIZiqAoyjKBWbbBTh3uBoqTwXEr6lD2dqiuWiUXMQntykAW8DBeLZ/DBsg1S+7S
         omdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ufqe3qDVP8rPjeI0a0gJ/NBW9bCcXTSdwnD3x5/yjM8=;
        b=kNkyuFzjFWwXaI14Xcb/3HcEK/3PaKnwi7Nb6DJwfn6yYomYOn8vV7Jbp9vfd4oDzv
         CZIxpiyTcSpPLBBee9RLNSxvm4ZRt+1l9EvYFMKGr6NypGfQhf4JmbpNsuNbVGzCKpG5
         352Jv9BKnIiPvi5X6GkK7v9yJwZjVYICRVVQRnWKcaI9/3BPXIq+0kbF2mcb3DCCnvex
         UWuaVQBZQSRgbnaxaUzv+XjmtJDuMqS2Ux8kB06HBo7rJLqonGIL4YhlT6ZVxGhUico+
         8PyHrTkdKyRMyA7H6ivHJWWRhIkQfXy5V0wRmYhyXam90nF2F+r2KUSYoE2XIJtWzu/A
         fFKQ==
X-Gm-Message-State: AOAM532Y9Ux0UVT8nVcJafUoWMZg8Wr94MiWv55RbozRV89YON65XoMA
	+Guk7Au9V2UHtfGJizyd3j3c5/LKBUc=
X-Google-Smtp-Source: 
 ABdhPJwiXmvSmxC2GXkIdo+euNeemImqRdbKS+6rEqBqahgnMLwYhuokHVdGiDrig9HUc/Qm1324zQ==
X-Received: by 2002:a5d:648b:0:b0:1e2:181:96cb with SMTP id
 o11-20020a5d648b000000b001e2018196cbmr10308358wri.508.1645301749180;
        Sat, 19 Feb 2022 12:15:49 -0800 (PST)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j5-20020a05600c410500b0037bc3e4b526sm3081065wmi.7.2022.02.19.12.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Feb 2022 12:15:48 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [OE-core][hardknott][PATCH 05/12] gstreamer1.0-plugins-ugly: 1.18.5
 -> 1.18.6
Date: Sat, 19 Feb 2022 20:15:07 +0000
Message-Id: <20220219201514.1551306-5-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220219201514.1551306-1-quaresma.jose@gmail.com>
References: <20220219201514.1551306-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 19 Feb 2022 20:15:52 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161969

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.18.5.bb => gstreamer1.0-plugins-ugly_1.18.6.bb} (94%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
similarity index 94%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
index 9777aaee19..5b31627141 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.5.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.6.bb
@@ -13,7 +13,7 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[sha256sum] = "df32803e98f8a9979373fa2ca7e05e62f977b1097576d3a80619d9f5c69f66d9"
+SRC_URI[sha256sum] = "4969c409cb6a88317d2108b8577108e18623b2333d7b587ae3f39459c70e3a7f"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.35.1


