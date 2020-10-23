Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.1032.1603478634618871710
 for <openembedded-core@lists.openembedded.org>;
 Fri, 23 Oct 2020 11:43:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sg8k19M0;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id x7so3246542wrl.3
        for <openembedded-core@lists.openembedded.org>; Fri, 23 Oct 2020 11:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ajwtHKe6OMotqMWAJqkCO9otlRy3uQNL1QYdJj7CPrA=;
        b=sg8k19M0/XbffZxUYKxc4waHER+8E1o2U0hgOSfhZQgkSlSpoIXknWWuIljA8FlDFq
         mv9BaWSohLMHlUeBexPvxMZnt9wa+zMCj0rrUZdk2kdJ/NcIGWTAM3BbY+YTsMNErGew
         mLW8nHsAmftlmV19ea3fkJ+RMGB2DKZHlfE+VeI1tsyg7Ix1FpgR/XV2/57JPYWaTeaH
         KCenPw95phFTYFNQy2Dc8P/qOZZ8qHDyBuQ5rIm0mq3UcSHj282nIgJ8a0weh6WwcoP9
         LW5TvdHVdhSTzA7axYB6BjLY1bLrTCzMJNv41rhwS3XFatpGevycIEsldBOsBnc12S8T
         yo8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ajwtHKe6OMotqMWAJqkCO9otlRy3uQNL1QYdJj7CPrA=;
        b=c/TZNrAbkFC/U1/k9Tc/JaFPT8X48u0NocEMsGCEmD6WnUlWfkacasceuKNlCbg1u8
         fUsMTLf3ShluYA2YurwWDYZI096O3qOfSpPv6CpcxkP5EXb4snr/QZakpjQaoCxGgJY0
         xLXvJfWznAuoQa9U82W/9KoPNNvKvRqjxxndGLfSUQvvZpv4qFo7Eqx7By/HOvRcaLmC
         KXF95uSkp/VVAumTHXto7/ihKJgyM4O1ti9lBN1jCq4qeVsMj+LVC+FUinfeszNvfXJJ
         VOogLq9J7iSXsEDcl3uG7vHoQoRVvh4z7kN5kqftpQD4ur/rPa7yeHeGK31ev8fNYxSW
         ATtw==
X-Gm-Message-State: AOAM530A3/YmZUMTUUTbD05PLgcqJlzwfW5XnHNyBGnL2Z4XXvxkhYKX
	ot06AzEmlpK1s4i6KbMwPSl2I/66s6dQEQ==
X-Google-Smtp-Source: ABdhPJxPf8mS/at42APhd0L+nV1sF7a2En5Mvs0yG1k1g0ZCF/3MWhycqMmnOPZChcZD2SOHcaVVLQ==
X-Received: by 2002:adf:8bd4:: with SMTP id w20mr4006430wra.391.1603478632857;
        Fri, 23 Oct 2020 11:43:52 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id b7sm4999302wrp.16.2020.10.23.11.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2020 11:43:52 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH v4 11/21] gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
Date: Fri, 23 Oct 2020 19:41:22 +0100
Message-Id: <20201023184132.3208737-12-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201023184132.3208737-1-quaresma.jose@gmail.com>
References: <20201023184132.3208737-1-quaresma.jose@gmail.com>
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
2.29.0

