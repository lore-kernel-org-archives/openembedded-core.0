Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.web11.14869.1602253156889021496
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2020 07:19:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=KCwQlDaN;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.177, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f177.google.com with SMTP id r21so3930046pgj.5
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2020 07:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references;
        bh=310zNJ8aX2Bh6MtlffwiuwbzGk5lTO9VbzcQZ8s9Hzw=;
        b=KCwQlDaN0KFiY+H1iSkWQrqrDK6h2MrJGk7zZzIDxoF1w+JoF4kSlK/aoJ+RXBSHpt
         V5AjImGffzx4fNfGtvcQTYicpeF9QufXHGrL0zKwxKmhHIUn3cUnRZITUHs+mpjXPJQ5
         9S0ltFlDGaZBWR8yan5QpYgMn80tCZmb34s9Xn/4qJv22TJAX/sZFPugljr02T61PHPe
         4wOwQHSFDWdzOpzEY9AldbV1CLNJjGq/BZDUX07AQ2Me0lJ/Kei/fnkKdI4umTvZGnfk
         Xv+DcdZz2q3bvdj1VjSl0/66Aj01fgJXiFp7XsanEP2841w41+dSF3JoaZ4GPe/8gV3o
         J5tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=310zNJ8aX2Bh6MtlffwiuwbzGk5lTO9VbzcQZ8s9Hzw=;
        b=tvX2aOMf7NzJbFbHLJPTlFvDVTU3jlszvPbP3WrmiNw9nj5+JsdllHauQldVU4Pbo8
         rAeJsNRH714AXrhoA4GMal6Pjp44CencDVD/roog5a+OhfngaLIVHrhk7Qg++1htI8Jd
         R8VrsBMwj517AatDz3vFhXqcXVUvgMHaYNj+CWs/BWiVoP2cW5qqmR5rBVdJpLq0Pg+a
         ggewdixEOQlev0PjQH9z+sUAy9TDzLV6qF9KNxIwUX0eEsDtz/8cnNC9+Xvwmc99pTUW
         nntVkuaJ76uTLQ7FHlTY5NNvL5vVc835XHauZNonDTwC/ZxlxT8Z4YTBRSdsh7TOQ8ei
         O17g==
X-Gm-Message-State: AOAM532XdKp67/lqd9Q2Ml6hN2SdRXDf4weVuF0VDSIJ7IkaoUFAzwEj
	+SJmm9nr0HZD49f02i/sA3l38vC06kSeXjyu
X-Google-Smtp-Source: ABdhPJx0chwPyPWj0ybgAZJ22DyEtnL9DIws2+eFq9cXbTAwgKcQZR+N2SH5WiE7q4MqTmD+Fhz/0g==
X-Received: by 2002:a17:90b:4b90:: with SMTP id lr16mr5063731pjb.0.1602253156049;
        Fri, 09 Oct 2020 07:19:16 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id n127sm10736116pfn.155.2020.10.09.07.19.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 07:19:15 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 04/14] lttng-ust: update to 2.11.1
Date: Fri,  9 Oct 2020 04:18:39 -1000
Message-Id: <2d9c34f2dd0a2d22d251d4375d8be86f88044f1e.1602253014.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1602253014.git.steve@sakoman.com>
References: <cover.1602253014.git.steve@sakoman.com>

From: Marek Vasut <marex@denx.de>

Update to latest available.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb}        | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-kernel/lttng/{lttng-ust_2.11.1.bb => lttng-ust_2.11.2.bb} (93%)

diff --git a/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb b/meta/recipes-kernel/lttng/lttng-ust_2.11.2.bb
similarity index 93%
rename from meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
rename to meta/recipes-kernel/lttng/lttng-ust_2.11.2.bb
index 3bd0dfad61..8968728dae 100644
--- a/meta/recipes-kernel/lttng/lttng-ust_2.11.1.bb
+++ b/meta/recipes-kernel/lttng/lttng-ust_2.11.2.bb
@@ -31,8 +31,8 @@ SRC_URI = "https://lttng.org/files/lttng-ust/lttng-ust-${PV}.tar.bz2 \
            file://0001-python-lttngust-Makefile.am-Add-install-lib-to-setup.patch \
            "
 
-SRC_URI[md5sum] = "7de04a8ff1f0a4effa09a42620ec4081"
-SRC_URI[sha256sum] = "7fbab963d60741ffd4d8dd0a246f6cf168cdfe3b2385798bd90550f5f0bba869"
+SRC_URI[md5sum] = "82556e4ab28c818c80db84296fc28bb3"
+SRC_URI[sha256sum] = "6b481cec7fe748503c827319e3356137bceef4cce8adecbda3a94c6effcdd161"
 
 CVE_PRODUCT = "ust"
 
-- 
2.17.1

