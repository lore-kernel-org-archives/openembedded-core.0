Return-Path: <sudipm.mukherjee@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A77CC77B7E
	for <webhook@archiver.kernel.org>; Tue,  2 May 2023 14:01:09 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.219.1683036066153663082
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 May 2023 07:01:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=h/zo14+H;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: sudipm.mukherjee@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3f178da219bso37274335e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 07:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683036064; x=1685628064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B+Zn3XgQvxsoozEnL/Gbsb/I0IZkbaPlKli+0f4zkS4=;
        b=h/zo14+HZI2Z87ZUWzgy9etoxJU+bU0P5T02Eg+i1T7gcs2GkHt5/3zdzBzrgCyr+A
         3qrmrO0NeU3s4gqquoyGpOm0wnN76DppCRPkXqZ/QSL4HHuE6XqORDn3NVkXo0xLlzxx
         5a+eBNzyX1jjayU8bQquMcYaODJxlOuCbvOgkOoE04tiRC7KnlIK6bCzL3o/yWzY3f+/
         dVFT76dTvU25pWtt3QkFmgpDg1tZbAAS3rxkF6873lppKiOPo6PQXaJMc5At7jUJPSuC
         GkBl0+4spZU6dh5u6PLM8+1dBR3+eCfTl0fMV/PW5s+lWrWdUUU8PShs3sOioidPJVZ0
         A0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683036064; x=1685628064;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+Zn3XgQvxsoozEnL/Gbsb/I0IZkbaPlKli+0f4zkS4=;
        b=fLizm5+GLd1/zZriZJ/gps4vVZy8shGZLrW+ejT+RxHOVSNzUaPRu/lHHv8wsXjP9D
         kVRrJJ59vy2YJ+Qvl7hmC8bPPbAjkyj9oL7xtpxrNUOAHHXcqwiIZgMqwrqmsjafJBAP
         dMeAK86NUB+vY4zEwyskju8wPPnb8LUO0zeNzJEhytupAlT/VuwPR7I+7XzrN8od7ykY
         d3SREKG/6pDsjitfIz1ik3EVT+BPe4fgUMe0T/+2YTwi43mZ/f4J6nHk69t6hy8iGwDH
         iXxe5y9D6HtctM57eLyteSO/+nM29/eq+F5JuBSBiVyfwGTlYxhZfxKr05BmRmEcmUkm
         ikkw==
X-Gm-Message-State: AC+VfDyxg+Sfe9HaJ9mzFfGUYgfypUM+FOmj8BbkJ4DqrgNEeKigzUYW
	tyB60hI29F8cE6xQtExTyeKXnofrCH4=
X-Google-Smtp-Source: ACHHUZ6LUHrcDYFEZBbEz/idRYjyIL8NkJ51bS/BYNH7gQAEEmzLM9XY/wgiFrB7qYXb2iSv+fjt5w==
X-Received: by 2002:a05:600c:2309:b0:3ea:f73e:9d8a with SMTP id 9-20020a05600c230900b003eaf73e9d8amr12905312wmo.30.1683036063538;
        Tue, 02 May 2023 07:01:03 -0700 (PDT)
Received: from localhost.localdomain ([63.135.72.41])
        by smtp.gmail.com with ESMTPSA id bi26-20020a05600c3d9a00b003eddc6aa5fasm35150659wmb.39.2023.05.02.07.01.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 May 2023 07:01:03 -0700 (PDT)
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH] apt: Upgrade to v2.6.0
Date: Tue,  2 May 2023 15:00:55 +0100
Message-Id: <20230502140055.163811-1-sudipm.mukherjee@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 May 2023 14:01:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180730

Changes:
Rebase patches for upstream changes
Remove upstream applied patches
Update homepage
Update sha256sum for new version

Signed-off-by: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
---
 ...e-documentation-directory-altogether.patch |  6 +-
 ...001-Remove-using-std-binary_function.patch |  8 +--
 ...001-add-missing-cstdint-for-uint16_t.patch | 35 ----------
 .../0001-cmake-Do-not-build-po-files.patch    |  9 ++-
 ...me_t-and-suseconds_t-from-std-chrono.patch | 64 -------------------
 ...tive-helper-Undefine-_FORTIFY_SOURCE.patch | 27 --------
 .../apt/{apt_2.4.5.bb => apt_2.6.0.bb}        |  7 +-
 7 files changed, 13 insertions(+), 143 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch
 rename meta/recipes-devtools/apt/{apt_2.4.5.bb => apt_2.6.0.bb} (92%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
index 8b28ede8a8..5443ff6caa 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9745c13..7cfc9ee 100644
+index 668e2d762..62f441bfa 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -239,7 +239,7 @@ add_subdirectory(apt-pkg)
- add_subdirectory(apt-private)
+@@ -246,7 +246,7 @@ add_subdirectory(apt-private)
+ endif()
  add_subdirectory(cmdline)
  add_subdirectory(completions)
 -add_subdirectory(doc)
diff --git a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
index 3065210a04..15b036b90d 100644
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 23 deletions(-)
 
 diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive.cc
-index 87ce9153c..56fdc2246 100644
+index 0f6587281..0a253b12b 100644
 --- a/ftparchive/apt-ftparchive.cc
 +++ b/ftparchive/apt-ftparchive.cc
 @@ -48,6 +48,11 @@
@@ -33,19 +33,19 @@ index 87ce9153c..56fdc2246 100644
     bool SrcDone;
     time_t ContentsMTime;
     
--   struct ContentsCompare : public binary_function<PackageMap,PackageMap,bool>
+-   struct ContentsCompare
 -   {
 -      inline bool operator() (const PackageMap &x,const PackageMap &y)
 -      {return x.ContentsMTime < y.ContentsMTime;};
 -   };
 -    
--   struct DBCompare : public binary_function<PackageMap,PackageMap,bool>
+-   struct DBCompare
 -   {
 -      inline bool operator() (const PackageMap &x,const PackageMap &y)
 -      {return x.BinCacheDB < y.BinCacheDB;};
 -   };  
 -
--   struct SrcDBCompare : public binary_function<PackageMap,PackageMap,bool>
+-   struct SrcDBCompare
 -   {
 -      inline bool operator() (const PackageMap &x,const PackageMap &y)
 -      {return x.SrcCacheDB < y.SrcCacheDB;};
diff --git a/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch b/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
deleted file mode 100644
index 44aa8a5873..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-add-missing-cstdint-for-uint16_t.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 960d10e89cf60d39998dae6fdcd4f0866b753a79 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 23 Jan 2023 12:31:35 -0800
-Subject: [PATCH] add missing <cstdint> for uint16_t
-
-This fixes build problems with gcc 13 snapshot [1]
-
-Fixes
-| include/apt-pkg/pkgcache.h:257:23: warning: cast from 'char*' to 'const uint16_t*' {aka 'const short unsigned int*'} increases required alignment of target type [-Wcast-align]
-|   257 |       uint16_t len = *reinterpret_cast<const uint16_t*>(name - sizeof(uint16_t));
-|       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
-
-[1] https://www.gnu.org/software/gcc/gcc-13/porting_to.html
-
-Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/276]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- apt-pkg/contrib/mmap.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/apt-pkg/contrib/mmap.cc b/apt-pkg/contrib/mmap.cc
-index 642e20473..0568e1cd0 100644
---- a/apt-pkg/contrib/mmap.cc
-+++ b/apt-pkg/contrib/mmap.cc
-@@ -23,6 +23,7 @@
- #include <apt-pkg/macros.h>
- #include <apt-pkg/mmap.h>
- 
-+#include <cstdint>
- #include <cstring>
- #include <string>
- #include <errno.h>
--- 
-2.39.1
-
diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
index 2837b7f1b3..036ce35963 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -15,16 +15,18 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 7 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 3c8ec3f..821a24f 100644
+index be157a55f..54163ae6c 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -245,13 +245,6 @@ add_subdirectory(ftparchive)
+@@ -252,15 +252,6 @@ add_subdirectory(ftparchive)
  add_subdirectory(methods)
  add_subdirectory(test)
  
 -if (USE_NLS)
 -add_subdirectory(po)
+-endif()
 -
+-if(TARGET update-po AND TARGET update-po4a)
 -# Link update-po4a into the update-po target
 -add_dependencies(update-po update-po4a)
 -endif()
@@ -32,6 +34,3 @@ index 3c8ec3f..821a24f 100644
  # Create our directories.
  install_empty_directories(
    ${CONF_DIR}/apt.conf.d
--- 
-2.31.0
-
diff --git a/meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch b/meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch
deleted file mode 100644
index fc3509d336..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch
+++ /dev/null
@@ -1,64 +0,0 @@
-From b7a1a4d3259557f2587f7d5d47502691d94c21c2 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Sep 2022 20:00:30 -0700
-Subject: [PATCH 1/2] typecast time_t and suseconds_t from std::chrono
-
-This fixes build on some architectures like mips
-progress.cc:125:31: error: non-constant-expression cannot be narrowed from type 'std::chrono::duration<long long>::rep' (aka 'long long') to '__time_t' (aka 'long') in initializer list [-Wc++11-narrowing]
-   struct timeval NowTime = { Now_sec.count(), Now_usec.count() };
-
-Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/259]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- apt-pkg/acquire.cc           | 4 ++--
- apt-pkg/contrib/progress.cc  | 2 +-
- ftparchive/apt-ftparchive.cc | 2 +-
- 3 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/apt-pkg/acquire.cc b/apt-pkg/acquire.cc
-index 100ccde..dd0624a 100644
---- a/apt-pkg/acquire.cc
-+++ b/apt-pkg/acquire.cc
-@@ -53,11 +53,11 @@
- using namespace std;
- 
- // helper to convert time_point to a timeval
--static struct timeval SteadyDurationToTimeVal(std::chrono::steady_clock::duration Time)
-+constexpr struct timeval SteadyDurationToTimeVal(std::chrono::steady_clock::duration Time)
- {
-    auto const Time_sec = std::chrono::duration_cast<std::chrono::seconds>(Time);
-    auto const Time_usec = std::chrono::duration_cast<std::chrono::microseconds>(Time - Time_sec);
--   return {Time_sec.count(), Time_usec.count()};
-+   return timeval{static_cast<time_t>(Time_sec.count()), static_cast<suseconds_t>(Time_usec.count())};
- }
- 
- std::string pkgAcquire::URIEncode(std::string const &part)		/*{{{*/
-diff --git a/apt-pkg/contrib/progress.cc b/apt-pkg/contrib/progress.cc
-index 03f88d4..eb688b9 100644
---- a/apt-pkg/contrib/progress.cc
-+++ b/apt-pkg/contrib/progress.cc
-@@ -122,7 +122,7 @@ bool OpProgress::CheckChange(float Interval)
-    auto const Now = std::chrono::steady_clock::now().time_since_epoch();
-    auto const Now_sec = std::chrono::duration_cast<std::chrono::seconds>(Now);
-    auto const Now_usec = std::chrono::duration_cast<std::chrono::microseconds>(Now - Now_sec);
--   struct timeval NowTime = { Now_sec.count(), Now_usec.count() };
-+   struct timeval NowTime = { static_cast<time_t>(Now_sec.count()), static_cast<suseconds_t>(Now_usec.count()) };
- 
-    std::chrono::duration<decltype(Interval)> Delta =
-       std::chrono::seconds(NowTime.tv_sec - LastTime.tv_sec) +
-diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive.cc
-index 56fdc22..0a253b1 100644
---- a/ftparchive/apt-ftparchive.cc
-+++ b/ftparchive/apt-ftparchive.cc
-@@ -58,7 +58,7 @@ static struct timeval GetTimevalFromSteadyClock()			/*{{{*/
-    auto const Time = std::chrono::steady_clock::now().time_since_epoch();
-    auto const Time_sec = std::chrono::duration_cast<std::chrono::seconds>(Time);
-    auto const Time_usec = std::chrono::duration_cast<std::chrono::microseconds>(Time - Time_sec);
--   return { Time_sec.count(), Time_usec.count() };
-+   return { static_cast<time_t>(Time_sec.count()), static_cast<suseconds_t>(Time_usec.count()) };
- }
- 									/*}}}*/
- static auto GetTimeDeltaSince(struct timeval StartTime)			/*{{{*/
--- 
-2.37.3
-
diff --git a/meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch b/meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch
deleted file mode 100644
index 18c4641b22..0000000000
--- a/meta/recipes-devtools/apt/apt/0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 891076c2cf4298b5d587545497f4831f0d21caa1 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Fri, 16 Sep 2022 20:04:43 -0700
-Subject: [PATCH 2/2] interactive-helper: Undefine _FORTIFY_SOURCE
-
-This ensures that it compiles when clang compiler is passing
--DFORTIFY_SOURCES=2
-
-Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/259]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- test/interactive-helper/libnoprofile.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test/interactive-helper/libnoprofile.c b/test/interactive-helper/libnoprofile.c
-index f11b898..b26ec2a 100644
---- a/test/interactive-helper/libnoprofile.c
-+++ b/test/interactive-helper/libnoprofile.c
-@@ -1,4 +1,5 @@
- #define _GNU_SOURCE
-+#undef _FORTIFY_SOURCE
- #include <stdarg.h>
- #include <stdlib.h>
- #include <string.h>
--- 
-2.37.3
-
diff --git a/meta/recipes-devtools/apt/apt_2.4.5.bb b/meta/recipes-devtools/apt/apt_2.6.0.bb
similarity index 92%
rename from meta/recipes-devtools/apt/apt_2.4.5.bb
rename to meta/recipes-devtools/apt/apt_2.6.0.bb
index 429cf6e659..b872be8371 100644
--- a/meta/recipes-devtools/apt/apt_2.4.5.bb
+++ b/meta/recipes-devtools/apt/apt_2.6.0.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Advanced front-end for dpkg"
 DESCRIPTION = "APT is the Advanced Package Tool, an advanced interface to the Debian packaging system which provides the apt-get program."
-HOMEPAGE = "https://packages.debian.org/jessie/apt"
+HOMEPAGE = "https://packages.debian.org/sid/apt"
 LICENSE = "GPL-2.0-or-later"
 SECTION = "base"
 
@@ -14,9 +14,6 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Hide-fstatat64-and-prlimit64-defines-on-musl.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
-           file://0001-typecast-time_t-and-suseconds_t-from-std-chrono.patch \
-           file://0002-interactive-helper-Undefine-_FORTIFY_SOURCE.patch \
-           file://0001-add-missing-cstdint-for-uint16_t.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -29,7 +26,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "5552f175c3a3924f5cda0c079b821b30f68a2521959f2c30ab164d2ec7993ecf"
+SRC_URI[sha256sum] = "43467d1ca7de6c0955fd991925433e22fa66230870e5f66c4498675d01776c2a"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.30.2


