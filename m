Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web09.11637.1621204370794090219
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 May 2021 15:32:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=KGJFrm9E;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.50, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f50.google.com with SMTP id 62so1506776wmb.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 May 2021 15:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=PkiRswJc+cK70XlSv4tx4T8Ra0p3ncrv+yAhv/RHgBs=;
        b=KGJFrm9EweJZDaShcdqhJdUFsR+CxCBkeQ7zFOLCQ+HHba5kYBLWf7Vb/fPBMWRoG3
         WK/t/K1XFLQLSlO8Ta5OHHcr1e+jLy9x5rOF/XO/n/0gkvAahJcPrxenz+4SU9Gqo6/T
         hmLiidGBzYte/EDSbfOeLUXY9wv3cHy1alQ5Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PkiRswJc+cK70XlSv4tx4T8Ra0p3ncrv+yAhv/RHgBs=;
        b=UaTh+HhE8g4WWAZQqT2AplPIZ54kFdeSngrt1FDvwjBlXnGe+tM0wdUAtBFgw1icyK
         ng0XoJJmflzfDRyS2lb88TXm4ZQ9JRsAiRD86AQNRRYhZbucNOr6s2DYeNMA4YNyvuJG
         xPAchUt4yH9QYivCbNdfnwYYMKxF2aQr2cCmy5khXg/J5dkx4bfvc3gZhMt0QbdObGx/
         vUcJ64qIwT1vN6xUpJC+GQ9SS13jEM2MCru2LhsBY0an+7SMsadq/I4vdsZC1c6K+11g
         nukVVc1G7UcRxikSO/FV8AjQMwguVeDxOsB7IUEWm3P+qndHhmhfir+TM55ZPR5ZYtLT
         g5PQ==
X-Gm-Message-State: AOAM531Y1McaTkqfPSVn3tvP65Tslc4TydcAMqjKn2dsUC9kltOXTDAG
	qM26h3uezykci7MvwxdKF8tI0AboC0gB6w==
X-Google-Smtp-Source: ABdhPJyHHHIO7cArYPrcB9GTq2pIWbkIp/ZuAzBBPS3AeWi0ILcDfybyjBW0/Ev7J5n2Q7YDWtzFZg==
X-Received: by 2002:a1c:9ac7:: with SMTP id c190mr17959680wme.43.1621204369158;
        Sun, 16 May 2021 15:32:49 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:1b39:2a3f:a2c2:a4fc])
        by smtp.gmail.com with ESMTPSA id f8sm11621759wmg.43.2021.05.16.15.32.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 15:32:49 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 02/27] ofono: upgrade 1.31 -> 1.32
Date: Sun, 16 May 2021 23:32:22 +0100
Message-Id: <20210516223247.2401235-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
References: <20210516223247.2401235-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../ofono/{ofono_1.31.bb => ofono_1.32.bb}                     | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-connectivity/ofono/{ofono_1.31.bb => ofono_1.32.bb} (93%)

diff --git a/meta/recipes-connectivity/ofono/ofono_1.31.bb b/meta/recipes-connectivity/ofono/ofono_1.32.bb
similarity index 93%
rename from meta/recipes-connectivity/ofono/ofono_1.31.bb
rename to meta/recipes-connectivity/ofono/ofono_1.32.bb
index 2425ef76a64..f3d875b204d 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.31.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.32.bb
@@ -13,8 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
 "
-SRC_URI[md5sum] = "1c26340e3c6ed132cc812595081bb3dc"
-SRC_URI[sha256sum] = "a15c5d28096c10eb30e47a68b6dc2e7c4a5a99d7f4cfedf0b69624f33d859e9b"
+SRC_URI[sha256sum] = "f7d775887b7b80cf3b82e3f0a6c2696c6d01963d222ca2217919d21b9e803042"
 
 inherit autotools pkgconfig update-rc.d systemd gobject-introspection-data
 
-- 
2.30.2

