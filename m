Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69733CCA482
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:49 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
 by mx.groups.io with SMTP id smtpd.web12.4030.1657773406926155370
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=kWYKhd1P;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.170,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f170.google.com with SMTP id 23so489494pgc.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=ci+TlZO3AKBXcXC+HJVxSuVaVpq0B4W7Uej8AhJILpw=;
        b=kWYKhd1PlhbAckMLP6cqQVFVZcpZE5iUQLjtpJsn5YHBY9PfvgOYLUrrfwB1I/1icB
         1i4f6HqR41yqyhdSm9+TpC3GT6yrjcTtcGRTLsA7XGK74nZwWYKvEDkbIyPvGONS77LH
         gQTZPgtZOVVBmE4Pb6H4bKhBzeLIi5qiKywzvFoVD91OWv1JWZia1EMRCxzUGcIPv42N
         2Plr8r+hUlqwz/dEzGGT3UB6iqF5uSgglURRQsAMCJ7bm1+KxEI+bdXhQwrC2PSitQ+t
         9ztvoWI7jVq/i9AljLdpp5+5f0tnrlSUtSL9p5tR3U4JjI37+XNBoR7MQEA3DIjuL2dD
         X/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ci+TlZO3AKBXcXC+HJVxSuVaVpq0B4W7Uej8AhJILpw=;
        b=nCHS+a/ODNsAlggzW21yrVBZ5ql6jbpJgcwF4HcmIgsR4FhhpqHw04lWHEt6IqaHLv
         D3vvQ/2PR4GEiWQEJzc9PsQY8h4XWKSE8ODR3q3A/+I48ImDKyay6uOKXGoMckUHNffX
         BeIb+Zx5d0PiPJXeH6YL6b8oINcp9xOVDCxXMSFpH/nQ2iIURqeYL48NhBEf0mXTbQKx
         e+yv4kLpSARfA7ZrUKNxCw/aosuZaqHCxhEeQ485PV2wF16lRrfm1rb0Ml0Hq//ooHr7
         Vq3I/aunUu1ogx9g6LikzGkSI1R2SsivSOruCjbiHyBWHHRVEy9IcD0mmGQBa5H5qzTa
         azww==
X-Gm-Message-State: AJIora/i767uGDEfaW0U99QEGd2lYgZs1ufiGAFc2/EqjABZHN5Iyhj4
	UKX+8nJqpIIz3iU6bhGEkhsPX1wUk/nxN2+W
X-Google-Smtp-Source: 
 AGRyM1tHz+VC47m/ddDHF0H7c3jvXYTvle6rQAWQ6umUJU6bhgKsqU+WCaVFYvWMn6Anft4CLCgxOQ==
X-Received: by 2002:a63:2686:0:b0:419:a2da:5078 with SMTP id
 m128-20020a632686000000b00419a2da5078mr4067423pgm.613.1657773405964;
        Wed, 13 Jul 2022 21:36:45 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:45 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 15/27] gstreamer1.0-libav: upgrade 1.20.2 ->
 1.20.3
Date: Wed, 13 Jul 2022 18:35:35 -1000
Message-Id: 
 <9b8a62dd3987280debba1fa11e9a1387fc341f4e.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168012

From: wangmy <wangmy@fujitsu.com>

No changes from version 1.20.2

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 671a2ebab778393207bf95db88445bded3a4ef54)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...streamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.2.bb => gstreamer1.0-libav_1.20.3.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
index 4ef9755c07..e8da49af99 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.3.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "b5c531dd8413bf771c79dab66b8e389f20b3991f745115133f0fa0b8e32809f9"
+SRC_URI[sha256sum] = "3fedd10560fcdfaa1b6462cbf79a38c4e7b57d7f390359393fc0cef6dbf27dfe"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.25.1


