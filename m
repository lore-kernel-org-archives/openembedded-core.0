Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.14993.1602947734807886798
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kj/vo2Qb;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id e17so6663882wru.12
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=Kj/vo2Qb5BaZmY+6jIsAfRskqLfWa+Gz95psxgQ95W6OmYoME1zH2g9IUgYVbe7F1T
         uPnmPgMcWGfR8SwtCZ9RDvpQ2ACeRquQNrTKCe+wh9WDFWqRq9pe1ksgJlKTAAhk53kh
         btuJbKoNoBc7X9f37cLPLM48FA99lKvpBHDbYWRexcQRb2FiviYaCdhz6H3YOVJKkGXn
         GtjoApPJZ4r9g4Y4LjgnDEg1/4EaJuR4rj2XjPyrgqmjbrxjEW0+u6bMmyAZd+kVI2AR
         B9sVqG4tydbMvsjc3KPtjJxyEgNT6cfFE3yDwbRDV11bewfnn+3Trme1kO90SfyZPoOP
         nuJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=FV0UagLVLG2pAsyflXzajS3Iv47O6n4jcmLuFmnTDQhWd5JpewK16IlpqBy5ozhiAA
         GrM6WFpugwrKOHfIpNh/rxfW1vme4YEKsl/wHLX+VOvestc0oWagqk66zAMtnrQxcdjc
         gsspdWDqAM7By2Aaw6wmH9Nxj9raOWeEV9gpKx9ylGxD+vGE92dI5ktttgtLKfJalkxc
         AlbIhv0ZEop1yPsHEgVSxQ7MCxWOojfHzpesrUHSIxl5Z17zImrhx/WoE2hRKcUNPPKN
         U5nkPTaxUgfEDhEiTa3zj5wuDINNvKDNkDF2dqSnTqdVTCCCBJEMncQhRiy2HzLmgX5j
         8hlw==
X-Gm-Message-State: AOAM533Y/HDGN5MsmMcnamURBkAsCk9VE+qR98NMNCyETDUT4PDfbfkx
	d/sYXFOTY+RYVWTBhA9X5MnOd2gw2Ejf3A==
X-Google-Smtp-Source: ABdhPJzbjB9C6idyzMxTCFXLnFGgm+tx49blEGlV0t7fkywGB7ClwMuNXBERAohF4I+AcoSXcPDdyg==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr5719696wrr.9.1602947733245;
        Sat, 17 Oct 2020 08:15:33 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:32 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 11/13] gstreamer1.0-omx: upgrade to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:22 +0100
Message-Id: <20201017151524.31550-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.18.0.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
index f1bdbd235d..c4855034e0 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.18.0.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "dcff9e4f055a2b1ecadc9f49f5b60a2e"
+SRC_URI[sha256sum] = "302c65e04578991364f7605e04cfb54dfd75268d51080d35f221ee1a8b341fad"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.28.0

