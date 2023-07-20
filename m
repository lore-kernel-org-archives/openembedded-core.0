Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2D3BEB64DC
	for <webhook@archiver.kernel.org>; Thu, 20 Jul 2023 16:25:49 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.1514.1689870341250721824
 for <openembedded-core@lists.openembedded.org>;
 Thu, 20 Jul 2023 09:25:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=MODICunW;
 spf=pass (domain: gmail.com, ip: 209.85.221.43, mailfrom: peron.clem@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-316feb137a7so877847f8f.1
        for <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 09:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689870339; x=1690475139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IW+LkjXH4D5/OtP7CaDmJ3EXP7sx47TyR1oBL4kKtnA=;
        b=MODICunWNwOgaKIfMwIKoks6bljzFkGPRDXA9Kz63gJ+qGN5rYG9ftPvbg05ABueXE
         mt5Om92Agh1ERVnHmX3S6Y+dHBE2MFHN7q/xGy25mqbobtg0wOAcxt5AkWy7Dt6wiOyv
         fqKS8VZ2wTFO+KVTdbVLrk6XnpqQhZgwrBwHgwJRCSgydjuCdN1PfjHtZ6d+jErIH9YU
         BEYLmscjc1L/xwpnQH+/HADOpowwvYbmGqGDQuNAd9o4NIDOFAFzuB+Ki2ZwbmHipGx3
         YrYXhG2KR4jSSu7lSCme4euDnwsdpZvT3rtk9OfcVDzBGVcKHE2Y3m5gzzhkIKpcFaZW
         M1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689870339; x=1690475139;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IW+LkjXH4D5/OtP7CaDmJ3EXP7sx47TyR1oBL4kKtnA=;
        b=jhKR0Uz/3oxEWTwaxHS1EvfvfLdMimud4w10IhLbuh6FvG6wHAapdufzd5f/a6wUCu
         uL89ExTew4q7GowJPaMw/6cDBdT9ndgRaC9xrnDD/qgGtECge20QFvArL9LXf/z5bIrS
         FxNkpL7mk1cf/tF6PdzrpLNHus4KRGSQ3iSPmOe/XkM3IyRyR6nR6wYF5DR/FusRoP03
         q/i4yfcJFNwNKShYhgHccXa0htuWtS0zu4pfUQDvwDHp5gc4lzqiI9kUyuk5SbFNBivx
         PLdz8Gufs1ezSK9UZ3V2Ukd/y55cYSQzkpaozPX0mSLi1VlwnT+9nHXxl2Kvwqx9YT5H
         PtiA==
X-Gm-Message-State: ABy/qLY2SW4TihBWJE5LtD2mO+7dJWu2vY9XCMgTaCTQpgVQWxPXUVy1
	YPkKQMIBiA3KagEjLwiTGUsLZAz07CJoNA==
X-Google-Smtp-Source: APBJJlHBDjRPYUcr2GDreBh/9xJlJmZlZbqhEgbcVaISb6OKA3qtjqTw7EtIktL4JFlEWXNwOWsq7A==
X-Received: by 2002:a05:6000:104a:b0:313:f353:d5d9 with SMTP id c10-20020a056000104a00b00313f353d5d9mr2680333wrx.50.1689870339272;
        Thu, 20 Jul 2023 09:25:39 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id z8-20020adff748000000b00314374145e0sm1749076wrp.67.2023.07.20.09.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jul 2023 09:25:38 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [RFC PATCH 3/4] protobuf: bump to 3.23.4
Date: Thu, 20 Jul 2023 18:23:01 +0200
Message-ID: <20230720162535.116519-4-peron.clem@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720162535.116519-1-peron.clem@gmail.com>
References: <20230720162535.116519-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 20 Jul 2023 16:25:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184647

Bump to protobuf 3.23.4 with the following diff

- Add new abseil-cpp jsoncpp dependencies
- Linking with gold patch has been fixed see
  commit 462964ed322503af52638d54c00a0a67d7133349
- Refresh the patch that fix examples LDFLAGS

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 .../0001-Fix-linking-error-with-ld-gold.patch | 69 -------------------
 ...e-respect-CXX-LDFLAGS-variables-fix-.patch |  4 +-
 ...protobuf_3.21.12.bb => protobuf_3.23.4.bb} |  8 ++-
 3 files changed, 7 insertions(+), 74 deletions(-)
 delete mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
 rename meta-oe/recipes-devtools/protobuf/{protobuf_3.21.12.bb => protobuf_3.23.4.bb} (95%)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
deleted file mode 100644
index 2bc44c898..000000000
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-Fix-linking-error-with-ld-gold.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From a91130bb95528743a3f7253f8fe945b7505047d5 Mon Sep 17 00:00:00 2001
-From: Kyungjik Min <dp.min@lge.com>
-Date: Mon, 28 Dec 2020 15:56:09 +0900
-Subject: [PATCH] Fix linking error with ld-gold
-
-:Release Notes:
-
-:Detailed Notes:
-https://github.com/protocolbuffers/protobuf/issues/6113
-There's a bug in the CMake build leading it to not use the version
-scripts, which hides the problem (because all symbols are now public)
-but doesn't solve it properly.
-
-:Testing Performed:
-
-:QA Notes:
-N/A
-
-:Issues Addressed:
-[PLAT-130467] Fix build error for libgoogleassistant with latest
-              protobuf-3.11.4
-
----
-Upstream-Status: Pending
-
- src/libprotobuf-lite.map | 2 ++
- src/libprotobuf.map      | 2 ++
- src/libprotoc.map        | 2 ++
- 3 files changed, 6 insertions(+)
-
-diff --git a/src/libprotobuf-lite.map b/src/libprotobuf-lite.map
-index 391554669..a1853ca6c 100644
---- a/src/libprotobuf-lite.map
-+++ b/src/libprotobuf-lite.map
-@@ -3,6 +3,8 @@
-     extern "C++" {
-       *google*;
-     };
-+    scc_info_*;
-+    descriptor_table_*;
- 
-   local:
-     *;
-diff --git a/src/libprotobuf.map b/src/libprotobuf.map
-index 391554669..a1853ca6c 100644
---- a/src/libprotobuf.map
-+++ b/src/libprotobuf.map
-@@ -3,6 +3,8 @@
-     extern "C++" {
-       *google*;
-     };
-+    scc_info_*;
-+    descriptor_table_*;
- 
-   local:
-     *;
-diff --git a/src/libprotoc.map b/src/libprotoc.map
-index 391554669..a1853ca6c 100644
---- a/src/libprotoc.map
-+++ b/src/libprotoc.map
-@@ -3,6 +3,8 @@
-     extern "C++" {
-       *google*;
-     };
-+    scc_info_*;
-+    descriptor_table_*;
- 
-   local:
-     *;
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
index 36c3c597a..f3eead39b 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch
@@ -46,12 +46,12 @@ index 1c7ec8d63..85f591231 100644
  
  add_person_cpp: add_person.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++11 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
+-	c++ -std=c++14 add_person.cc addressbook.pb.cc -o add_person_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) add_person.cc addressbook.pb.cc -o add_person_cpp
  
  list_people_cpp: list_people.cc protoc_middleman
  	pkg-config --cflags protobuf  # fails if protobuf is not installed
--	c++ -std=c++11 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
+-	c++ -std=c++14 list_people.cc addressbook.pb.cc -o list_people_cpp `pkg-config --cflags --libs protobuf`
 +	$(CXX) $(CXXFLAGS) $(LDFLAGS) ../src/google/protobuf/.libs/timestamp.pb.o $(PROTOBUF) list_people.cc addressbook.pb.cc -o list_people_cpp
  
  add_person_dart: add_person.dart protoc_middleman_dart
diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.23.4.bb
similarity index 95%
rename from meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
rename to meta-oe/recipes-devtools/protobuf/protobuf_3.23.4.bb
index 343933033..a053afa78 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf_3.21.12.bb
+++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.23.4.bb
@@ -7,12 +7,12 @@ SECTION = "console/tools"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=37b5762e07f0af8c74ce80a8bda4266b"
 
-DEPENDS = "zlib"
+DEPENDS = "abseil-cpp jsoncpp zlib"
 DEPENDS:append:class-target = " protobuf-native"
 
-SRCREV = "f0dc78d7e6e331b8c6bb2d5283e06aa26883ca7c"
+SRCREV = "2c5fa078d8e86e5f4bd34e6f4c9ea9e8d7d4d44a"
 
-SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=21.x;protocol=https \
+SRC_URI = "git://github.com/protocolbuffers/protobuf.git;branch=23.x;protocol=https \
            file://run-ptest \
            file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
            file://0001-Fix-linking-error-with-ld-gold.patch \
@@ -35,6 +35,8 @@ EXTRA_OECMAKE += "\
     -Dprotobuf_BUILD_LIBPROTOC=ON \
     -Dprotobuf_BUILD_TESTS=OFF \
     -Dprotobuf_BUILD_EXAMPLES=OFF \
+    -Dprotobuf_ABSL_PROVIDER=package \
+    -Dprotobuf_JSONCPP_PROVIDER=package \
 "
 
 TEST_SRC_DIR = "examples"
-- 
2.41.0


