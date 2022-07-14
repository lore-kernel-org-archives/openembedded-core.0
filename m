Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC36CCA47B
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 04:36:59 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web08.4062.1657773414302369085
 for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IsPzpBea;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.43,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f43.google.com with SMTP id
 j1-20020a17090aeb0100b001ef777a7befso5447202pjz.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 13 Jul 2022 21:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=gSnLQsaox0yOd+T0vhzOE4kk37bMLIGIITCDou8hgR0=;
        b=IsPzpBeafDa8QLcLxiW7roSbsrWA6KnPHU7spUSNEQrSo5BzAM9wHqbIUakFm2z6Eq
         5x2JTSLN//pdah2AmP4U7NV12Ct0vIivr3AQp51zQudvxU/5HL1bRZv5wrG2+/iQINJH
         i/zV/el8FrcsM0U9i4ijYIvs9OkSqmi5ctw6iQShuZJ97DrXr6lCMH+fFS94mVfuehhV
         OI0egpfAXe0jFMGhqT2h/xnygGdL7b4cyghhyhmyCVO6Pb8n0wTwR0WWZHNabqDQFBSG
         IvH2Lxzq1Xs7iNI3xNbPMt3HMHiHp/XmIlNnyfzcC+ZHkkO+UINg+xrso4EvoqMr59WE
         Sbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gSnLQsaox0yOd+T0vhzOE4kk37bMLIGIITCDou8hgR0=;
        b=hB22A/Lc4xFVYsqx95HZrWB5CR47A01fV2Wxk47cyj9RdVc0ZFH/u0/257K9Bw4jes
         cqwluZ7TwDRFFIh30iGsIoNbXTYgrgaNWE9kvN0gkF/4p9TnaADZzRaUFRWV4TUIGFH7
         RzHvuewwHV7ilmKfrdGAlMPBwj+CbL9M9YMTMbe+U76iG/6NnxtW47CYA3EgdzTtEwvW
         gEo989+ZepOL381m9BA9/G4tkdndNYvqnU85hAOWn7a8Njs8tx0UvIrPohoNI71wHtnM
         2XZDlltQ7W98Ji029syUhrIRRohOMWYz23kuCWUM5j3ut78AU1p+OtS344F2Ka87qGlp
         7kAw==
X-Gm-Message-State: AJIora+bKS+fLoSE3A6rU0fhKz+g3CPkJVLHoAJEir+zUwiHDXcrbN5f
	9n3D+93CR8wJeBnZLYRPlKRscC61ih6a2Ql2
X-Google-Smtp-Source: 
 AGRyM1vihDON5A/X1NIL5eX1vpI5/f33QzIgeceZdQJDqHVXm9qZWpSRVx8psPN9ThC8KsFaU9XPJg==
X-Received: by 2002:a17:902:a586:b0:16c:3182:a9b with SMTP id
 az6-20020a170902a58600b0016c31820a9bmr6578550plb.44.1657773413285;
        Wed, 13 Jul 2022 21:36:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f6-20020aa79d86000000b0050dc762819bsm411320pfq.117.2022.07.13.21.36.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Jul 2022 21:36:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 18/27] gstreamer1.0-plugins-base: upgrade 1.20.2
 -> 1.20.3
Date: Wed, 13 Jul 2022 18:35:38 -1000
Message-Id: 
 <c827ede3d6b9859b46e487ef60aa3259a45bd45e.1657772638.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1657772638.git.steve@sakoman.com>
References: <cover.1657772638.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 04:36:59 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168015

From: wangmy <wangmy@fujitsu.com>

Changes from version 1.20.2

audioconvert: If no channel-mask can be fixated then use a NONE channel layout
playbin3: Configure combiner on pad-added if needed
parsebin: Fix assertions/regression when dealing with un-handled streams (fixes regression in 1.20.2)
appsink: Fix race condition on caps handling
oggdemux: Protect against invalid framerates
rtcpbuffer: Allow padding on first reduced size packets
gl: check for xlib-xcb.h header to fix build of tests on macOS with homebrew
videoaggregator: unref temporary caps
v4l2videoenc: Setup crop rectangle if needed

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e9d5f5f88947efb8fbdfaa90676db82526e22093)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...ugins-base_1.20.2.bb => gstreamer1.0-plugins-base_1.20.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.20.2.bb => gstreamer1.0-plugins-base_1.20.3.bb} (97%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
similarity index 97%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
index e47851700a..7eebbba949 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.20.3.bb
@@ -11,7 +11,7 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/gst-plugins-base/gst-plugins-ba
            file://0003-viv-fb-Make-sure-config.h-is-included.patch \
            file://0002-ssaparse-enhance-SSA-text-lines-parsing.patch \
            "
-SRC_URI[sha256sum] = "ab0656f2ad4d38292a803e0cb4ca090943a9b43c8063f650b4d3e3606c317f17"
+SRC_URI[sha256sum] = "7e30b3dd81a70380ff7554f998471d6996ff76bbe6fc5447096f851e24473c9f"
 
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
-- 
2.25.1


