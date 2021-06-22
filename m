Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.7511.1624360893153541149
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Jun 2021 04:21:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=vM21ZVPX;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id s15so23101965edt.13
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Jun 2021 04:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=smH7qlmp55AOqGcZsA67Irs4fb3ukwZf/c1fF7GNqfo=;
        b=vM21ZVPXxHrobeUsvCJYgn3DASO4/5xPKBYaNKzyJayXVvPX4kQO/cGpdnvD3UD8FP
         2WreTw9nTSjVMYG0cmwugdA7/J3T8rXL5noPqS6EhbtFPy0iJ46AawKZh//35P13q1yu
         bXdZqi1dEDQedfhOX4fstWWWOfYXjDwh6cl8e7EDyMZbkUfx/PCRNbd2xRgcIKIlg+2X
         9qjEHbCsYz8GfjWWUd7SepGwXdJsavPZzmbgGwteCb1IK66R0wdI9vH+RgjfGc3wyrz2
         SDmms1hskRkNVDeXU6Qh7kTvJ3M4HaTkJpLcNJb3Y8ga+0FfEhoVktjXo/+OHvuxHp1B
         H0hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=smH7qlmp55AOqGcZsA67Irs4fb3ukwZf/c1fF7GNqfo=;
        b=IqJPjRLzwzPu/sexiQwvpFw9WmV0Ne0LUufn3CklGE1o/fvt0Iyc3UDhDNBAI80LTk
         ghnutc6hR2mrqT1pcxBwjGys8hLQCBf1InxS7HGHSs/3oUEdtLmb7nTJPyhNcDpLbN8l
         m71B22MLMgMLzfuE29TcVbiCFOZKr3G0N7Z39kAzlQXaD4OhXdVxgpMZhAOp0TgiT/78
         LkR+pEVRIskHzI2S4rZ9yTJDYgbA1q/im5ooSCv8DP/ufd62tfpQ5saGu82j4WY0I+Hu
         3H8+6ljf5fHct+cuA272bQ/7e5QLHuZYk6ulfi+OYeoEU452e4uBE/fDjAjaJwVSNQo6
         jdEw==
X-Gm-Message-State: AOAM533/vY1NYyoRL4/OJF/ZP0UmhOy4kfFzB3NIFXoCLZG3PEGkOj+i
	PvXJWeAK1ZiFfsGY9rujUT3c4PHRu8laoQ==
X-Google-Smtp-Source: ABdhPJxlCsQzoo2ZPkNlteRPfEZ4ltXwGPKdRrXvUq3k3/5aW0YoWbyjHrTEdsFVJbBQFHwXiv5NGw==
X-Received: by 2002:a05:6402:358:: with SMTP id r24mr4277475edw.69.1624360891826;
        Tue, 22 Jun 2021 04:21:31 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id n2sm11987416edi.32.2021.06.22.04.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 04:21:31 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/19] cmake: update 3.20.3 -> 3.20.4
Date: Tue, 22 Jun 2021 13:21:09 +0200
Message-Id: <20210622112126.2026646-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210622112126.2026646-1-alex.kanavin@gmail.com>
References: <20210622112126.2026646-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.20.3.bb => cmake-native_3.20.4.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.20.3.bb => cmake_3.20.4.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.3.bb => cmake-native_3.20.4.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.3.bb => cmake_3.20.4.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.20.4.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 0987c01c87..cf2cd0c2fa 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
+SRC_URI[sha256sum] = "87a4060298f2c6bb09d479de1400bc78195a5b55a65622a7dceeb3d1090a1b16"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.3.bb b/meta/recipes-devtools/cmake/cmake_3.20.4.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.3.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.4.bb
-- 
2.31.1

