Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.105.1603837799961006016
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Oct 2020 15:30:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=kCHY4oPn;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id az3so1528742pjb.4
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Oct 2020 15:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=LOlpIW75jpW6kzdHBnYCIm/IyPwNkSk9gnnv66ddDzY=;
        b=kCHY4oPnNNjqqC3DpWQujwcg7BPNFuaKfjycVkasGBFT48kqRnkYOJJtmsTaxp8/bu
         QzyyBY3TQHpDXE6HfgOn5G5wbut8TKsH2iIblpd2voPJTA5eQyASrwktdUOIGs3r55M+
         Gl8meZZoGKiRe4r/6kJplPxnLsCZEJajN2vsKtrh4Vmk+OQrkRuAQYMsry2kGEue4YRu
         rEcsy6LOfibE6wkMqaopot4Zx0Fdqq/jVzshVlN1Gr2Kmw7bRYc+9A7562TEynsLE0Fq
         JRS+3CoJo3hVlulo3xij2TTPQ/K/08bUUg8xpm0g+BUo25vJIPy+ip5tj9AfmOKx95Zo
         QNaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=LOlpIW75jpW6kzdHBnYCIm/IyPwNkSk9gnnv66ddDzY=;
        b=kyKp5wE0xsFwHgF3MvxSuymAOgzUDS9TaCuIVAVphnM5xGeoNi6qIzdJXAKOVjhWgI
         f1izCiom2NYiJahw1ZcGuYkWE0U+3gEfSwdaOSVzRdxCcCfKVo0CMDlOyvlSVQjTXcXU
         rg+ixE7rKpaTag+PIGQG8bTT85CJOQWEDetZy7iCz9HP7Amfg9EYKzR92U6c1aX7w7AT
         L+pIy4svx/nYUvztn4cxhhVAPtN+IwMWv1y7Xk+RcEG4CgpxJCDsDyxPPU45Dix/m/sm
         pHIKYyM9rD9OHkTXpIFhBAIGfPrUWt6EgddCeTTU+W7CmmZhCHroUPTbbo/0jPIQftx3
         qSeA==
X-Gm-Message-State: AOAM531EfLqJ0iv4KJKq1CBRw5Rp6oZGyndLdAbbiHmXUVixyoRC/Xsy
	bd2A/1VXHFP7nL2OozlsYGYu7duj5p5t33VN
X-Google-Smtp-Source: ABdhPJw8uKm4cC0DLQ1XC+/braG5aTndWAtPUkIl3jrwdXD+tV2WTWcHxPoeKd1xRRMqj51g1tidKg==
X-Received: by 2002:a17:90b:1953:: with SMTP id nk19mr3879680pjb.14.1603837799153;
        Tue, 27 Oct 2020 15:29:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b7sm3699000pfr.171.2020.10.27.15.29.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2020 15:29:58 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/16] gstreamer1.0-rtsp-server: Update 1.16.2 -> Update 1.16.3
Date: Tue, 27 Oct 2020 12:29:16 -1000
Message-Id: <9cc8c658239c664221ffbde7391feb6122a200e8.1603837524.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1603837524.git.steve@sakoman.com>
References: <cover.1603837524.git.steve@sakoman.com>

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...sp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.16.2.bb => gstreamer1.0-rtsp-server_1.16.3.bb} (86%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
similarity index 86%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
index 02c3c83840..5f1b1d44fa 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server_1.16.3.bb
@@ -12,8 +12,8 @@ SRC_URI = "https://gstreamer.freedesktop.org/src/${PNREAL}/${PNREAL}-${PV}.tar.x
            file://0001-meson-build-gir-even-when-cross-compiling-if-introsp.patch \
            "
 
-SRC_URI[md5sum] = "8a998725820c771ba45be6e18bfdf73a"
-SRC_URI[sha256sum] = "de07a2837b3b04820ce68264a4909f70c221b85dbff0cede7926e9cdbb1dc26e"
+SRC_URI[md5sum] = "f0d8263c9d61f6f05b59ae0f676a6406"
+SRC_URI[sha256sum] = "67886b872826d513c58f88d559d4dc4aa63382d03fb64ceac91a09537fe6fea0"
 
 S = "${WORKDIR}/${PNREAL}-${PV}"
 
-- 
2.17.1

