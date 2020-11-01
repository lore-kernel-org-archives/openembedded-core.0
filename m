Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web12.8587.1604191472862598476
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=SdZbZT+U;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id cw8so111429ejb.8
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TC81FoRgCIDQ/4M346cTRIWYnqPfQANstXOwH/sXEXQ=;
        b=SdZbZT+UuXiDCckuzjdFc80cAzFTBYhJcmf2HjM0bdmsTlGFlWs2fEXz+N85NQgFWZ
         rJH89Zkf0CcCmB2i/Z/AUVrAJKkUMHVBKtGHm1Ex/iLyijpABRfYRKVQz196mDkKTVdF
         Lb+nGaevto9SASb93iCitwmEc1AvuObCrUYRsImS+K/dUUzpR3mF3nFLFnwtOFVOiunC
         digYbxSIP5Ri6gwPm3t4UEtfNJSbR0CJG6lETYD+mEWBFfNhOFuw4bcs/wuPdso3Dh3m
         IMwbxhoWDY4nu66IF+NOO9ykgRYfMgQ0/HAVrCfnZtK6W3JImzmH6RuGNO/Jf5v3kgb0
         NgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TC81FoRgCIDQ/4M346cTRIWYnqPfQANstXOwH/sXEXQ=;
        b=Hr01tfTm308UIG0M2ao0ikvoEoHI+5C7y5GhSOqpRfumSkFSjXanH/XVdLVqlGzmyS
         1hIE4EoDakeQmhQ2fC6fgQprjlLIW5UuwTKnh7ydkCMNdVQwhDJSfx0Hh1M5Xw8ieGvi
         2XSyMLdMLmESLIn8PgUDn16uB/A9sLjJsMjt2DC+TVDofgUH9JqupmWljvKBAkRKvCwx
         B+iv9zggOOSbL06gnz3zK/8tQ91kn2LbY0qzOxkNKEFlDbTerqzY3KZpUKfA4dNlaPkw
         KYENVVXHr5CmKmCgRPo5kiMQpCiWddzvioCXelkUOhijPMrBjyU6bVSk1y7cgISsARZg
         WABg==
X-Gm-Message-State: AOAM53155rVkf1xgfnkZCnjQGS2HWYPKJu+SrDLVdCoWot1lI+6F615z
	0ngNcGyEAN3hwIXbuJ1Bdi9N0BZOLZA=
X-Google-Smtp-Source: ABdhPJwDCNaddEAaYz0WzW8qltKRhR0GObswO7RCZI7s87pWamgd5u4YowSccAjhCrnJAR6BP2NbLw==
X-Received: by 2002:a17:906:280a:: with SMTP id r10mr9020337ejc.45.1604191471285;
        Sat, 31 Oct 2020 17:44:31 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id b24sm5914112edt.68.2020.10.31.17.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:30 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 06/12] gstreamer1.0-plugins-ugly: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:34 +0100
Message-Id: <20201101004340.4019257-6-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.16.2.bb => gstreamer1.0-plugins-ugly_1.16.3.bb} (90%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
similarity index 90%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
index be10800389..d9ec82d887 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-ugly_1.16.3.bb
@@ -9,8 +9,8 @@ LICENSE_FLAGS = "commercial"
 SRC_URI = " \
             https://gstreamer.freedesktop.org/src/gst-plugins-ugly/gst-plugins-ugly-${PV}.tar.xz \
             "
-SRC_URI[md5sum] = "10283ff5ef1e34d462dde77042e329bd"
-SRC_URI[sha256sum] = "5500415b865e8b62775d4742cbb9f37146a50caecfc0e7a6fc0160d3c560fbca"
+SRC_URI[md5sum] = "b025125a6c928024cbd300cc27b5d712"
+SRC_URI[sha256sum] = "403c21688065f41e53008874402b5c07832567cc1309a60df597eab7ff5843f0"
 
 S = "${WORKDIR}/gst-plugins-ugly-${PV}"
 
-- 
2.27.0

