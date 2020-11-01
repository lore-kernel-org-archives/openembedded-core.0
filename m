Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.8485.1604191470901339623
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mOzR+xtc;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id t11so10445415edj.13
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/6TLyCp+U66VYECeNZs9C8FONRtCPldHwY1/oZlFrv4=;
        b=mOzR+xtc0AHOwuUvxMMIX6JdwsXVMEIzKYL2+vAVG70oX2QG5+TJ42YxjVC9eD0eAZ
         Q2Lfg6s+CyPLV5CNaYlqJT+AtaugTbfM0WgvnhR2YiS4DVRkmKZQXg1Kj7qbDZGBCoJq
         HoandvM4sufWPYL0/aLoBORzRS6duEVG6xaUTriyFLxtDTeEXx89X5M++SZ8SKy4asW8
         yyVfjT9iabEisYbfLDijtQZwa+/u6dxszStZq5EjDLKFFVRtZ1cW57HwTn5m6xucOjLi
         IQ3xcim/OIG+9KuMA7xMbas2TAHADLYX4FsgVn5qhCCfMWdr3ckcj4PZSYnoy0jsCus8
         sFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/6TLyCp+U66VYECeNZs9C8FONRtCPldHwY1/oZlFrv4=;
        b=XT6k4et0hHwATqwOEdCbxXC6dBkgzn9Ok1Y+c3lOhit6rUOXZEnsDhvdzw3Tm9T0wk
         IUxvWRfd3AG4z8kjaFBaQGrZ3/AEfHLcs+vUzhXSlLxLs2q1qxeYYKoY9gtNar99kTVR
         umAQ3swgqfogkdznsRX/JF7LOAa3+dH1yTfX8PTe9qYS+acfP0pHXRPNDNTusJqwIsPO
         l1ZKnfPVKDrtHa6Md3UXG7CRCtatRExnl+tlOpwmoogXzIv5ZaKovYEoFB1bE1ZUHWVD
         A403MM4ILFW/VVvp+s2zipGkeAi88N95vN0iO8Ey0iTai1pTE3AhvI3TiXv8LDA/VI8r
         yYww==
X-Gm-Message-State: AOAM532J3Utc5GJNeJY/GaeVkt5GlPGAADQA8EgvVGBGn8jHTejxH8Pu
	pNZWUUO+7MTuCHfowsDTLc5aroL3ndE=
X-Google-Smtp-Source: ABdhPJwRM6PR95nx7zaCwHL8nbyNjSF3LmnGHfIBwK7m8fPlo8GB8yBjCbsmPN7YGCins2UpinNnRg==
X-Received: by 2002:aa7:da4d:: with SMTP id w13mr9560673eds.266.1604191469332;
        Sat, 31 Oct 2020 17:44:29 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id df12sm6737375edb.8.2020.10.31.17.44.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:28 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 04/12] gstreamer1.0-plugins-good: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:32 +0100
Message-Id: <20201101004340.4019257-4-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...ins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.16.2.bb => gstreamer1.0-plugins-good_1.16.3.bb} (96%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
similarity index 96%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index 17c9421394..75dd029109 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -6,8 +6,8 @@ SRC_URI = " \
             file://0001-qt-include-ext-qt-gstqtgl.h-instead-of-gst-gl-gstglf.patch \
             "
 
-SRC_URI[md5sum] = "bd025f8f14974f94b75ac69a9d1b9c93"
-SRC_URI[sha256sum] = "40bb3bafda25c0b739c8fc36e48380fccf61c4d3f83747e97ac3f9b0171b1319"
+SRC_URI[md5sum] = "c79b6c2f8eaadb2bb66615b694db399e"
+SRC_URI[sha256sum] = "d3a23a3fe73de673f591b7655494990c9e8a0e22a3c70d6f1dbf50198b29f85f"
 
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
-- 
2.27.0

