Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web08.19189.1608974876483498736
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Dec 2020 01:27:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=gyaj58wj;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id g24so5545926edw.9
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Dec 2020 01:27:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fufM+oe4GBugUWmVHY7Q87Zw8pZwsIPCYVr7NZa7+Lg=;
        b=gyaj58wjgBJPo8cdbUG3NK/CBdWRvQHS8GIQM69tu7EbI+Kw3UGE1WcmyzHpwpHjrN
         FWNkYMMWfbyt0JLpfPRIPcP1rXlWTZ4Lba7QM1eS2R493Gu96VcoXPtKt5TcIK4JqJ9z
         h5aA4B3HcOGGjU3h+IpjEvtHOD2WZgjBfcGx4A+IlXiroMgZfYwwUXvcIb1q1pqMhIyP
         0NnN5LWSinrEm6s+BhlPH6PxI3I7csWNX/sjatapIgc39hlP9ljHQxiKl2aWBKw/Zu47
         6wz9hacF48CKEdKRztA/j0pg2k1jayGpsMWYopnAqAPJkR5uNLeBnNPRq7/wzjH/A646
         1llA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fufM+oe4GBugUWmVHY7Q87Zw8pZwsIPCYVr7NZa7+Lg=;
        b=Eu39IdDJ/OFlXkY1iL+oL6qc9VQr9+djFHSp2HCiMXfSht4TeWHPDb2uHCW6O3k9ZR
         afifzz+g1Ie31hegxcgrjGFJYX/XdcbWbI6Yxq1a6E0Ekcyc/9Pb9Bwv5q9TNwMh/yOP
         11NP19/21sMuyUXPrmMp/5ALMrNFk4O6PSCB+2uWfdEw/0AHoevH4mE4Mj8Xz7/5zzSu
         4ssSCVd0nndTfZH2tKRIb4lKYAV1mkLlKrKLsfVaP7I6Tz4Q+UAkonaCSSLaUZEWAOhE
         MYvguAjRefLKcQ9l6eIe06ZttUDI0AQe1aZNfOStiqfqjje/gy3En1SeeiQkxaGpKVrO
         l+fQ==
X-Gm-Message-State: AOAM533qLftZ4GUB+Tf9NmRAw7Gx86PuOjGWsxAkLsuzaSr3Cxa0cdDK
	Rdzb+XuAsWltGwCWV1jVnReEoyM0IKM=
X-Google-Smtp-Source: ABdhPJwDgVum4iWEeUey75TeWKeDF2CmqhH7HDy6vsCr9/FdhhtShccBI+OuJWv8G+b2Q4yRjszz6A==
X-Received: by 2002:a05:6402:3049:: with SMTP id bu9mr34639798edb.127.1608974875113;
        Sat, 26 Dec 2020 01:27:55 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id u2sm14828406ejb.65.2020.12.26.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Dec 2020 01:27:54 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 16/48] libusb1: upgrade 1.0.23 -> 1.0.24
Date: Sat, 26 Dec 2020 10:27:00 +0100
Message-Id: <20201226092732.52323-16-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201226092732.52323-1-alex.kanavin@gmail.com>
References: <20201226092732.52323-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../libusb/{libusb1_1.0.23.bb => libusb1_1.0.24.bb}            | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta/recipes-support/libusb/{libusb1_1.0.23.bb => libusb1_1.0.24.bb} (90%)

diff --git a/meta/recipes-support/libusb/libusb1_1.0.23.bb b/meta/recipes-support/libusb/libusb1_1.0.24.bb
similarity index 90%
rename from meta/recipes-support/libusb/libusb1_1.0.23.bb
rename to meta/recipes-support/libusb/libusb1_1.0.24.bb
index 2fd658b4ef..4c552ae6c7 100644
--- a/meta/recipes-support/libusb/libusb1_1.0.23.bb
+++ b/meta/recipes-support/libusb/libusb1_1.0.24.bb
@@ -12,8 +12,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/libusb/libusb-${PV}.tar.bz2 \
            file://run-ptest \
           "
 
-SRC_URI[md5sum] = "be79ed4a4a440169deec8beaac6aae33"
-SRC_URI[sha256sum] = "4fc17b2ef3502757641bf8fe2c14ad86ec86302a2b785abcb0806fd03aa1201f"
+SRC_URI[sha256sum] = "7efd2685f7b327326dcfb85cee426d9b871fd70e22caa15bb68d595ce2a2b12a"
 
 S = "${WORKDIR}/libusb-${PV}"
 
-- 
2.29.2

