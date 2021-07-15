Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web12.8421.1626358118806144864
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 07:08:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=VFDLYN94;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.51, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f51.google.com with SMTP id me13-20020a17090b17cdb0290173bac8b9c9so6322148pjb.3
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jul 2021 07:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=TWRG9PZTjyuFLIYxKmakvEa/bVB9Y/HIrGM9z1Fex5s=;
        b=VFDLYN94BxDZx6QWToQIKv32NmFfneZ2xlp5yZhS5DLtSICSHlezAu1CVIX1teeVjH
         VcnZlhi0euenHg63cz047wA6ghYXmaQVdJOwrLQ2ynYVcgbqXDoaGF8YOBC1vzxGjHmo
         m0wGGpyVYOrDx7istmJ3oVjku4Eb1X7LJjgOfHzFvKzfjWSAEBxseuPpKxPP6OBNSvLA
         BaC5N5KCUG4thM/mHz8r4cvqX6SXrG5RydPInh5ontr4W6bbC6y0utVNXzWQ4EI7I0S+
         YiTD74ZyCde7nJnUzdwUrfhrjbofzxo5/gArYvhTYm+4BHn36Pl6mbxNIhC3Ulw8pAHI
         xYOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TWRG9PZTjyuFLIYxKmakvEa/bVB9Y/HIrGM9z1Fex5s=;
        b=OzsmDSB+tJmk2JPCACZcbyNitrK1u7gTG5ixn0ut5bb4cjGs2wtKr75dzVnuz1ia1L
         W/rt3pU1os9Ev092H4Xl/3S4G22wKKL/z7QkGkh/hgQveq5/TtG2FULuD2/eB+1KHUR2
         9YvxoqaoJLzlLHzvst25TPJBsz0Ex03GszRnZMuzZTIX8iZHCF5hNKUed+63H0H1e3q8
         Llgq2PtXktMym0tqpBfDETqFBU33quiNEU1T8KZjVsDGmnXEQo8JIxzsQOH30U1RndMk
         RNsbE9kDsPW0KMzbQK/8yFxdjWOwXl7dLyjCe7Wn5zQVxRJffgeKyvFkZbSBfjskfqKo
         4VAQ==
X-Gm-Message-State: AOAM533wIyuvfGqgs9Arn6HhpJw8eHqxJSGnhhhdK4AKPo6QQlAOKG3k
	8BIrN1YF5NplcfrFvAeImIqU4V+caogzb+Ql
X-Google-Smtp-Source: ABdhPJzzcurVsTCSRojiR4IWp/IjdVHCAhmW2rM/+uX625RrQfkKkgrdSYydiBWD1E6BKC0dMUmwEA==
X-Received: by 2002:a17:902:e8c2:b029:123:25ba:e443 with SMTP id v2-20020a170902e8c2b029012325bae443mr3591003plg.29.1626358117941;
        Thu, 15 Jul 2021 07:08:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id u185sm6915353pfu.49.2021.07.15.07.08.36
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 07:08:37 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 2/7] gstreamer-plugins-base: ignore CVE-2021-3522 since it is fixed
Date: Thu, 15 Jul 2021 04:07:20 -1000
Message-Id: <f32e90a7f8918aacda61ef6176eb1655742045b4.1626357703.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1626357703.git.steve@sakoman.com>
References: <cover.1626357703.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CPE entries for gst-plugins-base are listed as gstreamer issues
so we need to ignore the false hit for the CVE we've patched

Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../gstreamer/gstreamer1.0-plugins-base_1.16.3.bb             | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
index bcfdef3bbd..431468d459 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.16.3.bb
@@ -20,6 +20,10 @@ SRC_URI = " \
 SRC_URI[md5sum] = "e3ddb1bae9fb510b49a295f212f1e6e4"
 SRC_URI[sha256sum] = "9f02678b0bbbcc9eff107d3bd89d83ce92fec2154cd607c7c8bd34dc7fee491c"
 
+# CPE entries for gst-plugins-base are listed as gstreamer issues
+# so we need to ignore the false hit
+CVE_CHECK_WHITELIST += "CVE-2021-3522"
+
 S = "${WORKDIR}/gst-plugins-base-${PV}"
 
 DEPENDS += "iso-codes util-linux zlib"
-- 
2.25.1

