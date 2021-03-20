Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.9739.1616277000435752164
 for <openembedded-core@lists.openembedded.org>;
 Sat, 20 Mar 2021 14:50:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RutjNI/6;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id 11so8354296pfn.9
        for <openembedded-core@lists.openembedded.org>; Sat, 20 Mar 2021 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9bBxYeA11O4s2AZo9IS2T+nSF+z4YLVPCFbH4KJyBQo=;
        b=RutjNI/6HAPNL8hOBeyzeWmWAGQ94Gp0ZM6eNr5Xg/2iKGeWNxGM/BogSa9SAncmLq
         JpienI8eEkwzhE9lAQAyFEitaR+fQ1pILRvh3sAllFLmCcisQ8KvliaU2geLEILQ/dtu
         MygWN4+2/aed8b2Ymbpg7LpmV0zdKaIqG9LUk0SRNuwvHcaNfclyAbyklaKPAsdjMjKX
         ozVUcnyxZ9nKRdGeE2VLT54hLnER3wTsojTZq3hue+9X80DgtwbLegyLyaqJ6xkvlZBa
         YRJeym5147urTtXA2x2SLYhv5BWFaLgmu8Va60ctBa3lQV0REKGEF7KYshYADslwHf2q
         yScQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9bBxYeA11O4s2AZo9IS2T+nSF+z4YLVPCFbH4KJyBQo=;
        b=jc9QXiey295eoGNcf1gh8Rg1Jbv1LQZ6tYXh/5Vbn/Qha0lgpi6ei7kmAkZiWzq433
         +k13nFIJv88ojrNDLvu1FCLXX9ycaW/T+aIlMMY8GfeezFcyg0mACy6Imidj6Li/IRpn
         DtRjCLqgWwP4fCxTPr6e6qeiD8ZDn+vo+JxAZZkFpVOG9gmgrcoJCJmTEdXtqVEWURt7
         Q4IWcMj/2/8SOKh0UFspcbd5QMH7W2QL6CK680SHDJnsUoFUPoqYZfsPc7x2z2Mj9Mac
         14zp97hE/sfHARoS8ErpkIuerc7ia30RbA7A1hEDhRn7uJNjgdleLcsW5e6VXHx+0MVD
         Glcg==
X-Gm-Message-State: AOAM530k89bg8ZLpMJh3cch1/QxPBM/SJCRGn7tgb5JQmvOCZmTOz2I3
	wF4RhfIIh1HwppDUJVwRuDWMiQ0mjY/voQ==
X-Google-Smtp-Source: ABdhPJz+iO7OFTEAvZQKd+NCttmgoRuzA3qGXKbXSpKLPzxzFD9+FGjVDI0qL8jAp5NQTQ8VvjZwfA==
X-Received: by 2002:a63:4f59:: with SMTP id p25mr8410733pgl.21.1616276999457;
        Sat, 20 Mar 2021 14:49:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:a0f0::b117])
        by smtp.gmail.com with ESMTPSA id q25sm9212316pfh.34.2021.03.20.14.49.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Mar 2021 14:49:59 -0700 (PDT)
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH v2 1/3] apt: update 1.8.2.2 -> 2.2.2
Date: Sat, 20 Mar 2021 14:49:54 -0700
Message-Id: <20210320214956.2477142-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Kanavin <alex.kanavin@gmail.com>

Drop 0001-test-libapt-do-not-use-gtest-from-the-host.patch
(replaced by WITH_TESTS option).

Drop 0001-Do-not-configure-packages-on-installation.patch
(no longer necessary).

Adjust build dependencies.

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...e-documentation-directory-altogether.patch |  8 ++--
 ...t-configure-packages-on-installation.patch | 48 -------------------
 ...-init-tables-from-dpkg-configuration.patch |  4 +-
 ...n-dpkg-configure-a-at-the-end-of-our.patch | 10 ++--
 ...ibapt-do-not-use-gtest-from-the-host.patch | 40 ----------------
 .../apt/{apt_1.8.2.2.bb => apt_2.2.2.bb}      |  9 ++--
 6 files changed, 14 insertions(+), 105 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
 rename meta/recipes-devtools/apt/{apt_1.8.2.2.bb => apt_2.2.2.bb} (89%)

diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
index cc422b74dc..8b28ede8a8 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From cd164b353ba7958d51b2f33f4079fb9787c983e2 Mon Sep 17 00:00:00 2001
+From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 14:16:47 +0200
 Subject: [PATCH] Disable documentation directory altogether
@@ -13,11 +13,11 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 83334ba..2cd4f8e 100644
+index 9745c13..7cfc9ee 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -232,7 +232,7 @@ add_subdirectory(apt-private)
- add_subdirectory(apt-inst)
+@@ -239,7 +239,7 @@ add_subdirectory(apt-pkg)
+ add_subdirectory(apt-private)
  add_subdirectory(cmdline)
  add_subdirectory(completions)
 -add_subdirectory(doc)
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
deleted file mode 100644
index 81b328a2ee..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-configure-packages-on-installation.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 96d23fc57d1ff9c851d563d6d6a6c4752dc4f1b6 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 21 May 2020 20:28:12 +0000
-Subject: [PATCH] Do not configure packages on installation
-
-This is done separately in do_rootfs().
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- apt-pkg/packagemanager.cc | 5 ++++-
- 1 file changed, 4 insertions(+), 1 deletion(-)
-
-diff --git a/apt-pkg/packagemanager.cc b/apt-pkg/packagemanager.cc
-index 156f7ad..0f6a87c 100644
---- a/apt-pkg/packagemanager.cc
-+++ b/apt-pkg/packagemanager.cc
-@@ -1013,10 +1013,12 @@ bool pkgPackageManager::SmartUnPack(PkgIterator Pkg, bool const Immediate, int c
-       return false;
- 
-    if (Immediate == true) {
-+#if 0
-       // Perform immediate configuration of the package. 
-          if (SmartConfigure(Pkg, Depth + 1) == false)
-             _error->Error(_("Could not perform immediate configuration on '%s'. "
-                "Please see man 5 apt.conf under APT::Immediate-Configure for details. (%d)"),Pkg.FullName().c_str(),2);
-+#endif
-    }
-    
-    return true;
-@@ -1111,6 +1113,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
-       }
-    }
- 
-+#if 0
-    // Final run through the configure phase
-    if (ConfigureAll() == false)
-       return Failed;
-@@ -1125,7 +1128,7 @@ pkgPackageManager::OrderResult pkgPackageManager::OrderInstall()
- 	 return Failed;
-       }
-    }
--	 
-+#endif	 
-    return Completed;
- }
- // PM::DoInstallPostFork - compat /*{{{*/
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 1417153e81..e0e7e0cd58 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From bf45c314867e5fb12141803fba06f3e45679d628 Mon Sep 17 00:00:00 2001
+From 382f8381ef8baf754057e376a6d9bf840ca6d543 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
@@ -13,7 +13,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
-index a619368..6e5a6cf 100644
+index b9d9b15..1725c59 100644
 --- a/apt-pkg/init.cc
 +++ b/apt-pkg/init.cc
 @@ -281,8 +281,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *&Sys)
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 37f969690c..c14dc2a414 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From 34700bebc52659e7e3eecd252f65bd36e669eee8 Mon Sep 17 00:00:00 2001
+From a603b3281f3f60a87531c8cec4843f970170d409 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
@@ -20,10 +20,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index ffa880d..5875e86 100644
+index 46a6dee..8617a9e 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1215,12 +1215,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1211,12 +1211,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 }
        }
     }
@@ -35,8 +35,8 @@ index ffa880d..5875e86 100644
 -   ++PackagesTotal;
  }
                                                                          /*}}}*/
- bool pkgDPkgPM::Go(int StatusFd)					/*{{{*/
-@@ -1716,7 +1710,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+ void pkgDPkgPM::StartPtyMagic()						/*{{{*/
+@@ -1710,7 +1704,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
        // support subpressing of triggers processing for special
        // cases like d-i that runs the triggers handling manually
diff --git a/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch b/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
deleted file mode 100644
index 503b5a5c0b..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-test-libapt-do-not-use-gtest-from-the-host.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From 28e389a0d1275e7693df84a7d4a58b28364be1a9 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Thu, 22 Oct 2020 17:33:38 +0200
-Subject: [PATCH] test/libapt: do not use gtest from the host
-
-This really does not work when cross-compiling.
-
-Upstream-Status: Inappropriate [oe-core specific]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- test/libapt/CMakeLists.txt | 16 ----------------
- 1 file changed, 16 deletions(-)
-
-diff --git a/test/libapt/CMakeLists.txt b/test/libapt/CMakeLists.txt
-index 035ff07..280b83c 100644
---- a/test/libapt/CMakeLists.txt
-+++ b/test/libapt/CMakeLists.txt
-@@ -6,22 +6,6 @@ find_path(GTEST_ROOT src/gtest.cc
- find_package(GTest)
- set(GTEST_DEPENDENCIES)
- 
--if(NOT GTEST_FOUND AND EXISTS ${GTEST_ROOT})
--   include(ExternalProject)
--   ExternalProject_Add(gtest PREFIX ./gtest
--                             SOURCE_DIR ${GTEST_ROOT}
--                             INSTALL_COMMAND true)
--
--   link_directories(${CMAKE_CURRENT_BINARY_DIR}/gtest/src/gtest-build)
--
--   set(GTEST_LIBRARIES "-lgtest")
--   set(GTEST_DEPENDENCIES "gtest")
--   set(GTEST_FOUND TRUE)
--   find_path(GTEST_INCLUDE_DIRS NAMES gtest/gtest.h PATHS ${GTEST_ROOT}/include)
--
--   message(STATUS "Found GTest at ${GTEST_ROOT}, headers at ${GTEST_INCLUDE_DIRS}")
--endif()
--
- if(GTEST_FOUND)
-    # gtest produces some warnings with the set of warnings we activate,
-    # so disable the offending warnings while compiling tests for now
diff --git a/meta/recipes-devtools/apt/apt_1.8.2.2.bb b/meta/recipes-devtools/apt/apt_2.2.2.bb
similarity index 89%
rename from meta/recipes-devtools/apt/apt_1.8.2.2.bb
rename to meta/recipes-devtools/apt/apt_2.2.2.bb
index 6cda61a7d8..b838495da8 100644
--- a/meta/recipes-devtools/apt/apt_1.8.2.2.bb
+++ b/meta/recipes-devtools/apt/apt_2.2.2.bb
@@ -10,22 +10,19 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-Disable-documentation-directory-altogether.patch \
            file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
-           file://0001-test-libapt-do-not-use-gtest-from-the-host.patch \
            "
      
 SRC_URI_append_class-native = " \
            file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-           file://0001-Do-not-configure-packages-on-installation.patch \
            "
 
 SRC_URI_append_class-nativesdk = " \
            file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
-           file://0001-Do-not-configure-packages-on-installation.patch \
            "
 
-SRC_URI[sha256sum] = "f5030de22a5cc80db6fe0d42373b5df25d7dc56e94d9155f2eaa80dbd65e82fa"
+SRC_URI[sha256sum] = "c5449a4c2126a12497a9949cd10209926005d329f6ce7942a3781fa2fcf50487"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
@@ -40,12 +37,12 @@ USERADD_PARAM_${PN} = "--system --home /nonexistent --no-create-home _apt"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS += "virtual/libiconv virtual/libintl db gnutls lz4 zlib bzip2 xz"
+DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
 
 EXTRA_OECMAKE_append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DUSE_NLS=False -DDPKG_DATADIR=${datadir}/dpkg \
     -DTRIEHASH_EXECUTABLE=${WORKDIR}/triehash \
-    -DCMAKE_DISABLE_FIND_PACKAGE_Zstd=True \
+    -DWITH_TESTS=False \
 "
 
 do_configure_prepend () {
-- 
2.31.0

