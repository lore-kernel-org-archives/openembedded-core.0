Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
 by mx.groups.io with SMTP id smtpd.web08.503.1606848765648678688
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=CeXrtdjU;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.177, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f177.google.com with SMTP id r2so1669866pls.3
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=ca32vkI0MQ1DDXjqpAG0PJcMDcvS8a1F3K2FvpmomT0=;
        b=CeXrtdjUltRDZLjJqC1uMttNIVOCHXl4xz2RAnISo2srW6/Fra7bD3bq5V0nHQZNvS
         ZZOfCiOi4vbWc5+rDaMXNrTK0pOZOKTwXmCb20bNdp5qYcJ+riuru8X7vUslCx5oREnu
         qSqECCd+OruoeOjNHF8lWr1AZjPX+OTncfYDhEQxOxArbj+2ePPsDm0hk0lSfaJuzOo3
         1LKK9U1Nb3gJEMFho0Y+WPBD3AnUfBREBEmkCVxRnTc61vqAZlQPSl4Yzk6y4NIer4Vc
         ps2J+vHHG/GfeMZ/TcQXuZGBaBWsXR56zEos7hWSQax4uRdoU+fcfPAZaZI8mzTan27Q
         oK7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ca32vkI0MQ1DDXjqpAG0PJcMDcvS8a1F3K2FvpmomT0=;
        b=VXED4nCuW4np0FWZFYze6VTdOSShJAqTkyaMdAvg2p6uU+0XUOau21Ibjxg57e9PsR
         IGJQK4jwZrXdQdq+7sHQweHAByTsDWHiwo6NDzeq5sEgzESRHQV8x2rO8ME8EjxRYbDg
         j+dtZIYnVw6dxli7COZ96A1k+tAWITDaCgl/te0G0mhk4yOtykEEdvvK8TIZPsaHXLE+
         3ok4idjZH/jW5ulA869eXhjCTWgHUyN7MwUZn+IxsBVG1VY3CkBUfUxEj9a2Sgz/F+wE
         a7uU4xhZv9n6j8gwNjVdUqsSzPjT+s6yWf78m+jk+RGZXH2/Hvm2mFIY2UBDDfILXU2z
         3lwQ==
X-Gm-Message-State: AOAM531I6FAY6WOzTiM7+BZakiUS+Kd0yUPRBJVDIUTbjBM/B8jb0xEF
	uf0GcTyCWi38RoyVSCGNYQHMRyP5GtEBpPqF
X-Google-Smtp-Source: ABdhPJxOmkiaAfsAjGCg91i6Di3gnpA1sVZXiaTR/LpPp/6nHcEOdbGjo1Lf03xgZvAEOVe/OhifOQ==
X-Received: by 2002:a17:90b:243:: with SMTP id fz3mr4048480pjb.41.1606848764426;
        Tue, 01 Dec 2020 10:52:44 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.43
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:43 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 10/16] gstreamer1.0-rtsp-server: set CVE_PRODUCT
Date: Tue,  1 Dec 2020 08:51:53 -1000
Message-Id: <0ca33b3edaa59f723fefed88c2a68c96e909dce0.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

There are CVEs with the 'gst-rtsp-server' product, so set that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit eb5cbdead78d092733e783b09528b208efccac3d)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb                | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
index 5f1b1d44fa..ed51a5693e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
@@ -29,3 +29,5 @@ GIR_MESON_DISABLE_FLAG = "disabled"
 
 # Starting with 1.8.0 gst-rtsp-server includes dependency-less plugins as well
 require gstreamer1.0-plugins-packaging.inc
+
+CVE_PRODUCT += "gst-rtsp-server"
-- 
2.17.1

