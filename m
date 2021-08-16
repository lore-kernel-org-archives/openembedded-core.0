Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.30880.1629150520019823526
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 14:48:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=gIkc/phg;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id p22so19589473qki.10
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 14:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4KoaNYmyDOAd85Sg60lFol0YCF1JFeLGPHPlFXJKsU=;
        b=gIkc/phgLFdHL0CNw+3n1NX4RUYY0YTRg8Xr3br7ei2MluglzN2qYK+YRN2kOD393v
         y5XRetYWmxbSoKl08sWN7B+LEMXKI6Jr+glwZ6tUPOl7GBdtz0TZVzQ4rtsEvCRZgxLo
         sA/Mi93emdYijO/QrE+WbgQprOdGuZKxUgQMPA1NTiWYdPh/zNo+wzPy/hNgK2ICUoXB
         MRhkgNS9Zb2KQd96pRXNyuNKxyK1vz2QqX/0sjWFLQvo3+gfB34xCfN+yp1EGkeH4tDS
         pPW0AIvViytX0IKU8d3lR24i/DHtVqEeidDSnqvCcBNCqkTyZJfKU6qKg8wOocuVkyCg
         O/uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=v4KoaNYmyDOAd85Sg60lFol0YCF1JFeLGPHPlFXJKsU=;
        b=SOxaBnj+OBqACkxh0F9mykn1/DCsK3Kx1tJbtYI2iSP96kCbvLm3ttLh3PjFiCzbaT
         y8l/wkRwutGJEMADmUUzjz31mseeYXPuuDWf1egiqI4zRNGc7KMBLoLQa18IGOVUAoor
         8BmEVQYYzhEQuo6CdTWBgUDWbRsmnr7+8k2zFTkpf/aOqP9k22OgGJbarFrQYVD3Dv9G
         qK2dT/rYC+Snn36PgXeNf1MNUG2uCvAgWVfy20MbYQL4SrNy+X6MLj5WqKPHONuK46BF
         16pYwes4/np2vepscn3+axrXpCAM174Rz1/7bhu3ovSsr7YaBYjjwpoe8NAw9E4htffo
         T3rg==
X-Gm-Message-State: AOAM5326x3LFfq4uMzordxFO3GjbEjrPvhFn3/xcHAvvFRUomEAr6kNh
	PjJqJrgCpKMop7nG25uL3T9OVDdltYTlpQ==
X-Google-Smtp-Source: ABdhPJyOeA9XszCvEXjD03hMA4GHWK3m0uz9f/EWrv/Hbfkaez6fPcbTrVX9Arbjs3eyL9B9/O339g==
X-Received: by 2002:a37:541:: with SMTP id 62mr493261qkf.478.1629150519017;
        Mon, 16 Aug 2021 14:48:39 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:f177:a44a:469d:7e14])
        by smtp.gmail.com with ESMTPSA id f24sm1912qtp.1.2021.08.16.14.48.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 14:48:38 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] arch-armv8m-main: missing space
Date: Mon, 16 Aug 2021 17:48:38 -0400
Message-Id: <20210816214838.28592-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct an issue with 2 AVAILTUNES not being separated by a space.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
---
 meta/conf/machine/include/arm/arch-armv8m-main.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/machine/include/arm/arch-armv8m-main.inc b/meta/conf/machine/include/arm/arch-armv8m-main.inc
index 27f552b2d726..4dbe401c1929 100644
--- a/meta/conf/machine/include/arm/arch-armv8m-main.inc
+++ b/meta/conf/machine/include/arm/arch-armv8m-main.inc
@@ -21,7 +21,7 @@ TUNEVALID[vfpv5spd16] = "Enable Vector Floating Point Version 5, Single Precisio
 TUNE_CCARGS_MFPU .= "${@bb.utils.contains('TUNE_FEATURES', 'vfpv5spd16', 'fpv5-sp-d16', '', d)}"
 MARCH_FPU = "${@bb.utils.contains('TUNE_FEATURES', [ 'vfpv5spd16' ], '+fp', '+nofp', d)}"
 
-AVAILTUNES                                      += "armv8m-main armv8m-mainearmv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
+AVAILTUNES                                      += "armv8m-main armv8m-maine armv8m-main-vfpv5spd16 armv8m-maine-vfpv5spd16"
 ARMPKGARCH:tune-armv8m-main                      = "armv8m-main"
 ARMPKGARCH:tune-armv8m-maine                     = "armv8m-main"
 ARMPKGARCH:tune-armv8m-main-vfpv5spd16           = "armv8m-main"
-- 
2.20.1

