Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web12.1473.1620945533439035623
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 15:38:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gfnKbnsp;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id t11so1481222pjm.0
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 15:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OXtBvK13rCJSkt7wCRTuwFXxuabqGSoLlK6dWpwDwVo=;
        b=gfnKbnspncpylvURSBKe1TAm4+tcmrUutQa7RzWLEmJ94IIjP6pYdzMl3XkjxbL0ee
         1VCTySlwB1ZtYrn5RYTkUe0tP21oJtLB+lVxS980oRJooTjQgMoBUfaCLbmoNu8YqqiP
         uKXAi4Q7j0aTD+lQGkThbDsIAYgaDrBib7XwuYQRcePUKSE6DRcSkpFontwycwPartCJ
         MLgHEwSmI15ymZ85huLQhJaEX7YcRjCdXKNore1uV/EhfSNdySPNmx7avboJNKayW1k1
         WTC6girCCrff5sfdcp/Rh7tyEaEzvFi9YRMmxdiMsIgP0fFR6l33KgkA8lfQWk73IVo2
         +nhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OXtBvK13rCJSkt7wCRTuwFXxuabqGSoLlK6dWpwDwVo=;
        b=Jr1mntjSHWKJXsrkD6/HW5WfNRM89/inZEe6Q4TwtTrcyoEgfk4gxrSBebgmyEVs4F
         zdfuECC66aaO7p4Ojd3179SGYd76jBExzuFvr4VRyArvDMuq1A5UIiBaeS0XMij5q2lf
         b6wANN2FwrttlSSpGpjOTGsrCuhLDRCDUXucFqvdM4fVVfiWceWm7sXnGGwXLMAGGrLz
         NxMNt8u784ioFIMyXYTjQXQ+J0/brA5rBuevttJdS6UMPa3K7Iah87qH2/MnENWboaFB
         J7+CDa8E68o5OAlkNVU67cV2C8BQHIxE+qjw1K9o7mnncYvYzay9ip1oCKIZTTwwY3ah
         10jw==
X-Gm-Message-State: AOAM531q38jRw+eNWBRaKSpbIK/wiUu3yHd16HVt+SPOcDiuL29LKpE0
	EAgGy6Tlr2GroMpF1kHEnbdF7PQVw1RwSg==
X-Google-Smtp-Source: ABdhPJx7CbDs9gNEbqz6STZro2c6IMHXl5c7DP1NrfUef/Cs2gW+fvw5LeoD+Q7zQqCteqlR5R2yRA==
X-Received: by 2002:a17:90a:1ce:: with SMTP id 14mr7403936pjd.163.1620945532781;
        Thu, 13 May 2021 15:38:52 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::a7ac])
        by smtp.gmail.com with ESMTPSA id x133sm2898588pfc.19.2021.05.13.15.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 May 2021 15:38:52 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Yann Dirson <yann@blade-group.com>,
	Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0-libav: remove explicit LICENSE_FLAGS
Date: Thu, 13 May 2021 15:38:47 -0700
Message-Id: <20210513223847.1086544-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210513223847.1086544-1-raj.khem@gmail.com>
References: <20210513223847.1086544-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Yann Dirson <yann@blade-group.com>

This flag does not describe the gst-libav package, but ffmpeg instead.
It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.

It is above all not needed, the real problem is even more clear without it:

 ffmpeg was skipped: because it has a restricted license 'commercial'. Which is not whitelisted in LICENSE_FLAGS_WHITELIST
 ERROR: Required build target 'gstreamer1.0-libav' has no buildable providers.
 Missing or unbuildable dependency chain was: ['gstreamer1.0-libav', 'ffmpeg']

Signed-off-by: Yann Dirson <yann@blade-group.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
index 7c39e7da37..d5b38f77c5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-libav_1.18.4.bb
@@ -4,9 +4,6 @@ muxers, and demuxers provided by FFmpeg."
 HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
 
-# ffmpeg has comercial license flags so add it as we need ffmpeg as a dependency
-LICENSE_FLAGS = "commercial"
-
 LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6762ed442b3822387a51c92d928ead0d \
                     file://ext/libav/gstav.h;beginline=1;endline=18;md5=a752c35267d8276fd9ca3db6994fca9c \
-- 
2.31.1

