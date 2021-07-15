Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
 by mx.groups.io with SMTP id smtpd.web09.8398.1626358121317802611
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=MrYD1qv5;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.180, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f180.google.com with SMTP id k20so6398028pgg.7
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=Piz5ndi31gKNEvX8TVOKixMG6LxA2MGjZXtuP7DwsCE=;
        b=MrYD1qv5TmPtZ8bU9aCJzLYclr6ABDT4JoLVfWRsBakZFFMkdb5CbeQfiglsN6iAyG
         VpDyMMIYeCE8VhYMkVP6X2E1eCv1Alh0daMuEcVKEbNkUcEV4V76xu0trfUOYrahOaWW
         57SaiDxmOQexh7cVrzjzdd4zIi84Rxm93oZ3PwyYK/pKiU46Y0lXRsA4zKsr+2TlxeQ4
         hzjtCXTmtBSO6ljyfpl+lRGeRLPbyJZZIPqCeHH+YK2QRKdZSeqqs0ajzqM82c/6/U6P
         nAHswf+J0oxmhr4FKFkxXMQm7a/ucam2OHJWk5lv2DAFi3JH2OGCQbRqdgSnbIQ0HK2X
         IhsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Piz5ndi31gKNEvX8TVOKixMG6LxA2MGjZXtuP7DwsCE=;
        b=B35h+0eFzrCHt/b1vbhs1vf5/fL4GBi0C/3ZvfaKe6J+S1DcSnWgzfQYpCtMOD/FN0
         CaPEw1tuJHZizBK1nWJS9AHUak9axROQ9qjkyeeQQ+LlEQ+qRhbW20c+iBkf4C+UREXu
         IfVLjiypiYmn8ks/YeYovTwwb7lxodsPzApOPnemoYkq3SPDhTBhuWRgogaIhPnBRfj1
         bwqo8JW/ogxtrfmjv581zIzAtkz01ffozQtaEHoJZgkI5Htw99guRLtjqNzvI+7ySEKy
         uCFRbfk1hccRmoXUVcHT/qXgQPm7Sz3xlyTCCANxULMoPmqRfc22SZsR/CnPei7MXxmx
         BCrg==
X-Gm-Message-State: AOAM533198d91RAdQLH1GOwF1sskOtXqfi2x4MVndkuaP8ZCG9ZTCnaj
	FrDOMb56TVqWSvv294nJnQbnX8U7BIiBjg==
X-Google-Smtp-Source: ABdhPJwmCtthAtLSpcW1L8aoTpw/Vxd4YRlsU0PklraTzZnUOXEZlQxSHauIiguTx3MOR0vhr0PkTw==
X-Received: by 2002:a05:6a00:b85:b029:332:1865:fea9 with SMTP id g5-20020a056a000b85b02903321865fea9mr4886412pfj.45.1626358120425;
        Thu, 15 Jul 2021 07:08:40 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:39 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 3/7] gstreamer-plugins-good: ignore CVE-2021-3497/8 since they are fixed
Date: Thu, 15 Jul 2021 04:07:21 -1000
Message-Id: <d853e2bde1ea083f8438e8d7a80f041196d2e38d.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPE entries for gst-plugins-good are listed as gstreamer issues
so we need to ignore the false hits for the two CVEs we've patched

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-good_1.16.3.bb            | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
index 1038cbf224..e8830103ce 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.16.3.bb
@@ -15,6 +15,11 @@ SRC_URI = " \
 SRC_URI[md5sum] = "c79b6c2f8eaadb2bb66615b694db399e"
 SRC_URI[sha256sum] = "d3a23a3fe73de673f591b7655494990c9e8a0e22a3c70d6f1dbf50198b29f85f"
 
+# CPE entries for gst-plugins-good are listed as gstreamer issues
+# so we need to ignore the false hit
+CVE_CHECK_WHITELIST += "CVE-2021-3497"
+CVE_CHECK_WHITELIST += "CVE-2021-3498"
+
 S = "${WORKDIR}/gst-plugins-good-${PV}"
 
 LICENSE = "GPLv2+ & LGPLv2.1+"
-- 
2.25.1

