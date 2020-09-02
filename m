Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.900.1599081240267227546
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Sep 2020 14:14:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cykhTggs;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id z23so635396ejr.13
        for <openembedded-core@lists.openembedded.org>; Wed, 02 Sep 2020 14:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=z3WGR94WoCRekqWlgwNhs1wK6F/Q+lxbn2d2sPMGXb4=;
        b=cykhTggsprlK/0qC7A9Xl4sJ7TW0gllXfsK+ATm8iWMq/HCDyfuaRhw+FKU05Mij9W
         pS3LwfU73JYKAxBqJBTcv60tPon+RIM+gwVAjP4gtIVvTjoZgb6MmwBocAJm3qSR53Eg
         6v/5+9VHhTBlHUhV9oyxnTT6uow1jfMNdhdOiIw8iyQiz6rSusRVRfpTPdeDVohmx69m
         QrrB3OWVvwUCELb7lChllSPCPwJcbDQylGZFpdTBkwh8a/waVWJyq1ZR6MM+4Vu6NRV3
         fka76GA5GzncptrLYtlc/ELM3YTGkFHxzlhWdZw3tIkbL51/qZccgMQrharUJqaCzyeM
         +jZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=z3WGR94WoCRekqWlgwNhs1wK6F/Q+lxbn2d2sPMGXb4=;
        b=hOMQ+kqea5E0bIC26FJoWgJqZcHXo4tMgmocU6IT2t7i5aRxP1Q1e/D6I/CBkRwa9A
         FSloX5smpkHdcLkvrMq5fuWuLC7l4MWYmHJwRJ0Ng+dvDEE4RpjCbG1mxZ90vwPRPiml
         ZmEEJo46qXVYFsR4HemHvxpm6DeW48hOScBuo9ZT92WLQHBV53uljE9DHqpPhBO81uT3
         lDphnRq4pqOQxnOwF/3sPJdrcTyjEBMk6OHOvvLINvSrA7TiDRhTDorYTdXZt2kAEZ5Q
         dis/hphCka/D7uSoSvCpdLRiF2ZV58TahhmWnyaIysQrLX73ZgskfjRzvLrVN/YIEgT0
         l71A==
X-Gm-Message-State: AOAM531I/c6wrTQO2Wym5BVs8htTl/2Ugp4jvtOFefY10bOKUJO2aCtV
	36yfwFl5XLcyJHIrBwi7hc4Pqde4j+I=
X-Google-Smtp-Source: ABdhPJxvo0muqDHNpvXDNrUNl4NIuvb9l/otN+36sztYwJt6iDkrIir4NJwHmgjDYfa+/VTV76JN/g==
X-Received: by 2002:a17:906:3a85:: with SMTP id y5mr4671ejd.507.1599081238427;
        Wed, 02 Sep 2020 14:13:58 -0700 (PDT)
Return-Path: <alex.kanavin@gmail.com>
Received: from linux-f9zs.site ([2a02:2450:1011:56f:b652:c378:b428:fdf])
        by smtp.gmail.com with ESMTPSA id ch29sm631607edb.74.2020.09.02.14.13.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 14:13:57 -0700 (PDT)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 02/23] cmake: upgrade 3.18.1 -> 3.18.2
Date: Wed,  2 Sep 2020 23:13:09 +0200
Message-Id: <20200902211330.4853-2-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200902211330.4853-1-alex.kanavin@gmail.com>
References: <20200902211330.4853-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../cmake/{cmake-native_3.18.1.bb => cmake-native_3.18.2.bb}    | 0
 meta/recipes-devtools/cmake/cmake.inc                           | 2 +-
 ...1-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch | 2 +-
 .../recipes-devtools/cmake/{cmake_3.18.1.bb => cmake_3.18.2.bb} | 0
 4 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.18.1.bb => cmake-native_3.18.2.bb} (100%)
 rename meta/recipes-devtools/cmake/{cmake_3.18.1.bb => cmake_3.18.2.bb} (100%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.18.1.bb b/meta/recipes-devtools/cmake/cmake-native_3.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake-native_3.18.1.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.18.2.bb
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 94465efc85..1334977225 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -22,6 +22,6 @@ SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://0004-Fail-silently-if-system-Qt-installation-is-broken.patch \
 "
 
-SRC_URI[sha256sum] = "c0e3338bd37e67155b9d1e9526fec326b5c541f74857771b7ffed0c46ad62508"
+SRC_URI[sha256sum] = "5d4e40fc775d3d828c72e5c45906b4d9b59003c9433ff1b36a1cb552bbd51d7e"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
diff --git a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
index f3f9f7d8d1..c4f81b27b5 100644
--- a/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
+++ b/meta/recipes-devtools/cmake/cmake/0001-CMakeDetermineSystem-use-oe-environment-vars-to-load.patch
@@ -1,4 +1,4 @@
-From 434761616f66074f1823b43145558c239c85b37d Mon Sep 17 00:00:00 2001
+From dd0fe8d54def4684d360b3e9b10e963ef0208202 Mon Sep 17 00:00:00 2001
 From: Cody P Schafer <dev@codyps.com>
 Date: Thu, 27 Apr 2017 11:35:05 -0400
 Subject: [PATCH] CMakeDetermineSystem: use oe environment vars to load default
diff --git a/meta/recipes-devtools/cmake/cmake_3.18.1.bb b/meta/recipes-devtools/cmake/cmake_3.18.2.bb
similarity index 100%
rename from meta/recipes-devtools/cmake/cmake_3.18.1.bb
rename to meta/recipes-devtools/cmake/cmake_3.18.2.bb
-- 
2.28.0

