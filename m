Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web10.492.1606848768508220929
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 10:52:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Vk+vSIgl;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id b12so1841276pjl.0
        for <openembedded-core@lists.openembedded.org>; Tue, 01 Dec 2020 10:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=4Wvrf3MEoFDslORK6/xZl353Krt+IB1zK9JQbirrxh4=;
        b=Vk+vSIgluCD5WC/F/YFKXdvhV3V3QRcpposIsXJCe27/1r+QQbUEDDDxueKp7II1OI
         KYNkYbmiFCLgahD0DZcI9JQuR9pU6tzSp6Yv0zCtpCHXzS9PPffaRiE5N3id/+srsWUS
         /hxX0nZBAAnk9OGqtbt9aAkzUiwoFIgvNECTP2Meskdly/rcAC14g+YlsJW4zcNT1TRH
         YVU4Fx8fOUV4FyBbJtB3opAsv0cJnSIBJkwfd+wNjmOnCwrdyUQnqlQ6fKbiSuxq/1zt
         ZbpDfTimUcD+Gzm9GRSJ54aAUtsNmcmI1jd26EDm6eVuNpf9ScuZsBftwP1NQwY9tJUb
         /Mjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=4Wvrf3MEoFDslORK6/xZl353Krt+IB1zK9JQbirrxh4=;
        b=RGp731V4mDq6fMGWie+2QUa083dmB46y3lwlnEN3cYSdxyMfGOVSSk9AZxbQ7ZYKft
         NBRGWprooGYuccCRGVmGQOESuj/WtPLbyPmgQtKAi74e67pxazSHAiEV1Q2iOSw7w4rB
         ShBEmQoVo2P5boVfMedGfuqawnYms21W93JsKP6rty37fiYFBTDROiuf0f/+9fTCK8Jn
         pdPkEx1CDDsxa7S55B+35pQSvkCwLmLOFzxLOXvK7jNlL2kxzmc/R6hiH2MTL4uE2vkJ
         oqu52WLgu6y6E9hBCHjKrhIvXWg14uXt7uChK51354wK/yMKSbhyH7/rd4qrGUMwUPsh
         WuJA==
X-Gm-Message-State: AOAM531O/cfWOzfQn68FXZW5WyCzyGGO/4Q6Z5iF2Tg586VSvIRpfF+d
	xPW48J1oNM0m/Hj0LXOrqtlXrJCdZHDZp2IG
X-Google-Smtp-Source: ABdhPJzp8g0sYbS275EZc4mnIJVtalToUIJdk3smEHWa6/63loHwVqH5L4rAmc+R91dVBdgyFUfyNA==
X-Received: by 2002:a17:902:8a91:b029:d9:da43:43ba with SMTP id p17-20020a1709028a91b02900d9da4343bamr4087577plo.14.1606848767577;
        Tue, 01 Dec 2020 10:52:47 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q5sm460168pjg.4.2020.12.01.10.52.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Dec 2020 10:52:46 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 11/16] gstreamer1.0-plugins-base: set CVE_PRODUCT
Date: Tue,  1 Dec 2020 08:51:54 -1000
Message-Id: <13fd15a894356394904e2c818c837d7733bd56f8.1606848593.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1606848593.git.steve@sakoman.com>
References: <cover.1606848593.git.steve@sakoman.com>

From: Ross Burton <ross@burtonini.com>

There are CVEs with the 'gst-plugins-base' product, so set that.

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec0f0e5995ab498f50ad51ceb361784247614982)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.16.3.bb               | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index a4f4772c1c..9daaf7587e 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -97,3 +97,5 @@ def get_opengl_cmdline_list(switch_name, options, d):
         return '-D' + switch_name + '=' + ','.join(selected_options)
     else:
         return ''
+
+CVE_PRODUCT += "gst-plugins-base"
-- 
2.17.1

