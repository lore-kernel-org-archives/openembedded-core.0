Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACAC7C83F2D
	for <webhook@archiver.kernel.org>; Tue, 15 Jul 2025 15:55:38 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.12170.1752594936231692855
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Jul 2025 08:55:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=LupSJBvL;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jWGqFl3w;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101980ecc6fdc-8989d609-c5fb-4eff-91e3-9e716144177b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mtk+7G4GADkYIBZMmYvlCcUB7O6jxxRK3qj1+ErxvlI=;
	b=LupSJBvLgknybJnyuY0soR96H/b+63Zzaqf0DH/RzH5DOm4KcnJ2kpI9awctgfzG
	KKW/UpGNnA370hExRhPTcI/ITAd/aM8fQzZEbiplyWvwu0kNROC2IfAYdR7aNBTaKeM
	CWNWA6Xn+HrzF1kS0xWUn+n8Hc2YubrztpvZlF1Q=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1752594935;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mtk+7G4GADkYIBZMmYvlCcUB7O6jxxRK3qj1+ErxvlI=;
	b=jWGqFl3wIYK9IS8RrOqQpPq8AxDuuiQODy+91i/Hpaes+pMgqkWz6R4t7ZgWBDsa
	Ex6hwjACqub83zyuJB+ISDnZhHmzlc+0fzoBmTwx1Rb6QQrUJjqnDxKLNgE/UXThTV/
	CTndZOYsy3+zKBVuC3NAab5fofj6w86MwsrkCXp0=
Content-Type: multipart/mixed; boundary="===============2286332815578984467=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] apt: upgrading to 3.0.3 FAILED
Message-ID: <010101980ecc6fdc-8989d609-c5fb-4eff-91e3-9e716144177b-000000@us-west-2.amazonses.com>
Date: Tue, 15 Jul 2025 15:55:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.07.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Jul 2025 15:55:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220328

--===============2286332815578984467==
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
From c7563fd636179523b76f145c5911ecc66715e34e Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 15 Jul 2025 09:09:43 +0000
Subject: [PATCH] apt: upgrade 2.6.1 -> 3.0.3

---
 ...void-changing-install-paths-based-on.patch |  6 +--
 ...e-documentation-directory-altogether.patch |  7 ++-
 ...-init-tables-from-dpkg-configuration.patch |  7 ++-
 .../apt/apt/0001-Fix-musl-build.patch         |  7 +--
 ...mum_required-to-3.13-to-avoid-warnin.patch | 47 -------------------
 ...001-Remove-using-std-binary_function.patch | 10 ++--
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  9 ++--
 .../0001-aptwebserver.cc-Include-array.patch  |  5 +-
 .../0001-cmake-Do-not-build-po-files.patch    | 10 ++--
 ...l-Add-missing-include-cstdint-gcc-15.patch | 26 ----------
 .../apt/{apt_2.6.1.bb => apt_3.0.3.bb}        |  6 +--
 11 files changed, 30 insertions(+), 110 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
 rename meta/recipes-devtools/apt/{apt_2.6.1.bb => apt_3.0.3.bb} (94%)

diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
index 199f11bf20..15a087849d 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -1,4 +1,4 @@
-From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From 168bdb6c474f060f670ea9157028a1af49d312ba Mon Sep 17 00:00:00 2001
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
index 5443ff6caa..7166f9f316 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
+From c0e54a8b878c6ec5a845aa8fbcf5ffc12b8af864 Mon Sep 17 00:00:00 2001
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
index 37a3133010..faea11de2c 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
+From b78e49a2b7a523428763f9cbade663f6b3308516 Mon Sep 17 00:00:00 2001
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
  
diff --git a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
index 0cefbedd6d..6bb3c2844d 100644
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
+From 46e4bac356452bc9b174dc8e7102d77b34858116 Mon Sep 17 00:00:00 2001
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
index 15b036b90d..189c8dbb2b 100644
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -1,4 +1,4 @@
-From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
+From 948541ce532de95cd0c268a5daaf88d41e35853d Mon Sep 17 00:00:00 2001
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
index 6f4d5b6e72..69cca62955 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
+From 83f8aabcd7ef4aa80f7529fa158106147e43ffbe Mon Sep 17 00:00:00 2001
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
index 2c1e617e55..b182b4c8ee 100644
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -1,4 +1,4 @@
-From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
+From cfca490f34158e0674a150e9822297ebd1f3791a Mon Sep 17 00:00:00 2001
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
index 036ce35963..9578192f5e 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -1,4 +1,4 @@
-From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From 7ee0c6668c3f149eeea40833625e9aa623cce7a2 Mon Sep 17 00:00:00 2001
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
similarity index 94%
rename from meta/recipes-devtools/apt/apt_2.6.1.bb
rename to meta/recipes-devtools/apt/apt_3.0.3.bb
index 50ac2ea812..01e3fbbf97 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.3.bb
@@ -13,8 +13,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
-           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
-           file://0001-Raise-cmake_minimum_required-to-3.13-to-avoid-warnin.patch \
+           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
+           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -27,7 +27,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff0ac6631939ee68fa6fd"
+SRC_URI[sha256sum] = "5b5f6f6d26121742a83aa80d4ed0eb0c6ce9bea259518db412edefd95760e4ef"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.47.1


--===============2286332815578984467==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1930 entries from dependency cache.
Parsing recipes...done.
Parsing of 941 .bb files complete (940 cached, 1 parsed). 1928 targets, 42 skipped, 0 masked, 0 errors.
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
DISTRO_VERSION       = "5.2.99+snapshot-bbed8ac47a8f23c26cecbec9c6732652782166a1"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:bbed8ac47a8f23c26cecbec9c6732652782166a1"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 314 Local 302 Mirrors 0 Missed 12 Current 477 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1619 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_recipe_qa)
NOTE: recipe apt-3.0.3-r0: task do_recipe_qa: Started
NOTE: recipe apt-3.0.3-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_recipe_qa unihash changed to 30ed340acbd8810ac21cb0c8857adcdb7599378ff7067e7546f785115f176b3b
NOTE: Setscene tasks completed
NOTE: Running task 2120 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_fetch)
NOTE: recipe apt-3.0.3-r0: task do_fetch: Started
NOTE: recipe apt-3.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2194 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_unpack)
NOTE: Running task 2195 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_prepare_recipe_sysroot)
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
NOTE: recipe apt-3.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_populate_lic unihash changed to d79cb02248e42e8c4053aa99c1e61dcac8a605ae6530b2e334b6adc45571f380
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 9aa24d14c3614a0d5c79fe3f26a3b903456ef88e0a923d23871988a46ca2d9e3
NOTE: Setscene tasks completed
NOTE: Running task 2201 of 2213 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure)
NOTE: recipe apt-3.0.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/p
 okybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker
 /auh/build/meta/recipes-devtools/ninja/ninja_1.13.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2478870:163 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/sources/apt-3.0.3 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/
 x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCURRENT_VENDOR=debian -DWITH_DOC=False -DDPKG_DATADIR=/usr/share/dpkg -DTRIEHASH_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/sources/triehash -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True -DWITH_TESTS=False -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2478870, line 163
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2478870, line 142
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2478870, line 181
NOTE: recipe apt-3.0.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2201 tasks of which 2191 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715090925.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250715090925.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/log.do_configure.2478870
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: apt-3.0.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2478870' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/log.do_configure.2478870
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure) failed with exit code '1'

--===============2286332815578984467==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-2.6.1-3.0.3.patch"

RnJvbSBjNzU2M2ZkNjM2MTc5NTIzYjc2ZjE0NWM1OTExZWNjNjY3MTVlMzRlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMTUgSnVsIDIwMjUgMDk6MDk6NDMgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHQ6IHVwZ3JhZGUgMi42LjEgLT4gMy4wLjMKCi0tLQogLi4udm9pZC1jaGFuZ2luZy1pbnN0YWxs
LXBhdGhzLWJhc2VkLW9uLnBhdGNoIHwgIDYgKy0tCiAuLi5lLWRvY3VtZW50YXRpb24tZGlyZWN0
b3J5LWFsdG9nZXRoZXIucGF0Y2ggfCAgNyArKy0KIC4uLi1pbml0LXRhYmxlcy1mcm9tLWRwa2ct
Y29uZmlndXJhdGlvbi5wYXRjaCB8ICA3ICsrLQogLi4uL2FwdC9hcHQvMDAwMS1GaXgtbXVzbC1i
dWlsZC5wYXRjaCAgICAgICAgIHwgIDcgKy0tCiAuLi5tdW1fcmVxdWlyZWQtdG8tMy4xMy10by1h
dm9pZC13YXJuaW4ucGF0Y2ggfCA0NyAtLS0tLS0tLS0tLS0tLS0tLS0tCiAuLi4wMDEtUmVtb3Zl
LXVzaW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2ggfCAxMCArKy0tCiAuLi5uLWRwa2ctY29u
ZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2ggfCAgOSArKy0tCiAuLi4vMDAwMS1hcHR3
ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJheS5wYXRjaCAgfCAgNSArLQogLi4uLzAwMDEtY21ha2Ut
RG8tbm90LWJ1aWxkLXBvLWZpbGVzLnBhdGNoICAgIHwgMTAgKystLQogLi4ubC1BZGQtbWlzc2lu
Zy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoIHwgMjYgLS0tLS0tLS0tLQogLi4uL2FwdC97
YXB0XzIuNi4xLmJiID0+IGFwdF8zLjAuMy5iYn0gICAgICAgIHwgIDYgKy0tCiAxMSBmaWxlcyBj
aGFuZ2VkLCAzMCBpbnNlcnRpb25zKCspLCAxMTAgZGVsZXRpb25zKC0pCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SYWlzZS1jbWFrZV9taW5p
bXVtX3JlcXVpcmVkLXRvLTMuMTMtdG8tYXZvaWQtd2FybmluLnBhdGNoCiBkZWxldGUgbW9kZSAx
MDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwtQWRkLW1pc3Np
bmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaAogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0
b29scy9hcHQve2FwdF8yLjYuMS5iYiA9PiBhcHRfMy4wLjMuYmJ9ICg5NCUpCgpkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1hdm9p
ZC1jaGFuZ2luZy1pbnN0YWxsLXBhdGhzLWJhc2VkLW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1hdm9pZC1jaGFuZ2luZy1pbnN0YWxs
LXBhdGhzLWJhc2VkLW9uLnBhdGNoCmluZGV4IDE5OWYxMWJmMjAuLjE1YTA4Nzg0OWQgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtQ01ha2VMaXN0cy50eHQt
YXZvaWQtY2hhbmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUNNYWtlTGlzdHMudHh0LWF2b2lkLWNoYW5naW5n
LWluc3RhbGwtcGF0aHMtYmFzZWQtb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDkwMjM1
ODkzMTc4NDNkZjRlNTdmOGViZWYxZDlhODM5OGRkYjkyOWQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIDE2OGJkYjZjNDc0ZjA2MGY2NzBlYTkxNTcwMjhhMWFmNDlkMzEyYmEgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmlu
QGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjggTWF5IDIwMjAgMTU6MzQ6MDUgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50eHQ6IGF2b2lkIGNoYW5naW5nIGluc3RhbGwgcGF0aHMg
YmFzZWQgb24gaG9zdApAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAzIGlu
c2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4
dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCAyY2Q0ZjhlLi40NzU5ODEyIDEwMDY0NAoraW5kZXgg
MTAxZmJmYi4uYjBiOTZhOSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFr
ZUxpc3RzLnR4dAotQEAgLTIxLDkgKzIxLDkgQEAgc2V0KENNQUtFX0VYRV9MSU5LRVJfRkxBR1Nf
Q09WRVJBR0UgIi1sZ2NvdiIpCitAQCAtMjgsOSArMjgsOSBAQCBzZXQoQ01BS0VfRVhFX0xJTktF
Ul9GTEFHU19DT1ZFUkFHRSAiLWxnY292IikKICBzZXQoQ01BS0VfU0hBUkVEX0xJTktFUl9GTEFH
U19DT1ZFUkFHRSAiLWxnY292IikKICAKICAjIFdvcmsgYXJvdW5kIGJ1ZyBpbiBHTlVJbnN0YWxs
RGlycwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1EaXNh
YmxlLWRvY3VtZW50YXRpb24tZGlyZWN0b3J5LWFsdG9nZXRoZXIucGF0Y2ggYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUtZG9jdW1lbnRhdGlvbi1kaXJlY3Rvcnkt
YWx0b2dldGhlci5wYXRjaAppbmRleCA1NDQzZmY2Y2FhLi43MTY2ZjlmMzE2IDEwMDY0NAotLS0g
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUtZG9jdW1lbnRhdGlv
bi1kaXJlY3RvcnktYWx0b2dldGhlci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YXB0L2FwdC8wMDAxLURpc2FibGUtZG9jdW1lbnRhdGlvbi1kaXJlY3RvcnktYWx0b2dldGhlci5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjYyOWQxYzNmY2ZiNTYwZWQyNGVmYzNlNzNkNGU0
OTk5YjFlYWIzMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYzBlNTRhOGI4NzhjNmVj
NWE4NDVhYThmYmNmNWZmYzEyYjhhZjg2NCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogRnJpLCAx
MCBNYXkgMjAxOSAxNDoxNjo0NyArMDIwMAogU3ViamVjdDogW1BBVENIXSBEaXNhYmxlIGRvY3Vt
ZW50YXRpb24gZGlyZWN0b3J5IGFsdG9nZXRoZXIKQEAgLTcsMTYgKzcsMTUgQEAgRXZlbiB3aGVu
IFdJVEhfRE9DPUZhbHNlLCB0aGUgYnVpbGQgcmVxdWlyZXMgcG80YSB0byBnZW5lcmF0ZSBtYW5w
YWdlcy4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmlj
XQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+Ci0KIC0tLQogIENNYWtlTGlzdHMudHh0IHwgMiArLQogIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQg
Yi9DTWFrZUxpc3RzLnR4dAotaW5kZXggNjY4ZTJkNzYyLi42MmY0NDFiZmEgMTAwNjQ0CitpbmRl
eCBmMzdiNzAwLi4xMDFmYmZiIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NN
YWtlTGlzdHMudHh0Ci1AQCAtMjQ2LDcgKzI0Niw3IEBAIGFkZF9zdWJkaXJlY3RvcnkoYXB0LXBy
aXZhdGUpCitAQCAtMjUxLDcgKzI1MSw3IEBAIGFkZF9zdWJkaXJlY3RvcnkoYXB0LXByaXZhdGUp
CiAgZW5kaWYoKQogIGFkZF9zdWJkaXJlY3RvcnkoY21kbGluZSkKICBhZGRfc3ViZGlyZWN0b3J5
KGNvbXBsZXRpb25zKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQv
MDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2ggYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURvLW5vdC1pbml0LXRhYmxlcy1mcm9t
LWRwa2ctY29uZmlndXJhdGlvbi5wYXRjaAppbmRleCAzN2EzMTMzMDEwLi5mYWVhMTFkZTJjIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURvLW5vdC1pbml0
LXRhYmxlcy1mcm9tLWRwa2ctY29uZmlndXJhdGlvbi5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURvLW5vdC1pbml0LXRhYmxlcy1mcm9tLWRwa2ctY29uZmln
dXJhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg0MjgwZmVjNGUxZDBkMzNlY2E3
OGU3NjU1NjAyM2Y4ZjhmZTViNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjc4ZTQ5
YTJiN2E1MjM0Mjg3NjNmOWNiYWRlNjYzZjZiMzMwODUxNiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0
ZTogRnJpLCAxMCBNYXkgMjAxOSAxNjo0NzozOCArMDIwMAogU3ViamVjdDogW1BBVENIXSBEbyBu
b3QgaW5pdCB0YWJsZXMgZnJvbSBkcGtnIGNvbmZpZ3VyYXRpb24KQEAgLTcsMTYgKzcsMTUgQEAg
VGhpcyB3b3VsZCByZXF1aXJlIHN5c3Jvb3QgcmVsb2NhdGlvbiBsb2dpYywgYW5kIGl0J3MgZWFz
aWVyIHRvIGp1c3QgZGlzYWJsZSB0aGUKIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRl
IFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFs
ZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIGFwdC1wa2cvaW5pdC5jYyB8IDQgKystLQog
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYg
LS1naXQgYS9hcHQtcGtnL2luaXQuY2MgYi9hcHQtcGtnL2luaXQuY2MKLWluZGV4IGI5ZDliMTVk
Mi4uMTcyNWM1OTY2IDEwMDY0NAoraW5kZXggNjFkNDVlMy4uOTcwMTdkMiAxMDA2NDQKIC0tLSBh
L2FwdC1wa2cvaW5pdC5jYwogKysrIGIvYXB0LXBrZy9pbml0LmNjCi1AQCAtMjgxLDggKzI4MSw4
IEBAIGJvb2wgcGtnSW5pdFN5c3RlbShDb25maWd1cmF0aW9uICZDbmYscGtnU3lzdGVtIComU3lz
KQorQEAgLTI5NSw4ICsyOTUsOCBAQCBib29sIHBrZ0luaXRTeXN0ZW0oQ29uZmlndXJhdGlvbiAm
Q25mLHBrZ1N5c3RlbSAqJlN5cykKICAJIHJldHVybiBfZXJyb3ItPkVycm9yKF8oIlVuYWJsZSB0
byBkZXRlcm1pbmUgYSBzdWl0YWJsZSBwYWNrYWdpbmcgc3lzdGVtIHR5cGUiKSk7CiAgICAgfQog
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtbXVz
bC1idWlsZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRml4LW11
c2wtYnVpbGQucGF0Y2gKaW5kZXggMGNlZmJlZGQ2ZC4uNmJiM2MyODQ0ZCAxMDA2NDQKLS0tIGEv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtbXVzbC1idWlsZC5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1tdXNsLWJ1aWxkLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2Yjg1NDcxNjFiOTAyYjAxYjYzOWQwNWE0Y2RmODQ5
ZDc2OTQ1NTZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0NmU0YmFjMzU2NDUyYmM5
YjE3NGRjOGU3MTAyZDc3YjM0ODU4MTE2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
QWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDIy
IE1heSAyMDIwIDE1OjI5OjIzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFwdC1wa2cvY29udHJp
Yi9zcnZyZWMuaDogRXhwbGljaXRseSBpbmNsdWRlIHN5cy90eXBlcy5oCkBAIC0xMiw3ICsxMiw3
IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwu
Y29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvYXB0
LXBrZy9jb250cmliL3NydnJlYy5oIGIvYXB0LXBrZy9jb250cmliL3NydnJlYy5oCi1pbmRleCBl
NWQwZjQzLi4yMDEwMTg0IDEwMDY0NAoraW5kZXggMWU5ODFkMy4uZjRlMjZmMSAxMDA2NDQKIC0t
LSBhL2FwdC1wa2cvY29udHJpYi9zcnZyZWMuaAogKysrIGIvYXB0LXBrZy9jb250cmliL3NydnJl
Yy5oCiBAQCAtOSw2ICs5LDcgQEAKQEAgLTIzLDYgKzIzLDMgQEAgaW5kZXggZTVkMGY0My4uMjAx
MDE4NCAxMDA2NDQKICAjaW5jbHVkZSA8c3RyaW5nPgogICNpbmNsdWRlIDx2ZWN0b3I+CiAgI2lu
Y2x1ZGUgPGFycGEvbmFtZXNlci5oPgotLS0gCi0yLjIwLjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SYWlzZS1jbWFrZV9taW5pbXVtX3JlcXVpcmVk
LXRvLTMuMTMtdG8tYXZvaWQtd2FybmluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Fw
dC9hcHQvMDAwMS1SYWlzZS1jbWFrZV9taW5pbXVtX3JlcXVpcmVkLXRvLTMuMTMtdG8tYXZvaWQt
d2FybmluLnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjM2E1ZGVkNDk0Li4w
MDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmFpc2Ut
Y21ha2VfbWluaW11bV9yZXF1aXJlZC10by0zLjEzLXRvLWF2b2lkLXdhcm5pbi5wYXRjaAorKysg
L2Rldi9udWxsCkBAIC0xLDQ3ICswLDAgQEAKLUZyb20gZGM3YThiMzA1MGEyYTQzZjQ5NTE1YTAz
YWUxOTcxM2RmY2VkNzVkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IERhdmlkIEth
bG5pc2Noa2llcyA8ZGF2aWRAa2FsbmlzY2hraWVzLmRlPgotRGF0ZTogU2F0LCAxOCBOb3YgMjAy
MyAxMzoxMDowNSArMDAwMAotU3ViamVjdDogW1BBVENIXSBSYWlzZSBjbWFrZV9taW5pbXVtX3Jl
cXVpcmVkIHRvIDMuMTMgdG8gYXZvaWQgd2FybmluZ3MKLQotQ01ha2UgRGVwcmVjYXRpb24gV2Fy
bmluZyBhdCBDTWFrZUxpc3RzLnR4dDo2IChjbWFrZV9taW5pbXVtX3JlcXVpcmVkKToKLSAgQ29t
cGF0aWJpbGl0eSB3aXRoIENNYWtlIDwgMy41IHdpbGwgYmUgcmVtb3ZlZCBmcm9tIGEgZnV0dXJl
IHZlcnNpb24gb2YKLSAgQ01ha2UuCi0KLSAgVXBkYXRlIHRoZSBWRVJTSU9OIGFyZ3VtZW50IDxt
aW4+IHZhbHVlIG9yIHVzZSBhIC4uLjxtYXg+IHN1ZmZpeCB0byB0ZWxsCi0gIENNYWtlIHRoYXQg
dGhlIHByb2plY3QgZG9lcyBub3QgbmVlZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgdmVyc2lv
bnMuCi0KLVBpY2tpbmcgMy4xMyBoZXJlIGlzIGEgc2VtaS1yYW5kb20gY2hvaWNlIHRvIGF2b2lk
IHJhaXNpbmcgdGhlIHJlcXVpcmVtZW50Ci10b28gbXVjaCBuZWVkbGVzc2x5IHdoaWxlIGFsc28g
aG9wZWZ1bGx5IGF2b2lkaW5nIG5lZWRpbmcgdG8gcmFpc2UgaXQKLXNvb24gYWdhaW4gYmFzZWQg
b24gdGhlIHJlZmVyZW5jZWQgbWFpbC4KLQotV2hpbGUgd2UgYXJlIGF0IGl0LCBsZXRzIGFsc28g
Zml4IHRoZSBvdGhlciBzcGV3ZWQgd2FybmluZzoKLQotQ01ha2UgV2FybmluZyAoZGV2KSBhdCBD
TWFrZUxpc3RzLnR4dDo1IChwcm9qZWN0KToKLSAgY21ha2VfbWluaW11bV9yZXF1aXJlZCgpIHNo
b3VsZCBiZSBjYWxsZWQgcHJpb3IgdG8gdGhpcyB0b3AtbGV2ZWwgcHJvamVjdCgpCi0gIGNhbGwu
ICBQbGVhc2Ugc2VlIHRoZSBjbWFrZS1jb21tYW5kcyg3KSBtYW51YWwgZm9yIHVzYWdlIGRvY3Vt
ZW50YXRpb24gb2YKLSAgYm90aCBjb21tYW5kcy4KLQotUmVmZXJlbmNlczogaHR0cHM6Ly9saXN0
cy5kZWJpYW4ub3JnL21zZ2lkLXNlYXJjaC8yMDIzMDYxNzE2Mjk1Ny42cGtsYjY2MzJ6ZjRuaWpj
QG1haWwuZ2F1c3NnbG9ja2UuZGUKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6
Ly9zYWxzYS5kZWJpYW4ub3JnL2FwdC10ZWFtL2FwdC8tL2NvbW1pdC9kYzdhOGIzMDUwYTJhNDNm
NDk1MTVhMDNhZTE5NzEzZGZjZWQ3NWRjXQotU2lnbmVkLW9mZi1ieTogTW9yaXR6IEhhYXNlIDxN
b3JpdHouSGFhc2VAYm13LmRlPgotLS0tCi0gQ01ha2VMaXN0cy50eHQgfCAyICstCi0gMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9D
TWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA2MjE4MmNkZGYuLmRhZTEyZTdj
MyAxMDA2NDQKLS0tLSBhL0NNYWtlTGlzdHMudHh0Ci0rKysgYi9DTWFrZUxpc3RzLnR4dAotQEAg
LTIsOCArMiw4IEBACi0gIyBMaWNlbnNlZCB1bmRlciB0aGUgc2FtZSB0ZXJtcyBhcyBBUFQ7IGku
ZS4gR1BMIDIgb3IgbGF0ZXIuCi0KLSAjIHNldCBtaW5pbXVtIHZlcnNpb24KLStjbWFrZV9taW5p
bXVtX3JlcXVpcmVkKFZFUlNJT04gMy4xMykKLSBwcm9qZWN0KGFwdCkKLS1jbWFrZV9taW5pbXVt
X3JlcXVpcmVkKFZFUlNJT04gMy40LjApCi0gIyBHZW5lcmljIGhlYWRlciBsb2NhdGlvbnMKLSBp
bmNsdWRlX2RpcmVjdG9yaWVzKCR7UFJPSkVDVF9CSU5BUllfRElSfS9pbmNsdWRlKQotCi0tLQot
R2l0TGFiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJl
bW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1SZW1vdmUtdXNpbmctc3RkLWJpbmFyeV9mdW5jdGlvbi5wYXRjaApp
bmRleCAxNWIwMzZiOTBkLi4xODljOGRiYjJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvYXB0L2FwdC8wMDAxLVJlbW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmVtb3ZlLXVzaW5nLXN0
ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU5MWZiMDYxOGNl
MGE1ZDQyZjIzOWQwZmNhNjAyNTQ0ODU4ZjA4MTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitG
cm9tIDk0ODU0MWNlNTMyZGU5NWNkMGMyNjhhNWRhYWY4OGQ0MWUzNTg1M2QgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTog
VHVlLCAxNiBBdWcgMjAyMiAwODo0NDoxOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUg
dXNpbmcgc3RkOjpiaW5hcnlfZnVuY3Rpb24KQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1i
eTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5z
ZXJ0aW9ucygrKSwgMjMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9mdHBhcmNoaXZlL2Fw
dC1mdHBhcmNoaXZlLmNjIGIvZnRwYXJjaGl2ZS9hcHQtZnRwYXJjaGl2ZS5jYwotaW5kZXggMGY2
NTg3MjgxLi4wYTI1M2IxMmIgMTAwNjQ0CitpbmRleCA5Yzg2ZDE4Li5iODc3ZDQ5IDEwMDY0NAog
LS0tIGEvZnRwYXJjaGl2ZS9hcHQtZnRwYXJjaGl2ZS5jYwogKysrIGIvZnRwYXJjaGl2ZS9hcHQt
ZnRwYXJjaGl2ZS5jYwogQEAgLTQ4LDYgKzQ4LDExIEBACkBAIC01NCw3ICs1NCw3IEBAIGluZGV4
IDBmNjU4NzI4MS4uMGEyNTNiMTJiIDEwMDY0NAogICAgIHZvaWQgR2V0R2VuZXJhbChDb25maWd1
cmF0aW9uICZTZXR1cCxDb25maWd1cmF0aW9uICZCbG9jayk7CiAgICAgYm9vbCBHZW5QYWNrYWdl
cyhDb25maWd1cmF0aW9uICZTZXR1cCxzdHJ1Y3QgQ2FjaGVEQjo6U3RhdHMgJlN0YXRzKTsKICAg
ICBib29sIEdlblNvdXJjZXMoQ29uZmlndXJhdGlvbiAmU2V0dXAsc3RydWN0IENhY2hlREI6OlN0
YXRzICZTdGF0cyk7Ci1AQCAtODY5LDcgKzg1Niw3IEBAIHN0YXRpYyBib29sIERvR2VuZXJhdGVD
b250ZW50cyhDb25maWd1cmF0aW9uICZTZXR1cCwKK0BAIC04NjcsNyArODU0LDcgQEAgc3RhdGlj
IGJvb2wgRG9HZW5lcmF0ZUNvbnRlbnRzKENvbmZpZ3VyYXRpb24gJlNldHVwLAogICAgICAgIGVs
c2UKICAJIEktPkNvbnRlbnRzTVRpbWUgPSBBLnN0X210aW1lOwogICAgIH0KQEAgLTYzLDcgKzYz
LDcgQEAgaW5kZXggMGY2NTg3MjgxLi4wYTI1M2IxMmIgMTAwNjQ0CiAgICAgCiAgICAgLyogTm93
IGZvciBDb250ZW50cy4uIFRoZSBwcm9jZXNzIGhlcmUgaXMgdG8gZG8gYSBtYWtlLWxpa2UgZGVw
ZW5kZW5jeQogICAgICAgIGNoZWNrLiBFYWNoIGNvbnRlbnRzIGZpbGUgaXMgdmVyaWZpZWQgdG8g
YmUgbmV3ZXIgdGhhbiB0aGUgcGFja2FnZSBmaWxlcwotQEAgLTk0MSw4ICs5MjgsOCBAQCBzdGF0
aWMgYm9vbCBHZW5lcmF0ZShDb21tYW5kTGluZSAmQ21kTCkKK0BAIC05MzksOCArOTI2LDggQEAg
c3RhdGljIGJvb2wgR2VuZXJhdGUoQ29tbWFuZExpbmUgJkNtZEwpCiAgICAgTG9hZEJpbkRpcihQ
a2dMaXN0LFNldHVwKTsKICAKICAgICAvLyBTb3J0IGJ5IGNhY2hlIERCIHRvIGltcHJvdmUgSU8g
bG9jYWxpdHkuCkBAIC03NCw3ICs3NCw3IEBAIGluZGV4IDBmNjU4NzI4MS4uMGEyNTNiMTJiIDEw
MDY0NAogIAogICAgIC8vIEdlbmVyYXRlIHBhY2thZ2VzCiAgICAgaWYgKF9jb25maWctPkZpbmRC
KCJBUFQ6OkZUUEFyY2hpdmU6OkNvbnRlbnRzT25seSIsIGZhbHNlKSA9PSBmYWxzZSkKLUBAIC05
OTMsOCArOTgwLDggQEAgc3RhdGljIGJvb2wgQ2xlYW4oQ29tbWFuZExpbmUgJkNtZEwpCitAQCAt
OTkxLDggKzk3OCw4IEBAIHN0YXRpYyBib29sIENsZWFuKENvbW1hbmRMaW5lICZDbWRMKQogICAg
IExvYWRCaW5EaXIoUGtnTGlzdCxTZXR1cCk7CiAgCiAgICAgLy8gU29ydCBieSBjYWNoZSBEQiB0
byBpbXByb3ZlIElPIGxvY2FsaXR5LgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2FwdC9hcHQvMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1l
bmQtb2Ytb3VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZXZl
cnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoCmlu
ZGV4IDZmNGQ1YjZlNzIuLjY5Y2NhNjI5NTUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9hcHQvYXB0LzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10
aGUtZW5kLW9mLW91ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8w
MDAxLVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIu
cGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGEyZGQ2NjE0ODQ1MzY0OTJiNDdkNGM4ODk5OGYy
YmY1MTY3NDliYzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDgzZjhhYWJjZDdlZjRh
YTgwZjc1MjlmYTE1ODEwNjE0N2U0M2ZmYmUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9t
OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwg
MjEgTWF5IDIwMjAgMjA6MTM6MjUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJhbHdh
eXMgcnVuICdkcGtnIC0tY29uZmlndXJlIC1hJyBhdCB0aGUgZW5kIG9mIG91cgpAQCAtMTQsMTYg
KzE0LDE1IEBAIGJlIHBhc3NlZCBpbnRvIGRwa2csIGFuZCBsZWFkIHRvIHRoZSBiZWxvdyBzaW1p
bGFyIGVycm9yOgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNw
ZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBn
bWFpbC5jb20+Ci0KIC0tLQogIGFwdC1wa2cvZGViL2Rwa2dwbS5jYyB8IDkgKystLS0tLS0tCiAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAt
LWdpdCBhL2FwdC1wa2cvZGViL2Rwa2dwbS5jYyBiL2FwdC1wa2cvZGViL2Rwa2dwbS5jYwotaW5k
ZXggOTNlZmZhOTU5Li40Mzc1NzgxZDEgMTAwNjQ0CitpbmRleCAwOWYzZTQ3Li41OGNkODBkIDEw
MDY0NAogLS0tIGEvYXB0LXBrZy9kZWIvZHBrZ3BtLmNjCiArKysgYi9hcHQtcGtnL2RlYi9kcGtn
cG0uY2MKLUBAIC0xMTk5LDEyICsxMTk5LDYgQEAgdm9pZCBwa2dEUGtnUE06OkJ1aWxkUGFja2Fn
ZXNQcm9ncmVzc01hcCgpCitAQCAtMTIxMCwxMiArMTIxMCw2IEBAIHZvaWQgcGtnRFBrZ1BNOjpC
dWlsZFBhY2thZ2VzUHJvZ3Jlc3NNYXAoKQogIAkgfQogICAgICAgIH0KICAgICB9CkBAIC0zNiw3
ICszNSw3IEBAIGluZGV4IDkzZWZmYTk1OS4uNDM3NTc4MWQxIDEwMDY0NAogIH0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAvKn19fSovCiAgdm9pZCBwa2dEUGtnUE06OlN0YXJ0UHR5TWFnaWMoKQkJCQkJCS8q
e3t7Ki8KLUBAIC0xNzQxLDcgKzE3MzUsOCBAQCBib29sIHBrZ0RQa2dQTTo6R28oQVBUOjpQcm9n
cmVzczo6UGFja2FnZU1hbmFnZXIgKnByb2dyZXNzKQorQEAgLTE3NTIsNyArMTc0Niw4IEBAIGJv
b2wgcGtnRFBrZ1BNOjpHbyhBUFQ6OlByb2dyZXNzOjpQYWNrYWdlTWFuYWdlciAqcHJvZ3Jlc3Mp
CiAgCiAgICAgICAgLy8gc3VwcG9ydCBzdWJwcmVzc2luZyBvZiB0cmlnZ2VycyBwcm9jZXNzaW5n
IGZvciBzcGVjaWFsCiAgICAgICAgLy8gY2FzZXMgbGlrZSBkLWkgdGhhdCBydW5zIHRoZSB0cmln
Z2VycyBoYW5kbGluZyBtYW51YWxseQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2FwdC9hcHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJheS5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtYXB0d2Vic2VydmVyLmNjLUluY2x1ZGUtYXJy
YXkucGF0Y2gKaW5kZXggMmMxZTYxN2U1NS4uYjE4MmI0YzhlZSAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJh
eS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWFwdHdlYnNl
cnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1OTg1ZjM2
Njc1MGE3M2M4MWM3ZDg2ODkzYTJiOTU5YjRhZjA2MmE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBjZmNhNDkwZjM0MTU4ZTA2NzRhMTUwZTk4MjIyOTdlYmQxZjM3OTFhIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERh
dGU6IFdlZCwgMjYgTWF5IDIwMjEgMjI6MTI6NDYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXB0
d2Vic2VydmVyLmNjOiBJbmNsdWRlIDxhcnJheT4KQEAgLTExLDEzICsxMSwxMiBAQCB0ZXN0L2lu
dGVyYWN0aXZlLWhlbHBlci9hcHR3ZWJzZXJ2ZXIuY2M6MzY6NTU6IGVycm9yOiBjb25zdGV4cHIg
dmFyaWFibGUgY2Fubm90CiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dp
dGh1Yi5jb20vRGViaWFuL2FwdC9wdWxsLzEzM10KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+Ci0KIC0tLQogIHRlc3QvaW50ZXJhY3RpdmUtaGVscGVyL2FwdHdl
YnNlcnZlci5jYyB8IDEgKwogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZm
IC0tZ2l0IGEvdGVzdC9pbnRlcmFjdGl2ZS1oZWxwZXIvYXB0d2Vic2VydmVyLmNjIGIvdGVzdC9p
bnRlcmFjdGl2ZS1oZWxwZXIvYXB0d2Vic2VydmVyLmNjCi1pbmRleCBmNGY4ZDk1Li4zNjFjN2E5
IDEwMDY0NAoraW5kZXggZTk4ODJhYi4uZDJjN2UzNSAxMDA2NDQKIC0tLSBhL3Rlc3QvaW50ZXJh
Y3RpdmUtaGVscGVyL2FwdHdlYnNlcnZlci5jYwogKysrIGIvdGVzdC9pbnRlcmFjdGl2ZS1oZWxw
ZXIvYXB0d2Vic2VydmVyLmNjCiBAQCAtMjMsNiArMjMsNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmlsZXMu
cGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1i
dWlsZC1wby1maWxlcy5wYXRjaAppbmRleCAwMzZjZTM1OTYzLi45NTc4MTkyZjVlIDEwMDY0NAot
LS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWls
ZC1wby1maWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LWNtYWtlLURvLW5vdC1idWlsZC1wby1maWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20g
MzMzNDdmOWY4MzAxNjMzYjAxYWY0ZTIwOGI3YmU1ZmRmY2IwZGYwYyBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKK0Zyb20gN2VlMGM2NjY4YzNmMTQ5ZWVlYTQwODMzNjI1ZTlhYTYyM2NjZTdhMiBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5j
b20+CiBEYXRlOiBTYXQsIDIwIE1hciAyMDIxIDE0OjQ1OjE4IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIGNtYWtlOiBEbyBub3QgYnVpbGQgcG8gZmlsZXMKQEAgLTExLDE0ICsxMSwxNCBAQCBGaXhl
cwogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtDcm9zcy1jb21waWxlIHNwZWNpZmlj
XQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0tLQotIENN
YWtlTGlzdHMudHh0IHwgNyAtLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0p
CisgQ01ha2VMaXN0cy50eHQgfCA5IC0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0
aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAot
aW5kZXggYmUxNTdhNTVmLi41NDE2M2FlNmMgMTAwNjQ0CitpbmRleCBiMGI5NmE5Li42MGFlMmY0
IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAt
MjUyLDE1ICsyNTIsNiBAQCBhZGRfc3ViZGlyZWN0b3J5KGZ0cGFyY2hpdmUpCitAQCAtMjU3LDE1
ICsyNTcsNiBAQCBhZGRfc3ViZGlyZWN0b3J5KGZ0cGFyY2hpdmUpCiAgYWRkX3N1YmRpcmVjdG9y
eShtZXRob2RzKQogIGFkZF9zdWJkaXJlY3RvcnkodGVzdCkKICAKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLUFkZC1taXNzaW5nLWluY2x1ZGUt
Y3N0ZGludC1nY2MtMTUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LXN0cnV0bC1BZGQtbWlzc2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoCmRlbGV0ZWQg
ZmlsZSBtb2RlIDEwMDY0NAppbmRleCBiODZlZDhiYjkyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLUFkZC1taXNzaW5nLWluY2x1ZGUt
Y3N0ZGludC1nY2MtMTUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyNiArMCwwIEBACi1Gcm9t
IDlkYTFiMGRiZGNjOTA0NTViYzlkZTQ5ZjczYTk2ZTdkMThmODM0OTMgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCi1Gcm9tOiBKdWxpYW4gQW5kcmVzIEtsb2RlIDxqdWxpYW4ua2xvZGVAY2Fub25p
Y2FsLmNvbT4KLURhdGU6IFR1ZSwgMTggRmViIDIwMjUgMTA6Mjk6NDAgKzAxMDAKLVN1YmplY3Q6
IFtQQVRDSF0gc3RydXRsOiBBZGQgbWlzc2luZyAjaW5jbHVkZSA8Y3N0ZGludD4gW2djYyAxNV0K
LQotQ2xvc2VzOiAjMTA5NjMyMgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczov
L3NhbHNhLmRlYmlhbi5vcmcvYXB0LXRlYW0vYXB0Ly0vY29tbWl0L2Y4MmRjZDdlNGViYjNmNzBk
MjhlOWZlYjM2MjE2NzZmOGMwY2MwMjRdCi0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWou
a2hlbUBnbWFpbC5jb20+Ci0tLS0KLSBhcHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjIHwgMSArCi0g
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0KLWRpZmYgLS1naXQgYS9hcHQtcGtnL2Nv
bnRyaWIvc3RydXRsLmNjIGIvYXB0LXBrZy9jb250cmliL3N0cnV0bC5jYwotaW5kZXggNjcxMDBm
MS4uYzBhMWNiYyAxMDA2NDQKLS0tLSBhL2FwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MKLSsrKyBi
L2FwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MKLUBAIC0yNiw2ICsyNiw3IEBACi0gCi0gI2luY2x1
ZGUgPGFsZ29yaXRobT4KLSAjaW5jbHVkZSA8YXJyYXk+Ci0rI2luY2x1ZGUgPGNzdGRpbnQ+Ci0g
I2luY2x1ZGUgPGlvbWFuaXA+Ci0gI2luY2x1ZGUgPGxpbWl0cz4KLSAjaW5jbHVkZSA8bG9jYWxl
PgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMi42LjEuYmIgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8zLjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDk0
JQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMS5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMy4wLjMuYmIKaW5kZXggNTBhYzJl
YTgxMi4uMDFlM2ZiYmY5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9h
cHRfMi42LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMy4wLjMuYmIK
QEAgLTEzLDggKzEzLDggQEAgU1JDX1VSSSA9ICIke0RFQklBTl9NSVJST1J9L21haW4vYS9hcHQv
JHtCUE59XyR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLURvLW5v
dC1idWlsZC1wby1maWxlcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWFwdHdlYnNl
cnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtUmVt
b3ZlLXVzaW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8v
MDAwMS1zdHJ1dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaCBcCi0g
ICAgICAgICAgIGZpbGU6Ly8wMDAxLVJhaXNlLWNtYWtlX21pbmltdW1fcmVxdWlyZWQtdG8tMy4x
My10by1hdm9pZC13YXJuaW4ucGF0Y2ggXAorICAgICAgICAgICBmaWxlOi8vMDAwMS1Eby1ub3Qt
aW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2ggXAorICAgICAgICAgICBm
aWxlOi8vMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQt
b2Ytb3VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFwcGVuZDpjbGFzcy1uYXRp
dmUgPSAiIFwKQEAgLTI3LDcgKzI3LDcgQEAgU1JDX1VSSTphcHBlbmQ6Y2xhc3MtbmF0aXZlc2Rr
ID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29u
ZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2ggXAogICAgICAgICAgICAiCiAKLVNSQ19V
Uklbc2hhMjU2c3VtXSA9ICI4NmI4ODhjOTAxZmEyZTc4ZjFiZjUyYTJhYWEyZjQwMGZmODJhNDcy
Yjk0ZmYwYWM2NjMxOTM5ZWU2OGZhNmZkIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjViNWY2ZjZk
MjYxMjE3NDJhODNhYTgwZDRlZDBlYjBjNmNlOWJlYTI1OTUxOGRiNDEyZWRlZmQ5NTc2MGU0ZWYi
CiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkdQTDttZDU9YjIzNGVlNGQ2OWY1
ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKICMgdGhlIHBhY2thZ2UgaXMgdGFrZW4gZnJvbSBzbmFw
c2hvdHMuZGViaWFuLm9yZzsgdGhhdCBzb3VyY2UgaXMgc3RhdGljIGFuZCBnb2VzIHN0YWxlCi0t
IAoyLjQ3LjEKCg==

--===============2286332815578984467==--

