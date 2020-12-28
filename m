Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.2381.1609185890081417744
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Dec 2020 12:04:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=H7HzS42o;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id b9so15641667ejy.0
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Dec 2020 12:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wprcMw2bf/Uy/6Y5hMN/pe+t5wXRJIxf3V+ecZrcPLg=;
        b=H7HzS42o36Oik3PFcf8uyve9fM2bqGd2Cn6WoaK+4XGhw3PexMpa3VsvohayVSCAe1
         f8wnhhOk6Lz1DaLepI/GLdP6r38sa+HdmySlpLXUyjy7Bbqu+6Bk0oJiMZkrnVfZ87OL
         YBVtzn5+k8SBPvs2VNBpgjChOgMTJMMazEaxdAcTiEV/beD5dX3BhbaRrcD911RGxfWv
         HRcQSjh2uT8tIxUQuMQixHrEevADCz3V9Zjp0FscsG64p/PJqidCzsh6qrc9tbYGAIEq
         YYcXdbO2lrq+hcAsD+M6p4oVOKZ0c0sSBCZ11x9eLmQGkVFx2X86IB4TeZ0GIwWssumn
         sTkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wprcMw2bf/Uy/6Y5hMN/pe+t5wXRJIxf3V+ecZrcPLg=;
        b=L4NJyT9mQGaty3DSuq4oDx4LPpQ1Uz1NM7RvRqdYJ76UyOvzPegrvBqBA9oaXGrgog
         rr7TZPivdu34+6Wsr8w5qnA6yJS59iVxIHMpmdE048nSYkajbf/aiQ9JR4NrH9zaDjSr
         VmxQZAWgjwP+95QQK1qD51oRMeaOk7hL4jSVZ725GcR113PeShynkHu+NM0gw+5OPRba
         IhpQe9bIBdzfnd6kxLERVNCF8+IxG8K26J6HA9D3mafDvoL3WHaRuA/s1FMUwJIakAnv
         lODIpN2OoQeD3SuXXqM5MQq1/WfyVnqNpepOgZ9ixq4wR4UFaXAcBSKteb0U6NkdJlLQ
         o/mQ==
X-Gm-Message-State: AOAM531nr76vczGRupR5tIPyTCeEwfBdpI04cQ8eYMcVIIV+6DAm4SVI
	okp7iClNltv5uHL/fI12Hx8ClNfdwns=
X-Google-Smtp-Source: ABdhPJxoG+RbuYZ5njBzM614oKahaAp9Ph8ol/y++WiD4OOHhApiJtYoYce3gOYVDHnlUVMG9GVD8Q==
X-Received: by 2002:a17:906:ceca:: with SMTP id si10mr42243707ejb.547.1609185888654;
        Mon, 28 Dec 2020 12:04:48 -0800 (PST)
Return-Path: <alex.kanavin@gmail.com>
Received: from localhost-live.fritz.box ([2a02:2450:1011:4f7:a0c9:fd7f:e532:e1ec])
        by smtp.gmail.com with ESMTPSA id a10sm17447476ejk.92.2020.12.28.12.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Dec 2020 12:04:48 -0800 (PST)
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 08/22] boost: update 1.74.0 -> 1.75.0
Date: Mon, 28 Dec 2020 21:04:22 +0100
Message-Id: <20201228200436.78130-8-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201228200436.78130-1-alex.kanavin@gmail.com>
References: <20201228200436.78130-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove 0001-Apply-boost-1.62.0-no-forced-flags.patch.patch:
upstream has refactored the code, purpose of the patch is unclear.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{boost-1.74.0.inc => boost-1.75.0.inc}    |   2 +-
 ...y-boost-1.62.0-no-forced-flags.patch.patch | 100 ------------------
 .../{boost_1.74.0.bb => boost_1.75.0.bb}      |   1 -
 3 files changed, 1 insertion(+), 102 deletions(-)
 rename meta/recipes-support/boost/{boost-1.74.0.inc => boost-1.75.0.inc} (90%)
 delete mode 100644 meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
 rename meta/recipes-support/boost/{boost_1.74.0.bb => boost_1.75.0.bb} (85%)

diff --git a/meta/recipes-support/boost/boost-1.74.0.inc b/meta/recipes-support/boost/boost-1.75.0.inc
similarity index 90%
rename from meta/recipes-support/boost/boost-1.74.0.inc
rename to meta/recipes-support/boost/boost-1.75.0.inc
index b47fdaf099..e5a8488c58 100644
--- a/meta/recipes-support/boost/boost-1.74.0.inc
+++ b/meta/recipes-support/boost/boost-1.75.0.inc
@@ -12,7 +12,7 @@ BOOST_MAJ = "${@"_".join(d.getVar("PV").split(".")[0:2])}"
 BOOST_P = "boost_${BOOST_VER}"
 
 SRC_URI = "https://dl.bintray.com/boostorg/release/${PV}/source/${BOOST_P}.tar.bz2"
-SRC_URI[sha256sum] = "83bfc1507731a0906e387fc28b7ef5417d591429e51e788417fe9ff025e116b1"
+SRC_URI[sha256sum] = "953db31e016db7bb207f11432bef7df100516eeb746843fa0486a222e3fd49cb"
 
 UPSTREAM_CHECK_URI = "http://www.boost.org/users/download/"
 UPSTREAM_CHECK_REGEX = "boostorg/release/(?P<pver>.*)/source/"
diff --git a/meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch b/meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
deleted file mode 100644
index 169906344f..0000000000
--- a/meta/recipes-support/boost/boost/0001-Apply-boost-1.62.0-no-forced-flags.patch.patch
+++ /dev/null
@@ -1,100 +0,0 @@
-From 8845a786598f1d9e83aa1b7d2966b0d1eb765ba0 Mon Sep 17 00:00:00 2001
-From: Christopher Larson <chris_larson@mentor.com>
-Date: Tue, 13 Dec 2016 10:14:31 -0700
-Subject: [PATCH 1/3] Apply boost-1.62.0-no-forced-flags.patch
-
-Upstream-Status: Inappropriate
-Signed-off-by: Christopher Larson <chris_larson@mentor.com>
----
- libs/log/build/Jamfile.v2           |  4 ++--
- libs/log/config/x86-ext/Jamfile.jam | 16 ++++++++--------
- libs/log/src/dump_avx2.cpp          |  4 ++++
- libs/log/src/dump_ssse3.cpp         |  4 ++++
- 4 files changed, 18 insertions(+), 10 deletions(-)
-
-diff --git a/libs/log/build/Jamfile.v2 b/libs/log/build/Jamfile.v2
-index 4abbdbc..b3016fc 100644
---- a/libs/log/build/Jamfile.v2
-+++ b/libs/log/build/Jamfile.v2
-@@ -373,7 +373,7 @@ rule avx2-targets-cond ( properties * )
-             }
-             else if <toolset>clang in $(properties)
-             {
--                result = <cxxflags>"-mavx -mavx2" ;
-+                result = <cxxflags> ;
-             }
-             else if <toolset>intel in $(properties)
-             {
-@@ -383,7 +383,7 @@ rule avx2-targets-cond ( properties * )
-                 }
-                 else
-                 {
--                    result = <cxxflags>"-xCORE-AVX2 -fabi-version=0" ;
-+                    result = <cxxflags>"-fabi-version=0" ;
-                 }
-             }
-             else if <toolset>msvc in $(properties)
-diff --git a/libs/log/config/x86-ext/Jamfile.jam b/libs/log/config/x86-ext/Jamfile.jam
-index 0e9695a..dcc394d 100644
---- a/libs/log/config/x86-ext/Jamfile.jam
-+++ b/libs/log/config/x86-ext/Jamfile.jam
-@@ -15,19 +15,19 @@ project /boost/log/x86-extensions
- 
- obj ssse3 : ssse3.cpp
-     :
--        <toolset>gcc:<cxxflags>"-msse -msse2 -msse3 -mssse3"
--        <toolset>clang:<cxxflags>"-msse -msse2 -msse3 -mssse3"
--        <toolset>intel-linux:<cxxflags>"-xSSSE3"
--        <toolset>intel-darwin:<cxxflags>"-xSSSE3"
-+        <toolset>gcc:<cxxflags>
-+        <toolset>clang:<cxxflags>
-+        <toolset>intel-linux:<cxxflags>
-+        <toolset>intel-darwin:<cxxflags>
-         <toolset>intel-win:<cxxflags>"/QxSSSE3"
-     ;
- 
- obj avx2 : avx2.cpp
-     :
--        <toolset>gcc:<cxxflags>"-mavx -mavx2 -fabi-version=0"
--        <toolset>clang:<cxxflags>"-mavx -mavx2"
--        <toolset>intel-linux:<cxxflags>"-xCORE-AVX2 -fabi-version=0"
--        <toolset>intel-darwin:<cxxflags>"-xCORE-AVX2 -fabi-version=0"
-+        <toolset>gcc:<cxxflags>"-fabi-version=0"
-+        <toolset>clang:<cxxflags>
-+        <toolset>intel-linux:<cxxflags>"-fabi-version=0"
-+        <toolset>intel-darwin:<cxxflags>"-fabi-version=0"
-         <toolset>intel-win:<cxxflags>"/arch:CORE-AVX2"
-         <toolset>msvc:<cxxflags>"/arch:AVX"
-     ;
-diff --git a/libs/log/src/dump_avx2.cpp b/libs/log/src/dump_avx2.cpp
-index 4ab1250..610fc6d 100644
---- a/libs/log/src/dump_avx2.cpp
-+++ b/libs/log/src/dump_avx2.cpp
-@@ -22,6 +22,10 @@
- #include <boost/cstdint.hpp>
- #include <boost/log/detail/header.hpp>
- 
-+#if !defined(__AVX2__)
-+#error "AVX2 Unsupported!"
-+#endif
-+
- #if defined(__x86_64) || defined(__x86_64__) || \
-     defined(__amd64__) || defined(__amd64) || \
-     defined(_M_X64)
-diff --git a/libs/log/src/dump_ssse3.cpp b/libs/log/src/dump_ssse3.cpp
-index 1325b49..60d4112 100644
---- a/libs/log/src/dump_ssse3.cpp
-+++ b/libs/log/src/dump_ssse3.cpp
-@@ -22,6 +22,10 @@
- #include <boost/cstdint.hpp>
- #include <boost/log/detail/header.hpp>
- 
-+#if !defined(__SSSE3__)
-+#error "SSSE3 Unsupported!"
-+#endif
-+
- #if defined(__x86_64) || defined(__x86_64__) || \
-     defined(__amd64__) || defined(__amd64) || \
-     defined(_M_X64)
--- 
-2.8.0
diff --git a/meta/recipes-support/boost/boost_1.74.0.bb b/meta/recipes-support/boost/boost_1.75.0.bb
similarity index 85%
rename from meta/recipes-support/boost/boost_1.74.0.bb
rename to meta/recipes-support/boost/boost_1.75.0.bb
index b01b390a59..33137e236d 100644
--- a/meta/recipes-support/boost/boost_1.74.0.bb
+++ b/meta/recipes-support/boost/boost_1.75.0.bb
@@ -4,7 +4,6 @@ require boost.inc
 SRC_URI += "file://arm-intrinsics.patch \
            file://boost-CVE-2012-2677.patch \
            file://boost-math-disable-pch-for-gcc.patch \
-           file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0001-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
            file://0001-dont-setup-compiler-flags-m32-m64.patch \
            file://0001-fiber-libs-Define-SYS_futex-if-it-does-not-exist.patch \
-- 
2.29.2

