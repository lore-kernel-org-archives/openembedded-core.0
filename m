Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C18AC4332F
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 14:30:16 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by mx.groups.io with SMTP id smtpd.web09.7394.1653489002211546535
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gwtRY3UT;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.178,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f178.google.com with SMTP id f21so7026109pfa.3
        for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 07:30:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=GAiBiWGv+KUVLieSztDzl7NrnNhwf43pvBrS7lhK+DY=;
        b=gwtRY3UTqmQGXHXuJEnYwR7vTzAGJjR96yUblF2qvU4EJ1WCgyOOdebJyhpBMf4e3p
         1C71sFrn0jWgLgH8HTePUlNvJ1ebR4xGt2X5HQxYAyEXOM4GVzawYOfUIc6NNxsatwkN
         vOrHcYUtLZOVSv7ypK7F3iz9UxPbjEqylI4VahMMqtPN8bP1SWosx7C1y3tKRVW+qTyW
         OQcbCfva7/iwwatb8vB7+Jdje5/DmDx2LwgMGg5Mm+KX8bkf0t35JKFC37ThrV6pE6L7
         H03yDrtd0mO3lD67LI+WANkeXR0tL/9CUYwqdWJO7NIy+HOxCRzkLZ8mUSqiDLvfGgZK
         aN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GAiBiWGv+KUVLieSztDzl7NrnNhwf43pvBrS7lhK+DY=;
        b=vZxu1ucX8EMey/wmXeCp1BdsEFESfdFOX2teFdenMPE1MXrZIMU69zK8+ILatzaM+S
         ix2Hxz0qpGGxZlJ000b/xMmzYa1FskbzCJrmXBrIsAq9D/lHID5HXAX5hh/q75CmKKkd
         i89XSmIYOu+l5wigzlnz0PMn6R7lhlahrtKA9iTewISLGQjloWI9FQze2Hgwq4pKL+UI
         zVGR9cZ4GpCOh+OKDZdxZmjlFAgxhT/UsWe+qxkhrsApGiimVvBs11KBBZrIstNMD/xA
         XsDsT8+jWm06epboTAnpm1dyUETubTX+h6fSQbuLUGY7wCvyOxn86v++afSIcEFciT4l
         ckuA==
X-Gm-Message-State: AOAM531ueWYF5bffgb4Uw9rwxqaTCesg/GApYVzqkyWuke54LMZL8UYQ
	wySVPtS5wPjXGP2cvC78XkTS8g6t0Yj6CEHj
X-Google-Smtp-Source: 
 ABdhPJxJgUefDcewzuAkwvQ2YESuRCdjOMVTcpQbPNB+PwKbjLWMZQukCmlSL7G7strH2PZN1BJvCA==
X-Received: by 2002:a63:854a:0:b0:3f9:eacd:d724 with SMTP id
 u71-20020a63854a000000b003f9eacdd724mr19135741pgd.248.1653489015132;
        Wed, 25 May 2022 07:30:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a8-20020a656408000000b003db141a5f26sm8553837pgv.1.2022.05.25.07.30.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 07:30:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 05/19] gstreamer1.0-libav: upgrade 1.20.1 ->
 1.20.2
Date: Wed, 25 May 2022 04:29:33 -1000
Message-Id: 
 <b796e337ac4ce189525b5af942226c0b4ab42ca3.1653488418.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1653488418.git.steve@sakoman.com>
References: <cover.1653488418.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 14:30:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166131

From: Alexander Kanavin <alex.kanavin@gmail.com>

Bug fix only release:

video decoders: fix frame leak on negotiation error
Fix build on systems without C++ compiler
avviddec: Remove vc1/wmv3 override (fixing crash with FFmpeg 5
Segfaults on ASF/WMV files with FFMPEG 5.0+

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 208ddca121bb213a9e79d21b448547df58b9a511)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...streamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.20.1.bb => gstreamer1.0-libav_1.20.2.bb} (91%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
similarity index 91%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
index 16a298ab14..4ef9755c07 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.20.2.bb
@@ -12,7 +12,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=69333daa044cb77e486cc36129f7a770 \
                     "
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz"
-SRC_URI[sha256sum] = "91a71fb633b75e1bd52e22a457845cb0ba563a2972ba5954ec88448f443a9fc7"
+SRC_URI[sha256sum] = "b5c531dd8413bf771c79dab66b8e389f20b3991f745115133f0fa0b8e32809f9"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.25.1


