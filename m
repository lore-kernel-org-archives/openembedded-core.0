Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.435.1592848938925582181
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Jun 2020 11:02:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BGXVqpzO;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.174, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f174.google.com with SMTP id k4so16455769oik.2
        for <openembedded-core@lists.openembedded.org>; Mon, 22 Jun 2020 11:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=gyHvQAv335iMLb6PUsWQJgcyF6t8wuyZZgf18+mu40s=;
        b=BGXVqpzO6yEguAUZBeFxpg/ePsC3nbap83WHCqBiXaam7jPAkl0riP/R9dHaMYsp6U
         jH5JkcOgNc80VIQySq0FjPiGrIQTMdhRgCV4ZK6C8b1/Fn60KD9DgGQ1pME7j8TOwTzi
         vjQ7heYRWQQlPFg7CcNsbhLM8HcA6VWRjPug1daI+rreTOQk2Ry70d7CfZ2CbA7/tk+2
         VNMxNpoROxBEzIofaJ/OxNidsMO0BwZXBKe80h4dS14PPCVjO9Q+xZEdGLE0m0PHbiTD
         fJ4Sg6exdXkgZu7uG+axlPDITvx3Byp7TrVLgBwO1nNDINGvI6rXBEZ0u1ib1Y2BjgMS
         PyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=gyHvQAv335iMLb6PUsWQJgcyF6t8wuyZZgf18+mu40s=;
        b=kSYrT/16jlNS/UVOsxyQPe3/ajHigC7NVra1kELMGWTGDzoEkT6P5v0k5g/qFPB3au
         xTw82bPFU4gPsTL7zvZdE6OjazRuEemtja3eboIwodqA/4CGC68NmoW0Dr2jF4nj5alh
         zVBXwjFnJrx1d7oO4RfTCCgt89k4zT8vTXQZLYg7eRi/rRZAARwkC4501do+WBnWNJhp
         eGOVBuMvTSlOfEB9PPN5lUjHTNWgQAGv9xjyt2WP67gmwqL6LXyJJQLQVuOYFOsD5BIi
         KgDcraKogtFM5ST1bkw3rnXO9xe0wgQlmP9+w0iSX37sak8wrshoOAr5SNATkm1WZymn
         o0xA==
X-Gm-Message-State: AOAM531mVdsCFDneUpdkrs67hZMnBZHVPQGOO2tj4y30ATyRPABbs7mK
	/lkbZrtasp3ga1cmOR++LVtofh2Jjp7L4g==
X-Google-Smtp-Source: ABdhPJz8dVln9cgg1+TrR4hLl6ZPFUVc9kuEoj+C9DcIeavKn/OYuaCBElJSoPbBH/BZ+7/fECqslw==
X-Received: by 2002:aca:fc49:: with SMTP id a70mr12958040oii.114.1592848937821;
        Mon, 22 Jun 2020 11:02:17 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id n60sm3422659otn.75.2020.06.22.11.02.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 11:02:17 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 33/33] gstreamer1.0-plugins-bad: add support for vdpau
Date: Mon, 22 Jun 2020 07:58:27 -1000
Message-Id: <e603d67f8219c09c0640242af5c26a4f46f65f1a.1592848337.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1592848337.git.steve@sakoman.com>
References: <cover.1592848337.git.steve@sakoman.com>

From: Ross Burton <ross.burton@arm.com>

libvdpau support was added to meta-oe by commit bf1de4db2 ("libvdpau:
Add recipe") in 2016. Therefore add a packageconfig for the
corresponding gstreamer plugin.

Based on a patch by Richard Leitner <richard.leitner@skidata.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 878a8561e10017bb91ea42bbbe6d4acfc0985482)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
index 7a227fed51..99176b2571 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.16.2.bb
@@ -75,6 +75,7 @@ PACKAGECONFIG[srtp]            = "-Dsrtp=enabled,-Dsrtp=disabled,libsrtp"
 PACKAGECONFIG[tinyalsa]        = "-Dtinyalsa=enabled,-Dtinyalsa=disabled,tinyalsa"
 PACKAGECONFIG[ttml]            = "-Dttml=enabled,-Dttml=disabled,libxml2 pango cairo"
 PACKAGECONFIG[uvch264]         = "-Duvch264=enabled,-Duvch264=disabled,libusb1 libgudev"
+PACKAGECONFIG[vdpau]           = "-Dvdpau=enabled,-Dvdpau=disabled,libvdpau"
 PACKAGECONFIG[voaacenc]        = "-Dvoaacenc=enabled,-Dvoaacenc=disabled,vo-aacenc"
 PACKAGECONFIG[voamrwbenc]      = "-Dvoamrwbenc=enabled,-Dvoamrwbenc=disabled,vo-amrwbenc"
 PACKAGECONFIG[vulkan]          = "-Dvulkan=enabled,-Dvulkan=disabled,vulkan-loader"
@@ -88,7 +89,7 @@ PACKAGECONFIG[zbar]            = "-Dzbar=enabled,-Dzbar=disabled,zbar"
 #   aom androidmedia applemedia bs2b chromaprint d3dvideosink
 #   directsound dts fdkaac gme gsm iq kate ladspa lv2 mpeg2enc
 #   mplex musepack nvdec nvenc ofa openexr openni2 opensles
-#   soundtouch spandsp srt teletext vdpau wasapi wildmidi winks
+#   soundtouch spandsp srt teletext wasapi wildmidi winks
 #   winscreencap wpe x265
 
 EXTRA_OEMESON += " \
@@ -127,7 +128,6 @@ EXTRA_OEMESON += " \
     -Dspandsp=disabled \
     -Dsrt=disabled \
     -Dteletext=disabled \
-    -Dvdpau=disabled \
     -Dwasapi=disabled \
     -Dwildmidi=disabled \
     -Dwinks=disabled \
-- 
2.17.1

