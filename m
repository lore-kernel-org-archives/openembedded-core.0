Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web12.106.1603837795635523453
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=xjztTbsh;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id a17so1531735pju.1
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=jy3LNu4tf+RR39/fnywTIY52p3N3ZDGa8BUMopg4lNA=;
        b=xjztTbshffxyI+t7WiW5oOUePWYsrc/CfIvGNJ7t15cImxI6b1DbUrLVEdXTJwErvG
         jLLdQoy93016R1TugDJnIK8G33yWKEEhOTjJu//sUzThXywEMIf0l8loY4EPCgjbziuk
         C9AxME7nc7NGZiuS15c4Nipts7a2/VHNdVNR64r+p4MpJBp/VAetI/wh7kMpi0uC7QRO
         oThZfDX0zCXfM8NFbHGTsJnFG+NstSUolnfTsoMXR2r2l0QIJAQYtK+t9CzjLwR+c23O
         bALWRDCqhvvgNW69hm6dG3UnPAa6SBLMpx2EPTH8z/naK8gWd3zO2HScHn8WRWGP9h+M
         GyAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=jy3LNu4tf+RR39/fnywTIY52p3N3ZDGa8BUMopg4lNA=;
        b=cCkuxFS92PshEJUsxwxi3AKuhXVx2ASkY7Bwf3j6L3Pwfm1A9eGfA4HyUYtOgel0Sc
         QBGF/xzqAL5aItwHhANrHkzk2r9PR/Vc/5YxGnq9kBVBGKXEcdreNxIalxzexplxkmh3
         M1/8VTjaavAQcR8KCsFF3GOsni0d4hT7gGThXJPb2PXI6eK0AtggmcAFSwVFSKK+MVwr
         rJ5sdNrZ3Zsot1gihxy8uTWqpG9e8zp2t7Nu/FPnOFlVGkmQzDkWg04PdZpD8rDBbimo
         KXtiz2/q7E6j5h77wXgfF61NjPyRfmsJFeZaBx9RBae0/JQ5zZbISZRmaBX07o/2nX1G
         Gn0A==
X-Gm-Message-State: AOAM532YKrpv5wDGYNSX2LvzSNYJq0wO0YjGD58+gz1Jpk6bg4JlNNXv
	MMktjc3NGjwJVLxPPrKLUWoARs8aOKqLIlPh
X-Google-Smtp-Source: ABdhPJx0diuYVP6s3Z8WXqHAx5/TPjQUhbznl0uFMVYmrdLoTru4YeTHeBoKvMayOLtzLFR5N2PQCQ==
X-Received: by 2002:a17:902:8544:b029:d5:e680:1d23 with SMTP id d4-20020a1709028544b02900d5e6801d23mr4807986plo.46.1603837794797;
        Tue, 27 Oct 2020 15:29:54 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:54 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/16] gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:14 -1000
Message-Id: <cc27832fb7fb88ed9c97da742b54eaff760f0018.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...reamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.16.2.bb => gstreamer1.0-libav_1.16.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
index 2fdefc925e..98355a1b75 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.16.3.bb
@@ -10,8 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-libav/gst-libav-${PV}.tar.xz \
            "
-SRC_URI[md5sum] = "eacebd0136ede3a9bd3672eeb338806b"
-SRC_URI[sha256sum] = "c724f612700c15a933c7356fbeabb0bb9571fb5538f8b1b54d4d2d94188deef2"
+SRC_URI[md5sum] = "d08fb5429f102d5a3f1eca3dee2a0add"
+SRC_URI[sha256sum] = "d10c5eb1a00a91de97c85c0956c663aa6e99d268195cdec4534c179b831538ec"
 
 S = "${WORKDIR}/gst-libav-${PV}"
 
-- 
2.17.1

