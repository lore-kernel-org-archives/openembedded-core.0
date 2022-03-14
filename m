Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FCA3C433EF
	for <webhook@archiver.kernel.org>; Mon, 14 Mar 2022 23:17:28 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.3816.1647299847642938137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qSCvaH/1;
 spf=pass (domain: gmail.com, ip: 209.85.221.45,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id u10so26399998wra.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 14 Mar 2022 16:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=c1+XoZtuq010IyPRDGVu7lVqR0fB8JYvYiVihf2eZlI=;
        b=qSCvaH/1S/zBh4/zA1HpEJIpE6Gtq4UxMdfoeQojbjHljV6OngyOa257J5Nf5ETf7q
         0m5W/Sl9/sP/vjZNON36sDqbyk7WxVo8LFy3QnDKzGYWjs5yTV521xgJqI1TZhwpo/R5
         GxT90Uf+4dXYYWKn/fk+rGVjqf1tqSvYCBY/Sswno43/G/Xk4Yo8dQ9N3b59+yvrhNU5
         6Nn9voVZ0sBQNSLlIoL37KbjqSzciZ9kVCJN6ipnws1TsUl9oAVMlrDVCbWHSxWOR/P2
         d+Puw5vc7KK82k59lZx8rCRWdV9VJZBALBylw+L1Ri0xOOdLtPRB9rB7z4HzZONKyoIz
         U7/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=c1+XoZtuq010IyPRDGVu7lVqR0fB8JYvYiVihf2eZlI=;
        b=hptK9sXIB7HAihFZprxB9LUyiWS7HwT+1IMIwRtTcMK26hWeIC++158dx44jhSwu/6
         bk1W8XWpHaY7ltoWUxZq+6MrYDw8JU1ZgITKsHhJCd34gPnnO1cAUna2+rMdzpPgRSWF
         DZBTdknmrNEDXuSW03PMXByl/uC8qKrBDb9hVdF+AQMGwwb9/CSJqrbWd0JliJrAE4sa
         lrOmQuYL7JHDHzrFXs8i0MTJEmy6JM55fP90F27XGkeg6LDyz07/g9xCpXs1gUgsLHWm
         I+5rhUVfDnNF86mwHwhyLhsErjxjqNPJJSf9YaWBdqkxfhaHrGCBoTt6tX/0IpkU4a9I
         KGIw==
X-Gm-Message-State: AOAM531EjoGEceMkYRrxDWwZv4dlqJTBEuKPPBLWw0uGirIhoGJoPjSA
	GFqY0T2g5uOT38XLkvx060IN1CWIpaA=
X-Google-Smtp-Source: 
 ABdhPJyqRmex5agfSoPUuNpjo6BqhZ/RlF/dUNXElFttx8djIcSpMdyF7cDRWRxe+N06CK1tzTS+Rg==
X-Received: by 2002:adf:eccc:0:b0:1f0:1a33:a7af with SMTP id
 s12-20020adfeccc000000b001f01a33a7afmr18990697wro.113.1647299845944;
        Mon, 14 Mar 2022 16:17:25 -0700 (PDT)
Received: from CTW-01195.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id
 j34-20020a05600c1c2200b0038995cb915fsm1122019wms.9.2022.03.14.16.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 16:17:25 -0700 (PDT)
From: Jose Quaresma <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 04/11] gstreamer1.0-plugins-bad: upgrade 1.20.0 -> 1.20.1
Date: Mon, 14 Mar 2022 23:17:05 +0000
Message-Id: <20220314231712.296796-4-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314231712.296796-1-quaresma.jose@gmail.com>
References: <20220314231712.296796-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 14 Mar 2022 23:17:28 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163208

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...plugins-bad_1.20.0.bb => gstreamer1.0-plugins-bad_1.20.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.0.bb => gstreamer1.0-plugins-bad_1.20.1.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
index 1531b68de9..78e8f35025 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
@@ -12,7 +12,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            file://0005-msdk-fix-includedir-path.patch \
            "
-SRC_URI[sha256sum] = "015b8d4d9a395ebf444d40876867a2034dd3304b3ad48bc3a0dd0c1ee71dc11d"
+SRC_URI[sha256sum] = "09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.35.1


