Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web12.4220.1632003537163796690
 for <openembedded-core@lists.openembedded.org>;
 Sat, 18 Sep 2021 15:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@oleksandr-kravchuk-com.20210112.gappssmtp.com header.s=20210112 header.b=I578nyV5;
 spf=none, err=permanent DNS error (domain: oleksandr-kravchuk.com, ip: 209.85.167.49, mailfrom: open.source@oleksandr-kravchuk.com)
Received: by mail-lf1-f49.google.com with SMTP id m3so46800290lfu.2
        for <openembedded-core@lists.openembedded.org>; Sat, 18 Sep 2021 15:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oleksandr-kravchuk-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=quxBgjN134/6vlFF84IEJaUgD2cGr7Vq7sROYbSpFg4=;
        b=I578nyV5Dgw89o4hDtFTnPCy3cwE0Ezti85A8DAWMKLzircgicTD6miCrFGI0end4L
         dXEn+FmR5WTMykQKcyV7TQDav1PRlSXVzlaqWL2UIpdPSiGtK8VomXWBOBNNrbiDetsY
         7q+VkeGDewEgzKrGhjGwvVZ89376j8zn8UzQI+omRsHOGzvZV2AG7+Phx9UqNmmGnXyj
         tf8W0rnMHT5IPDrG8IgF26s2cwNrdzA/U00iSiu9z6dNaND1kucxQWnakAYOvRUnCXVF
         tlojOhYyJHR4wFlmDcAXeR2hnKJs2gmxT62OyIiVNeSuEcpXa+/wsHagzar1Yr25WKpw
         Cahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=quxBgjN134/6vlFF84IEJaUgD2cGr7Vq7sROYbSpFg4=;
        b=m4XYLgqFYJKfIGC8blpC2C8czBZmjYIlEQ4uYBk2oLPRDImZARieO0DrLc9romw2IN
         7aeLXRfQF999rmPU+x8WFdmLEvGcLfucnX5OSibf5APKJleNzODftRa6TXdr9IAdUmyO
         cZ5GVM9CU7t7xHBXFZqhwnE5XUfPmDqe9V2TnefcsjQ/ZHeMhz5OAoqTj6q2OZcEN3pe
         HfwtNsyJxfgaSobUlP70iZS0LrIh7Ouoj+74e4pokLy2JnjGFyZbCtu/adFsFBYC1Lgi
         p1uxfkVaznv+Hb501KgEcDnXjxiMvKBj0B0/PExYLeOEIuyiDOcxQsBu3BHMq+l79bTF
         jhUA==
X-Gm-Message-State: AOAM533T81weyKrYV002OZ6JciZkLQSD60DOSAnQemDcXABZmX15Zoyi
	/F6UyiLGSwbY1dh0NdFD6+se3lCdvzeVLWsB
X-Google-Smtp-Source: ABdhPJyYGFg4VBg1ygBFGzupr7o9KyxAVURUgLBuapU3HnoHtuzCr/w6bQr/bcLQXSiCPS4oeh/H/g==
X-Received: by 2002:a05:651c:2ca:: with SMTP id f10mr15207943ljo.211.1632003535072;
        Sat, 18 Sep 2021 15:18:55 -0700 (PDT)
Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from localhost.localdomain (c-7a22524e.023-160-67626725.bbcust.telenor.se. [78.82.34.122])
        by smtp.gmail.com with ESMTPSA id r200sm866917lff.115.2021.09.18.15.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 15:18:54 -0700 (PDT)
From: "Oleksandr Kravchuk" <open.source@oleksandr-kravchuk.com>
To: openembedded-core@lists.openembedded.org
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH 1/2] python3-setuptools: update to 58.0.4
Date: Sun, 19 Sep 2021 00:18:51 +0200
Message-Id: <20210918221852.2284913-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 ...ython3-setuptools_57.4.0.bb => python3-setuptools_58.0.4.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/python/{python3-setuptools_57.4.0.bb => python3-setuptools_58.0.4.bb} (94%)

diff --git a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
similarity index 94%
rename from meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
rename to meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
index ae45936c39..2000d355a9 100644
--- a/meta/recipes-devtools/python/python3-setuptools_57.4.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools_58.0.4.bb
@@ -10,7 +10,7 @@ SRC_URI:append:class-native = " file://0001-conditionally-do-not-fetch-code-by-e
 
 SRC_URI += "file://0001-change-shebang-to-python3.patch"
 
-SRC_URI[sha256sum] = "6bac238ffdf24e8806c61440e755192470352850f3419a52f26ffe0a1a64f465"
+SRC_URI[sha256sum] = "f10059f0152e0b7fb6b2edd77bcb1ecd4c9ed7048a826eb2d79f72fd2e6e237b"
 
 DEPENDS += "${PYTHON_PN}"
 
-- 
2.25.1

