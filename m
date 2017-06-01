Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ua0-f196.google.com (mail-ua0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5D9FD719E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  1 Jun 2017 00:31:08 +0000 (UTC)
Received: by mail-ua0-f196.google.com with SMTP id j17so2161102uag.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 May 2017 17:31:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=1g4t0g66I/rE2yFhmZJ4E9lEXl4av2CYhx9KjaY7hLs=;
	b=gluzkYuTegjMXkQGNvwZm0i/d5UiaYYyXbC0yE/WMjZxb5fZVsk8klN+mGOyDG6M6N
	Cw0zj3JWMv8PvusEhDTV1A3ODaVVPaqPksrpSz1vJNhjURECrKY6LOG/E0zadOA19abz
	6pnvWvq+H5DhB6z6zrj+JLyyqDdfMv26FGOi8aCBkGjKfmPmi8DaqVftKtlVrXzSxuFV
	Hcr/5cM3WsFwQb1J3I36mAD3L+Nmvt1WFDJ8NHO0mNkcbAiWcTMxzCNqunu7ZkF3Ryaa
	3P4ZS+xK80PRM7xdFgwv6CbYdvpAV2OtrRHPhxZv4BBdBKMwxhqIJfFNxq4wwMdGJX8d
	dkkA==
X-Gm-Message-State: AODbwcDIOl7VLFjH85eGBXXmeGwy5+bzJvKx2Bhg7wSzep2Bda6D+/CR
	eadSaS8Wc94ZKweN
X-Received: by 10.159.49.87 with SMTP id n23mr15030088uab.117.1496277068885;
	Wed, 31 May 2017 17:31:08 -0700 (PDT)
Received: from localhost.localdomain ([189.35.69.200])
	by smtp.gmail.com with ESMTPSA id v26sm4479215uav.2.2017.05.31.17.31.05
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 31 May 2017 17:31:07 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Wed, 31 May 2017 21:31:01 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 31 May 2017 21:31:00 -0300
Message-Id: <20170601003100.32359-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.13.0
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] cmake: Upgrade to 3.8.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 01 Jun 2017 00:31:08 -0000

There was a set of changes, those are:

 - CMake now requires librhash for build and as there is no other
   users in OE-Core we make it use its internal copy instead;

 - Copyright.txt checksum has change due new contrubutors and 2017
   year additions;

 - Patch avoid-gcc-warnings-with-Wstrict-prototypes.patch was removed
   as it is not need anymore;

 - Patch 0001-KWIML-tests-Remove-format-security-from-flags.patch was
   removed as it is included in this release.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 ...cmake-native_3.7.2.bb => cmake-native_3.8.1.bb} |  1 +
 meta/recipes-devtools/cmake/cmake.inc              |  8 ++---
 ...L-tests-Remove-format-security-from-flags.patch | 33 -----------------
 ...void-gcc-warnings-with-Wstrict-prototypes.patch | 42 ----------------------
 .../cmake/{cmake_3.7.2.bb => cmake_3.8.1.bb}       |  1 +
 5 files changed, 5 insertions(+), 80 deletions(-)
 rename meta/recipes-devtools/cmake/{cmake-native_3.7.2.bb => cmake-native_3.8.1.bb} (94%)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch
 delete mode 100644 meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
 rename meta/recipes-devtools/cmake/{cmake_3.7.2.bb => cmake_3.8.1.bb} (97%)

diff --git a/meta/recipes-devtools/cmake/cmake-native_3.7.2.bb b/meta/recipes-devtools/cmake/cmake-native_3.8.1.bb
similarity index 94%
rename from meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
rename to meta/recipes-devtools/cmake/cmake-native_3.8.1.bb
index 7ad4345efe..e55e8b1cf6 100644
--- a/meta/recipes-devtools/cmake/cmake-native_3.7.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_3.8.1.bb
@@ -18,6 +18,7 @@ CMAKE_EXTRACONF = "\
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBARCHIVE=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
     -DENABLE_ACL=0 -DHAVE_ACL_LIBACL_H=0 \
     -DHAVE_SYS_ACL_H=0 \
 "
diff --git a/meta/recipes-devtools/cmake/cmake.inc b/meta/recipes-devtools/cmake/cmake.inc
index 6c8b36d18d..45563de3b1 100644
--- a/meta/recipes-devtools/cmake/cmake.inc
+++ b/meta/recipes-devtools/cmake/cmake.inc
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.cmake.org/"
 BUGTRACKER = "http://public.kitware.com/Bug/my_view_page.php"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://Copyright.txt;md5=7a64bc564202bf7401d9a8ef33c9564d \
+LIC_FILES_CHKSUM = "file://Copyright.txt;md5=8d8c7bc32f8797d23f5cf605d9339d2d \
                     file://Source/cmake.h;beginline=1;endline=3;md5=4494dee184212fc89c469c3acd555a14"
 
 CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
@@ -14,12 +14,10 @@ CMAKE_MAJOR_VERSION = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 SRC_URI = "https://cmake.org/files/v${CMAKE_MAJOR_VERSION}/cmake-${PV}.tar.gz \
            file://support-oe-qt4-tools-names.patch \
            file://qt4-fail-silent.patch \
-           file://avoid-gcc-warnings-with-Wstrict-prototypes.patch \
-           file://0001-KWIML-tests-Remove-format-security-from-flags.patch \
            "
 
-SRC_URI[md5sum] = "79bd7e65cd81ea3aa2619484ad6ff25a"
-SRC_URI[sha256sum] = "dc1246c4e6d168ea4d6e042cfba577c1acd65feea27e56f5ff37df920c30cae0"
+SRC_URI[md5sum] = "e8ef820ddf7a650845252bca846696e7"
+SRC_URI[sha256sum] = "ce5d9161396e06501b00e52933783150a87c33080d4bdcef461b5b7fd24ac228"
 
 UPSTREAM_CHECK_REGEX = "cmake-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch b/meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch
deleted file mode 100644
index 190133ba5c..0000000000
--- a/meta/recipes-devtools/cmake/cmake/0001-KWIML-tests-Remove-format-security-from-flags.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 0941395b146804abcd87004589ff6e7a2953412d Mon Sep 17 00:00:00 2001
-From: Jussi Kukkonen <jussi.kukkonen@intel.com>
-Date: Thu, 16 Mar 2017 14:39:04 +0200
-Subject: [PATCH] KWIML tests: Remove format-security from flags
-
-For the tests where "format" is removed from flags, "format-security"
-should be removed as well. Otherwise building cmake with
-"-Wformat -Wformat-security" fails:
-
-| cc1: error: -Wformat-security ignored without -Wformat [-Werror=format-security]
-
-Upstream-Status: Backport [part of commit f77420cfc9]
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- Utilities/KWIML/test/CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Utilities/KWIML/test/CMakeLists.txt b/Utilities/KWIML/test/CMakeLists.txt
-index 4f6f37b..1bf93bb 100644
---- a/Utilities/KWIML/test/CMakeLists.txt
-+++ b/Utilities/KWIML/test/CMakeLists.txt
-@@ -10,7 +10,7 @@ endif()
- # Suppress printf/scanf format warnings; we test if the sizes match.
- foreach(lang C CXX)
-   if(KWIML_LANGUAGE_${lang} AND CMAKE_${lang}_COMPILER_ID STREQUAL "GNU")
--    set(CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS} -Wno-format")
-+    set(CMAKE_${lang}_FLAGS "${CMAKE_${lang}_FLAGS} -Wno-format -Wno-format-security")
-   endif()
- endforeach()
- 
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch b/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
deleted file mode 100644
index 8b8d4802ee..0000000000
--- a/meta/recipes-devtools/cmake/cmake/avoid-gcc-warnings-with-Wstrict-prototypes.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 4bc17345c01ea467099e28c7df30c23ace9e7811 Mon Sep 17 00:00:00 2001
-From: Andre McCurdy <armccurdy@gmail.com>
-Date: Fri, 14 Oct 2016 16:26:58 -0700
-Subject: [PATCH] CheckFunctionExists.c: avoid gcc warnings with
- -Wstrict-prototypes
-
-Avoid warnings (and therefore build failures etc) if a user happens
-to add -Wstrict-prototypes to CFLAGS.
-
- | $ gcc --version
- | gcc (Ubuntu 4.8.4-2ubuntu1~14.04.3) 4.8.4
- |
- | $ gcc -Wstrict-prototypes -Werror -DCHECK_FUNCTION_EXISTS=pthread_create -o foo.o -c Modules/CheckFunctionExists.c
- | Modules/CheckFunctionExists.c:7:3: error: function declaration isn't a prototype [-Werror=strict-prototypes]
- |    CHECK_FUNCTION_EXISTS();
- |    ^
- | cc1: all warnings being treated as errors
- |
-
-Upstream-Status: Pending
-
-Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
----
- Modules/CheckFunctionExists.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/Modules/CheckFunctionExists.c b/Modules/CheckFunctionExists.c
-index 2304000..224e340 100644
---- a/Modules/CheckFunctionExists.c
-+++ b/Modules/CheckFunctionExists.c
-@@ -4,7 +4,7 @@
- extern "C"
- #endif
-   char
--  CHECK_FUNCTION_EXISTS();
-+  CHECK_FUNCTION_EXISTS(void);
- #ifdef __CLASSIC_C__
- int main()
- {
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/cmake/cmake_3.7.2.bb b/meta/recipes-devtools/cmake/cmake_3.8.1.bb
similarity index 97%
rename from meta/recipes-devtools/cmake/cmake_3.7.2.bb
rename to meta/recipes-devtools/cmake/cmake_3.8.1.bb
index f566a48cfb..3f8fd7a997 100644
--- a/meta/recipes-devtools/cmake/cmake_3.7.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_3.8.1.bb
@@ -28,6 +28,7 @@ EXTRA_OECMAKE=" \
     -DCMAKE_USE_SYSTEM_LIBRARIES=1 \
     -DCMAKE_USE_SYSTEM_LIBRARY_JSONCPP=0 \
     -DCMAKE_USE_SYSTEM_LIBRARY_LIBUV=0 \
+    -DCMAKE_USE_SYSTEM_LIBRARY_LIBRHASH=0 \
     -DKWSYS_CHAR_IS_SIGNED=1 \
     -DBUILD_CursesDialog=0 \
     -DKWSYS_LFS_WORKS=1 \
-- 
2.13.0


