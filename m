Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.902.1599081241761776444
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=LcdScp8f;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id e23so726208eja.3
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yI6JxFxkAEh3fAnmt+gmNn20mGmjKlRaYjssNWgj+5U=;
        b=LcdScp8fgGHtCZZItgboF5hLckoV6NQoMEA/JHc4OrR65DGFLxI4jrtn3ZqaVmh3jr
         RaZvH8ofYiUbQE9hI4xSKaB65yYFn5oPHhruTYrJjukYyZ3z69rPICUwNU1GKTIGZtmZ
         e/AU5kCkY4aXf+FwqflfCPb78JntV5Zrk8ivFKWITedZksHp6NKkPC7RNkn8BeADl4/G
         8qMFosCJRASsIbViuyVJfX2v1kNmi19p8/qSWac9ysl+JntMEgUFOIQxSv93UQAVZEPw
         VueTJGLz1mdnO2qW/k8SuqP1mmrfKAr8ne5WDGjaaLCP8e00EN0UxhJRJG51uXLH3D56
         53Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yI6JxFxkAEh3fAnmt+gmNn20mGmjKlRaYjssNWgj+5U=;
        b=rugrkY4eBLYD43tfa8O++/wn7UUZ23HnsxUmBP+dbAnK8lzIREWs5cM9rLCVYm7zHm
         VYgxEfzoeIKQKYHhej4r9mXYkXDuoM3r6ZjoGCyt5V5dqKQHZIFYzb8483U9aXIEI8K6
         6kNhUnKawkRrNH57fU2XppmZQ8o/kX8zJjhFM4GMx+mTu4CRTmu5s4MIfit7okyXEVg7
         6ZzAND73czFpmARcEGh6fZyUaQofWHoiMAGB3JzWkoC9qJlpmRZxt6/LL6tlsbLwWhDy
         o+OLa5qQJPGBDGLsJLl+Zpceji+VU4ge28SVrlx1IrJNM/mG573Cxztk5wxjZG4lmuB6
         3Tvw==
X-Gm-Message-State: AOAM532rtgk9pvAAUiG7Sg3r7Hs0PK7nvhGAMTtaYltDBBnzJkq/5IWJ
	i0Qc4QV/07ApjaVePE+6h4y9gMRbyYA=
X-Google-Smtp-Source: ABdhPJyrqKG6gEr7cwAexM+wZGaP2TCN1ZpTlMUudfsVeDPIZ5Dvo1M5sWis8Gti9QvMpxdbDN/eOA==
X-Received: by 2002:a17:906:60d5:: with SMTP id f21mr85007ejk.94.1599081240042;
        Wed, 02 Sep 2020 14:14:00 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.13.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:13:59 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/23] debianutils: upgrade 4.11 -> 4.11.1
Date: Wed,  2 Sep 2020 23:13:11 +0200
Message-Id: <20200902211330.4853-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../debianutils/{debianutils_4.11.bb => debianutils_4.11.1.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/debianutils/{debianutils_4.11.bb => debianutils_4.11.1.bb} (95%)

diff --git a/meta/recipes-support/debianutils/debianutils_4.11.bb b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
similarity index 95%
rename from meta/recipes-support/debianutils/debianutils_4.11.bb
rename to meta/recipes-support/debianutils/debianutils_4.11.1.bb
index ac3d5b0267..71fc99e29b 100644
--- a/meta/recipes-support/debianutils/debianutils_4.11.bb
+++ b/meta/recipes-support/debianutils/debianutils_4.11.1.bb
@@ -8,7 +8,7 @@ SRC_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/${BPN}_${PV}.tar.xz"
 # so we check the latest upstream from a directory that does get updated
 UPSTREAM_CHECK_URI = "${DEBIAN_MIRROR}/main/d/${BPN}/"
 
-SRC_URI[sha256sum] = "bb5ce6290696b0d623377521ed217f484aa98f7346c5f7c48f9ae3e1acfb7151"
+SRC_URI[sha256sum] = "8be869f19c55c18d53d9f0414b68bb966a068b2154e9fbbfc6193827d6af983c"
 
 inherit autotools update-alternatives
 
-- 
2.28.0

