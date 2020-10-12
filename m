Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.39520.1602506213581701818
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bRMnF0ly;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id d3so17370936wma.4
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=bRMnF0lyvWeaMxh8MWNZjNwbUUge5emuGjKbGrio8yvs16zPuCG8mi0EmujFre5U2T
         GiG7WA6TazU69X3M3FB142D23FdE49WhFLJ09q2Gm9Ax0zzKxmUT7QM3KGH2JzKcMRjW
         IKxLiuRl0cFINksMwPGMSLchfyA2gToaToRlDrXviL+J797UXYys8Ht/Oa1HkCA8pkNL
         K2pVIKh6y7xS2dfcan7i4n4Z/YN1JyMP6WqBBSmmmS65yfEuapkXqQXcIHDKj7ZQhHHz
         poxZqIHvIumukrxm1l+2IYXK6UR9E3hMXikZgIjbm0axddeHgkKJSZjGXtYkuCFL/yPQ
         iu9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xAggA36d+JddOGXWBELHxtoofFCb300e7bvkT6LjvBw=;
        b=F6yA5Sxd4KPP0yOoDLFL7x+yVYoBHDFCe2ArnmRbibJoeeePfxMXtvP6f2u5+6lauI
         l0pPfHVwQII6qd6i5XyFo+h3ZXRXocUXOxEsRi/FYRTI68+tWczKggzEaqxFguW493xi
         LQAL94f2r4LzjfDLNTO/joRTIA6Au2UD+t+3e0KB2htCYgyONGAxsSyyyYeAH4+OiS+J
         u/VLaVmXRX+Isi0/vou91b485MhAIC4J902t7qIQSjconnLHWeS9vTHkISdnE4vOSBM+
         +T9QOQrORhSfwh63Loy0WMvBHB9UYj9NhG+XK+UB56LszTd240G102szAxhZiyY1apVi
         njbg==
X-Gm-Message-State: AOAM531ULYVTXzEqPGbGvGgSqQOncZoVMyFc1mpd7tZu2ZI8ND21ViBd
	8hGd+aon+VJXaf07cD46X04IDQKOMPeo/w==
X-Google-Smtp-Source: ABdhPJxwWBdeyt8DJLJGBptcKSRKlF2dunaykHUbRazUpznxuuw8GClWV8R6E6jjwxxCoBK6DGpKxw==
X-Received: by 2002:a1c:a184:: with SMTP id k126mr10655654wme.39.1602506211717;
        Mon, 12 Oct 2020 05:36:51 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:51 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 12/13] gstreamer1.0-omx: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:19 +0100
Message-Id: <20201012123620.2095778-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
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

