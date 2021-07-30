Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.22719.1627645514738758555
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Jul 2021 04:45:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=KyC/Q7/F;
 spf=pass (domain: gmail.com, ip: 209.85.221.44, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id b7so10956207wri.8
        for <openembedded-core@lists.openembedded.org>; Fri, 30 Jul 2021 04:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4OCbdBL8PEw+jndkDOXSQGOOc5bQ77DY72FbVDUnVKU=;
        b=KyC/Q7/FepsYtnuS3a8LlJSNVpp+k+8RcbkxC7pNUbuJFEcHe9CUYZmLR0yrTn1ta5
         gHIKyyYbzMMNlXCFT0+nqZ3uDx7AvHFiSh6MrXcGsTxyhkRvJ4mvklAPdqgwf3Rcp1im
         iKkUKWMqN2Nqr4g2tacfF5jV/TiXYHm7hBn1oHos8sV3JBnZQOCXFtcA1k6lvlXbSvEU
         hA+NAVwf8weqLZh+EprCWGzjHx81ly3/cqHhzKhUGuJE5PDc2FI9pr+vaGDz848qBFDr
         eVkG7AEDfgVpovofzPkJ/PXvfJ3Vq3wy0zdkTftthiNejZyddD8/e61E12Ho0G3PuFo8
         xNPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4OCbdBL8PEw+jndkDOXSQGOOc5bQ77DY72FbVDUnVKU=;
        b=AHE+lwULqpQa1o8lbfHF53adFZ0ahDz8Z0D1dJkI3KPFnZ5rhKqlTK33z2/gNtghb2
         fg3/1eaAG66s9/ZM8Fd6geljf143Dp/EmubUSWc7D+rFBuo202lLO4SD8lNmiN3C83Ef
         NDlE1ZjYS6iRVLiGhjWHh5ElaULW+tCKLxJtP87RUrzBbzM7SHLmXLH9hMDo4pWe9vS8
         2ig5+00Rk3zDfz29cLtqf9zkskBbqvvO7sEXN1E92rPXMTS7mEDcu8RbJ4N6ylAGd768
         sJ5ceWgLeHCEIy7ZU10u0d4YsKzLdp9psGJ+Iz1Fgz82wYXSnrO1lVAskBL0rvptDqpx
         m4eg==
X-Gm-Message-State: AOAM532f9bnXfFdPbnc03sU8RinJTQgHTRSq8ROCZblEPs5bCOlgydh+
	VZ18aShkrXoYNrmdp0okioCjkdLDtj4=
X-Google-Smtp-Source: ABdhPJwa2Cc+rVE1bQQImbMYjB4RTWevU3pwXyh2Wsd5OHTYlBQWmaBLP51upGFWw+RQ4vvM5gdRFg==
X-Received: by 2002:adf:e587:: with SMTP id l7mr2524649wrm.411.1627645512977;
        Fri, 30 Jul 2021 04:45:12 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id s9sm1459792wra.80.2021.07.30.04.45.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 04:45:12 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 1/9] cmake: update 3.21.0 -> 3.21.1
Date: Fri, 30 Jul 2021 13:44:59 +0200
Message-Id: <20210730114507.732448-1-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.21.0.bb => cmake-native_3.21.1.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.21.0.bb => cmake_3.21.1.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.21.0.bb => cmake-native_3.21.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.21.0.bb => cmake_3.21.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.21.0.bb b/meta/recipes-devtools/cmake/cmake-native_3.21.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.21.0.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.21.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 358f284279..7f0aff8118 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "4a42d56449a51f4d3809ab4d3b61fd4a96a469e56266e896ce1009b5768bd2ab"
+SRC_URI[sha256sum] = "fac3915171d4dff25913975d712f76e69aef44bf738ba7b976793a458b4cfed4"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.21.0.bb b/meta/recipes-devtools/cmake/cmake_3.21.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.21.0.bb
rename to meta/recipes-devtools/cmake/cmake_3.21.1.bb
-- 
2.31.1

