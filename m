Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web12.39787.1602506206718120558
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Oct 2020 05:36:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=Kdwwx9SN;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 13so17054042wmf.0
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Oct 2020 05:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=Kdwwx9SNOiyasgSFTaPTbMoF3yWlYnUhltic9stHPg3c/jO7UegaB45BYc9IqZx9pz
         K9+izH+xFmWO916UUTpb+Ew35Tj/4ySYARWlUNojn3Zwsr0UbCrhNt8gX3ToBCbKQy3Z
         yK03FK7CmRREAA5kc/Hu1ia4iFKiktvJWu8W8YsZpKUplPm9ehNBQa2I4kyGkU9ztV3w
         TI9dE8QT1y1aFIFkfWBsYF7vJDYcZSo77Y9V/l8sxWXxAF0Aftlp8xbbLriliu32X4aq
         sVlAYMtG0wAshDp6nH1D0VwhkIw6TpjrXSAm3/Pjb3ErGJ8u5IGDq1clyA1FqtUxTor8
         w1Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=e/M8Cj/dVDjg1VJSwZy/W5LpYPCNy27vyW/74/U1OMm0dqE9UZm1VmeJB7N4XaMqds
         98E+6wAMQOxL8DowJaf3rzvLg8xVtb3n7efVF44XjA3/Nvmf9T5ZdbQDoW3jYix/BpNS
         UmMX5E51y9uF3YgcqVO0Oe6TlIcfwqKzYp+rFuzFpcp4D38oOEHc3pAWbYq4Pv201ZrG
         mUVI52Ty0jvc9yLhs9MLkdaCj5+50f2FyQc+ZYtEP5WzqriBc+8z4r/lW+Mw92B5odXs
         PWm+kSrwZnZlsh+nOUmDAkPrT864MqUAycXvAR7CwdOjBWrHjAtwBxKgPwagGf3kqGpr
         uXaQ==
X-Gm-Message-State: AOAM5311h+57DFVwGYX5EHFWarQHjVceXROgoEQzo2mK3JncWD0QVt17
	YfJu/xNy2tpNmH/l9A6NCkL6Bo5zzU+2qA==
X-Google-Smtp-Source: ABdhPJx22nZs3JdfMTjvkbvzvvxtkAqmvOqMnZdjXHE0pzVi+SN1bhHqmuarZ4ihdpkImEx8puiLWg==
X-Received: by 2002:a1c:d5:: with SMTP id 204mr10813661wma.56.1602506205030;
        Mon, 12 Oct 2020 05:36:45 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id i14sm23076089wml.24.2020.10.12.05.36.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2020 05:36:44 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 06/13] gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
Date: Mon, 12 Oct 2020 13:36:13 +0100
Message-Id: <20201012123620.2095778-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201012123620.2095778-1-quaresma.jose@gmail.com>
References: <20201012123620.2095778-1-quaresma.jose@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ns-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.18.0.bb} (89%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
similarity index 89%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
index be10800389..d38550c352 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.18.0.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[md5sum] = "01d3a24152cfd5eb27b1787d44b524c6"
+SRC_URI[sha256sum] = "686644e45e08258ae240c4519376668ad8d34ea6d0f6ab556473c317bfb7e082"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
@@ -32,6 +32,7 @@ PACKAGECONFIG[mpeg2dec] = "-Dmpeg2dec=enabled,-Dmpeg2dec=disabled,mpeg2dec"
 PACKAGECONFIG[x264]     = "-Dx264=enabled,-Dx264=disabled,x264"
 
 EXTRA_OEMESON += " \
+    -Ddoc=disabled \
     -Dsidplay=disabled \
 "
 
-- 
2.28.0

