Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6D6FC10F1D
	for <webhook@archiver.kernel.org>; Tue, 13 Dec 2022 11:11:36 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.70919.1670929888813782307
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Dec 2022 03:11:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=HczVoerU;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i7so595699wrv.8
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 03:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R8ZiaJ//GfuLhx/5TseGOaEhsGIjM4HwZZoKXqFB7zU=;
        b=HczVoerU8N8SH2p/8hID6RKuLhprx+LF1PPTsgRc+Ivw/ii397vLn1BnQ3Hv9kCn4+
         06Aqte4iE1LOyYeUZQsFPB1DxfMvsUvSKdrxrZ5tGnH4AHoYi7Sb+UB8O5Hd4DQfYhTL
         AGrI2mGVn7o297nJyfMS+4mPHU590E1vddDzL2gj7diTq78tfdZ35r6ky/tHsiU1JdcF
         JAuBaovvS+BhJYkbBQHG4MYHqeD3anqPEBztTjcJzte2zVCaJP604wxj1x0SMsuVH9kc
         iIC6aqtd9qpviWtvw53EzUO5BPSPG09tuKPOkyoscxlzHXeTMHii9RD1VH9rmx4YCUbU
         Z75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8ZiaJ//GfuLhx/5TseGOaEhsGIjM4HwZZoKXqFB7zU=;
        b=kQmt6pGu8/WddSgLkZBfYU9IYvFW6qae6mrTve8D4apsExR2HnxaeWrkCux3n07iKv
         1nWp59HK13mODevP1cMtikNtnr9Bzf+SEW8rMYGwLvDrQBU4tj4jvJP+Gyvf7eNyb9zk
         FRvKPvTPULybYEac0BTUxK4M0Jk4d7hVJCWk3WzH7+80HqPrS+qk2SSkM29Hp+oXXoi5
         3mfV6W+maHkmVPtEjNEDc7IvX6Y3HhjdprzoRpCBAbjJygjyxWDsArB0DizZUwYlQ3WI
         X/MnR/95DwUa1cj089TeUEUb/CVt3okxr18TttqVnBWVV1llfWCiPXpSNu9v3RNkFh+O
         Qj4Q==
X-Gm-Message-State: ANoB5pkTGFjFC5hi9hd/0ha0xaNbJjOpl8uCNBet+JXV+yN9alZqBbas
	T/s/6t0gD/XlCE7a0V4jiJkFY35le2E=
X-Google-Smtp-Source: AA0mqf74ajAF5Ng7+J9e/vCQRyBr0hZiEtSh2fS+00/wtXxI2UCz0C3wocozdM8YiOM9VvSRK8OgIQ==
X-Received: by 2002:a5d:6304:0:b0:242:736f:d3c5 with SMTP id i4-20020a5d6304000000b00242736fd3c5mr11846792wru.57.1670929894139;
        Tue, 13 Dec 2022 03:11:34 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id m8-20020a056000008800b002366c3eefccsm11362665wrx.109.2022.12.13.03.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Dec 2022 03:11:33 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 15/24] cmake: update 3.24.2 -> 3.25.1
Date: Tue, 13 Dec 2022 12:11:09 +0100
Message-Id: <20221213111118.149697-15-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221213111118.149697-1-alex@linutronix.de>
References: <20221213111118.149697-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Dec 2022 11:11:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174524

License-Update: additional contributors

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../cmake/{cmake-native_3.24.2.bb => cmake-native_3.25.1.bb}  | 0
 meta/recipes-devtools/cmake/cmake.inc                         | 4 ++--
 ...CMakeDetermineSystem-use-oe-environment-vars-to-load.patch | 4 ++--
 .../cmake/{cmake_3.24.2.bb => cmake_3.25.1.bb}                | 0
 4 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.24.2.bb => cmake-native_3.25.1.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.24.2.bb => cmake_3.25.1.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.24.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.24.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.25.1.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 151456e500..ce831dc830 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -10,7 +10,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD-3-Clause"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=45025187a129339459b6f1a24f7fac6e \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=09069e0fffe4e5eaf6dde04c3b1932e5 \
                     file://Source/cmake.h;beginline=1;endline=2;md5=a5f70e1fef8614734eae0d62b4f5891b \
                     "
 
@@ -23,7 +23,7 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://environment.d-cmake.sh \
 "
 
-SRC_URI[sha256sum] = "0d9020f06f3ddf17fb537dc228e1a56c927ee506b486f55fe2dc19f69bf0c8db"
+SRC_URI[sha256sum] = "1c511d09516af493694ed9baf13c55947a36389674d657a2d5e0ccedc6b291d8"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index 9a2287f517..451b6ebfad 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 89f6c846f02ad6d30b9ebb7eaaaa4fb6f9cec054 Mon Sep 17 00:00:00 2001
+From 8e53dd7f6f534ad933e7e9c7fc20cc1a6cded3f4 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
@@ -25,7 +25,7 @@ Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
  1 file changed, 7 insertions(+)
 
 diff --git a/Modules/CMakeDetermineSystem.cmake b/Modules/CMakeDetermineSystem.cmake
-index 8c7af067..ade2b189 100644
+index 2c2c2ac3..fae4f97f 100644
 --- a/Modules/CMakeDetermineSystem.cmake
 +++ b/Modules/CMakeDetermineSystem.cmake
 @@ -112,6 +112,13 @@ else()
diff --git a/meta/recipes-devtools/cmake/cmake_3.24.2.bb b/meta/recipes-devtools/cmake/cmake_3.25.1.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.24.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.25.1.bb
-- 
2.30.2


