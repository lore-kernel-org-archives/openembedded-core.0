Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web11.8559.1604191476752821982
 for <openembedded-core@lists.openembedded.org>;
 Sat, 31 Oct 2020 17:44:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gnV4qLkd;
 spf=pass (domain: gmail.com, ip: 209.85.208.52, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id l16so10545830eds.3
        for <openembedded-core@lists.openembedded.org>; Sat, 31 Oct 2020 17:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ylxq5+lTTdBCRetF0MFxqKmls7BJmhmUk45Bp0XP0aU=;
        b=gnV4qLkdaf6Y2ABqF9FeUA/stiwBV8luZNlBcfmGyx9DaGG3Gt2YT/TBmcCR6ZJDF+
         1zn60Sb7DoNq1Yefo2o5c+wHI8NIHLXSi8fMxFzpL8xUy6KHkZ++reL2ZaX4E6H4NJXg
         n+8fvpqGHXQJe8X9ZbZBUX/RNfmD6MTkGNz9UrZA/xQArUUgzY1o1BzBxfsSEA0zF+ST
         gXdE+gGzuRBdbjIQPmjpEzSF5lUUW68uKGy36H6GbS4vzL4+Ywer5L/kc2RuEQbwobQE
         /1PghsRIvzAcpvjeYZLB/WZkF7D4tIUjyP6quFN/OhVBT0r57xKQwIyvoIB4NZ4DHem2
         Mi3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ylxq5+lTTdBCRetF0MFxqKmls7BJmhmUk45Bp0XP0aU=;
        b=SfJcQ6s5AJgNDkZJX/8tah1SoZ7q791lG66yMdrF72u7JI7LizxxZ4xbH+aTDp0tQa
         5/E7d6U+ftiPSl9UkTHOc9shAnfGXwanciWW90fw08P2UwOJaTIAeCe0YSUm17WW+t5Q
         Xout7CmGLBWggugxUQSXM0svirYVplNAJz70FHz5z2/5VoPQIxw4JP1DJIwLdVCEtU/Z
         YH90LaXK4lIT60RIR1kN0B7KFFAA/J72AG0yYRoxUMAfkwtLeyaciIHMHaPJ+688BVXz
         bc8/ERH9jWTD5jDnCVKT/32yYYYBTxCV26st+en4CtTrDoIdKftnPUQpFC+UAcYg6OI3
         kzMw==
X-Gm-Message-State: AOAM5314yBeEAjpLD3csvNxvU663D3FjRoEKjakiGWnNlEFAKcWyAAAy
	3BDC5Yp3GELIK+Bqhu1Yapb4wuzin5Q=
X-Google-Smtp-Source: ABdhPJy6RtyEOc39eYnhoTU76CPukJpWVGp9zdE7z0a/zLZ3rS69egjtJbkatdQEFuf6HdjYlZzHjQ==
X-Received: by 2002:aa7:df89:: with SMTP id b9mr9886270edy.335.1604191475202;
        Sat, 31 Oct 2020 17:44:35 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id cn8sm2245902edb.18.2020.10.31.17.44.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 17:44:34 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [gastesgarth][PATCH 10/12] gstreamer1.0-omx: Update 1.16.2 -> Update 1.16.3
Date: Sun,  1 Nov 2020 01:43:38 +0100
Message-Id: <20201101004340.4019257-10-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
References: <20201101004340.4019257-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jose Quaresma <quaresma.jose@gmail.com>

Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
---
 ...{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.16.2.bb => gstreamer1.0-omx_1.16.3.bb} (92%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
similarity index 92%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
index f1bdbd235d..1aa13cf73c 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.3.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 
 SRC_URI = "https://gstreamer.freedesktop.org/src/gst-omx/gst-omx-${PV}.tar.xz"
 
-SRC_URI[md5sum] = "6362786d2b6cce34de08c86b7847f782"
-SRC_URI[sha256sum] = "11ed411a2eba75610d72331eeb14ff05e2df28f4fd05cb69225a88bec6d27439"
+SRC_URI[md5sum] = "d4d89dd44362c1d262186c60437cdbee"
+SRC_URI[sha256sum] = "60603b7889528ef8539d36cb3284b648c46aa0cf980a28cba4d3fe3a44988ff9"
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-- 
2.27.0

