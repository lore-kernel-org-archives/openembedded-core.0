Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C8D9CA0FF2
	for <webhook@archiver.kernel.org>; Wed,  3 Sep 2025 18:03:54 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.19876.1756922627158583283
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Sep 2025 11:03:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hETeW0vv;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-45b627ea685so1919075e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 11:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756922625; x=1757527425; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pDQY9/hhtbdcsICsVwOKbixDqSu+yR2nrMBVk3uFsMM=;
        b=hETeW0vvacCcApSSaFtNIReHyo5nyYvRWynB6Zt+ACJn6BTPERQk5CmmqZKo0lWK+w
         DNVYE9nOy6s0zgyVMvMbIlBge2X1b/mfOETZ+wEUpsHD5MSiBJyccNsiqFrlYJFeDk30
         SM8skoyk1sc8dV0IUzzd6DfcRfrDNEVhiVZ5tV38g3IGTdSYXvAqY3nX4viFdLhArnBx
         ay5GQctJRJX+EBypJ3yqW2M7DCoOtt9uVlwtNZM/EkGTrz68CNR2A6iBTj0s+7rf99kM
         Vm/eoen76z2dpsrpiR96Jf2rKYRissINmYm6bsfxBLhHfjfdcdCw2CIJzxqehJDJT9W+
         qlzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756922625; x=1757527425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pDQY9/hhtbdcsICsVwOKbixDqSu+yR2nrMBVk3uFsMM=;
        b=D5a6EdQp2bfnY0qiLDD2H9pBWP8h0c0kdvKuX/TO3tb3wz0U9GwL0CU9wkBmLMc0If
         IPvcZhJJB44YYrgtKI/+o6w44INA4T9tjHrUWNudyryfMikunuLvI84LpewXFDfgQH+W
         SjqY+mYYipUdAc4TCyT9di6Nz/f+AK3DbcVnIlonTuH1Omawtj3pa5UommUO2SHheMHf
         dVbEbhGGVwGWz6aW+wUaahFDBStiNzHUS8ZXuRu4w3RgZuGhCOdVKn9eFMRrdK7can2P
         zLyvRefh5svfCt1BIVEi/hglMw7clLw6JEq6IC6L3WbzVvW8kOGf9gMS9nBMhTv05Aa/
         762w==
X-Gm-Message-State: AOJu0Yx+TE/g3NLJ+8z38/tXdLxGQR+7qP67TnvugXUWqqWUCgwnuD+q
	H5jnJ62NgLnSua/15prTvNmJKpUsxIbjiB0aRvtFE0ZBS64E7pa5j5rRCkC8wyBn
X-Gm-Gg: ASbGncssAfqqjx/A2lA50z2YJyacESsN7uhnam5Oa/qvDXtCzuPT/y+09P+H/iiZ6vC
	6SjijICKtUHm7nSGozbucUg/Asz4nPvHFLNd8vclxgGhBN9ugvSraL9EV/9xx8CztgwiUDWZhd6
	uyEBoD3HAmhJnghtIH1sxqx/RdqELyO49CHgmLvjcJf4kirGgYiALLlPrFQ1aMsshVSsJ1smcQ0
	YggK1sqSvGrVzXlZRcsHIC9vDKE7DCAUBU0Dd8BA/OVKikaw/PkBFQT3/MtkHcurdgk7lrFUI8G
	JyFhnBIZXjpt3V41tQJ0gHdggHZ7qOhzR1lf2Xb97GEeffGgiIo8ETW2Y5w+WTORCdJ7EM+w7Ep
	NEw4Hn/E3S0LQdsPKr5GS
X-Google-Smtp-Source: AGHT+IGqI3Q6aal1mTV+nDC66bRVN5ZH8VZHzxMc7qinXj6tSWEWV2ZGZvAHIQGoq2PV0etgjxNM3A==
X-Received: by 2002:a05:600c:1d07:b0:45b:6b57:5308 with SMTP id 5b1f17b1804b1-45b855508e0mr139241745e9.7.1756922624861;
        Wed, 03 Sep 2025 11:03:44 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45dcfc48b9asm588525e9.0.2025.09.03.11.03.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Sep 2025 11:03:44 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v6] apt: upgrade 2.6.1 -> 3.0.3
Date: Wed,  3 Sep 2025 20:03:43 +0200
Message-ID: <20250903180343.1222627-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Sep 2025 18:03:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222880

Changelog:
https://metadata.ftp-master.debian.org/changelogs/main/a/apt/apt_3.0.3_changelog

Dropped patches which are included in this release, or became obsolete:
0001-Fix-compilation-error-with-clang-libc-18.patch - included in this release
0001-Fix-musl-build.patch - included in this release
0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch - included in this release
0001-Remove-using-std-binary_function.patch - became obsolete, fixed upstream
0001-aptwebserver.cc-Include-array.patch - became obsolete, fixed upstream
0001-strutl-Add-missing-include-cstdint-gcc-15.patch - included in this release

Added a new patch to avoid compilation error with musl:
error: 'basename' was not declared in this scope; did you mean 'rename'?

Adapted DEPENDS list - gnutls and gcrypt dependencies were dropped in favor of openssl
in version 2.9.19.

Added a new PACKAGECONFIG, 'usrmerge', which displays a gentle warning if the system
isn't a usrmerge system during package installation.

Added new COMMON_ARCH CMake argument - if it is not defined, CMake is trying to
determine the value of this variable by running dpkg, which is usually a futile
endeavour. It is used in config creation, and to print some system info.

Also adapt a self test: the apt-key command has been deprecated since a while,
and in this release it was completely removed. Instead sources.list file
contains the signature data, on a per-repository basis.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
v6: remove unnecessary quote escaping from self-test
v5: copy the keyring with the correct extension (.asc) in self test
v4: remove a debug "cat" from the test
v3: adapt self-test. apt-key has been removed from this version, so make the test
    use an alternative method to indicate the signature location
v2: changed the status 0001-fix-compilation-with-musl.patch from Pending to Submitted

 meta/lib/oeqa/runtime/cases/apt.py            |  9 +-
 ...void-changing-install-paths-based-on.patch |  2 +-
 ...e-documentation-directory-altogether.patch |  2 +-
 ...-init-tables-from-dpkg-configuration.patch |  2 +-
 ...compilation-error-with-clang-libc-18.patch | 29 -------
 .../apt/apt/0001-Fix-musl-build.patch         | 28 ------
 ...mum_required-to-3.13-to-avoid-warnin.patch | 47 ----------
 ...001-Remove-using-std-binary_function.patch | 87 -------------------
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  4 +-
 .../0001-aptwebserver.cc-Include-array.patch  | 30 -------
 .../0001-cmake-Do-not-build-po-files.patch    |  6 +-
 .../apt/0001-fix-compilation-with-musl.patch  | 49 +++++++++++
 ...l-Add-missing-include-cstdint-gcc-15.patch | 26 ------
 .../apt/{apt_2.6.1.bb => apt_3.0.3.bb}        | 17 ++--
 14 files changed, 74 insertions(+), 264 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
 create mode 100644 meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
 rename meta/recipes-devtools/apt/{apt_2.6.1.bb => apt_3.0.3.bb} (88%)

diff --git a/meta/lib/oeqa/runtime/cases/apt.py b/meta/lib/oeqa/runtime/cases/apt.py
index 8000645843..c6b62987f1 100644
--- a/meta/lib/oeqa/runtime/cases/apt.py
+++ b/meta/lib/oeqa/runtime/cases/apt.py
@@ -54,7 +54,14 @@ class AptRepoTest(AptTest):
     def setup_key(self):
         # the key is found on the target /etc/pki/packagefeed-gpg/
         # named PACKAGEFEED-GPG-KEY-poky-branch
-        self.target.run('cd %s; apt-key add P*' % ('/etc/pki/packagefeed-gpg'))
+        # copy it to /etc/apt/keyrings/PACKAGEFEED-GPG-KEY-poky-branch.asc, and
+        # set it as the signing key for the repos
+        cmd =  "KEY_FILE_PATH=`realpath /etc/pki/packagefeed-gpg/P*`; "
+        cmd += "KEY_FILE_NAME=`basename $KEY_FILE_PATH`; "
+        cmd += "mkdir -p /etc/apt/keyrings; "
+        cmd += "cp $KEY_FILE_PATH /etc/apt/keyrings/${KEY_FILE_NAME}.asc; "
+        cmd += 'sed -i "s|^deb |deb \[signed-by=/etc/apt/keyrings/${KEY_FILE_NAME}.asc\] |g" /etc/apt/sources.list'
+        self.target.run(cmd)
 
     @skipIfNotFeature('package-management',
                       'Test requires package-management to be in IMAGE_FEATURES')
diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
index 199f11bf20..d37aa811cd 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -14,7 +14,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 2cd4f8e..4759812 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -21,9 +21,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
+@@ -28,9 +28,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
  set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "-lgcov")
  
  # Work around bug in GNUInstallDirs
diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
index 5443ff6caa..4bc6dce760 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -16,7 +16,7 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index 668e2d762..62f441bfa 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -246,7 +246,7 @@ add_subdirectory(apt-private)
+@@ -251,7 +251,7 @@ add_subdirectory(apt-private)
  endif()
  add_subdirectory(cmdline)
  add_subdirectory(completions)
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 37a3133010..d21f5a49c5 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -16,7 +16,7 @@ diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
 index b9d9b15d2..1725c5966 100644
 --- a/apt-pkg/init.cc
 +++ b/apt-pkg/init.cc
-@@ -281,8 +281,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *&Sys)
+@@ -295,8 +295,8 @@ bool pkgInitSystem(Configuration &Cnf,pkgSystem *&Sys)
  	 return _error->Error(_("Unable to determine a suitable packaging system type"));
     }
  
diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch b/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch
deleted file mode 100644
index e55205ca3f..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From b4488583424b33f51cb031562a9e8df820ffda23 Mon Sep 17 00:00:00 2001
-From: Chongyun Lee <licy183@termux.dev>
-Date: Thu, 15 Aug 2024 21:31:24 +0800
-Subject: [PATCH] Fix compilation error with clang/libc++ 18
-
-Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/b4488583424b33f51cb031562a9e8df820ffda23]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- apt-pkg/cacheset.h | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/apt-pkg/cacheset.h b/apt-pkg/cacheset.h
-index 5dbb9bf08..1c67a65d6 100644
---- a/apt-pkg/cacheset.h
-+++ b/apt-pkg/cacheset.h
-@@ -218,11 +218,11 @@ public:
- 	operator container_iterator(void) const { return _iter; }
- 	inline iterator_type& operator++() { ++_iter; return static_cast<iterator_type&>(*this); }
- 	inline iterator_type operator++(int) { iterator_type tmp(*this); operator++(); return tmp; }
--	inline iterator_type operator+(typename container_iterator::difference_type const &n) { return iterator_type(_iter + n); }
-+	inline iterator_type operator+(typename container_iterator::difference_type const &n) const { return iterator_type(_iter + n); }
- 	inline iterator_type operator+=(typename container_iterator::difference_type const &n) { _iter += n; return static_cast<iterator_type&>(*this); }
- 	inline iterator_type& operator--() { --_iter;; return static_cast<iterator_type&>(*this); }
- 	inline iterator_type operator--(int) { iterator_type tmp(*this); operator--(); return tmp; }
--	inline iterator_type operator-(typename container_iterator::difference_type const &n) { return iterator_type(_iter - n); }
-+	inline iterator_type operator-(typename container_iterator::difference_type const &n) const { return iterator_type(_iter - n); }
- 	inline typename container_iterator::difference_type operator-(iterator_type const &b) { return (_iter - b._iter); }
- 	inline iterator_type operator-=(typename container_iterator::difference_type const &n) { _iter -= n; return static_cast<iterator_type&>(*this); }
- 	inline bool operator!=(iterator_type const &i) const { return _iter != i._iter; }
diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
deleted file mode 100644
index 0cefbedd6d..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 22 May 2020 15:29:23 +0000
-Subject: [PATCH] apt-pkg/contrib/srvrec.h: Explicitly include sys/types.h
-
-This avoids type errors with musl C library.
-
-Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/200]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- apt-pkg/contrib/srvrec.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
-index e5d0f43..2010184 100644
---- a/apt-pkg/contrib/srvrec.h
-+++ b/apt-pkg/contrib/srvrec.h
-@@ -9,6 +9,7 @@
- #ifndef SRVREC_H
- #define SRVREC_H
- 
-+#include <sys/types.h>
- #include <string>
- #include <vector>
- #include <arpa/nameser.h>
--- 
-2.20.1
-
diff --git a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch b/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
deleted file mode 100644
index c3a5ded494..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From dc7a8b3050a2a43f49515a03ae19713dfced75dc Mon Sep 17 00:00:00 2001
-From: David Kalnischkies <david@kalnischkies.de>
-Date: Sat, 18 Nov 2023 13:10:05 +0000
-Subject: [PATCH] Raise cmake_minimum_required to 3.13 to avoid warnings
-
-CMake Deprecation Warning at CMakeLists.txt:6 (cmake_minimum_required):
-  Compatibility with CMake < 3.5 will be removed from a future version of
-  CMake.
-
-  Update the VERSION argument <min> value or use a ...<max> suffix to tell
-  CMake that the project does not need compatibility with older versions.
-
-Picking 3.13 here is a semi-random choice to avoid raising the requirement
-too much needlessly while also hopefully avoiding needing to raise it
-soon again based on the referenced mail.
-
-While we are at it, lets also fix the other spewed warning:
-
-CMake Warning (dev) at CMakeLists.txt:5 (project):
-  cmake_minimum_required() should be called prior to this top-level project()
-  call.  Please see the cmake-commands(7) manual for usage documentation of
-  both commands.
-
-References: https://lists.debian.org/msgid-search/20230617162957.6pklb6632zf4nijc@mail.gaussglocke.de
-
-Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/dc7a8b3050a2a43f49515a03ae19713dfced75dc]
-Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 62182cddf..dae12e7c3 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -2,8 +2,8 @@
- # Licensed under the same terms as APT; i.e. GPL 2 or later.
-
- # set minimum version
-+cmake_minimum_required(VERSION 3.13)
- project(apt)
--cmake_minimum_required(VERSION 3.4.0)
- # Generic header locations
- include_directories(${PROJECT_BINARY_DIR}/include)
-
---
-GitLab
diff --git a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
deleted file mode 100644
index 15b036b90d..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ /dev/null
@@ -1,87 +0,0 @@
-From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Tue, 16 Aug 2022 08:44:18 -0700
-Subject: [PATCH] Remove using std::binary_function
-
-std::binary_function and std::unary_function are deprecated since c++11
-and removed in c++17, therefore remove it and use lambda functions to get same
-functionality implemented.
-
-Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/253]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- ftparchive/apt-ftparchive.cc | 33 ++++++++++-----------------------
- 1 file changed, 10 insertions(+), 23 deletions(-)
-
-diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive.cc
-index 0f6587281..0a253b12b 100644
---- a/ftparchive/apt-ftparchive.cc
-+++ b/ftparchive/apt-ftparchive.cc
-@@ -48,6 +48,11 @@
- using namespace std;
- unsigned Quiet = 0;
- 
-+auto ContentsCompare = [](const auto &a, const auto &b) { return a.ContentsMTime < b.ContentsMTime; };
-+auto DBCompare = [](const auto &a, const auto &b) { return a.BinCacheDB < b.BinCacheDB; };
-+auto SrcDBCompare = [](const auto &a, const auto &b) { return a.SrcCacheDB < b.SrcCacheDB; };
-+
-+
- static struct timeval GetTimevalFromSteadyClock()			/*{{{*/
- {
-    auto const Time = std::chrono::steady_clock::now().time_since_epoch();
-@@ -116,24 +121,6 @@ struct PackageMap
-    bool SrcDone;
-    time_t ContentsMTime;
-    
--   struct ContentsCompare
--   {
--      inline bool operator() (const PackageMap &x,const PackageMap &y)
--      {return x.ContentsMTime < y.ContentsMTime;};
--   };
--    
--   struct DBCompare
--   {
--      inline bool operator() (const PackageMap &x,const PackageMap &y)
--      {return x.BinCacheDB < y.BinCacheDB;};
--   };  
--
--   struct SrcDBCompare
--   {
--      inline bool operator() (const PackageMap &x,const PackageMap &y)
--      {return x.SrcCacheDB < y.SrcCacheDB;};
--   };
--   
-    void GetGeneral(Configuration &Setup,Configuration &Block);
-    bool GenPackages(Configuration &Setup,struct CacheDB::Stats &Stats);
-    bool GenSources(Configuration &Setup,struct CacheDB::Stats &Stats);
-@@ -869,7 +856,7 @@ static bool DoGenerateContents(Configuration &Setup,
-       else
- 	 I->ContentsMTime = A.st_mtime;
-    }
--   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::ContentsCompare());
-+   stable_sort(PkgList.begin(),PkgList.end(),ContentsCompare);
-    
-    /* Now for Contents.. The process here is to do a make-like dependency
-       check. Each contents file is verified to be newer than the package files
-@@ -941,8 +928,8 @@ static bool Generate(CommandLine &CmdL)
-    LoadBinDir(PkgList,Setup);
- 
-    // Sort by cache DB to improve IO locality.
--   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompare());
--   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCompare());
-+   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
-+   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
- 
-    // Generate packages
-    if (_config->FindB("APT::FTPArchive::ContentsOnly", false) == false)
-@@ -993,8 +980,8 @@ static bool Clean(CommandLine &CmdL)
-    LoadBinDir(PkgList,Setup);
- 
-    // Sort by cache DB to improve IO locality.
--   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::DBCompare());
--   stable_sort(PkgList.begin(),PkgList.end(),PackageMap::SrcDBCompare());
-+   stable_sort(PkgList.begin(),PkgList.end(),DBCompare);
-+   stable_sort(PkgList.begin(),PkgList.end(),SrcDBCompare);
- 
-    string CacheDir = Setup.FindDir("Dir::CacheDir");
- 
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 6f4d5b6e72..43ab6a4cd8 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -23,7 +23,7 @@ diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
 index 93effa959..4375781d1 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1210,12 +1210,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 }
        }
     }
@@ -36,7 +36,7 @@ index 93effa959..4375781d1 100644
  }
                                                                          /*}}}*/
  void pkgDPkgPM::StartPtyMagic()						/*{{{*/
-@@ -1741,7 +1735,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+@@ -1752,7 +1746,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
        // support subpressing of triggers processing for special
        // cases like d-i that runs the triggers handling manually
diff --git a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
deleted file mode 100644
index 2c1e617e55..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 26 May 2021 22:12:46 -0700
-Subject: [PATCH] aptwebserver.cc: Include <array>
-
-This helps getting std::array definition
-
-Fixes
-test/interactive-helper/aptwebserver.cc:36:55: error: constexpr variable cannot have non-literal type 'const std::array<std::array<const char *, 2>, 6>'
-   constexpr std::array<std::array<char const *,2>,6> htmlencode = {{
-
-Upstream-Status: Submitted [https://github.com/Debian/apt/pull/133]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
----
- test/interactive-helper/aptwebserver.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/test/interactive-helper/aptwebserver.cc b/test/interactive-helper/aptwebserver.cc
-index f4f8d95..361c7a9 100644
---- a/test/interactive-helper/aptwebserver.cc
-+++ b/test/interactive-helper/aptwebserver.cc
-@@ -23,6 +23,7 @@
- 
- #include <array>
- #include <algorithm>
-+#include <array>
- #include <fstream>
- #include <iostream>
- #include <list>
diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
index 036ce35963..08815a3ec4 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -11,14 +11,14 @@ Fixes
 Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- CMakeLists.txt | 7 -------
- 1 file changed, 7 deletions(-)
+ CMakeLists.txt | 9 ---------
+ 1 file changed, 9 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
 index be157a55f..54163ae6c 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -252,15 +252,6 @@ add_subdirectory(ftparchive)
+@@ -257,15 +257,6 @@ add_subdirectory(ftparchive)
  add_subdirectory(methods)
  add_subdirectory(test)
  
diff --git a/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch
new file mode 100644
index 0000000000..d3c5fe658e
--- /dev/null
+++ b/meta/recipes-devtools/apt/apt/0001-fix-compilation-with-musl.patch
@@ -0,0 +1,49 @@
+From a6b024ceb71c43977838d625f5ac64b7e4815a56 Mon Sep 17 00:00:00 2001
+From: Gyorgy Sarvari <skandigraun@gmail.com>
+Date: Thu, 28 Aug 2025 08:11:58 +0200
+Subject: [PATCH] fix compilation with musl
+
+The basename() function requires the libgen.h header when
+compiling with musl-libc, otherwise it complains:
+
+error: 'basename' was not declared in this scope; did you mean 'rename'?
+
+Also, musl's basename requires char* instead of const char* argument:
+
+error: invalid conversion from 'const char*' to 'char*' [-fpermissive]
+
+The musl implementation of basename modifies the argument only in case
+it is a folder path (it cuts off the trailing slashes). In our case,
+when argv[0] is passed, it is always a filename without a trailing
+slash, so just cast the argument.
+
+Upstream-Status: Submitted [https://salsa.debian.org/apt-team/apt/-/merge_requests/508]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ cmdline/apt-internal-solver.cc | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/cmdline/apt-internal-solver.cc b/cmdline/apt-internal-solver.cc
+index ceedd96c7..74ed38c50 100644
+--- a/cmdline/apt-internal-solver.cc
++++ b/cmdline/apt-internal-solver.cc
+@@ -35,6 +35,7 @@
+ #include <list>
+ #include <sstream>
+ #include <string>
++#include <libgen.h>
+ #include <unistd.h>
+ 
+ #include <apti18n.h>
+@@ -119,7 +120,7 @@ int main(int argc,const char *argv[])					/*{{{*/
+ 		_config->Set("Debug::EDSP::WriteSolution", true);
+ 
+ 	_config->Set("APT::System", "Debian APT solver interface");
+-	if (strcmp(basename(argv[0]), "solver3") == 0)
++	if (strcmp(basename((char*)argv[0]), "solver3") == 0)
+ 	   _config->Set("APT::Solver", "3.0");
+ 	else if (_config->Find("APT::Solver") != "3.0")
+ 	   _config->Set("APT::Solver", "internal");
+-- 
+2.39.5
+
diff --git a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch b/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
deleted file mode 100644
index b86ed8bb92..0000000000
--- a/meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 9da1b0dbdcc90455bc9de49f73a96e7d18f83493 Mon Sep 17 00:00:00 2001
-From: Julian Andres Klode <julian.klode@canonical.com>
-Date: Tue, 18 Feb 2025 10:29:40 +0100
-Subject: [PATCH] strutl: Add missing #include <cstdint> [gcc 15]
-
-Closes: #1096322
-
-Upstream-Status: Backport [https://salsa.debian.org/apt-team/apt/-/commit/f82dcd7e4ebb3f70d28e9feb3621676f8c0cc024]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- apt-pkg/contrib/strutl.cc | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/apt-pkg/contrib/strutl.cc b/apt-pkg/contrib/strutl.cc
-index 67100f1..c0a1cbc 100644
---- a/apt-pkg/contrib/strutl.cc
-+++ b/apt-pkg/contrib/strutl.cc
-@@ -26,6 +26,7 @@
- 
- #include <algorithm>
- #include <array>
-+#include <cstdint>
- #include <iomanip>
- #include <limits>
- #include <locale>
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_3.0.3.bb
similarity index 88%
rename from meta/recipes-devtools/apt/apt_2.6.1.bb
rename to meta/recipes-devtools/apt/apt_3.0.3.bb
index b039599395..03a6869393 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -8,14 +8,9 @@ SECTION = "base"
 SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://triehash \
            file://0001-Disable-documentation-directory-altogether.patch \
-           file://0001-Fix-musl-build.patch \
            file://0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch \
            file://0001-cmake-Do-not-build-po-files.patch \
-           file://0001-aptwebserver.cc-Include-array.patch \
-           file://0001-Remove-using-std-binary_function.patch \
-           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
-           file://0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch \
-           file://0001-Fix-compilation-error-with-clang-libc-18.patch \
+           file://0001-fix-compilation-with-musl.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -28,7 +23,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff0ac6631939ee68fa6fd"
+SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
@@ -47,7 +42,7 @@ USERADD_PARAM:${PN} = "--system --home /nonexistent --no-create-home _apt"
 
 BBCLASSEXTEND = "native nativesdk"
 
-DEPENDS += "db gnutls lz4 zlib bzip2 xz libgcrypt xxhash"
+DEPENDS += "db lz4 zlib bzip2 xz xxhash openssl"
 
 EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DDPKG_DATADIR=${datadir}/dpkg \
@@ -55,8 +50,14 @@ EXTRA_OECMAKE:append = " -DCURRENT_VENDOR=debian -DWITH_DOC=False \
     -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True \
     -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True \
     -DWITH_TESTS=False \
+    -DCOMMON_ARCH=${DPKG_ARCH} \
 "
 
+PACKAGECONFIG ??= ""
+# usrmerge displays a runtime warning during package installation in case 
+# the system doesn't have merged /usr folders.
+PACKAGECONFIG[usrmerge] = "-DREQUIRE_MERGED_USR=ON,-DREQUIRE_MERGED_USR=OFF"
+
 do_configure:prepend() {
 	echo "set( CMAKE_FIND_ROOT_PATH_MODE_INCLUDE BOTH )" >>  ${WORKDIR}/toolchain.cmake
 }

