Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
 by mx.groups.io with SMTP id smtpd.web12.4533.1588176707071909189
 for <openembedded-core@lists.openembedded.org>;
 Wed, 29 Apr 2020 09:11:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=vcqR0ztV;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.68, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f68.google.com with SMTP id a32so954764pje.5
        for <openembedded-core@lists.openembedded.org>; Wed, 29 Apr 2020 09:11:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=KOJUE5tEJKQtYV0LmBPVvlCXUEYPkozYIbRnXLr61u8=;
        b=vcqR0ztVmx/ZyY0i7+qv/l7i4BIEO6h3rMYOaP7WZnMRRGCaLvzMCBP4w8Jya3sBhP
         J1F1EYDiexq+O73vSINy4yfTH3FasI+Ivh2cX6hRtvYoYnAjAk5WDNyGDM/MXNR4APkD
         0XBvc1/dWulmNPs8WmZkiXvuNX1XxhRNd1Jp2AviEiCQ5ZWs769CIzozHDQs9rOnpmpx
         lGFwrEkpBLEPpWJ8XUv+3kV4jDerWKzCpvtD9UjJmhs+pjUem0hYmuYycmuqkpxICSTf
         gawG7/KrZS9YKpwqdt1Am5GQ+y2dYuxLFycImIn+fOp9VvNJhcMk5/tlOGEGC/vSicI8
         nnnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=KOJUE5tEJKQtYV0LmBPVvlCXUEYPkozYIbRnXLr61u8=;
        b=nP7wt/C9B0yjiOcn2bVkzwzcq5sMYO0vFKwZiUk4P44hlvT3oDa/PltmidloCp32OR
         wLRTE4BxclMdDb+E+FYvgLVvESzcae2MYV/fRaLRL1Byjd7UlChOnOI8sEmYrtnPsBOB
         5l4OHAaJBDEGLW51qFgtJd5Qcc4LTnNqrsoSoE2u38OpVOxnu41eTRzmEaplwTMC3V2f
         vh1/tJH+exFG04UXVOChQ1BIkd32Fqz/GTLgKHaMLJCpiOH4DEQcMUvXBqayzYhQV7wF
         WPxi5KXRqWTamKBqyIV50lebMc5CI3A25JQ7nQXKsmZfavQI8QyANnTT8hNGVvXAs7eh
         2Hlw==
X-Gm-Message-State: AGi0PuaooteEM3pf9JcG2RwXwZQOtPGjwdGgQHGA3l0Qk/8/JMi2UiAP
	g7riThew9oCOvyAbqEbwX/f07KrMbWq4pw==
X-Google-Smtp-Source: APiQypIWWmpgc+025LFxDPuZ7CbWHGi41JWJf8OV0IKXRAFKkx12uaawn9+g6DbIoBqG9sqdkauutQ==
X-Received: by 2002:a17:90a:cb8c:: with SMTP id a12mr3976454pju.153.1588176706057;
        Wed, 29 Apr 2020 09:11:46 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id o1sm4833062pjs.39.2020.04.29.09.11.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2020 09:11:45 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 06/16] buildtools-extended-tarball: Add libstc++.a
Date: Wed, 29 Apr 2020 06:10:51 -1000
Message-Id: <bb55dd4f3493f8d27a162943198329c16a75f659.1588175775.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1588175775.git.steve@sakoman.com>
References: <cover.1588175775.git.steve@sakoman.com>

From: Jeremy Puhlman <jpuhlman@mvista.com>

Builds like native-openjdk, really wants a to link
some tools against the static version. Since when
using the extended tarball, its the only place to
get it, add the library.

Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-core/meta/buildtools-extended-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/buildtools-extended-tarball.bb b/meta/recipes-core/meta/buildtools-extended-tarball.bb
index dd780c5d57..e38967af3f 100644
--- a/meta/recipes-core/meta/buildtools-extended-tarball.bb
+++ b/meta/recipes-core/meta/buildtools-extended-tarball.bb
@@ -23,6 +23,7 @@ TOOLCHAIN_HOST_TASK += "\
     nativesdk-libgcc \
     nativesdk-libstdc++ \
     nativesdk-libstdc++-dev \
+    nativesdk-libstdc++-staticdev \
     nativesdk-libtool \
     nativesdk-pkgconfig \
     nativesdk-glibc-utils \
-- 
2.17.1

