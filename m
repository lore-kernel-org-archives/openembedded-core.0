Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE60C53210
	for <webhook@archiver.kernel.org>; Sat, 24 Dec 2022 17:00:07 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.web11.101083.1671901200644877018
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Dec 2022 09:00:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=V+caHmXE;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id bs20so4946530wrb.3
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 09:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xDn9UPUUFjKryeijvQ62srMrJ7K0Dryr3DsWcs8x9/s=;
        b=V+caHmXE7rXvTCTRMkUq3k8dF9mxIM7NI7/GE9634xBxVPPm2n6CtWB1KZPCynGNHY
         8fJ8qNkjoj61Ix9qQEtmqIrIPt1WmGuXiJ8GDjnMY6ACIS1uNutp5IOGCb134RwAoW3u
         tcko2gXcOC8g3wCz/xrFJpjJC37Dnl1EjY3+cp1VSFoAGMocrIZCi5SU7lLt+ewQ14tr
         BgZGnIbTsbpFVvSLtOe7vHiY7PuoK2Pi5jcpBjqEN15jNCBpn7QPIc0a68HkJ5ZZlsNY
         QmLW/Na2Nf4i8DfMmJucFVcnXp4pUd1QgOIyjHYQoBaY70aifbjoJTy/aqbao2HItz/X
         jqgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xDn9UPUUFjKryeijvQ62srMrJ7K0Dryr3DsWcs8x9/s=;
        b=Dkb82GEtR6Qi/2jihkqhTjiTPXf9E1PC8hFcQbO34zRU3LgyQbdIQjcdAjYdaHbunx
         BZ/midoNlQd2Efc9th27XseELbw5nz6tqERbAfm8pWdfuzllF/+v3h9qkNm6L8a43kcb
         Xi3Mj/TCXl0n3MEnlOsWDwVf8aRzW/EsH7w6r2Mr9ggU8RbO7/NhBLwBpNdxhkfM71rj
         EzNUecriGWyS791qUwy2iKnwhGsaVHYr/sEewFzsohy8szOsYrMM7DgI1KoIabdrr4C4
         6AY+f+ZDSWLOy2Ny6GW5TrlFIWGOskvBXxzicNSL4oKS7glSNmWf2Wu5QpvN3TILj7r7
         fMPQ==
X-Gm-Message-State: AFqh2kr4QvBJO3OAEzoiVI00IKExyBC3Sn6eH3HtXcT/CbOCBqZjGzFR
	sGlq3IDka+d8/IkZNm+C6ORc187TCZI=
X-Google-Smtp-Source: AMrXdXviMJ1j3C+0tjWDDyb8SyUcbAlbUkZ7a8OWjLXLZIa7l0qhntnL+FUliJIQcOLvhcp6Jbcgtg==
X-Received: by 2002:a5d:4692:0:b0:242:2e1e:1f0b with SMTP id u18-20020a5d4692000000b002422e1e1f0bmr8282003wrq.23.1671901198932;
        Sat, 24 Dec 2022 08:59:58 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id b2-20020adff242000000b0023662245d3csm6005622wrp.95.2022.12.24.08.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Dec 2022 08:59:58 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/7] cmake: update 3.24.2 -> 3.25.1
Date: Sat, 24 Dec 2022 17:59:39 +0100
Message-Id: <20221224165943.1324800-3-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221224165943.1324800-1-alex@linutronix.de>
References: <20221224165943.1324800-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Dec 2022 17:00:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174985

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
index 7561e851c6..7da9a2fb55 100644
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
 
@@ -19,7 +19,7 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
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


