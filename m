Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
 by mx.groups.io with SMTP id smtpd.web12.7593.1621937099746838852
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 May 2021 03:05:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N6Q3wk/3;
 spf=pass (domain: gmail.com, ip: 209.85.208.173, mailfrom: samuli.piippo@gmail.com)
Received: by mail-lj1-f173.google.com with SMTP id c15so37315202ljr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 25 May 2021 03:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+265rqYozdVAKdvsw/4hASiMDj7hNrt+N+rq+cNVbU=;
        b=N6Q3wk/3y3Cl9Q/v7iR9mEEniOOwtJ9IwwtBdWpi0THcWTziUHSdoHgVddECnrigKW
         3EGqHsaVHcw1VwtXP8qlhSCuIXaf0wIKwLScQSZvGBHW08PMEvrfPudZaV7iDTM6iS5Q
         HSKPBwcyKenCrzCHgeTOavc0MsRmqkmnNtlqIamld3NKX3HSsu0+6uXV7yfJZmtUcPaT
         XIZSlnoozZkEiyCI17rP9YEqjgZQzwDgYALwZiJwxJzRsqeJK9M7sYl6nJ2el84CZpoQ
         SekbSgYMfm6i7LNHzdi1EcjfXFl7ocUQ5E/9cvpVteN/m7si9WkpOufN2/OeZ5YKpPZX
         LlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=U+265rqYozdVAKdvsw/4hASiMDj7hNrt+N+rq+cNVbU=;
        b=BXhzmQoGDIrAhYR5LJavntipwukOcbyN8g5Yi2FGGdTFGaSWMiUSTl6a0OuZRlKNqe
         TgDZWAXPJEiZHynT6S9PAj1CAC3vmFOe+OFGspEUABV29kaKkLX89HfhuXUtC+G5fAPX
         vCiErSfxTgej/ipq7Woi+Y03ZsQtb7HfHqKrMvV3eFWJTwE3X6guTO746GKZ69e+bynb
         z0Hv33lPKm8606ktJHDIQO8J68Bue6Mblq6PM4zcZuArhLBQJe/AmbJMjLJMgWWBjLtP
         fhgbsMysRB1UAZhtWaZtAzmZYefs024szNijd6eP6lC+7YQveY4O3JYB/1FqyzBeY9Xm
         dS/A==
X-Gm-Message-State: AOAM532aTQqBFBiZkROc4ZTTXVKc7MUyLkepTqbF3zwS6rw+MTiad1Yk
	CY8c4hyJ/a1fKx+S99NJEHG83ylZq+BT3hsg
X-Google-Smtp-Source: ABdhPJzs+gBbRljNXgL4QJSlNOhN1eOz1jXQnNsFlKCQoK0EKDTo6O5itleyhnEiy7tTSpnfnw0V9w==
X-Received: by 2002:a05:651c:216:: with SMTP id y22mr20737065ljn.181.1621937097437;
        Tue, 25 May 2021 03:04:57 -0700 (PDT)
Return-Path: <samuli.piippo@gmail.com>
Received: from munkone.intra.qt.io (62-183-187-94.co.dnainternet.fi. [62.183.187.94])
        by smtp.gmail.com with ESMTPSA id m5sm2048681ljg.118.2021.05.25.03.04.56
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 03:04:57 -0700 (PDT)
From: "Samuli Piippo" <samuli.piippo@gmail.com>
X-Google-Original-From: Samuli Piippo <samuli.piippo@qt.io>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] cmake-native: enabled zstd support
Date: Tue, 25 May 2021 13:04:47 +0300
Message-Id: <20210525100447.3918978-1-samuli.piippo@qt.io>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that zstd is in oe-core, enable support for it in native CMake.

Signed-off-by: Samuli Piippo <samuli.piippo@qt.io>
---
 meta/recipes-devtools/cmake/cmake-native_3.20.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
index d91e42ef9a..335097d387 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.20.1.bb
@@ -1,7 +1,7 @@
 require cmake.inc
 inherit native
 
-DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native"
+DEPENDS += "bzip2-replacement-native xz-native zlib-native curl-native ncurses-native zstd-native"
 
 SRC_URI += "file://OEToolchainConfig.cmake \
             file://environment.d-cmake.sh \
-- 
2.25.1

