Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.105.1603837788254340993
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:29:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PBJ/HOf6;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id l2so1472688pjt.5
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=8TNOId6Rzf0uEty7yDVjjdkGfFpa7hhogIO9ZQn9Z9c=;
        b=PBJ/HOf6+5Bvkpop9RBS3EgJmHqsk3RuITr3rWvEr+Q3YAJJTgjIeVPSL3c51fs+KL
         Z11hlPVLLbmHRdiCMDc4H5KtOFr9OSsiAuRWetLqLvlOg5uJWRSYfAEJBWQcXSY+kc7n
         /ySTqtzAIAuNVarVgMYO/ntc0elfHT6ymHLh6w810kRys0Zz1TKYAvIWiqu+ZFDuKJ/t
         R+ElWKEO3NP4GucJMlkMKzHlN1VhIP6cV4+gc7HnbTTUIGQyeKT97pie3WpfFYBp9c3k
         9SGFcQZi2jnG60nlzZj0lGxfDkFyNuFZ0t/sgofOqX4wQBQkj1qiI/kPU0jp/ymcYjqj
         QCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=8TNOId6Rzf0uEty7yDVjjdkGfFpa7hhogIO9ZQn9Z9c=;
        b=Sc6CwLmdUaakQrxFfz69Ca0cCx9GFruKZywQ/3tuiitPTz3eHZl8aXbOBT6GpnW05o
         JMANpVBoWK46UIeTtxPRJxFOfilHFRq05xswYlq1GPewcAHBXZYtVOa4tzby+v41xMoN
         Gsss5hWLqoCuqi5YNtj5ktCjZLbAocDcJ3ZAY+//UkxbhhTkiwWtvLO46InSuqzt7Y+m
         4czhJAiBG3rR6oR/q8gkDJGpiiv+5W/CrLVG6oig4Z/olCttpecxYVKy1jaL9xzJuFYR
         mLyAt2j7zYSVGMFD2ESQOdxtdkoX15LcDCTYN/OVjzeuoddKF03nfPS77Ch9i3QGSAoZ
         cKow==
X-Gm-Message-State: AOAM531F5LwcqyQnkPyKCIL4NGVaYWF/Th5jmUb3APUQNNE7GbVf1f1P
	/gqJ+ATd8ghyH31SVr3Cpfcpo3QZoZ1KvLGP
X-Google-Smtp-Source: ABdhPJzu8hkJPP5NAfMy075Xh4YoRj2gjm/vaHshzPICaUo/IPxBlInt4Yo7ArUVREd3fyNyxFTEzw==
X-Received: by 2002:a17:902:8a8a:b029:d5:aba7:5abb with SMTP id p10-20020a1709028a8ab02900d5aba75abbmr4331244plo.50.1603837787396;
        Tue, 27 Oct 2020 15:29:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:46 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 07/16] gstreamer1.0-plugins-good: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:11 -1000
Message-Id: <ae0f8a8895de9731e8506e4a84e9f7a3957c6c47.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

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
2.17.1

