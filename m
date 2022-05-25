Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEE61C4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:26 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com
 [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web10.7519.1653489020710578126
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=P9kPZ2Tn;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173,
 mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id a9so17018329pgv.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=zzewl8CZzs7b+xhIQgfnXBK+f2uSpe8wj9wJ1G8NICg=;
        b=P9kPZ2TnG5hYWGA5UDOhuBYLdqxy1+SmNplDGeJyUG9k5e6mtHYEBW2rbLykJn2AoY
         JGHxkUHPXYrflWpp6mqfiJyd7DTvvnqDrq6GWyjxirC6FXE70Vuvtp76lsBkWNZlrWL1
         fU7vNV1lYpcFR0BtxjzyEnNfvaarPUM9V5fq8DK6y6SQVarV8qHRM9NUZE2c97j0Hz3n
         TZ9x3klxRxU3o9tWJnSF2h5sNfodxCvE1UuHw0EnYSX/NnTxcStWSKHGTVF80/McUj78
         d7GrSvDIjTDwZ88WHgQYfsu6+3yW/eR/hPRnVQZ7z4k9jB2pt6PUxxZIDvLYuCsAm8w8
         3LSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zzewl8CZzs7b+xhIQgfnXBK+f2uSpe8wj9wJ1G8NICg=;
        b=HTLsqgG8TJqhlMpgC0MSoGsolTGXrAc30S2xDRkfl9uMWzHVqrbZVgNauaEkNgfQUA
         QhH9Bc3DflbCcGX0pbcKbkpxhcitZoqVD9Lqdpc2rRp78OSVBNu8/Sdfo40IT6W/lVsF
         evjt/UmGAD+uxEUH+9+XNTlgQ2KdN3UUGx2xVx3Kr04yBg5OK0VSBy/B8/jBjhcZW9Na
         yZhyhybMCpMfNr5K/d7VHTSFVfsAPrcP7edX7sV8cEewtIcgMiLNZES+NsH4I4lFWx2C
         9FJKG8zYAVzWg9DFwF/giUvCv0JUTiAtH8Rg6MU735bzdDrx1kONeaZYKW6zFEmjn1xl
         5vsg==
X-Gm-Message-State: AOAM533LABWyv4YnZePL9h66RCPL5NU0BsmP3h5V8QZ6NoyWDmqeTKMr
	LH11BcKH1bi15dG6Qt4Q2igDjSQKwVJpqqXX
X-Google-Smtp-Source: 
 ABdhPJw+/EwkUbhXY+TnBeI5/JFM4emeqhrKdn6kphYp0sYLf/d5YYdkzqVMVbbtv8ED3FtpSU1e9g==
X-Received: by 2002:a05:6a00:4216:b0:518:8335:3bfa with SMTP id
 cd22-20020a056a00421600b0051883353bfamr21707351pfb.65.1653489019565;
        Wed, 25 May 2022 07:30:19 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:18 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/19] gstreamer1.0-plugins-bad: upgrade 1.20.1
 -> 1.20.2
Date: Wed, 25 May 2022 04:29:35 -1000
Message-Id: 
 <8dca7bae0b16c7db820f0d7d60592a7d1d868a8d.1653488418.git.steve@sakoman.com>
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
 https://lists.openembedded.org/g/openembedded-core/message/166133

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix release:

av1parse: Fix several issues about the colorimetry.
av1parse: fix up various possible logic errors
dashsink: fix missing mutex unlock in error code path when failing to get content
d3d11videosink: Fix for unhandled mouse double click events
interlace: Also handle a missing "interlace-mode" field as progressive
msdk: fix build with MSVC
mxfdemux: Fix issues at EOS
mxfdemux: Handle empty VANC packets
nvh264dec, nvh265dec: Fix broken key-unit trick and reverse playback
nvvp9sldec: Increase DPB size to cover render delay
rvsg: fix cairo include
tsdemux: Fix AC-4 detection in MPEG-TS
tsdemux: Handle "empty" PMT gracefully
va: pool: don't advertise the GST_BUFFER_POOL_OPTION_VIDEO_ALIGNMENT option any more
v4l2codecs: Fix memory leak
v4l2videodec: set frame duration according to framerate
webrtcbin: Update documentation of 'get-stats' action signal
webrtcbin: Check data channel transport for notifying 'ice-gathering-state'
webrtcbin: Avoid access of freed memory
wpe: Reintroduce persistent WebContext
Build: use CMake to find some openssl and exr deps
Fix multiple "unused-but-set variable" compiler warnings

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 70ff1c8f54bfb47307cce4d2cb731cc775cd7e21)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.20.1.bb => gstreamer1.0-plugins-bad_1.20.2.bb} (98%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
similarity index 98%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
index 7c4665ae80..bb33e3822e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.20.2.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-bad/gst-plugins-bad
            file://0003-ensure-valid-sentinals-for-gst_structure_get-etc.patch \
            file://0004-opencv-resolve-missing-opencv-data-dir-in-yocto-buil.patch \
            "
-SRC_URI[sha256sum] = "09d3c2cf5911f0bc7da6bf557a55251779243d3de216b6a26cc90c445b423848"
+SRC_URI[sha256sum] = "4adc4c05f41051f8136b80cda99b0d049a34e777832f9fea7c5a70347658745b"
 
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
2.25.1


