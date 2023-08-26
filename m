Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6852FC83F15
	for <webhook@archiver.kernel.org>; Sat, 26 Aug 2023 17:14:27 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web11.12514.1693070057451005636
 for <openembedded-core@lists.openembedded.org>;
 Sat, 26 Aug 2023 10:14:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=koudQwBF;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3fee769fd53so16870275e9.1
        for <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 10:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693070055; x=1693674855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kD8eYJ9dx/9gjskIMfYo0jM3nUsOVqNeMI5HGFJFVkM=;
        b=koudQwBF99N0oSV+z0FkUzB5bbBvX9vUqLnZmWWAKzLWS7xlU/q1q+b4A9nT0IkEf8
         IqZ+3AoL9xjDydW3aG157TfsNDcH1MxPKINzUe7oPBNiiT+RPqDDp4FK33U2RRe7Ry4y
         NfbexmaHmecKIfGAaLk9NBr9l+pottHo/vif67q5fvlmikg0iJS0hzz7If9NU09SP5yO
         Z5DvSxC3TuusTIim9bdh0eVC0DZUAAuL/h5oJ0nmf698+n2oyyxAzM4nHFqfwudx5N7n
         msDWnCHu5U75lffGvyvNZUlVEBnBfL7s9ZrXRbZyAIJC4KeDfCJEoCJE9PY4xKBLRWaa
         5zOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693070055; x=1693674855;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD8eYJ9dx/9gjskIMfYo0jM3nUsOVqNeMI5HGFJFVkM=;
        b=GsKMbpoDO1vJAV+K9FjIN30TN8YFHbGP9AiI2ivFxX68udo4iJRKH3BUnMs0ANe/BG
         H4w8mCZFAuw2YZ879LaBQLiPot/Q7UgskbGVsQ4h/fz+PwTMc+TQGTdUm7w1CV4pHuIx
         Mg0KIpO+TmMN2sR8lcUwB9KVLd97zGD2OdAvPIq8onCYa4NWu6rfHjaim+274RHU26yX
         VyVaHy5bq5zEk4GSqWxQkVzPVgWJhlrqhMe0niBwlFxT5BQo3lVCRINS5XbMQW0J7XRr
         cnJ52ZyUfE3X59U7dOLFFeJ4PBOIYtZYeCxibIBJYV3wj9QGUQkTj27Jhn72t040V8ot
         p+ug==
X-Gm-Message-State: AOJu0Yy2CaEbiIi8fxUWEPDDm2O3ooV1Vf832x/dJ/kFhwYaoxk3pf5Y
	CU9Iksr+Rxqr0O1pA6+wlyEegPO4844=
X-Google-Smtp-Source: AGHT+IEOGw2G9+KdHnxUV6JS1tR3H6rXnKNmT/pNp4CVT0P3rjcBS++9VwgbUJyJK2Rn45t84jQv+A==
X-Received: by 2002:a5d:66d0:0:b0:316:fb57:26d1 with SMTP id k16-20020a5d66d0000000b00316fb5726d1mr16434343wrw.8.1693070055346;
        Sat, 26 Aug 2023 10:14:15 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id g13-20020a5d64ed000000b003177f57e79esm5414296wri.88.2023.08.26.10.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 10:14:14 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] cmake: upgrade to v3.27.4
Date: Sat, 26 Aug 2023 18:14:12 +0100
Message-Id: <20230826171412.15092-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 26 Aug 2023 17:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186765

Changes:
Update cmcurl license checksum: change in copyright year.
Update sha256sum for new version.
Use cmake provided cppdap.
Disable debugger.

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 .../cmake/{cmake-native_3.26.4.bb => cmake-native_3.27.4.bb}   | 3 ++-
 meta/recipes-devtools/cmake/cmake.inc                          | 2 +-
 .../cmake/{cmake_3.26.4.bb => cmake_3.27.4.bb}                 | 2 ++
 3 files changed, 5 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.26.4.bb => cmake-native_3.27.4.bb} (95%)
 rename meta/recipes-devtools/cmake/{cmake_3.26.4.bb => cmake_3.27.4.bb} (96%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb b/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb
similarity index 95%
rename from meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.27.4.bb
index 2177aa81a4..8c23bc214d 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.26.4.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.27.4.bb
@@ -17,7 +17,7 @@ LIC_FILES_CHKSUM:append = " \
     file://Utilities/cmexpat/COPYING;md5=9e2ce3b3c4c0f2670883a23bbd7c37a9 \
     file://Utilities/cmlibrhash/COPYING;md5=a8c2a557a5c53b1c12cddbee98c099af \
     file://Utilities/cmlibuv/LICENSE;md5=ad93ca1fffe931537fcf64f6fcce084d \
-    file://Utilities/cmcurl/COPYING;md5=190c514872597083303371684954f238 \
+    file://Utilities/cmcurl/COPYING;md5=db8448a1e43eb2125f7740fc397db1f6 \
 "
 
 B = "${WORKDIR}/build"
@@ -28,6 +28,7 @@ CMAKE_EXTRACONF = "\
     -DBUILD_CursesDialog=1 \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index f57a77c7bb..430f13f4e1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
 "
 
-SRC_URI[sha256sum] = "313b6880c291bd4fe31c0aa51d6e62659282a521e695f30d5cc0d25abbd5c208"
+SRC_URI[sha256sum] = "0a905ca8635ca81aa152e123bdde7e54cbe764fdd9a70d62af44cad8b92967af"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake_3.26.4.bb b/meta/recipes-devtools/cmake/cmake_3.27.4.bb
similarity index 96%
rename from meta/recipes-devtools/cmake/cmake_3.26.4.bb
rename to meta/recipes-devtools/cmake/cmake_3.27.4.bb
index bb7ed83e30..183b2b75f4 100644
--- a/meta/recipes-devtools/cmake/cmake_3.26.4.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.27.4.bb
@@ -38,11 +38,13 @@ EXTRA_OECMAKE=" \
     -DCMAKE_DOC_DIR=${docdir_stripped}/cmake-${CMAKE_MAJOR_VERSION} \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_CPPDAP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     -DKWSYS_LFS_WORKS=1 \
+    -DCMake_ENABLE_DEBUGGER=0 \
 "
 
 do_install:append:class-nativesdk() {
-- 
2.39.2


