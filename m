Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6540FCA0EE5
	for <webhook@archiver.kernel.org>; Fri,  1 Aug 2025 14:08:01 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web10.88809.1754057270484144697
 for <openembedded-core@lists.openembedded.org>;
 Fri, 01 Aug 2025 07:07:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=UZQSx1Ui;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fgK7BvP9;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 0101019865f5e27d-6eeb257d-e4d0-4ece-b25c-3032aee623bc-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=7PLW/4CUQ91oqDBDS66D6Sg6INsykByhupCEyNP7ofc=;
	b=UZQSx1Ui7+B9yD2/3A57JkaBgXNcMLhdtr4j9bYRBxl02s1Vb5mxd7a4hipnR5oj
	+8fSJBnQuGOiNI8WSjkjBQP8GJn4bwztgDH+yj4sBawfO2gcZYSclHWEEN9u4N4g4uG
	OhO0b6k+sX0vNJk+ZflGeW6LfRSt+N/vyQUcqy04=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1754057270;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=7PLW/4CUQ91oqDBDS66D6Sg6INsykByhupCEyNP7ofc=;
	b=fgK7BvP9dok/JuQSivYqt8xcVYX615J3X3W0pAtf8Nxj+Ix8OHpzr0GGC54ViRRa
	jfHoqfSfoRb4l9zfsY4MVmh9IlIjuEp8mIgm9dw081XtWE3t8cB9jaGnsmin79PbTd5
	vBwYkiaMVwPeW/QSm9XbsI87YkIbe6aiL+IpLLWc=
Content-Type: multipart/mixed; boundary="===============2908409183049824570=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] apt: upgrading to 3.0.3 FAILED
Message-ID: <0101019865f5e27d-6eeb257d-e4d0-4ece-b25c-3032aee623bc-000000@us-west-2.amazonses.com>
Date: Fri, 1 Aug 2025 14:07:49 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.01-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 01 Aug 2025 14:08:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221267

--===============2908409183049824570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apt* to *3.0.3* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-apt-upgrade-2.6.1-3.0.3.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 2d229a2e664639ee3c2b2d827f231014849634af Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 1 Aug 2025 09:00:21 +0000
Subject: [PATCH] apt: upgrade 2.6.1 -> 3.0.3

---
 ...void-changing-install-paths-based-on.patch |  6 +--
 ...e-documentation-directory-altogether.patch |  7 ++-
 ...-init-tables-from-dpkg-configuration.patch |  7 ++-
 ...compilation-error-with-clang-libc-18.patch | 29 ------------
 .../apt/apt/0001-Fix-musl-build.patch         |  7 +--
 ...mum_required-to-3.13-to-avoid-warnin.patch | 47 -------------------
 ...001-Remove-using-std-binary_function.patch | 10 ++--
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  9 ++--
 .../0001-aptwebserver.cc-Include-array.patch  |  5 +-
 .../0001-cmake-Do-not-build-po-files.patch    | 10 ++--
 ...l-Add-missing-include-cstdint-gcc-15.patch | 26 ----------
 .../apt/{apt_2.6.1.bb => apt_3.0.3.bb}        |  7 ++-
 12 files changed, 30 insertions(+), 140 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Fix-compilation-error-with-clang-libc-18.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
 rename meta/recipes-devtools/apt/{apt_2.6.1.bb => apt_3.0.3.bb} (93%)

diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
index 199f11bf20..6d00e68e23 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -1,4 +1,4 @@
-From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From aedc16a00b28141e99354bba83ddb4befe790cca Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 28 May 2020 15:34:05 +0000
 Subject: [PATCH] CMakeLists.txt: avoid changing install paths based on host
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2cd4f8e..4759812 100644
+index 101fbfb..b0b96a9 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -21,9 +21,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
+@@ -28,9 +28,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
  set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "-lgcov")
  
  # Work around bug in GNUInstallDirs
diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
index 5443ff6caa..6560a9abc2 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
+From 9dffe6d99b3417da0e39c7accedd1e98e0139413 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 14:16:47 +0200
 Subject: [PATCH] Disable documentation directory altogether
@@ -7,16 +7,15 @@ Even when WITH_DOC=False, the build requires po4a to generate manpages.
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 668e2d762..62f441bfa 100644
+index f37b700..101fbfb 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -246,7 +246,7 @@ add_subdirectory(apt-private)
+@@ -251,7 +251,7 @@ add_subdirectory(apt-private)
  endif()
  add_subdirectory(cmdline)
  add_subdirectory(completions)
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 37a3133010..fa61cb9156 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
+From 2308b63e26138a9fc68a6b8f5ca78ff96e4e9c13 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 10 May 2019 16:47:38 +0200
 Subject: [PATCH] Do not init tables from dpkg configuration
@@ -7,16 +7,15 @@ This would require sysroot relocation logic, and it's easier to just disable the
 
 Upstream-Status: Inappropriate [oe-core specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  apt-pkg/init.cc | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/apt-pkg/init.cc b/apt-pkg/init.cc
-index b9d9b15d2..1725c5966 100644
+index 61d45e3..97017d2 100644
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
index 0cefbedd6d..fea6f7404a 100644
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
+From ca9dcbbf08f815d63df2198a2872ce376aff15d7 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 22 May 2020 15:29:23 +0000
 Subject: [PATCH] apt-pkg/contrib/srvrec.h: Explicitly include sys/types.h
@@ -12,7 +12,7 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 1 insertion(+)
 
 diff --git a/apt-pkg/contrib/srvrec.h b/apt-pkg/contrib/srvrec.h
-index e5d0f43..2010184 100644
+index 1e981d3..f4e26f1 100644
 --- a/apt-pkg/contrib/srvrec.h
 +++ b/apt-pkg/contrib/srvrec.h
 @@ -9,6 +9,7 @@
@@ -23,6 +23,3 @@ index e5d0f43..2010184 100644
  #include <string>
  #include <vector>
  #include <arpa/nameser.h>
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
index 15b036b90d..896955ad4d 100644
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -1,4 +1,4 @@
-From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
+From 713b6db7d4e1d59018d7646cc691f9c793d3046f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 16 Aug 2022 08:44:18 -0700
 Subject: [PATCH] Remove using std::binary_function
@@ -14,7 +14,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 10 insertions(+), 23 deletions(-)
 
 diff --git a/ftparchive/apt-ftparchive.cc b/ftparchive/apt-ftparchive.cc
-index 0f6587281..0a253b12b 100644
+index 9c86d18..b877d49 100644
 --- a/ftparchive/apt-ftparchive.cc
 +++ b/ftparchive/apt-ftparchive.cc
 @@ -48,6 +48,11 @@
@@ -54,7 +54,7 @@ index 0f6587281..0a253b12b 100644
     void GetGeneral(Configuration &Setup,Configuration &Block);
     bool GenPackages(Configuration &Setup,struct CacheDB::Stats &Stats);
     bool GenSources(Configuration &Setup,struct CacheDB::Stats &Stats);
-@@ -869,7 +856,7 @@ static bool DoGenerateContents(Configuration &Setup,
+@@ -867,7 +854,7 @@ static bool DoGenerateContents(Configuration &Setup,
        else
  	 I->ContentsMTime = A.st_mtime;
     }
@@ -63,7 +63,7 @@ index 0f6587281..0a253b12b 100644
     
     /* Now for Contents.. The process here is to do a make-like dependency
        check. Each contents file is verified to be newer than the package files
-@@ -941,8 +928,8 @@ static bool Generate(CommandLine &CmdL)
+@@ -939,8 +926,8 @@ static bool Generate(CommandLine &CmdL)
     LoadBinDir(PkgList,Setup);
  
     // Sort by cache DB to improve IO locality.
@@ -74,7 +74,7 @@ index 0f6587281..0a253b12b 100644
  
     // Generate packages
     if (_config->FindB("APT::FTPArchive::ContentsOnly", false) == false)
-@@ -993,8 +980,8 @@ static bool Clean(CommandLine &CmdL)
+@@ -991,8 +978,8 @@ static bool Clean(CommandLine &CmdL)
     LoadBinDir(PkgList,Setup);
  
     // Sort by cache DB to improve IO locality.
diff --git a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
index 6f4d5b6e72..07055a471c 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
+From 2dcc7b59721973eea84d5fea01bf82b476d336f6 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 21 May 2020 20:13:25 +0000
 Subject: [PATCH] Revert "always run 'dpkg --configure -a' at the end of our
@@ -14,16 +14,15 @@ be passed into dpkg, and lead to the below similar error:
 
 Upstream-Status: Inappropriate [embedded specific]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  apt-pkg/deb/dpkgpm.cc | 9 ++-------
  1 file changed, 2 insertions(+), 7 deletions(-)
 
 diff --git a/apt-pkg/deb/dpkgpm.cc b/apt-pkg/deb/dpkgpm.cc
-index 93effa959..4375781d1 100644
+index 09f3e47..58cd80d 100644
 --- a/apt-pkg/deb/dpkgpm.cc
 +++ b/apt-pkg/deb/dpkgpm.cc
-@@ -1199,12 +1199,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
+@@ -1210,12 +1210,6 @@ void pkgDPkgPM::BuildPackagesProgressMap()
  	 }
        }
     }
@@ -36,7 +35,7 @@ index 93effa959..4375781d1 100644
  }
                                                                          /*}}}*/
  void pkgDPkgPM::StartPtyMagic()						/*{{{*/
-@@ -1741,7 +1735,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
+@@ -1752,7 +1746,8 @@ bool pkgDPkgPM::Go(APT::Progress::PackageManager *progress)
  
        // support subpressing of triggers processing for special
        // cases like d-i that runs the triggers handling manually
diff --git a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
index 2c1e617e55..f45d63bd5d 100644
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -1,4 +1,4 @@
-From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
+From bb7dcf7f69a9f4408c97a153f3432d3eb6d94adb Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Wed, 26 May 2021 22:12:46 -0700
 Subject: [PATCH] aptwebserver.cc: Include <array>
@@ -11,13 +11,12 @@ test/interactive-helper/aptwebserver.cc:36:55: error: constexpr variable cannot
 
 Upstream-Status: Submitted [https://github.com/Debian/apt/pull/133]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
 ---
  test/interactive-helper/aptwebserver.cc | 1 +
  1 file changed, 1 insertion(+)
 
 diff --git a/test/interactive-helper/aptwebserver.cc b/test/interactive-helper/aptwebserver.cc
-index f4f8d95..361c7a9 100644
+index e9882ab..d2c7e35 100644
 --- a/test/interactive-helper/aptwebserver.cc
 +++ b/test/interactive-helper/aptwebserver.cc
 @@ -23,6 +23,7 @@
diff --git a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
index 036ce35963..8bf3503767 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -1,4 +1,4 @@
-From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From 4482b6a80e04ed2f7ee72f5f7a7b8dbf4c3d3a56 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Sat, 20 Mar 2021 14:45:18 -0700
 Subject: [PATCH] cmake: Do not build po files
@@ -11,14 +11,14 @@ Fixes
 Upstream-Status: Inappropriate [Cross-compile specific]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
- CMakeLists.txt | 7 -------
- 1 file changed, 7 deletions(-)
+ CMakeLists.txt | 9 ---------
+ 1 file changed, 9 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index be157a55f..54163ae6c 100644
+index b0b96a9..60ae2f4 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -252,15 +252,6 @@ add_subdirectory(ftparchive)
+@@ -257,15 +257,6 @@ add_subdirectory(ftparchive)
  add_subdirectory(methods)
  add_subdirectory(test)
  
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
similarity index 93%
rename from meta/recipes-devtools/apt/apt_2.6.1.bb
rename to meta/recipes-devtools/apt/apt_3.0.3.bb
index b039599395..01e3fbbf97 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -13,9 +13,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
-           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
-           file://0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch \
-           file://0001-Fix-compilation-error-with-clang-libc-18.patch \
+           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
+           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -28,7 +27,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff0ac6631939ee68fa6fd"
+SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.47.1


--===============2908409183049824570==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1935 entries from dependency cache.
Parsing recipes...done.
Parsing of 942 .bb files complete (941 cached, 1 parsed). 1933 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.1"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-3299752b36ab29ff3237c8e85e2c8a234ab775f6"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:3299752b36ab29ff3237c8e85e2c8a234ab775f6"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 292 Local 281 Mirrors 0 Missed 11 Current 499 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 787 of 791 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe apt-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe apt-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1633 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_fetch)
NOTE: recipe apt-3.0.3-r0: task do_fetch: Started
NOTE: recipe apt-3.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2180 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_unpack)
NOTE: Running task 2181 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-3.0.3-r0: task do_unpack: Started
NOTE: recipe apt-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-3.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2196 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_patch)
NOTE: Running task 2197 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_collect_spdx_deps)
NOTE: recipe apt-3.0.3-r0: task do_patch: Started
NOTE: recipe apt-3.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apt-3.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2198 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2199 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_generate_toolchain_file)
NOTE: Running task 2200 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_populate_lic)
NOTE: recipe apt-3.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-3.0.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe apt-3.0.3-r0: task do_populate_lic: Started
NOTE: recipe apt-3.0.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 9aa24d14c3614a0d5c79fe3f26a3b903456ef88e0a923d23871988a46ca2d9e3
NOTE: recipe apt-3.0.3-r0: task do_populate_lic: Succeeded
NOTE: Running task 2201 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_populate_lic unihash changed to d79cb02248e42e8c4053aa99c1e61dcac8a605ae6530b2e334b6adc45571f380
NOTE: Setscene tasks completed
NOTE: recipe apt-3.0.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.0.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/po
 kybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/
 auh/build/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'libidn2', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'attr', 'bash-completion', 'db', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libgcrypt', 'libgpg-error', 'libseccomp', 'libunistring', 'lz4', 'nettle', 'xxhash', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pseudo-native', 'bzip2-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 15.1.0
| -- The CXX compiler identification is GNU 15.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
| -- Detecting CXX compile features
| -- Detecting CXX compile features - done
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD
| -- Performing Test CMAKE_HAVE_LIBC_PTHREAD - Success
| -- Found Threads: TRUE
| -- Looking for native LFS support
| -- Looking for native LFS support - found
| -- Found LFS: TRUE
| -- Looking for iconv_open
| -- Looking for iconv_open - found
| -- Found Iconv: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/include
| -- Found Perl: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot-native/usr/bin/perl-native/perl (found version "5.40.2")
| -- Found Intl: built in to C library
| -- Performing Test have-compiler-flag:-Wall
| -- Performing Test have-compiler-flag:-Wall - Success
| -- Performing Test have-compiler-flag:-Wextra
| -- Performing Test have-compiler-flag:-Wextra - Success
| -- Performing Test have-compiler-flag:-Wcast-align
| -- Performing Test have-compiler-flag:-Wcast-align - Success
| -- Performing Test have-compiler-flag:-Wlogical-op
| -- Performing Test have-compiler-flag:-Wlogical-op - Success
| -- Performing Test have-compiler-flag:-Wredundant-decls
| -- Performing Test have-compiler-flag:-Wredundant-decls - Success
| -- Performing Test have-compiler-flag:-Wmissing-declarations
| -- Performing Test have-compiler-flag:-Wmissing-declarations - Success
| -- Performing Test have-compiler-flag:-Wunsafe-loop-optimizations
| -- Performing Test have-compiler-flag:-Wunsafe-loop-optimizations - Success
| -- Performing Test have-compiler-flag:-Wctor-dtor-privacy
| -- Performing Test have-compiler-flag:-Wctor-dtor-privacy - Success
| -- Performing Test have-compiler-flag:-Wdisabled-optimization
| -- Performing Test have-compiler-flag:-Wdisabled-optimization - Success
| -- Performing Test have-compiler-flag:-Winit-self
| -- Performing Test have-compiler-flag:-Winit-self - Success
| -- Performing Test have-compiler-flag:-Wmissing-include-dirs
| -- Performing Test have-compiler-flag:-Wmissing-include-dirs - Success
| -- Performing Test have-compiler-flag:-Wnoexcept
| -- Performing Test have-compiler-flag:-Wnoexcept - Success
| -- Performing Test have-compiler-flag:-Wsign-promo
| -- Performing Test have-compiler-flag:-Wsign-promo - Success
| -- Performing Test have-compiler-flag:-Wundef
| -- Performing Test have-compiler-flag:-Wundef - Success
| -- Performing Test have-compiler-flag:-Wdouble-promotion
| -- Performing Test have-compiler-flag:-Wdouble-promotion - Success
| -- Performing Test have-compiler-flag:-Wsuggest-override
| -- Performing Test have-compiler-flag:-Wsuggest-override - Success
| -- Performing Test have-compiler-flag:-Werror=suggest-override
| -- Performing Test have-compiler-flag:-Werror=suggest-override - Success
| -- Performing Test have-compiler-flag:-Werror=return-type
| -- Performing Test have-compiler-flag:-Werror=return-type - Success
| -- Performing Test have-compiler-flag:-Wp,-D_GLIBCXX_ASSERTIONS
| -- Performing Test have-compiler-flag:-Wp,-D_GLIBCXX_ASSERTIONS - Success
| -- Found Berkeley: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/include
| -- Found OpenSSL: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot-native/usr/lib/libcrypto.so (found version "3.5.1")
| -- Found ZLIB: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/lib/libz.so (found version "1.3.1")
| -- Found BZip2: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/lib/libbz2.so (found version "1.0.8")
| -- Looking for BZ2_bzCompressInit
| -- Looking for BZ2_bzCompressInit - found
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Found LZMA: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/include
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Found LZ4: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/include
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Could NOT find Udev (missing: UDEV_INCLUDE_DIRS UDEV_LIBRARIES)
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Could NOT find Systemd (missing: SYSTEMD_INCLUDE_DIRS SYSTEMD_LIBRARIES)
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Found XXHASH: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot/usr/include
| -- Looking for statfs
| -- Looking for statfs - found
| -- Looking for include file sys/params.h
| -- Looking for include file sys/params.h - not found
| -- Looking for statfs
| -- Looking for statfs - not found
| -- Looking for statvfs
| -- Looking for statvfs - found
| -- Performing Test HAVE_STRUCT_STATFS_F_TYPE
| -- Performing Test HAVE_STRUCT_STATFS_F_TYPE - Success
| -- Looking for getresuid
| -- Looking for getresuid - found
| -- Looking for getresgid
| -- Looking for getresgid - found
| -- Looking for setresuid
| -- Looking for setresuid - found
| -- Looking for setresgid
| -- Looking for setresgid - found
| -- Looking for ptsname_r
| -- Looking for ptsname_r - found
| -- Looking for timegm
| -- Looking for timegm - found
| -- Looking for include file machine/endian.h
| -- Looking for include file machine/endian.h - not found
| -- Looking for include file sys/endian.h
| -- Looking for include file sys/endian.h - not found
| -- Looking for include file endian.h
| -- Looking for include file endian.h - found
| -- Looking for C++ include sys/types.h
| -- Looking for C++ include sys/types.h - found
| -- Looking for C++ include stdint.h
| -- Looking for C++ include stdint.h - found
| -- Looking for C++ include stddef.h
| -- Looking for C++ include stddef.h - found
| -- Check size of sig_t
| -- Check size of sig_t - done
| -- Check size of sighandler_t
| -- Check size of sighandler_t - done
| -- Looking for res_ninit
| -- Looking for res_ninit - not found
| CMake Error at CMakeLists.txt:218 (execute_process):
|   execute_process failed command indexes:
| 
|     1: "Abnormal exit with child return code: no such file or directory"
| 
| 
| 
| -- Configuring incomplete, errors occurred!
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.1288317:163 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/sources/apt-3.0.3 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/
 x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCURRENT_VENDOR=debian -DWITH_DOC=False -DDPKG_DATADIR=/usr/share/dpkg -DTRIEHASH_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/sources/triehash -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True -DWITH_TESTS=False -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.1288317, line 163
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.1288317, line 142
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.1288317, line 181
NOTE: recipe apt-3.0.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2201 tasks of which 2192 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801090006.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250801090006.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/log.do_configure.1288317
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: apt-3.0.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.1288317' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/log.do_configure.1288317
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure) failed with exit code '1'

--===============2908409183049824570==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-2.6.1-3.0.3.patch"

RnJvbSAyZDIyOWEyZTY2NDYzOWVlM2MyYjJkODI3ZjIzMTAxNDg0OTYzNGFmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMSBBdWcgMjAyNSAwOTowMDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
dDogdXBncmFkZSAyLjYuMSAtPiAzLjAuMwoKLS0tCiAuLi52b2lkLWNoYW5naW5nLWluc3RhbGwt
cGF0aHMtYmFzZWQtb24ucGF0Y2ggfCAgNiArLS0KIC4uLmUtZG9jdW1lbnRhdGlvbi1kaXJlY3Rv
cnktYWx0b2dldGhlci5wYXRjaCB8ICA3ICsrLQogLi4uLWluaXQtdGFibGVzLWZyb20tZHBrZy1j
b25maWd1cmF0aW9uLnBhdGNoIHwgIDcgKystCiAuLi5jb21waWxhdGlvbi1lcnJvci13aXRoLWNs
YW5nLWxpYmMtMTgucGF0Y2ggfCAyOSAtLS0tLS0tLS0tLS0KIC4uLi9hcHQvYXB0LzAwMDEtRml4
LW11c2wtYnVpbGQucGF0Y2ggICAgICAgICB8ICA3ICstLQogLi4ubXVtX3JlcXVpcmVkLXRvLTMu
MTMtdG8tYXZvaWQtd2FybmluLnBhdGNoIHwgNDcgLS0tLS0tLS0tLS0tLS0tLS0tLQogLi4uMDAx
LVJlbW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoIHwgMTAgKystLQogLi4ubi1k
cGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIHwgIDkgKystLQogLi4uLzAw
MDEtYXB0d2Vic2VydmVyLmNjLUluY2x1ZGUtYXJyYXkucGF0Y2ggIHwgIDUgKy0KIC4uLi8wMDAx
LWNtYWtlLURvLW5vdC1idWlsZC1wby1maWxlcy5wYXRjaCAgICB8IDEwICsrLS0KIC4uLmwtQWRk
LW1pc3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaCB8IDI2IC0tLS0tLS0tLS0KIC4u
Li9hcHQve2FwdF8yLjYuMS5iYiA9PiBhcHRfMy4wLjMuYmJ9ICAgICAgICB8ICA3ICsrLQogMTIg
ZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgMTQwIGRlbGV0aW9ucygtKQogZGVsZXRl
IG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRml4LWNvbXBp
bGF0aW9uLWVycm9yLXdpdGgtY2xhbmctbGliYy0xOC5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmFpc2UtY21ha2VfbWluaW11bV9y
ZXF1aXJlZC10by0zLjEzLXRvLWF2b2lkLXdhcm5pbi5wYXRjaAogZGVsZXRlIG1vZGUgMTAwNjQ0
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLUFkZC1taXNzaW5nLWlu
Y2x1ZGUtY3N0ZGludC1nY2MtMTUucGF0Y2gKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YXB0L3thcHRfMi42LjEuYmIgPT4gYXB0XzMuMC4zLmJifSAoOTMlKQoKZGlmZiAtLWdpdCBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtQ01ha2VMaXN0cy50eHQtYXZvaWQtY2hh
bmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9hcHQvYXB0LzAwMDEtQ01ha2VMaXN0cy50eHQtYXZvaWQtY2hhbmdpbmctaW5zdGFsbC1wYXRo
cy1iYXNlZC1vbi5wYXRjaAppbmRleCAxOTlmMTFiZjIwLi42ZDAwZTY4ZTIzIDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUNNYWtlTGlzdHMudHh0LWF2b2lk
LWNoYW5naW5nLWluc3RhbGwtcGF0aHMtYmFzZWQtb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1hdm9pZC1jaGFuZ2luZy1pbnN0
YWxsLXBhdGhzLWJhc2VkLW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5MDIzNTg5MzE3
ODQzZGY0ZTU3ZjhlYmVmMWQ5YTgzOThkZGI5MjlkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSBhZWRjMTZhMDBiMjgxNDFlOTkzNTRiYmE4M2RkYjRiZWZlNzkwY2NhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFp
bC5jb20+CiBEYXRlOiBUaHUsIDI4IE1heSAyMDIwIDE1OjM0OjA1ICswMDAwCiBTdWJqZWN0OiBb
UEFUQ0hdIENNYWtlTGlzdHMudHh0OiBhdm9pZCBjaGFuZ2luZyBpbnN0YWxsIHBhdGhzIGJhc2Vk
IG9uIGhvc3QKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2Fu
YXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRp
b25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9D
TWFrZUxpc3RzLnR4dAotaW5kZXggMmNkNGY4ZS4uNDc1OTgxMiAxMDA2NDQKK2luZGV4IDEwMWZi
ZmIuLmIwYjk2YTkgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01ha2VMaXN0
cy50eHQKLUBAIC0yMSw5ICsyMSw5IEBAIHNldChDTUFLRV9FWEVfTElOS0VSX0ZMQUdTX0NPVkVS
QUdFICItbGdjb3YiKQorQEAgLTI4LDkgKzI4LDkgQEAgc2V0KENNQUtFX0VYRV9MSU5LRVJfRkxB
R1NfQ09WRVJBR0UgIi1sZ2NvdiIpCiAgc2V0KENNQUtFX1NIQVJFRF9MSU5LRVJfRkxBR1NfQ09W
RVJBR0UgIi1sZ2NvdiIpCiAgCiAgIyBXb3JrIGFyb3VuZCBidWcgaW4gR05VSW5zdGFsbERpcnMK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRGlzYWJsZS1k
b2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2FwdC9hcHQvMDAwMS1EaXNhYmxlLWRvY3VtZW50YXRpb24tZGlyZWN0b3J5LWFsdG9n
ZXRoZXIucGF0Y2gKaW5kZXggNTQ0M2ZmNmNhYS4uNjU2MGE5YWJjMiAxMDA2NDQKLS0tIGEvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1EaXNhYmxlLWRvY3VtZW50YXRpb24tZGly
ZWN0b3J5LWFsdG9nZXRoZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9h
cHQvMDAwMS1EaXNhYmxlLWRvY3VtZW50YXRpb24tZGlyZWN0b3J5LWFsdG9nZXRoZXIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGY2MjlkMWMzZmNmYjU2MGVkMjRlZmMzZTczZDRlNDk5OWIx
ZWFiMzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDlkZmZlNmQ5OWIzNDE3ZGEwZTM5
YzdhY2NlZGQxZTk4ZTAxMzk0MTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMTAgTWF5
IDIwMTkgMTQ6MTY6NDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRGlzYWJsZSBkb2N1bWVudGF0
aW9uIGRpcmVjdG9yeSBhbHRvZ2V0aGVyCkBAIC03LDE2ICs3LDE1IEBAIEV2ZW4gd2hlbiBXSVRI
X0RPQz1GYWxzZSwgdGhlIGJ1aWxkIHJlcXVpcmVzIHBvNGEgdG8gZ2VuZXJhdGUgbWFucGFnZXMu
CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgot
CiAtLS0KICBDTWFrZUxpc3RzLnR4dCB8IDIgKy0KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01h
a2VMaXN0cy50eHQKLWluZGV4IDY2OGUyZDc2Mi4uNjJmNDQxYmZhIDEwMDY0NAoraW5kZXggZjM3
YjcwMC4uMTAxZmJmYiAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxp
c3RzLnR4dAotQEAgLTI0Niw3ICsyNDYsNyBAQCBhZGRfc3ViZGlyZWN0b3J5KGFwdC1wcml2YXRl
KQorQEAgLTI1MSw3ICsyNTEsNyBAQCBhZGRfc3ViZGlyZWN0b3J5KGFwdC1wcml2YXRlKQogIGVu
ZGlmKCkKICBhZGRfc3ViZGlyZWN0b3J5KGNtZGxpbmUpCiAgYWRkX3N1YmRpcmVjdG9yeShjb21w
bGV0aW9ucykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEt
RG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtn
LWNvbmZpZ3VyYXRpb24ucGF0Y2gKaW5kZXggMzdhMzEzMzAxMC4uZmE2MWNiOTE1NiAxMDA2NDQK
LS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJs
ZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRp
b24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4NDI4MGZlYzRlMWQwZDMzZWNhNzhlNzY1
NTYwMjNmOGY4ZmU1YjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDIzMDhiNjNlMjYx
MzhhOWZjNjhhNmI4ZjVjYTc4ZmY5NmU0ZTljMTMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBG
cm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZy
aSwgMTAgTWF5IDIwMTkgMTY6NDc6MzggKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gRG8gbm90IGlu
aXQgdGFibGVzIGZyb20gZHBrZyBjb25maWd1cmF0aW9uCkBAIC03LDE2ICs3LDE1IEBAIFRoaXMg
d291bGQgcmVxdWlyZSBzeXNyb290IHJlbG9jYXRpb24gbG9naWMsIGFuZCBpdCdzIGVhc2llciB0
byBqdXN0IGRpc2FibGUgdGhlCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ut
Y29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBhcHQtcGtnL2luaXQuY2MgfCA0ICsrLS0KICAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvYXB0LXBrZy9pbml0LmNjIGIvYXB0LXBrZy9pbml0LmNjCi1pbmRleCBiOWQ5YjE1ZDIuLjE3
MjVjNTk2NiAxMDA2NDQKK2luZGV4IDYxZDQ1ZTMuLjk3MDE3ZDIgMTAwNjQ0CiAtLS0gYS9hcHQt
cGtnL2luaXQuY2MKICsrKyBiL2FwdC1wa2cvaW5pdC5jYwotQEAgLTI4MSw4ICsyODEsOCBAQCBi
b29sIHBrZ0luaXRTeXN0ZW0oQ29uZmlndXJhdGlvbiAmQ25mLHBrZ1N5c3RlbSAqJlN5cykKK0BA
IC0yOTUsOCArMjk1LDggQEAgYm9vbCBwa2dJbml0U3lzdGVtKENvbmZpZ3VyYXRpb24gJkNuZixw
a2dTeXN0ZW0gKiZTeXMpCiAgCSByZXR1cm4gX2Vycm9yLT5FcnJvcihfKCJVbmFibGUgdG8gZGV0
ZXJtaW5lIGEgc3VpdGFibGUgcGFja2FnaW5nIHN5c3RlbSB0eXBlIikpOwogICAgIH0KICAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRml4LWNvbXBpbGF0
aW9uLWVycm9yLXdpdGgtY2xhbmctbGliYy0xOC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9hcHQvYXB0LzAwMDEtRml4LWNvbXBpbGF0aW9uLWVycm9yLXdpdGgtY2xhbmctbGliYy0xOC5w
YXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggZTU1MjA1Y2EzZi4uMDAwMDAwMDAw
MAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1jb21waWxhdGlv
bi1lcnJvci13aXRoLWNsYW5nLWxpYmMtMTgucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyOSAr
MCwwIEBACi1Gcm9tIGI0NDg4NTgzNDI0YjMzZjUxY2IwMzE1NjJhOWU4ZGY4MjBmZmRhMjMgTW9u
IFNlcCAxNyAwMDowMDowMCAyMDAxCi1Gcm9tOiBDaG9uZ3l1biBMZWUgPGxpY3kxODNAdGVybXV4
LmRldj4KLURhdGU6IFRodSwgMTUgQXVnIDIwMjQgMjE6MzE6MjQgKzA4MDAKLVN1YmplY3Q6IFtQ
QVRDSF0gRml4IGNvbXBpbGF0aW9uIGVycm9yIHdpdGggY2xhbmcvbGliYysrIDE4Ci0KLVVwc3Ry
ZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc2Fsc2EuZGViaWFuLm9yZy9hcHQtdGVhbS9h
cHQvLS9jb21taXQvYjQ0ODg1ODM0MjRiMzNmNTFjYjAzMTU2MmE5ZThkZjgyMGZmZGEyM10KLVNp
Z25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBhcHQtcGtn
L2NhY2hlc2V0LmggfCA0ICsrLS0KLSAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQotCi1kaWZmIC0tZ2l0IGEvYXB0LXBrZy9jYWNoZXNldC5oIGIvYXB0LXBr
Zy9jYWNoZXNldC5oCi1pbmRleCA1ZGJiOWJmMDguLjFjNjdhNjVkNiAxMDA2NDQKLS0tLSBhL2Fw
dC1wa2cvY2FjaGVzZXQuaAotKysrIGIvYXB0LXBrZy9jYWNoZXNldC5oCi1AQCAtMjE4LDExICsy
MTgsMTEgQEAgcHVibGljOgotIAlvcGVyYXRvciBjb250YWluZXJfaXRlcmF0b3Iodm9pZCkgY29u
c3QgeyByZXR1cm4gX2l0ZXI7IH0KLSAJaW5saW5lIGl0ZXJhdG9yX3R5cGUmIG9wZXJhdG9yKyso
KSB7ICsrX2l0ZXI7IHJldHVybiBzdGF0aWNfY2FzdDxpdGVyYXRvcl90eXBlJj4oKnRoaXMpOyB9
Ci0gCWlubGluZSBpdGVyYXRvcl90eXBlIG9wZXJhdG9yKysoaW50KSB7IGl0ZXJhdG9yX3R5cGUg
dG1wKCp0aGlzKTsgb3BlcmF0b3IrKygpOyByZXR1cm4gdG1wOyB9Ci0tCWlubGluZSBpdGVyYXRv
cl90eXBlIG9wZXJhdG9yKyh0eXBlbmFtZSBjb250YWluZXJfaXRlcmF0b3I6OmRpZmZlcmVuY2Vf
dHlwZSBjb25zdCAmbikgeyByZXR1cm4gaXRlcmF0b3JfdHlwZShfaXRlciArIG4pOyB9Ci0rCWlu
bGluZSBpdGVyYXRvcl90eXBlIG9wZXJhdG9yKyh0eXBlbmFtZSBjb250YWluZXJfaXRlcmF0b3I6
OmRpZmZlcmVuY2VfdHlwZSBjb25zdCAmbikgY29uc3QgeyByZXR1cm4gaXRlcmF0b3JfdHlwZShf
aXRlciArIG4pOyB9Ci0gCWlubGluZSBpdGVyYXRvcl90eXBlIG9wZXJhdG9yKz0odHlwZW5hbWUg
Y29udGFpbmVyX2l0ZXJhdG9yOjpkaWZmZXJlbmNlX3R5cGUgY29uc3QgJm4pIHsgX2l0ZXIgKz0g
bjsgcmV0dXJuIHN0YXRpY19jYXN0PGl0ZXJhdG9yX3R5cGUmPigqdGhpcyk7IH0KLSAJaW5saW5l
IGl0ZXJhdG9yX3R5cGUmIG9wZXJhdG9yLS0oKSB7IC0tX2l0ZXI7OyByZXR1cm4gc3RhdGljX2Nh
c3Q8aXRlcmF0b3JfdHlwZSY+KCp0aGlzKTsgfQotIAlpbmxpbmUgaXRlcmF0b3JfdHlwZSBvcGVy
YXRvci0tKGludCkgeyBpdGVyYXRvcl90eXBlIHRtcCgqdGhpcyk7IG9wZXJhdG9yLS0oKTsgcmV0
dXJuIHRtcDsgfQotLQlpbmxpbmUgaXRlcmF0b3JfdHlwZSBvcGVyYXRvci0odHlwZW5hbWUgY29u
dGFpbmVyX2l0ZXJhdG9yOjpkaWZmZXJlbmNlX3R5cGUgY29uc3QgJm4pIHsgcmV0dXJuIGl0ZXJh
dG9yX3R5cGUoX2l0ZXIgLSBuKTsgfQotKwlpbmxpbmUgaXRlcmF0b3JfdHlwZSBvcGVyYXRvci0o
dHlwZW5hbWUgY29udGFpbmVyX2l0ZXJhdG9yOjpkaWZmZXJlbmNlX3R5cGUgY29uc3QgJm4pIGNv
bnN0IHsgcmV0dXJuIGl0ZXJhdG9yX3R5cGUoX2l0ZXIgLSBuKTsgfQotIAlpbmxpbmUgdHlwZW5h
bWUgY29udGFpbmVyX2l0ZXJhdG9yOjpkaWZmZXJlbmNlX3R5cGUgb3BlcmF0b3ItKGl0ZXJhdG9y
X3R5cGUgY29uc3QgJmIpIHsgcmV0dXJuIChfaXRlciAtIGIuX2l0ZXIpOyB9Ci0gCWlubGluZSBp
dGVyYXRvcl90eXBlIG9wZXJhdG9yLT0odHlwZW5hbWUgY29udGFpbmVyX2l0ZXJhdG9yOjpkaWZm
ZXJlbmNlX3R5cGUgY29uc3QgJm4pIHsgX2l0ZXIgLT0gbjsgcmV0dXJuIHN0YXRpY19jYXN0PGl0
ZXJhdG9yX3R5cGUmPigqdGhpcyk7IH0KLSAJaW5saW5lIGJvb2wgb3BlcmF0b3IhPShpdGVyYXRv
cl90eXBlIGNvbnN0ICZpKSBjb25zdCB7IHJldHVybiBfaXRlciAhPSBpLl9pdGVyOyB9CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1tdXNsLWJ1aWxk
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtbXVzbC1idWls
ZC5wYXRjaAppbmRleCAwY2VmYmVkZDZkLi5mZWE2Zjc0MDRhIDEwMDY0NAotLS0gYS9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1tdXNsLWJ1aWxkLnBhdGNoCisrKyBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRml4LW11c2wtYnVpbGQucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDZiODU0NzE2MWI5MDJiMDFiNjM5ZDA1YTRjZGY4NDlkNzY5NDU1
NmYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGNhOWRjYmJmMDhmODE1ZDYzZGYyMTk4
YTI4NzJjZTM3NmFmZjE1ZDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5k
ZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IEZyaSwgMjIgTWF5IDIw
MjAgMTU6Mjk6MjMgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gYXB0LXBrZy9jb250cmliL3NydnJl
Yy5oOiBFeHBsaWNpdGx5IGluY2x1ZGUgc3lzL3R5cGVzLmgKQEAgLTEyLDcgKzEyLDcgQEAgU2ln
bmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS9hcHQtcGtnL2Nv
bnRyaWIvc3J2cmVjLmggYi9hcHQtcGtnL2NvbnRyaWIvc3J2cmVjLmgKLWluZGV4IGU1ZDBmNDMu
LjIwMTAxODQgMTAwNjQ0CitpbmRleCAxZTk4MWQzLi5mNGUyNmYxIDEwMDY0NAogLS0tIGEvYXB0
LXBrZy9jb250cmliL3NydnJlYy5oCiArKysgYi9hcHQtcGtnL2NvbnRyaWIvc3J2cmVjLmgKIEBA
IC05LDYgKzksNyBAQApAQCAtMjMsNiArMjMsMyBAQCBpbmRleCBlNWQwZjQzLi4yMDEwMTg0IDEw
MDY0NAogICNpbmNsdWRlIDxzdHJpbmc+CiAgI2luY2x1ZGUgPHZlY3Rvcj4KICAjaW5jbHVkZSA8
YXJwYS9uYW1lc2VyLmg+Ci0tLSAKLTIuMjAuMQotCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJhaXNlLWNtYWtlX21pbmltdW1fcmVxdWlyZWQtdG8tMy4x
My10by1hdm9pZC13YXJuaW4ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8w
MDAxLVJhaXNlLWNtYWtlX21pbmltdW1fcmVxdWlyZWQtdG8tMy4xMy10by1hdm9pZC13YXJuaW4u
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGMzYTVkZWQ0OTQuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SYWlzZS1jbWFrZV9t
aW5pbXVtX3JlcXVpcmVkLXRvLTMuMTMtdG8tYXZvaWQtd2FybmluLnBhdGNoCisrKyAvZGV2L251
bGwKQEAgLTEsNDcgKzAsMCBAQAotRnJvbSBkYzdhOGIzMDUwYTJhNDNmNDk1MTVhMDNhZTE5NzEz
ZGZjZWQ3NWRjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogRGF2aWQgS2FsbmlzY2hr
aWVzIDxkYXZpZEBrYWxuaXNjaGtpZXMuZGU+Ci1EYXRlOiBTYXQsIDE4IE5vdiAyMDIzIDEzOjEw
OjA1ICswMDAwCi1TdWJqZWN0OiBbUEFUQ0hdIFJhaXNlIGNtYWtlX21pbmltdW1fcmVxdWlyZWQg
dG8gMy4xMyB0byBhdm9pZCB3YXJuaW5ncwotCi1DTWFrZSBEZXByZWNhdGlvbiBXYXJuaW5nIGF0
IENNYWtlTGlzdHMudHh0OjYgKGNtYWtlX21pbmltdW1fcmVxdWlyZWQpOgotICBDb21wYXRpYmls
aXR5IHdpdGggQ01ha2UgPCAzLjUgd2lsbCBiZSByZW1vdmVkIGZyb20gYSBmdXR1cmUgdmVyc2lv
biBvZgotICBDTWFrZS4KLQotICBVcGRhdGUgdGhlIFZFUlNJT04gYXJndW1lbnQgPG1pbj4gdmFs
dWUgb3IgdXNlIGEgLi4uPG1heD4gc3VmZml4IHRvIHRlbGwKLSAgQ01ha2UgdGhhdCB0aGUgcHJv
amVjdCBkb2VzIG5vdCBuZWVkIGNvbXBhdGliaWxpdHkgd2l0aCBvbGRlciB2ZXJzaW9ucy4KLQot
UGlja2luZyAzLjEzIGhlcmUgaXMgYSBzZW1pLXJhbmRvbSBjaG9pY2UgdG8gYXZvaWQgcmFpc2lu
ZyB0aGUgcmVxdWlyZW1lbnQKLXRvbyBtdWNoIG5lZWRsZXNzbHkgd2hpbGUgYWxzbyBob3BlZnVs
bHkgYXZvaWRpbmcgbmVlZGluZyB0byByYWlzZSBpdAotc29vbiBhZ2FpbiBiYXNlZCBvbiB0aGUg
cmVmZXJlbmNlZCBtYWlsLgotCi1XaGlsZSB3ZSBhcmUgYXQgaXQsIGxldHMgYWxzbyBmaXggdGhl
IG90aGVyIHNwZXdlZCB3YXJuaW5nOgotCi1DTWFrZSBXYXJuaW5nIChkZXYpIGF0IENNYWtlTGlz
dHMudHh0OjUgKHByb2plY3QpOgotICBjbWFrZV9taW5pbXVtX3JlcXVpcmVkKCkgc2hvdWxkIGJl
IGNhbGxlZCBwcmlvciB0byB0aGlzIHRvcC1sZXZlbCBwcm9qZWN0KCkKLSAgY2FsbC4gIFBsZWFz
ZSBzZWUgdGhlIGNtYWtlLWNvbW1hbmRzKDcpIG1hbnVhbCBmb3IgdXNhZ2UgZG9jdW1lbnRhdGlv
biBvZgotICBib3RoIGNvbW1hbmRzLgotCi1SZWZlcmVuY2VzOiBodHRwczovL2xpc3RzLmRlYmlh
bi5vcmcvbXNnaWQtc2VhcmNoLzIwMjMwNjE3MTYyOTU3LjZwa2xiNjYzMnpmNG5pamNAbWFpbC5n
YXVzc2dsb2NrZS5kZQotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3NhbHNh
LmRlYmlhbi5vcmcvYXB0LXRlYW0vYXB0Ly0vY29tbWl0L2RjN2E4YjMwNTBhMmE0M2Y0OTUxNWEw
M2FlMTk3MTNkZmNlZDc1ZGNdCi1TaWduZWQtb2ZmLWJ5OiBNb3JpdHogSGFhc2UgPE1vcml0ei5I
YWFzZUBibXcuZGU+Ci0tLS0KLSBDTWFrZUxpc3RzLnR4dCB8IDIgKy0KLSAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKLQotZGlmZiAtLWdpdCBhL0NNYWtlTGlz
dHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDYyMTgyY2RkZi4uZGFlMTJlN2MzIDEwMDY0
NAotLS0tIGEvQ01ha2VMaXN0cy50eHQKLSsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtMiw4ICsy
LDggQEAKLSAjIExpY2Vuc2VkIHVuZGVyIHRoZSBzYW1lIHRlcm1zIGFzIEFQVDsgaS5lLiBHUEwg
MiBvciBsYXRlci4KLQotICMgc2V0IG1pbmltdW0gdmVyc2lvbgotK2NtYWtlX21pbmltdW1fcmVx
dWlyZWQoVkVSU0lPTiAzLjEzKQotIHByb2plY3QoYXB0KQotLWNtYWtlX21pbmltdW1fcmVxdWly
ZWQoVkVSU0lPTiAzLjQuMCkKLSAjIEdlbmVyaWMgaGVhZGVyIGxvY2F0aW9ucwotIGluY2x1ZGVf
ZGlyZWN0b3JpZXMoJHtQUk9KRUNUX0JJTkFSWV9ESVJ9L2luY2x1ZGUpCi0KLS0tCi1HaXRMYWIK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmVtb3ZlLXVz
aW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0
L2FwdC8wMDAxLVJlbW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoCmluZGV4IDE1
YjAzNmI5MGQuLjg5Njk1NWFkNGQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9h
cHQvYXB0LzAwMDEtUmVtb3ZlLXVzaW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZW1vdmUtdXNpbmctc3RkLWJpbmFy
eV9mdW5jdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTkxZmIwNjE4Y2UwYTVkNDJm
MjM5ZDBmY2E2MDI1NDQ4NThmMDgxOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNzEz
YjZkYjdkNGUxZDU5MDE4ZDc2NDZjYzY5MWY5Yzc5M2QzMDQ2ZiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE2
IEF1ZyAyMDIyIDA4OjQ0OjE4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSB1c2luZyBz
dGQ6OmJpbmFyeV9mdW5jdGlvbgpAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25z
KCspLCAyMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2Z0cGFyY2hpdmUvYXB0LWZ0cGFy
Y2hpdmUuY2MgYi9mdHBhcmNoaXZlL2FwdC1mdHBhcmNoaXZlLmNjCi1pbmRleCAwZjY1ODcyODEu
LjBhMjUzYjEyYiAxMDA2NDQKK2luZGV4IDljODZkMTguLmI4NzdkNDkgMTAwNjQ0CiAtLS0gYS9m
dHBhcmNoaXZlL2FwdC1mdHBhcmNoaXZlLmNjCiArKysgYi9mdHBhcmNoaXZlL2FwdC1mdHBhcmNo
aXZlLmNjCiBAQCAtNDgsNiArNDgsMTEgQEAKQEAgLTU0LDcgKzU0LDcgQEAgaW5kZXggMGY2NTg3
MjgxLi4wYTI1M2IxMmIgMTAwNjQ0CiAgICAgdm9pZCBHZXRHZW5lcmFsKENvbmZpZ3VyYXRpb24g
JlNldHVwLENvbmZpZ3VyYXRpb24gJkJsb2NrKTsKICAgICBib29sIEdlblBhY2thZ2VzKENvbmZp
Z3VyYXRpb24gJlNldHVwLHN0cnVjdCBDYWNoZURCOjpTdGF0cyAmU3RhdHMpOwogICAgIGJvb2wg
R2VuU291cmNlcyhDb25maWd1cmF0aW9uICZTZXR1cCxzdHJ1Y3QgQ2FjaGVEQjo6U3RhdHMgJlN0
YXRzKTsKLUBAIC04NjksNyArODU2LDcgQEAgc3RhdGljIGJvb2wgRG9HZW5lcmF0ZUNvbnRlbnRz
KENvbmZpZ3VyYXRpb24gJlNldHVwLAorQEAgLTg2Nyw3ICs4NTQsNyBAQCBzdGF0aWMgYm9vbCBE
b0dlbmVyYXRlQ29udGVudHMoQ29uZmlndXJhdGlvbiAmU2V0dXAsCiAgICAgICAgZWxzZQogIAkg
SS0+Q29udGVudHNNVGltZSA9IEEuc3RfbXRpbWU7CiAgICAgfQpAQCAtNjMsNyArNjMsNyBAQCBp
bmRleCAwZjY1ODcyODEuLjBhMjUzYjEyYiAxMDA2NDQKICAgICAKICAgICAvKiBOb3cgZm9yIENv
bnRlbnRzLi4gVGhlIHByb2Nlc3MgaGVyZSBpcyB0byBkbyBhIG1ha2UtbGlrZSBkZXBlbmRlbmN5
CiAgICAgICAgY2hlY2suIEVhY2ggY29udGVudHMgZmlsZSBpcyB2ZXJpZmllZCB0byBiZSBuZXdl
ciB0aGFuIHRoZSBwYWNrYWdlIGZpbGVzCi1AQCAtOTQxLDggKzkyOCw4IEBAIHN0YXRpYyBib29s
IEdlbmVyYXRlKENvbW1hbmRMaW5lICZDbWRMKQorQEAgLTkzOSw4ICs5MjYsOCBAQCBzdGF0aWMg
Ym9vbCBHZW5lcmF0ZShDb21tYW5kTGluZSAmQ21kTCkKICAgICBMb2FkQmluRGlyKFBrZ0xpc3Qs
U2V0dXApOwogIAogICAgIC8vIFNvcnQgYnkgY2FjaGUgREIgdG8gaW1wcm92ZSBJTyBsb2NhbGl0
eS4KQEAgLTc0LDcgKzc0LDcgQEAgaW5kZXggMGY2NTg3MjgxLi4wYTI1M2IxMmIgMTAwNjQ0CiAg
CiAgICAgLy8gR2VuZXJhdGUgcGFja2FnZXMKICAgICBpZiAoX2NvbmZpZy0+RmluZEIoIkFQVDo6
RlRQQXJjaGl2ZTo6Q29udGVudHNPbmx5IiwgZmFsc2UpID09IGZhbHNlKQotQEAgLTk5Myw4ICs5
ODAsOCBAQCBzdGF0aWMgYm9vbCBDbGVhbihDb21tYW5kTGluZSAmQ21kTCkKK0BAIC05OTEsOCAr
OTc4LDggQEAgc3RhdGljIGJvb2wgQ2xlYW4oQ29tbWFuZExpbmUgJkNtZEwpCiAgICAgTG9hZEJp
bkRpcihQa2dMaXN0LFNldHVwKTsKICAKICAgICAvLyBTb3J0IGJ5IGNhY2hlIERCIHRvIGltcHJv
dmUgSU8gbG9jYWxpdHkuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2Fw
dC8wMDAxLVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1v
dXIucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJldmVydC1hbHdh
eXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2gKaW5kZXggNmY0
ZDViNmU3Mi4uMDcwNTVhNDcxYyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Fw
dC9hcHQvMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQt
b2Ytb3VyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmV2
ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaApA
QCAtMSw0ICsxLDQgQEAKLUZyb20gYTJkZDY2MTQ4NDUzNjQ5MmI0N2Q0Yzg4OTk4ZjJiZjUxNjc0
OWJjOCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMmRjYzdiNTk3MjE5NzNlZWE4NGQ1
ZmVhMDFiZjgyYjQ3NmQzMzZmNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhh
bmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMSBNYXkg
MjAyMCAyMDoxMzoyNSArMDAwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgImFsd2F5cyBydW4g
J2Rwa2cgLS1jb25maWd1cmUgLWEnIGF0IHRoZSBlbmQgb2Ygb3VyCkBAIC0xNCwxNiArMTQsMTUg
QEAgYmUgcGFzc2VkIGludG8gZHBrZywgYW5kIGxlYWQgdG8gdGhlIGJlbG93IHNpbWlsYXIgZXJy
b3I6CiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNd
CiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNv
bT4KLQogLS0tCiAgYXB0LXBrZy9kZWIvZHBrZ3BtLmNjIHwgOSArKy0tLS0tLS0KICAxIGZpbGUg
Y2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
YXB0LXBrZy9kZWIvZHBrZ3BtLmNjIGIvYXB0LXBrZy9kZWIvZHBrZ3BtLmNjCi1pbmRleCA5M2Vm
ZmE5NTkuLjQzNzU3ODFkMSAxMDA2NDQKK2luZGV4IDA5ZjNlNDcuLjU4Y2Q4MGQgMTAwNjQ0CiAt
LS0gYS9hcHQtcGtnL2RlYi9kcGtncG0uY2MKICsrKyBiL2FwdC1wa2cvZGViL2Rwa2dwbS5jYwot
QEAgLTExOTksMTIgKzExOTksNiBAQCB2b2lkIHBrZ0RQa2dQTTo6QnVpbGRQYWNrYWdlc1Byb2dy
ZXNzTWFwKCkKK0BAIC0xMjEwLDEyICsxMjEwLDYgQEAgdm9pZCBwa2dEUGtnUE06OkJ1aWxkUGFj
a2FnZXNQcm9ncmVzc01hcCgpCiAgCSB9CiAgICAgICAgfQogICAgIH0KQEAgLTM2LDcgKzM1LDcg
QEAgaW5kZXggOTNlZmZhOTU5Li40Mzc1NzgxZDEgMTAwNjQ0CiAgfQogICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC8qfX19Ki8KICB2b2lkIHBrZ0RQa2dQTTo6U3RhcnRQdHlNYWdpYygpCQkJCQkJLyp7e3sqLwot
QEAgLTE3NDEsNyArMTczNSw4IEBAIGJvb2wgcGtnRFBrZ1BNOjpHbyhBUFQ6OlByb2dyZXNzOjpQ
YWNrYWdlTWFuYWdlciAqcHJvZ3Jlc3MpCitAQCAtMTc1Miw3ICsxNzQ2LDggQEAgYm9vbCBwa2dE
UGtnUE06OkdvKEFQVDo6UHJvZ3Jlc3M6OlBhY2thZ2VNYW5hZ2VyICpwcm9ncmVzcykKICAKICAg
ICAgICAvLyBzdXBwb3J0IHN1YnByZXNzaW5nIG9mIHRyaWdnZXJzIHByb2Nlc3NpbmcgZm9yIHNw
ZWNpYWwKICAgICAgICAvLyBjYXNlcyBsaWtlIGQtaSB0aGF0IHJ1bnMgdGhlIHRyaWdnZXJzIGhh
bmRsaW5nIG1hbnVhbGx5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2Fw
dC8wMDAxLWFwdHdlYnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJheS5wYXRj
aAppbmRleCAyYzFlNjE3ZTU1Li5mNDVkNjNiZDVkIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWFwdHdlYnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtYXB0d2Vic2VydmVyLmNj
LUluY2x1ZGUtYXJyYXkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU5ODVmMzY2NzUwYTcz
YzgxYzdkODY4OTNhMmI5NTliNGFmMDYyYTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGJiN2RjZjdmNjlhOWY0NDA4Yzk3YTE1M2YzNDMyZDNlYjZkOTRhZGIgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2Vk
LCAyNiBNYXkgMjAyMSAyMjoxMjo0NiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBhcHR3ZWJzZXJ2
ZXIuY2M6IEluY2x1ZGUgPGFycmF5PgpAQCAtMTEsMTMgKzExLDEyIEBAIHRlc3QvaW50ZXJhY3Rp
dmUtaGVscGVyL2FwdHdlYnNlcnZlci5jYzozNjo1NTogZXJyb3I6IGNvbnN0ZXhwciB2YXJpYWJs
ZSBjYW5ub3QKIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNv
bS9EZWJpYW4vYXB0L3B1bGwvMTMzXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KLQogLS0tCiAgdGVzdC9pbnRlcmFjdGl2ZS1oZWxwZXIvYXB0d2Vic2VydmVy
LmNjIHwgMSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQg
YS90ZXN0L2ludGVyYWN0aXZlLWhlbHBlci9hcHR3ZWJzZXJ2ZXIuY2MgYi90ZXN0L2ludGVyYWN0
aXZlLWhlbHBlci9hcHR3ZWJzZXJ2ZXIuY2MKLWluZGV4IGY0ZjhkOTUuLjM2MWM3YTkgMTAwNjQ0
CitpbmRleCBlOTg4MmFiLi5kMmM3ZTM1IDEwMDY0NAogLS0tIGEvdGVzdC9pbnRlcmFjdGl2ZS1o
ZWxwZXIvYXB0d2Vic2VydmVyLmNjCiArKysgYi90ZXN0L2ludGVyYWN0aXZlLWhlbHBlci9hcHR3
ZWJzZXJ2ZXIuY2MKIEBAIC0yMyw2ICsyMyw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWlsZC1wby1maWxlcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtY21ha2UtRG8tbm90LWJ1aWxkLXBv
LWZpbGVzLnBhdGNoCmluZGV4IDAzNmNlMzU5NjMuLjhiZjM1MDM3NjcgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtY21ha2UtRG8tbm90LWJ1aWxkLXBvLWZp
bGVzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtY21ha2Ut
RG8tbm90LWJ1aWxkLXBvLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMzM0N2Y5
ZjgzMDE2MzNiMDFhZjRlMjA4YjdiZTVmZGZjYjBkZjBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSA0NDgyYjZhODBlMDRlZDJmN2VlNzJmNWY3YTdiOGRiZjRjM2QzYTU2IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IFNhdCwgMjAgTWFyIDIwMjEgMTQ6NDU6MTggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY21h
a2U6IERvIG5vdCBidWlsZCBwbyBmaWxlcwpAQCAtMTEsMTQgKzExLDE0IEBAIEZpeGVzCiBVcHN0
cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW0Nyb3NzLWNvbXBpbGUgc3BlY2lmaWNdCiBTaWdu
ZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLS0tCi0gQ01ha2VMaXN0
cy50eHQgfCA3IC0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKKyBDTWFr
ZUxpc3RzLnR4dCB8IDkgLS0tLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCBi
ZTE1N2E1NWYuLjU0MTYzYWU2YyAxMDA2NDQKK2luZGV4IGIwYjk2YTkuLjYwYWUyZjQgMTAwNjQ0
CiAtLS0gYS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01ha2VMaXN0cy50eHQKLUBAIC0yNTIsMTUg
KzI1Miw2IEBAIGFkZF9zdWJkaXJlY3RvcnkoZnRwYXJjaGl2ZSkKK0BAIC0yNTcsMTUgKzI1Nyw2
IEBAIGFkZF9zdWJkaXJlY3RvcnkoZnRwYXJjaGl2ZSkKICBhZGRfc3ViZGlyZWN0b3J5KG1ldGhv
ZHMpCiAgYWRkX3N1YmRpcmVjdG9yeSh0ZXN0KQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50
LWdjYy0xNS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRs
LUFkZC1taXNzaW5nLWluY2x1ZGUtY3N0ZGludC1nY2MtMTUucGF0Y2gKZGVsZXRlZCBmaWxlIG1v
ZGUgMTAwNjQ0CmluZGV4IGI4NmVkOGJiOTIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50
LWdjYy0xNS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDI2ICswLDAgQEAKLUZyb20gOWRhMWIw
ZGJkY2M5MDQ1NWJjOWRlNDlmNzNhOTZlN2QxOGY4MzQ5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKLUZyb206IEp1bGlhbiBBbmRyZXMgS2xvZGUgPGp1bGlhbi5rbG9kZUBjYW5vbmljYWwuY29t
PgotRGF0ZTogVHVlLCAxOCBGZWIgMjAyNSAxMDoyOTo0MCArMDEwMAotU3ViamVjdDogW1BBVENI
XSBzdHJ1dGw6IEFkZCBtaXNzaW5nICNpbmNsdWRlIDxjc3RkaW50PiBbZ2NjIDE1XQotCi1DbG9z
ZXM6ICMxMDk2MzIyCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc2Fsc2Eu
ZGViaWFuLm9yZy9hcHQtdGVhbS9hcHQvLS9jb21taXQvZjgyZGNkN2U0ZWJiM2Y3MGQyOGU5ZmVi
MzYyMTY3NmY4YzBjYzAyNF0KLQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdt
YWlsLmNvbT4KLS0tLQotIGFwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MgfCAxICsKLSAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL2FwdC1wa2cvY29udHJpYi9z
dHJ1dGwuY2MgYi9hcHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjCi1pbmRleCA2NzEwMGYxLi5jMGEx
Y2JjIDEwMDY0NAotLS0tIGEvYXB0LXBrZy9jb250cmliL3N0cnV0bC5jYwotKysrIGIvYXB0LXBr
Zy9jb250cmliL3N0cnV0bC5jYwotQEAgLTI2LDYgKzI2LDcgQEAKLSAKLSAjaW5jbHVkZSA8YWxn
b3JpdGhtPgotICNpbmNsdWRlIDxhcnJheT4KLSsjaW5jbHVkZSA8Y3N0ZGludD4KLSAjaW5jbHVk
ZSA8aW9tYW5pcD4KLSAjaW5jbHVkZSA8bGltaXRzPgotICNpbmNsdWRlIDxsb2NhbGU+CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMS5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9hcHQvYXB0XzMuMC4zLmJiCnNpbWlsYXJpdHkgaW5kZXggOTMlCnJlbmFt
ZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzIuNi4xLmJiCnJlbmFtZSB0byBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8zLjAuMy5iYgppbmRleCBiMDM5NTk5Mzk1Li4w
MWUzZmJiZjk3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYu
MS5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8zLjAuMy5iYgpAQCAtMTMs
OSArMTMsOCBAQCBTUkNfVVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9hL2FwdC8ke0JQTn1f
JHtQVn0udGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY21ha2UtRG8tbm90LWJ1aWxk
LXBvLWZpbGVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXB0d2Vic2VydmVyLmNj
LUluY2x1ZGUtYXJyYXkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1SZW1vdmUtdXNp
bmctc3RkLWJpbmFyeV9mdW5jdGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXN0
cnV0bC1BZGQtbWlzc2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoIFwKLSAgICAgICAg
ICAgZmlsZTovLzAwMDEtUmFpc2UtY21ha2VfbWluaW11bV9yZXF1aXJlZC10by0zLjEzLXRvLWF2
b2lkLXdhcm5pbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLUZpeC1jb21waWxhdGlv
bi1lcnJvci13aXRoLWNsYW5nLWxpYmMtMTgucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAw
MS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2ggXAorICAg
ICAgICAgICBmaWxlOi8vMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0
LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFwcGVuZDpj
bGFzcy1uYXRpdmUgPSAiIFwKQEAgLTI4LDcgKzI3LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3Mt
bmF0aXZlc2RrID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJldmVydC1hbHdheXMtcnVu
LWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2ggXAogICAgICAgICAgICAi
CiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NmI4ODhjOTAxZmEyZTc4ZjFiZjUyYTJhYWEyZjQw
MGZmODJhNDcyYjk0ZmYwYWM2NjMxOTM5ZWU2OGZhNmZkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0g
IjViNWY2ZjZkMjYxMjE3NDJhODNhYTgwZDRlZDBlYjBjNmNlOWJlYTI1OTUxOGRiNDEyZWRlZmQ5
NTc2MGU0ZWYiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkdQTDttZDU9YjIz
NGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKICMgdGhlIHBhY2thZ2UgaXMgdGFrZW4g
ZnJvbSBzbmFwc2hvdHMuZGViaWFuLm9yZzsgdGhhdCBzb3VyY2UgaXMgc3RhdGljIGFuZCBnb2Vz
IHN0YWxlCi0tIAoyLjQ3LjEKCg==

--===============2908409183049824570==--

