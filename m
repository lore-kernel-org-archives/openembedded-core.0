Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web11.14989.1602947728431660244
 for <openembedded-core@lists.openembedded.org>;
 Sat, 17 Oct 2020 08:15:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=GzvVFpAm;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id g12so6677606wrp.10
        for <openembedded-core@lists.openembedded.org>; Sat, 17 Oct 2020 08:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=GzvVFpAmOrBWGJWm0aRkgLNs9/AfM9mUtY2SCtAhHJZejZTZqAUqnEhq41rvWS5anM
         5I+5I7uhYeep7toTbK4a2cift1hmzuDzLxn2JFFWMwBG6gB4tmZX3BwqSCNfWrEl6+xf
         bFDeti4nrCwmkLKiwNgmeU9g2mPF4D/H2pDYQavThwCAIOuKjYv3TS9ut4YWx/XtAggY
         D+sBkTuVICpvvB6HMfeC/U2N3rSqzcTcQwe9Ue7guUrsv3cl5VgVvtNg17Nyq5ZnXV7P
         hf39S9uYAP2VzBqcvaIkjTqnwjbsjdnHtz4YEsqj8jCaD5WHsHxJCHJnPgmbwZjO5lhI
         jrjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cdcpB8fjFO8pZkRp5KMr4SaAut+nUX8Uy0l+ZFnz4X4=;
        b=FTOOcqD5WQkXbmTW0VOyjzOTsUihxK91WvZM3Ev5XD58T/RSL6zQqsOJPhErGdFklW
         ExIPxGi5k68blukJP3T7lnH/PgZriQ/JPRTX2AMn9PhAZ8G9raJNwFEA7e5oUasT8AUa
         hJIZ4CGsjWckCdxY/9BLq+n+onujDEgek4n0JdCnbtvNI0Sgsjgua66AJSN86NTPSZ+t
         aW+Xw9UsG/uZn4Gnm2gmPcNJlbs5RJfwONSonWJEZ8mf16Q6rDzKfk9bx4saXeH48G2J
         GAivG0GWNJnxoRpvFBZSKW03dgLWOLRZWQfK34ZIHRcL22Ta/7EHZW05kIofDhdyyQ4j
         VtKQ==
X-Gm-Message-State: AOAM533/4Qv66S4+bz51W0ZE0Rcul3RSaN4wlXhYtpTxXlhwanVW1cal
	yD/dnJFwBamlLRZB2ScQg1DeB3yZj49/iQ==
X-Google-Smtp-Source: ABdhPJxOjQ2n7tLYxeNcCsoZ7wgAYitilIGYJR76qapfUQQ2fKryyjhH+VvV9twj+IC+R4zg1qaCWw==
X-Received: by 2002:adf:e4c8:: with SMTP id v8mr10340967wrm.72.1602947726886;
        Sat, 17 Oct 2020 08:15:26 -0700 (PDT)
Return-Path: <quaresma.jose@gmail.com>
Received: from dragon.lan (176.57.115.89.rev.vodafone.pt. [89.115.57.176])
        by smtp.gmail.com with ESMTPSA id m1sm7637380wmm.34.2020.10.17.08.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 08:15:26 -0700 (PDT)
From: "Jose Quaresma" <quaresma.jose@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Jose Quaresma <quaresma.jose@gmail.com>
Subject: [PATCH 05/13] gstreamer1.0-plugins-ugly: upgrade to version 1.18.0
Date: Sat, 17 Oct 2020 16:15:16 +0100
Message-Id: <20201017151524.31550-6-quaresma.jose@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201017151524.31550-1-quaresma.jose@gmail.com>
References: <20201017151524.31550-1-quaresma.jose@gmail.com>
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

