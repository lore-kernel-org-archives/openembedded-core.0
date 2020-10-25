Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web12.27302.1603635843920082987
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Oct 2020 07:24:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=WMI0DZhU;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 13so9202303wmf.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Oct 2020 07:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xXnf3XSmJujjkpGd+RkV86Guvc4BDTzDmye6aFLCZc=;
        b=WMI0DZhUEXYGkgTeJ5+FFNayuuvQmzelFOhBBQzjObpHMea/YSWiH/luFGhy84Qr8p
         L/EdhaAFCvdeiUZwsERLpbHoHF3Kl3SbES4ZjQOM+k4i562ncMZdczC5IK6jkLisz0lS
         xE9NV4Eno/Wwn1GzKyw2eISh+Kwa3tURdTfyaS4bmD2CX2fGeZIgC7oZd16KX3CVDPKI
         bdATXR3einwPdnDcvC3EmMHTx4QzOFbRVV6eY0HlgfydTi7R0+CCcuf0GcIO8UnH9RaT
         mEUFtyLKcUFGVClVukpj15GI5VfBezTHgyxvwGAFfo2iVSnpH4Pc7FTWhBLDd4eMM97M
         V+JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xXnf3XSmJujjkpGd+RkV86Guvc4BDTzDmye6aFLCZc=;
        b=hwiXM0gzzrqUB8lOmgeskew/SEZ05oNP/DXiXpD2cojOowJSwTLa6gbZFWalrX2X+1
         5b8ZYBD7U+Vb82aXU/1WwR1DWsrRqEl4UHdtw7Vxe8C38bXwAv+gvtlSiQKNOXwhbaTI
         0xpzEs2CRITPT5h9ocOpHIGOweLxt0sRcnnBmlKWz8jNmOKojmVko/jZFVPwuAEucQGF
         h1Hh2b6zpby/x1TkMxAIodGgNYyfmtF6WeZumsfThrtPO41xHRIH7NgRXxPTCU59SEeH
         GNKraUoFGD8iqo9KwVf1e90ClgdrZqY97Wqn1RazHczQZBlWijuID20q9fE0IBgRNcqc
         Dv6w==
X-Gm-Message-State: AOAM53219NdynVExqH8ec8TM9kr1v6eX5UoM0f17Qi+eVomjKdl6btQk
	KnKL5EfkjSOQgu4v5BYDcN051nVCXMSqpA==
X-Google-Smtp-Source: ABdhPJzXtIVdzTJRwGCctiLR3IHfKZ/ai4BOmQwF/GEKNzhc9o4OV+DepWOwnWp2NmFE18e7AcaZXQ==
X-Received: by 2002:a1c:6546:: with SMTP id z67mr11421647wmb.98.1603635841715;
        Sun, 25 Oct 2020 07:24:01 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id f14sm18041731wrr.80.2020.10.25.07.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2020 07:24:00 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH][dunfell 07/12] gstreamer1.0-libav: Update 1.16.2 -> Update 1.16.3
Date: Sun, 25 Oct 2020 14:23:48 +0000
Message-Id: <20201025142353.1929717-7-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201025142353.1929717-1-quaresma.jose@gmail.com>
References: <20201025142353.1929717-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.29.0

