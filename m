Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.3920.1603919170415199480
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2020 14:06:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=IV5WQIkd;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id k9so957319edo.5
        for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2020 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uJCVZN3IA8/A9onnC12rYJ747aVmAT+s8+qPUL/fp3c=;
        b=IV5WQIkdTz0tpR8/GbNlI2xUC0lf3TdKaFoCoHvJC+bmtM3z1UNCaeKGXNeJz5GrLU
         /C+mUUesYW1vDnS417PIK/174Q+6jIQqw6d1shE6r2gU61+kZVIpzKccJgxDb3sgKZsp
         1hB+H6ZKt4D0o+GHUY2wuPJ9ykFn9zR+hlmjNiUFxDZg/yrs1xgW+A7vKG/GPEZjOQ2c
         TJFBrAggm7+52TcvWZMu4yfGiyIMXksNZUvmSa+qbChFMCp/34iDk5ZAq1RH1FCRooRH
         AYBlyWDXwV/OzSOmuMOdIlk0Aw9VIpn6B8UxZtnm74KaJeFfKk7fEAR54rEbVhTXpcJz
         Z2Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uJCVZN3IA8/A9onnC12rYJ747aVmAT+s8+qPUL/fp3c=;
        b=RH49J4MBhcsN4nh1f3IJP1Y9PuuwjbmA7laIe2KkuBAZEKGESGv2gCw/PJthEKccnL
         bcivRWDYHe1s1e5+zUvyRa9uWuJwJGBmwHeg7d0SheRUVskMwaECx96miWG4C98VqdLK
         8V7MvJpw9PgdF27WkzPWdcObcg1enLm3rfJxThGGkkWyKRrM5poDig4dxF5VQ+Ce5QVx
         IgLZ8wcc2gCGyc7KU8gmQIZaPxgb2x8mZDFCMbI4o/VH3QNEFOQYODtM1OLuKxaSTqsr
         CJ9t2JQXOkBT+39ApzAsh98f2TKs3MrMaMyEISihbY3iMH3UBtVVD6GCxLgB/NO9exeo
         P/Xg==
X-Gm-Message-State: AOAM532/LQIaF4PCDfy4+R/OVZan8JfiV6FEXkffttMVMyYX2L/ldm9+
	YVzE9Alg7D2RlcdaI24KMW1DZlTJXjlETA==
X-Google-Smtp-Source: ABdhPJya2/oQlERA00W2IH6+n9z6B/kX7awZ0NVDiFETjIKGrBjAmKda/aTfCXBjgTaSMeEdMR7rRA==
X-Received: by 2002:aa7:c6cd:: with SMTP id b13mr918920eds.32.1603919168741;
        Wed, 28 Oct 2020 14:06:08 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.fritz.box ([2a02:2450:1011:4f7:596d:bf31:3950:5bda])
        by smtp.gmail.com with ESMTPSA id q25sm352434eja.86.2020.10.28.14.06.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2020 14:06:08 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 03/33] cmake: update 3.18.2 -> 3.18.4
Date: Wed, 28 Oct 2020 22:05:28 +0100
Message-Id: <20201028210558.21070-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20201028210558.21070-1-alex.kanavin@gmail.com>
References: <20201028210558.21070-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.18.2.bb => cmake-native_3.18.4.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.18.2.bb => cmake_3.18.4.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.18.2.bb => cmake-native_3.18.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.18.2.bb => cmake_3.18.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.18.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.18.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index fa1b818ae4..e840e884cf 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,7 +22,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
+SRC_URI[sha256sum] = "597c61358e6a92ecbfad42a9b5321ddd801fc7e7eca08441307c9138382d4f77"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.18.2.bb b/meta/recipes-devtools/cmake/cmake_3.18.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.18.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.18.4.bb
-- 
2.29.0

