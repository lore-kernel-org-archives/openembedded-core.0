Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web10.5868.1622797839577163633
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Jun 2021 02:10:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=I2dvPuL6;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id o5so10328659edc.5
        for <openembedded-core@lists.openembedded.org>; Fri, 04 Jun 2021 02:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WHdromoc0gL77eEEVm/314/RA2BS7AEFqX07nUCH0VM=;
        b=I2dvPuL6cIZzRDXwnrOTgSq5OPdwjIu5+XPymhbIccFJBhhhqAS52CbTdVcGeJCvhm
         9XTKMowgjIaoFTkVqpAw+WtEDFYRnAulp+WHJlM7+NsXv2OAP0hU0BOfhvhgYBwnF7BI
         9EH/xONZCly5Ukg5T5U6/wSexDvx//mN8qSt/Y+AoG/N/lWKXbkIHatQWROJeFWik6B9
         zZxTaOqozDljj0dYDlI57tdNXZYb5s8ZyYcKqJcz8qDae/yRwHhaBjgKT7ir++cfq6B5
         YC2IiBWCKR1c7m6f+QNcwf8DLASfTlVfYKQU29P4BZIi4weQgh1licGuJBQd0bbP7jrM
         9bEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WHdromoc0gL77eEEVm/314/RA2BS7AEFqX07nUCH0VM=;
        b=pWeI41E18sXR9eWoSqlxfJSHOtNy9ydH9y/mh7knCpf7QbMj4LGs6k/8UKy60cvz3i
         2PWMVaIbQqq7dCjCegn/3sT+Hes6NsTBznbIm9nyJJLpnHYS5lN3jLvuhbdMhBO6+LNs
         MBVWJ6h26TeSbn5zrqR61RWmJgphhecJpvRlQ/6HMepgP60VuiENPXtM5p0imiLj3c/Z
         xpaBv+4Otrqxaq/ReMF/QkpcGVrmnowTqsIobPP0hSHhD98vmCO2MYiPvbD1H0tbSm7F
         glxUdL+70S0GEpPZx8SNr7lB0guHccT38KSgyKCoQn9g1wbXDz6v7noHQxz/A+t2rVXm
         zNrQ==
X-Gm-Message-State: AOAM533mMDFf9G1Zz2Tl8B44DCwnaBzJdNSZKewXqNUUqC36oUTwtfi/
	juznmhJCozx6wd0zTQrwKNUC/G84beIaLQ==
X-Google-Smtp-Source: ABdhPJyIUNTdvCiGtyedCKFJVCrly1U/HDxYU6IickTbjLfeuQgsKPaA7TjnSgNApajOHKa/uB4xgw==
X-Received: by 2002:aa7:db90:: with SMTP id u16mr3638689edt.106.1622797838234;
        Fri, 04 Jun 2021 02:10:38 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost.localdomain ([2a02:2454:2a0:cb00:eb83:2e01:3dda:5d46])
        by smtp.gmail.com with ESMTPSA id f7sm2525152ejz.95.2021.06.04.02.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 02:10:37 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 04/11] cmake: update 3.20.2 -> 3.20.3
Date: Fri,  4 Jun 2021 11:10:23 +0200
Message-Id: <20210604091030.1380877-4-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210604091030.1380877-1-alex.kanavin@gmail.com>
References: <20210604091030.1380877-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 .../recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} | 0
 3 files changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.20.2.bb => cmake-native_3.20.3.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.20.2.bb => cmake_3.20.3.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.20.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.20.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.20.3.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index be43760628..0987c01c87 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -21,7 +21,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "aecf6ecb975179eb3bb6a4a50cae192d41e92b9372b02300f9e8f1d5f559544e"
+SRC_URI[sha256sum] = "4d008ac3461e271fcfac26a05936f77fc7ab64402156fb371d41284851a651b8"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.20.2.bb b/meta/recipes-devtools/cmake/cmake_3.20.3.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.20.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.20.3.bb
-- 
2.31.1

