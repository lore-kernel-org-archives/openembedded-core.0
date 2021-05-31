Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web10.44086.1622467447101686493
 for <openembedded-core@lists.openembedded.org>;
 Mon, 31 May 2021 06:24:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=QGJZapkt;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.54, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f54.google.com with SMTP id x8so10905399wrq.9
        for <openembedded-core@lists.openembedded.org>; Mon, 31 May 2021 06:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jSoQ7RF5LtbReK1Zvy5NzFlGwbZwODrfBSDvfMuslQg=;
        b=QGJZapktvV5AfkYGcIcM/2p4FF6w1MKajzysExDjJE96Fc8attSVaMRa58iINjqdqM
         2y4grNdxlsSegou/vgZDCedhK+1ZyoJEQmYhdL32is5cTGZ+AKqhFJEGfMqsY/NB1hVA
         iumHpt/zLcSFBkyiVd5cVaKzSO5Be6wWBm51E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=jSoQ7RF5LtbReK1Zvy5NzFlGwbZwODrfBSDvfMuslQg=;
        b=uAzI6HVp5eFxqEHnPNvEMuKg1V7cbq72hmxjEB4g/xsimZbEthkBjk9RHeIFfT+mKN
         Nx9VZKrEtvB9RhGRctve2G2j6n3H4iF+Z+H06Ffn3DL/wIdW9gnTii/vN4k0CrUfgPoE
         mBvQhs12bPgw4VGURAl2a3/m7JazoCCx4u4mlQtWzQQAt+NmKgZxHvuLNy2Tidhzhmv7
         PeQoB2oV+tpe3ULYrSvyW9oOgfhmw2kFQflW7wLQkxgZjrSD2t98nsj+/2jMo0J+iJfS
         26xUkZ0izjh7cydbm6uR8E3vDZMeMBEx7g1MV1skRcJ/2ENQ7sDTlXdGf606Cy4JZ15t
         xzYQ==
X-Gm-Message-State: AOAM5330/At5g7vVL2SBVq5y07eWOEhRPpZCQ4mwmQuojdeUYKzKOzKh
	mXCDaF/BxuDmasHQ1tL1E7KMtSrnyb5zpA==
X-Google-Smtp-Source: ABdhPJweSyMdh9RimL7ygpuHHTfylpIvr5AbOCQkSJTjh0SrICF0pZeyb71hj3ggT43xjonJPvqYSQ==
X-Received: by 2002:a5d:6552:: with SMTP id z18mr21359420wrv.208.1622467445376;
        Mon, 31 May 2021 06:24:05 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:fcab:51bf:ac39:992c])
        by smtp.gmail.com with ESMTPSA id z11sm13912849wmf.31.2021.05.31.06.24.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 06:24:05 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/2] curl: upgrade 7.76.1 -> 7.77.0
Date: Mon, 31 May 2021 14:24:03 +0100
Message-Id: <20210531132404.2843797-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-support/curl/{curl_7.76.1.bb => curl_7.77.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/curl/{curl_7.76.1.bb => curl_7.77.0.bb} (97%)

diff --git a/meta/recipes-support/curl/curl_7.76.1.bb b/meta/recipes-support/curl/curl_7.77.0.bb
similarity index 97%
rename from meta/recipes-support/curl/curl_7.76.1.bb
rename to meta/recipes-support/curl/curl_7.77.0.bb
index 4e2c277010b..ee1aa89f275 100644
--- a/meta/recipes-support/curl/curl_7.76.1.bb
+++ b/meta/recipes-support/curl/curl_7.77.0.bb
@@ -13,7 +13,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://0001-replace-krb5-config-with-pkg-config.patch \
 "
 
-SRC_URI[sha256sum] = "7a8e184d7d31312c4ebf6a8cb59cd757e61b2b2833a9ed4f9bf708066e7695e9"
+SRC_URI[sha256sum] = "6c0c28868cb82593859fc43b9c8fdb769314c855c05cf1b56b023acf855df8ea"
 
 # Curl has used many names over the years...
 CVE_PRODUCT = "haxx:curl haxx:libcurl curl:curl curl:libcurl libcurl:libcurl daniel_stenberg:curl"
-- 
2.30.2

