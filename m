Received: from mail-pg1-f193.google.com (mail-pg1-f193.google.com [209.85.215.193])
 by mx.groups.io with SMTP id smtpd.web10.12786.1596464868712235431
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Aug 2020 07:27:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=C48VRnAP;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.193, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f193.google.com with SMTP id g33so2478819pgb.4
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Aug 2020 07:27:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=baqiOpVUM2IIv0/pIR2n9Ckbgr/AJa6GlWjF6cOp/cU=;
        b=C48VRnAPeVil4HRzNbIhLmBtw1rqQClOWBk2JRsGpWyy2Lwwkssd0Zw9c3P8hKc7N+
         9FiA4ZgS+1M91cLKW2Ourre0vqyNw6C1KHwEnHH8ZiW6ofr4UG7MQMwBstNevFlCbVfn
         /iwSKQ5C/iVB5x5kN62j/7pPNhxxhisuClfTerCxkd31YhXiscLlcW23Pwz2IlMwVQ6y
         u3KVbJiU4SffxCw/Qze8LjLyERohd2iKrDyS1x0QWBuGOATPd59WYVTDubXJUEQZTkKz
         iFZ3nKv9yRx4jnlGKt55AELmmPOpeYmp91oxTrLWbJSgNpAxJjQeWyCoyvNgYIpJUuwE
         WE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=baqiOpVUM2IIv0/pIR2n9Ckbgr/AJa6GlWjF6cOp/cU=;
        b=NRcu9GLl8ovFULmv1cmVZllJ5ssAsOJ9V095iWLbOC47K6J/bZP+2QprnqiSe6JJOY
         jglCO8XeNW3mm+5009u9tx+TT4F82U2YGvhJ1dtOQFnll8HMeGiqpR5eEwcdVyO0o9d1
         KdA7dfjbrwdksCUA/s9R1ACgMkN1pxO9fF0Qfu6jfRAwD9XI+1nMpXN8UNVgB8B6tk8x
         cunNSgtROyIilYZbw6uf41a8I9Y6tH2zcwByq4mBVZ2qE5HC8LqKwJSsFDQj6CSVkJtE
         +VD5AhAY7vCKhc37Jx8BndTMIuBNH7d9E4+Kn+MsUqmTiP9O1fTwLJyKC6EXzRXqf5Xf
         1e3w==
X-Gm-Message-State: AOAM531Rqd/LEySJ96JTCL3B3huCQimWhq6bncPiD86ZPJpaVi0o5RPK
	8jQDcWdvuDp8wrTCpw3DbZ+Ua8nIYfQ=
X-Google-Smtp-Source: ABdhPJz86o2vCbK+x5a9ZD/Pvc6QXdiXeAXk5SxhPdzwOoj5qVReGzeyBPV9R1FupsS7MCKDKiRRnw==
X-Received: by 2002:a62:90:: with SMTP id 138mr1338020pfa.0.1596464867807;
        Mon, 03 Aug 2020 07:27:47 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id r15sm10913729pfq.189.2020.08.03.07.27.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 07:27:47 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 12/12] glib-networking: upgrade 2.62.3 to 2.62.4
Date: Mon,  3 Aug 2020 04:27:04 -1000
Message-Id: <a3bfc93dc5c2aa0a72f70c78845ff3f5eb16bda7.1596464561.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1596464561.git.steve@sakoman.com>
References: <cover.1596464561.git.steve@sakoman.com>

Bug and CVE fix release

Fixes CVE-2020-13645

Details of changes at:

https://gitlab.gnome.org/GNOME/glib-networking/-/commits/glib-2-62

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-networking/{glib-networking_2.62.3.bb => glib-networking_2.62.4.bb} (88%)

diff --git a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb b/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
similarity index 88%
rename from meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
index e9596ce1a4..b74532087c 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.62.3.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.62.4.bb
@@ -9,8 +9,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "libs"
 DEPENDS = "glib-2.0"
 
-SRC_URI[archive.md5sum] = "a758ca62bd54982a798b39c744cbf783"
-SRC_URI[archive.sha256sum] = "8ca1f86f23a76b5c7640624f7d5490705c78e81375e1741c9a1c41ce7f8f7ff7"
+SRC_URI[archive.md5sum] = "fad14a4a2cac73f0c2f9d426f1a9e5af"
+SRC_URI[archive.sha256sum] = "c18f289eec480fdce12044c0a06f77521edf9f460d16ad4213de61f2a3b294cf"
 
 PACKAGECONFIG ??= "gnutls"
 
-- 
2.17.1

