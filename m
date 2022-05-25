Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BCE6C433FE
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:26 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web09.7399.1653489025435641127
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=N9hIuDR7;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id bo5so19381005pfb.4
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=aN3c8nxonOF3NMWBYWl5ZKpb79t7SswHFBLPCHQ+ZqU=;
        b=N9hIuDR7lUW/91xvLH9uyKxqxZFF2RSuv3usZezMyGCNpuNrv3lnJZrW0kOofHTtGH
         reBbpw7iS0CXXsmDxf4yOyRuWF8uaMZUrUA8a01+8r0svXsW/+AW8O0S79OtVOwDK/V/
         iiDNmhZXb6ZcuDlWWD3nA6fhNCI5ST7z8dtULLzwMC8kEX+XjPcUCmkSdrV4V+EHWg76
         GFfpLfkI4Y+PIkKay4iPwTcXYJIVEXcIG6Ml73COLDIXgzmOfGxiB02tukw5UAUFXXx1
         d9zJyscQNc6mDxAWBf8iS7zKwbV0QZedp/WOYB7N6eT1EQ48YRumLpxl4llpA+Ncc0m+
         m+Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aN3c8nxonOF3NMWBYWl5ZKpb79t7SswHFBLPCHQ+ZqU=;
        b=RFLXM4qN+kbSgoTuU4SwsRxf0Z5qGwLUOhBKDBce/AX+3QGFS4sufyn7qcCGZLP9s+
         jwiuCt99qIL7IyfJoJARN5C8yRrRmD0TqCpzVpIVO+KGu9/N5aUTENmwhA+oYUO0mz12
         XRzHdTFFiEEdFem7Ek3/d5gs4g+wScxNh7oDYhse1ISX88GWph5FvUhQHz1UsGmPaIW7
         sF78POGphHy8lHeDYWQ2oXWrAW+ZACmU6lPG9TLw/cOWyj7IgEJzH5AZD7rEwBHLgM1g
         RqW3xVfbJqrxBLt11XhgOi4hos1mWx2l6fdh0wccnaXiUneycSQS3gsbE+WZ711I89f4
         /O4A==
X-Gm-Message-State: AOAM531k3SgMbyboOpAMpRuIcuUoDAEHgxnpKtsMRsO344RbsGoHKtRF
	xNO7Lej66vEwTzKrSxAWcj0Tp9+prMa7q7OF
X-Google-Smtp-Source: 
 ABdhPJwFeyD2s+ZVEZAY85e7zfYIAu7RB0Z+WaOc9gyvm7GzrsITM0dsIrUW47lZyhV4inipizj8qA==
X-Received: by 2002:a63:488:0:b0:3f5:e6da:4619 with SMTP id
 130-20020a630488000000b003f5e6da4619mr28722100pge.6.1653489024173;
        Wed, 25 May 2022 07:30:24 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.22
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:23 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 09/19] gstreamer1.0-plugins-good: upgrade 1.20.1
 -> 1.20.2
Date: Wed, 25 May 2022 04:29:37 -1000
Message-Id: 
 <9472f0fe643c34a70139fd3967564a7e6cc0ded0.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166135

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

deinterlace: silence unused-but-set werror from imported code
qtdemux: fix leak of channel_mapping
rtpopusdepay: missing sprop-stereo should not assume mono
rtpjitterbuffer: Fix invalid memory access in rtp_jitter_buffer_pop()
rtpptdemux: fix leak of caps when ignoring a pt
rtpredenc: quieten warning about ignoring header extensions
soup: Fix pre-processor macros in souploader for libsoup-3.0
twcc: Note that twcc-stats packet loss counts reordering as loss + add some logging
video4linux2: Manual backports for RPi users
wavparse: handle URI query in any parse state, fixing audio track selection issue in GES
wavparse: Unset DISCONT buffer flag for divided into multiple buffers in push mode

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3594cbc054d0f0eb3342282f8100a0285fc9d1fd)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.20.1.bb => gstreamer1.0-plugins-good_1.20.2.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
index 1f61d9a10e..6c52fb35b9 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.20.2.bb
@@ -8,7 +8,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-good/gst-plugins-go
            file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
            "
 
-SRC_URI[sha256sum] = "3c66876f821d507bcdbebffb08b4f31a322727d6753f65a0f02c905ecb7084aa"
+SRC_URI[sha256sum] = "83589007bf002b8f9ef627718f308c16d83351905f0db8e85c3060f304143aae"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.25.1


