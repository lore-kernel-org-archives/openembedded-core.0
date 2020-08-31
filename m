Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.50000.1598867887019702825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 Aug 2020 02:58:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AYtzGFMl;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id a26so7707983ejc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 31 Aug 2020 02:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LyU9s3a1PVM4KVUe4j5Bjrrj0XC41BZ/9cmrdne+9q0=;
        b=AYtzGFMlVpu/yxLluqm7rY3QLgWdRgrgXuAZgN633XKkhFVKhIiHeIMPHZvy6Rkz+K
         ylFLryTXWA+3C9/XkjBLrqZcf6KPWBCT0rBCRYCmoJTw1RN4VGWP7YmkEc/TCP7//xFr
         3MgE3K/PEG2l2uY5aPnmEU+G1wzNwmDaesZQ6Zbv5sWO/o7LMQD8HSy/WJYIIJiPxGTy
         xEbjRgrxtOrmiOYXpKDhs/01qTI6w4dKyYJCaQSRNWKk9SwVeeoX0e50lOFeo2OOmgd3
         2ywsIM4FW62JWU5RPpnFga5wuPez4KSEi8kXXn5GwDNS8wEzBdeS3rCiJTO8A9xftIk0
         HcPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LyU9s3a1PVM4KVUe4j5Bjrrj0XC41BZ/9cmrdne+9q0=;
        b=SsPKApflcBUlpU/CrWdE88UyYKxIteKgMGPlpaBpAxyClibr/ERpBij4k14dz20EM0
         KxwLKA/oIDgmtkU7G7Nc9xfhsfNVJVU/Lau1IZ/IBAYctLO6hYB3V8MnhsH2Gek9PyF7
         igc6gIiBhmRlF8CbaPMGi8aZzNwjL6VxScb6LK9kew9Rq4WsGo+OW2hx81u2lTn47SNY
         /pR9ZvFRZyK6aKsEwkMsoH9LR2Xeas2Vi/8HYHBZEehjMvkyvfAMMfhrLwUnq1DbuW8r
         y4uvt5dXNrbvYWIS12xbs0/AtRp33oUi7rYvGu/sr8lK9l0XVxAkwak46HwdkJwZDBTc
         pPxw==
X-Gm-Message-State: AOAM532yrkGqJw7T2dWz1OubxBdpkuTaSpWTRrPVFuhjo3JNd2Hk3EZv
	gIs4E5refaYbxUiRQWozG7IP2Jj2k94=
X-Google-Smtp-Source: ABdhPJxHS3DUcqOFBa/quYkOm/DMsX0komfDg9ZwThFVpyhnhHs6rsDPTLFJSA04vbFK6ctAMfXj5Q==
X-Received: by 2002:a17:906:fa81:: with SMTP id lt1mr335915ejb.459.1598867885127;
        Mon, 31 Aug 2020 02:58:05 -0700 (PDT)
Return-Path: <changhyeok.bae@gmail.com>
Received: from cmtcleu60844809.rd.corpintra.net ([2a02:8109:b5c0:8990:b114:707f:d9f1:179])
        by smtp.gmail.com with ESMTPSA id n15sm7233241eja.26.2020.08.31.02.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 02:58:04 -0700 (PDT)
From: "Changhyeok Bae" <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-Core][PATCH 1/2] iw: upgrade 5.4 -> 5.8
Date: Mon, 31 Aug 2020 11:59:47 +0200
Message-Id: <20200831095948.15750-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 meta/recipes-connectivity/iw/{iw_5.4.bb => iw_5.8.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/iw/{iw_5.4.bb => iw_5.8.bb} (85%)

diff --git a/meta/recipes-connectivity/iw/iw_5.4.bb b/meta/recipes-connectivity/iw/iw_5.8.bb
similarity index 85%
rename from meta/recipes-connectivity/iw/iw_5.4.bb
rename to meta/recipes-connectivity/iw/iw_5.8.bb
index 9f58e49709..97ca66d66f 100644
--- a/meta/recipes-connectivity/iw/iw_5.4.bb
+++ b/meta/recipes-connectivity/iw/iw_5.8.bb
@@ -14,8 +14,8 @@ SRC_URI = "http://www.kernel.org/pub/software/network/iw/${BP}.tar.gz \
            file://separate-objdir.patch \
 "
 
-SRC_URI[md5sum] = "08a4f581a39dc62fa85d3af796d844b6"
-SRC_URI[sha256sum] = "943cd2446a6c7242fded3766d054ab2a214a3514b9a8b7e942fed8fb13c1370c"
+SRC_URI[md5sum] = "98129d64212bdbb408f009c56ed5c62a"
+SRC_URI[sha256sum] = "cd9125c7e560926d66b09977fe0f75e5365ffd05a15df67d86a421dc76f96a96"
 
 inherit pkgconfig
 
-- 
2.23.0

