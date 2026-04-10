Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0975BE9905B
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 08:49:26 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151840.1775810961564573645
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Apr 2026 01:49:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fesbzBNh;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso22077915e9.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 01:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775810960; x=1776415760; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AEWbTTCWcYvZXbCl2q4E7JHnfewAG3w8phF6yGVmezw=;
        b=fesbzBNhoHZpYf6l6qkkLF38TZ2by0PhZLqh4lCcubk8vaWpWNnXotZ12JKRGAWDRa
         rJHi7KLAz35c2CaawHmXAUS3MAeQ/YtQ+Bw1WquIbBvgDMnA2X+rS2OP8VYHKDB8WJPG
         0I6jUk+IAXz7yg3FaRn4bL1ml9IwOuVS6nimF+hzgz50xssz0IJ5WKQXbR9r4c4glsOk
         SYijhkKD6ubDGLwvnqM9WXitozKpArXlTx1yX+prqQw8Uspv9wDS9ShwIYnaMCNbpLsc
         fUrxxLCvWhOXHlopHtAf9B161yVyeAUsFOthXFb0Jk7ZhkVTHY5Z37ox5ckDkydbRHBE
         mTzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775810960; x=1776415760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEWbTTCWcYvZXbCl2q4E7JHnfewAG3w8phF6yGVmezw=;
        b=LA6ArS6HvmTOu1Bi62PRbBoQkbNIn91yqb0IL5YjYcNuYOiTGSNGKmQNLIAwNgwZrs
         Y5q1Rm3NUPklGE9t/OMMky4RcborTvtHdW9mjwDebptcYT+mYosqVmeAaac/eDfg2FZy
         fGMCb17SeIw9uzTL3K2hAdoOIAyMXb/sJ55EJVJXxMVTxqHpvZF+ADNXV4MpLfr0XKDr
         A7BtorcNV8Ta43ugKnX9nT0QGuw9+0HqliAgjZzRbyY7TdVmR2URcatJ29xFn1PLojvT
         wb9vWhJfFjBbgGTCL8uuq9+UmrYTMZ5NKZijc68DZnF7aRfFr76W3wJwlGWC8dtYWaLK
         3sHA==
X-Gm-Message-State: AOJu0YxypGUeUvRVroppNOyEdh1CyO7YFR5mAkkxXPEChTPh26tT+wnl
	wERYmeGn/kukMx2G11m2Bl7VvfK8c8I95s2+hzjcnn8UzXMpnYRZ6ZEtg+qWng==
X-Gm-Gg: AeBDievkHPiwR2mK5+wpiCQ844cbDRIrAGfTEaAcKsxmdh3YvVkdzBcqMJ1HZMGvVBn
	fJQcaZu/apNMQYk6bxUUvMd1C9gPO+syB+WV7FCKBkbKue/s+NRClEuc845GoLeosIUhfbxVawj
	4KhLh/F9AiFBmZDd4qeE0NTKWjSzcy9+ordWLQy/mfDqhSkgiDpD4BpIX+r+WirFQBTs2L6hNmt
	yOw30Fmq2745uhr3wswQmbtJEsobjcQBPP+MgRSAjed+/yGj2QQBnKt/co8neRxUgMUX/snMp0f
	UpJTvLPrY/ur2wVsf3Fii6ThzPr+JNw6YaH/noVkTA297T9gfXsAeFoTM3M+f9J2j71o9tuvFnP
	BgWTKWDC3vie3CH8j1kHg181j7oPOjus0lBUIvN2p4wutXxxvPFMWChyTLC4kkmvVP/5N87qmGs
	c7kayc0e8/J7iXzoRdHzY8NPjBe0DJzfuzY9liJOu71tFnlzcygtESvz5RqRy0QSiYiQrUBWmet
	ROmQq8l4Q==
X-Received: by 2002:a05:600c:a406:b0:488:aa33:dc8f with SMTP id 5b1f17b1804b1-488d6781cf5mr19716115e9.0.1775810959725;
        Fri, 10 Apr 2026 01:49:19 -0700 (PDT)
Received: from localhost ([109.238.218.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d531f229sm83033965e9.3.2026.04.10.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 01:49:19 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [scarthgap][PATCH] cmake: backport a fix for gcc-16 on host
Date: Fri, 10 Apr 2026 10:49:13 +0200
Message-ID: <20260410084913.3326967-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 10 Apr 2026 08:49:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234998

From: Martin Jansa <martin.jansa@gmail.com>

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 .../cmake/cmake-native_3.28.3.bb              |  1 +
 ...mpilation-with-gcc-16-devirtualizati.patch | 36 +++++++++++++++++++
 meta/recipes-devtools/cmake/cmake_3.28.3.bb   |  4 ++-
 3 files changed, 40 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
index 7b250752d8..eecc2df538 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.28.3.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://OEToolchainConfig.cmake \
             file://0005-Disable-use-of-ext2fs-ext2_fs.h-by-cmake-s-internal-.patch \
             file://0001-CMakeLists.txt-disable-USE_NGHTTP2.patch \
             file://CVE-2025-9301.patch \
+            file://0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch \
             "
 
 LICENSE:append = " & BSD-1-Clause & MIT & BSD-2-Clause & curl"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch b/meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch
new file mode 100644
index 0000000000..2f28e3a7ba
--- /dev/null
+++ b/meta/recipes-devtools/cmake/cmake/0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch
@@ -0,0 +1,36 @@
+From 0f8fdfb55950e383d9780b875bc8d7213db8a42a Mon Sep 17 00:00:00 2001
+From: Brad King <brad.king@kitware.com>
+Date: Wed, 24 Sep 2025 12:02:37 -0400
+Subject: [PATCH] bootstrap: Fix compilation with gcc 16 devirtualization
+
+Avoid including a header for a subclass whose implementation is not
+compiled during bootstrap.
+
+Fixes: #27256
+
+Upstream-Status: Backport [v3.31.10 ea04e19daf7010781d0df980b9683a642093e381 https://gitlab.kitware.com/cmake/cmake/-/merge_requests/11243]
+Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
+---
+ Source/cmake.cxx | 6 +++---
+ 1 file changed, 3 insertions(+), 3 deletions(-)
+
+diff --git a/Source/cmake.cxx b/Source/cmake.cxx
+index 636a0da5b8..0e05afb7a6 100644
+--- a/Source/cmake.cxx
++++ b/Source/cmake.cxx
+@@ -124,12 +124,12 @@
+ #  include "cmExtraEclipseCDT4Generator.h"
+ #  include "cmExtraKateGenerator.h"
+ #  include "cmExtraSublimeTextGenerator.h"
+-#endif
+ 
+ // NOTE: the __linux__ macro is predefined on Android host too, but
+ // main CMakeLists.txt filters out this generator by host name.
+-#if (defined(__linux__) && !defined(__ANDROID__)) || defined(_WIN32)
+-#  include "cmGlobalGhsMultiGenerator.h"
++#  if (defined(__linux__) && !defined(__ANDROID__)) || defined(_WIN32)
++#    include "cmGlobalGhsMultiGenerator.h"
++#  endif
+ #endif
+ 
+ #if defined(__APPLE__)
diff --git a/meta/recipes-devtools/cmake/cmake_3.28.3.bb b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
index 1841bfd1cf..f018ca21ff 100644
--- a/meta/recipes-devtools/cmake/cmake_3.28.3.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.28.3.bb
@@ -11,7 +11,9 @@ SRC_URI:append:class-nativesdk = " \
     file://cmake-setup.py \
     file://environment.d-cmake.sh \
 "
-SRC_URI += "file://CVE-2025-9301.patch"
+SRC_URI += "file://CVE-2025-9301.patch \
+    file://0001-bootstrap-Fix-compilation-with-gcc-16-devirtualizati.patch \
+"
 
 LICENSE:append = " & BSD-1-Clause & MIT"
 LIC_FILES_CHKSUM:append = " \

