Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18147C5B54E
	for <webhook@archiver.kernel.org>; Thu, 15 May 2025 12:32:01 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.11036.1747312311544518048
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 May 2025 05:31:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=I50pFdZq;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=fla3mJbJ;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 01010196d3edf9e4-c5b578ea-ab95-439f-9208-d32a96e875c0-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1747312310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=smOoF6PQUwCUsipiPN5tnfZNiPz48sn9F+Y+u2E0g1o=;
	b=I50pFdZqhIsLbLV6X+5ACY2yGG80hewitSsESIyXQwHWEfMzcIKUc//LHQ55V6Ux
	z1al1TPTXbiHhkmhPSiWw3DibxCD1h/l2mCwOiICa+MSUzBof3hdUEuGqgzEM1hmEni
	5Z3iuMo4MoOAULMaDet+fy0VeVKjEOqZdgBxdf4Y=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1747312310;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=smOoF6PQUwCUsipiPN5tnfZNiPz48sn9F+Y+u2E0g1o=;
	b=fla3mJbJ1S6O2Hgb0VaAvpZGqIt2cxJ2s5ziybPC8e8/FWGKaSJnKddBRQB58VyZ
	IyriOpJbOvtwJugSoThvudzjvSGbo3kyDHZBlAPVXmxS+HeBoN8GHldXYYghho7U9Ht
	qYaD0B1eiGKrfQd85S85ACLzhQntHZ9i9xwJTSzY=
Content-Type: multipart/mixed; boundary="===============4459772240908787411=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] apt: upgrading to 3.0.1 FAILED
Message-ID: <01010196d3edf9e4-c5b578ea-ab95-439f-9208-d32a96e875c0-000000@us-west-2.amazonses.com>
Date: Thu, 15 May 2025 12:31:50 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.15-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 May 2025 12:32:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216599

--===============4459772240908787411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *apt* to *3.0.1* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-apt-upgrade-2.6.1-3.0.1.patch
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
From 4bbc557fec92e3740ba7ebc0d736838ee4dcda5f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 15 May 2025 07:20:37 +0000
Subject: [PATCH] apt: upgrade 2.6.1 -> 3.0.1

---
 ...void-changing-install-paths-based-on.patch |  6 ++---
 ...e-documentation-directory-altogether.patch |  7 +++--
 ...-init-tables-from-dpkg-configuration.patch |  7 +++--
 .../apt/apt/0001-Fix-musl-build.patch         |  7 ++---
 ...001-Remove-using-std-binary_function.patch | 10 +++----
 ...n-dpkg-configure-a-at-the-end-of-our.patch |  9 +++----
 .../0001-aptwebserver.cc-Include-array.patch  |  5 ++--
 .../0001-cmake-Do-not-build-po-files.patch    | 10 +++----
 ...l-Add-missing-include-cstdint-gcc-15.patch | 26 -------------------
 .../apt/{apt_2.6.1.bb => apt_3.0.1.bb}        |  5 ++--
 10 files changed, 30 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-devtools/apt/apt/0001-strutl-Add-missing-include-cstdint-gcc-15.patch
 rename meta/recipes-devtools/apt/{apt_2.6.1.bb => apt_3.0.1.bb} (94%)

diff --git a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
index 199f11bf20..abd59ae7f7 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -1,4 +1,4 @@
-From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From 81e6cfe47496446b7c7cb75d0f7e03e4fa5c0242 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Thu, 28 May 2020 15:34:05 +0000
 Subject: [PATCH] CMakeLists.txt: avoid changing install paths based on host
@@ -11,10 +11,10 @@ Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 2cd4f8e..4759812 100644
+index c5b86c2..14b3ff1 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -21,9 +21,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
+@@ -28,9 +28,9 @@ set(CMAKE_EXE_LINKER_FLAGS_COVERAGE "-lgcov")
  set(CMAKE_SHARED_LINKER_FLAGS_COVERAGE "-lgcov")
  
  # Work around bug in GNUInstallDirs
diff --git a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
index 5443ff6caa..1ccca7407f 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
+From 5f806a2f4a7f2fbf73c32021db0d1f3f326e6ac9 Mon Sep 17 00:00:00 2001
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
+index b07678b..c5b86c2 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -246,7 +246,7 @@ add_subdirectory(apt-private)
+@@ -251,7 +251,7 @@ add_subdirectory(apt-private)
  endif()
  add_subdirectory(cmdline)
  add_subdirectory(completions)
diff --git a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
index 37a3133010..e2e7e3de32 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
+From 3108b59024a4ffc1b9af15c2469004416378d721 Mon Sep 17 00:00:00 2001
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
index 0cefbedd6d..31cd9a31e6 100644
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
+From 50f6c0fff42711c44561770dffbbeeb06b9581b6 Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
index 15b036b90d..944326946a 100644
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -1,4 +1,4 @@
-From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
+From 0ef0ef41fc5d170a05a8b295f45df0240848a3ae Mon Sep 17 00:00:00 2001
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
index 6f4d5b6e72..8ea06258c5 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
+From a33809d30dee69797a62b7e89b829f5ae49938ff Mon Sep 17 00:00:00 2001
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
index 2c1e617e55..4200401c61 100644
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -1,4 +1,4 @@
-From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
+From 0dcdc88cb99e58c150068a00285ba3cc4214da6b Mon Sep 17 00:00:00 2001
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
index 036ce35963..9785416059 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -1,4 +1,4 @@
-From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From a1b8eb579f4d4a645b1e8fcc32a06733b09480c9 Mon Sep 17 00:00:00 2001
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
+index 14b3ff1..d139692 100644
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
diff --git a/meta/recipes-devtools/apt/apt_2.6.1.bb b/meta/recipes-devtools/apt/apt_3.0.1.bb
similarity index 94%
rename from meta/recipes-devtools/apt/apt_2.6.1.bb
rename to meta/recipes-devtools/apt/apt_3.0.1.bb
index d605d950dd..59f3a59bee 100644
--- a/meta/recipes-devtools/apt/apt_2.6.1.bb
+++ b/meta/recipes-devtools/apt/apt_3.0.1.bb
@@ -13,7 +13,8 @@ SRC_URI = "${DEBIAN_MIRROR}/main/a/apt/${BPN}_${PV}.tar.xz \
            file://0001-cmake-Do-not-build-po-files.patch \
            file://0001-aptwebserver.cc-Include-array.patch \
            file://0001-Remove-using-std-binary_function.patch \
-           file://0001-strutl-Add-missing-include-cstdint-gcc-15.patch \
+           file://0001-Do-not-init-tables-from-dpkg-configuration.patch \
+           file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -26,7 +27,7 @@ SRC_URI:append:class-nativesdk = " \
            file://0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch \
            "
 
-SRC_URI[sha256sum] = "86b888c901fa2e78f1bf52a2aaa2f400ff82a472b94ff0ac6631939ee68fa6fd"
+SRC_URI[sha256sum] = "60128e651f96fda2f747d95d424bbb46e25e95eca8a587ae8f8cd4794728cc6f"
 LIC_FILES_CHKSUM = "file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 # the package is taken from snapshots.debian.org; that source is static and goes stale
-- 
2.47.1


--===============4459772240908787411==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-2.6.1-3.0.1.patch"

RnJvbSA0YmJjNTU3ZmVjOTJlMzc0MGJhN2ViYzBkNzM2ODM4ZWU0ZGNkYTVmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMTUgTWF5IDIwMjUgMDc6MjA6MzcgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHQ6IHVwZ3JhZGUgMi42LjEgLT4gMy4wLjEKCi0tLQogLi4udm9pZC1jaGFuZ2luZy1pbnN0YWxs
LXBhdGhzLWJhc2VkLW9uLnBhdGNoIHwgIDYgKystLS0KIC4uLmUtZG9jdW1lbnRhdGlvbi1kaXJl
Y3RvcnktYWx0b2dldGhlci5wYXRjaCB8ICA3ICsrKy0tCiAuLi4taW5pdC10YWJsZXMtZnJvbS1k
cGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2ggfCAgNyArKystLQogLi4uL2FwdC9hcHQvMDAwMS1GaXgt
bXVzbC1idWlsZC5wYXRjaCAgICAgICAgIHwgIDcgKystLS0KIC4uLjAwMS1SZW1vdmUtdXNpbmct
c3RkLWJpbmFyeV9mdW5jdGlvbi5wYXRjaCB8IDEwICsrKy0tLS0KIC4uLm4tZHBrZy1jb25maWd1
cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaCB8ICA5ICsrKy0tLS0KIC4uLi8wMDAxLWFwdHdl
YnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoICB8ICA1ICsrLS0KIC4uLi8wMDAxLWNtYWtl
LURvLW5vdC1idWlsZC1wby1maWxlcy5wYXRjaCAgICB8IDEwICsrKy0tLS0KIC4uLmwtQWRkLW1p
c3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaCB8IDI2IC0tLS0tLS0tLS0tLS0tLS0t
LS0KIC4uLi9hcHQve2FwdF8yLjYuMS5iYiA9PiBhcHRfMy4wLjEuYmJ9ICAgICAgICB8ICA1ICsr
LS0KIDEwIGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDYyIGRlbGV0aW9ucygtKQog
ZGVsZXRlIG1vZGUgMTAwNjQ0IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3Ry
dXRsLUFkZC1taXNzaW5nLWluY2x1ZGUtY3N0ZGludC1nY2MtMTUucGF0Y2gKIHJlbmFtZSBtZXRh
L3JlY2lwZXMtZGV2dG9vbHMvYXB0L3thcHRfMi42LjEuYmIgPT4gYXB0XzMuMC4xLmJifSAoOTQl
KQoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtQ01ha2VM
aXN0cy50eHQtYXZvaWQtY2hhbmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaCBiL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtQ01ha2VMaXN0cy50eHQtYXZvaWQtY2hh
bmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaAppbmRleCAxOTlmMTFiZjIwLi5hYmQ1
OWFlN2Y3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUNN
YWtlTGlzdHMudHh0LWF2b2lkLWNoYW5naW5nLWluc3RhbGwtcGF0aHMtYmFzZWQtb24ucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1h
dm9pZC1jaGFuZ2luZy1pbnN0YWxsLXBhdGhzLWJhc2VkLW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA5MDIzNTg5MzE3ODQzZGY0ZTU3ZjhlYmVmMWQ5YTgzOThkZGI5MjlkIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSA4MWU2Y2ZlNDc0OTY0NDZiN2M3Y2I3NWQwZjdlMDNlNGZh
NWMwMjQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4g
PGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDI4IE1heSAyMDIwIDE1OjM0OjA1
ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIENNYWtlTGlzdHMudHh0OiBhdm9pZCBjaGFuZ2luZyBp
bnN0YWxsIHBhdGhzIGJhc2VkIG9uIGhvc3QKQEAgLTExLDEwICsxMSwxMCBAQCBTaWduZWQtb2Zm
LWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUg
Y2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
Q01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggMmNkNGY4ZS4uNDc1OTgxMiAx
MDA2NDQKK2luZGV4IGM1Yjg2YzIuLjE0YjNmZjEgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3RzLnR4
dAogKysrIGIvQ01ha2VMaXN0cy50eHQKLUBAIC0yMSw5ICsyMSw5IEBAIHNldChDTUFLRV9FWEVf
TElOS0VSX0ZMQUdTX0NPVkVSQUdFICItbGdjb3YiKQorQEAgLTI4LDkgKzI4LDkgQEAgc2V0KENN
QUtFX0VYRV9MSU5LRVJfRkxBR1NfQ09WRVJBR0UgIi1sZ2NvdiIpCiAgc2V0KENNQUtFX1NIQVJF
RF9MSU5LRVJfRkxBR1NfQ09WRVJBR0UgIi1sZ2NvdiIpCiAgCiAgIyBXb3JrIGFyb3VuZCBidWcg
aW4gR05VSW5zdGFsbERpcnMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQv
YXB0LzAwMDEtRGlzYWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1EaXNhYmxlLWRvY3VtZW50YXRp
b24tZGlyZWN0b3J5LWFsdG9nZXRoZXIucGF0Y2gKaW5kZXggNTQ0M2ZmNmNhYS4uMWNjY2E3NDA3
ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1EaXNhYmxl
LWRvY3VtZW50YXRpb24tZGlyZWN0b3J5LWFsdG9nZXRoZXIucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1EaXNhYmxlLWRvY3VtZW50YXRpb24tZGlyZWN0b3J5
LWFsdG9nZXRoZXIucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGY2MjlkMWMzZmNmYjU2MGVk
MjRlZmMzZTczZDRlNDk5OWIxZWFiMzMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDVm
ODA2YTJmNGE3ZjJmYmY3M2MzMjAyMWRiMGQxZjNmMzI2ZTZhYzkgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
IERhdGU6IEZyaSwgMTAgTWF5IDIwMTkgMTQ6MTY6NDcgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0g
RGlzYWJsZSBkb2N1bWVudGF0aW9uIGRpcmVjdG9yeSBhbHRvZ2V0aGVyCkBAIC03LDE2ICs3LDE1
IEBAIEV2ZW4gd2hlbiBXSVRIX0RPQz1GYWxzZSwgdGhlIGJ1aWxkIHJlcXVpcmVzIHBvNGEgdG8g
Z2VuZXJhdGUgbWFucGFnZXMuCiAKIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbb2Ut
Y29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBDTWFrZUxpc3RzLnR4dCB8IDIgKy0KICAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBhL0NN
YWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IDY2OGUyZDc2Mi4uNjJmNDQxYmZh
IDEwMDY0NAoraW5kZXggYjA3Njc4Yi4uYzViODZjMiAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMu
dHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTI0Niw3ICsyNDYsNyBAQCBhZGRfc3ViZGly
ZWN0b3J5KGFwdC1wcml2YXRlKQorQEAgLTI1MSw3ICsyNTEsNyBAQCBhZGRfc3ViZGlyZWN0b3J5
KGFwdC1wcml2YXRlKQogIGVuZGlmKCkKICBhZGRfc3ViZGlyZWN0b3J5KGNtZGxpbmUpCiAgYWRk
X3N1YmRpcmVjdG9yeShjb21wbGV0aW9ucykKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0
aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5p
dC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2gKaW5kZXggMzdhMzEzMzAxMC4u
ZTJlN2UzZGUzMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAw
MS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJv
bS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGI4NDI4MGZl
YzRlMWQwZDMzZWNhNzhlNzY1NTYwMjNmOGY4ZmU1YjcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDMxMDhiNTkwMjRhNGZmYzFiOWFmMTVjMjQ2OTAwNDQxNjM3OGQ3MjEgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdt
YWlsLmNvbT4KIERhdGU6IEZyaSwgMTAgTWF5IDIwMTkgMTY6NDc6MzggKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gRG8gbm90IGluaXQgdGFibGVzIGZyb20gZHBrZyBjb25maWd1cmF0aW9uCkBAIC03
LDE2ICs3LDE1IEBAIFRoaXMgd291bGQgcmVxdWlyZSBzeXNyb290IHJlbG9jYXRpb24gbG9naWMs
IGFuZCBpdCdzIGVhc2llciB0byBqdXN0IGRpc2FibGUgdGhlCiAKIFVwc3RyZWFtLVN0YXR1czog
SW5hcHByb3ByaWF0ZSBbb2UtY29yZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRl
ciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAtLS0KICBhcHQtcGtnL2luaXQu
Y2MgfCA0ICsrLS0KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQogCiBkaWZmIC0tZ2l0IGEvYXB0LXBrZy9pbml0LmNjIGIvYXB0LXBrZy9pbml0LmNjCi1p
bmRleCBiOWQ5YjE1ZDIuLjE3MjVjNTk2NiAxMDA2NDQKK2luZGV4IDYxZDQ1ZTMuLjk3MDE3ZDIg
MTAwNjQ0CiAtLS0gYS9hcHQtcGtnL2luaXQuY2MKICsrKyBiL2FwdC1wa2cvaW5pdC5jYwotQEAg
LTI4MSw4ICsyODEsOCBAQCBib29sIHBrZ0luaXRTeXN0ZW0oQ29uZmlndXJhdGlvbiAmQ25mLHBr
Z1N5c3RlbSAqJlN5cykKK0BAIC0yOTUsOCArMjk1LDggQEAgYm9vbCBwa2dJbml0U3lzdGVtKENv
bmZpZ3VyYXRpb24gJkNuZixwa2dTeXN0ZW0gKiZTeXMpCiAgCSByZXR1cm4gX2Vycm9yLT5FcnJv
cihfKCJVbmFibGUgdG8gZGV0ZXJtaW5lIGEgc3VpdGFibGUgcGFja2FnaW5nIHN5c3RlbSB0eXBl
IikpOwogICAgIH0KICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0
LzAwMDEtRml4LW11c2wtYnVpbGQucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2Fw
dC8wMDAxLUZpeC1tdXNsLWJ1aWxkLnBhdGNoCmluZGV4IDBjZWZiZWRkNmQuLjMxY2Q5YTMxZTYg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRml4LW11c2wt
YnVpbGQucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgt
bXVzbC1idWlsZC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNmI4NTQ3MTYxYjkwMmIwMWI2
MzlkMDVhNGNkZjg0OWQ3Njk0NTU2ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTBm
NmMwZmZmNDI3MTFjNDQ1NjE3NzBkZmZiYmVlYjA2Yjk1ODFiNiBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAyMiBNYXkgMjAyMCAxNToyOToyMyArMDAwMAogU3ViamVjdDogW1BBVENIXSBh
cHQtcGtnL2NvbnRyaWIvc3J2cmVjLmg6IEV4cGxpY2l0bHkgaW5jbHVkZSBzeXMvdHlwZXMuaApA
QCAtMTIsNyArMTIsNyBAQCBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlm
ZiAtLWdpdCBhL2FwdC1wa2cvY29udHJpYi9zcnZyZWMuaCBiL2FwdC1wa2cvY29udHJpYi9zcnZy
ZWMuaAotaW5kZXggZTVkMGY0My4uMjAxMDE4NCAxMDA2NDQKK2luZGV4IDFlOTgxZDMuLmY0ZTI2
ZjEgMTAwNjQ0CiAtLS0gYS9hcHQtcGtnL2NvbnRyaWIvc3J2cmVjLmgKICsrKyBiL2FwdC1wa2cv
Y29udHJpYi9zcnZyZWMuaAogQEAgLTksNiArOSw3IEBACkBAIC0yMyw2ICsyMywzIEBAIGluZGV4
IGU1ZDBmNDMuLjIwMTAxODQgMTAwNjQ0CiAgI2luY2x1ZGUgPHN0cmluZz4KICAjaW5jbHVkZSA8
dmVjdG9yPgogICNpbmNsdWRlIDxhcnBhL25hbWVzZXIuaD4KLS0tIAotMi4yMC4xCi0KZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmVtb3ZlLXVzaW5nLXN0
ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8w
MDAxLVJlbW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoCmluZGV4IDE1YjAzNmI5
MGQuLjk0NDMyNjk0NmEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0
LzAwMDEtUmVtb3ZlLXVzaW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2gKKysrIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZW1vdmUtdXNpbmctc3RkLWJpbmFyeV9mdW5j
dGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTkxZmIwNjE4Y2UwYTVkNDJmMjM5ZDBm
Y2E2MDI1NDQ4NThmMDgxOSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMGVmMGVmNDFm
YzVkMTcwYTA1YThiMjk1ZjQ1ZGYwMjQwODQ4YTNhZSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBUdWUsIDE2IEF1ZyAy
MDIyIDA4OjQ0OjE4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSB1c2luZyBzdGQ6OmJp
bmFyeV9mdW5jdGlvbgpAQCAtMTQsNyArMTQsNyBAQCBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8
cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspLCAy
MyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2Z0cGFyY2hpdmUvYXB0LWZ0cGFyY2hpdmUu
Y2MgYi9mdHBhcmNoaXZlL2FwdC1mdHBhcmNoaXZlLmNjCi1pbmRleCAwZjY1ODcyODEuLjBhMjUz
YjEyYiAxMDA2NDQKK2luZGV4IDljODZkMTguLmI4NzdkNDkgMTAwNjQ0CiAtLS0gYS9mdHBhcmNo
aXZlL2FwdC1mdHBhcmNoaXZlLmNjCiArKysgYi9mdHBhcmNoaXZlL2FwdC1mdHBhcmNoaXZlLmNj
CiBAQCAtNDgsNiArNDgsMTEgQEAKQEAgLTU0LDcgKzU0LDcgQEAgaW5kZXggMGY2NTg3MjgxLi4w
YTI1M2IxMmIgMTAwNjQ0CiAgICAgdm9pZCBHZXRHZW5lcmFsKENvbmZpZ3VyYXRpb24gJlNldHVw
LENvbmZpZ3VyYXRpb24gJkJsb2NrKTsKICAgICBib29sIEdlblBhY2thZ2VzKENvbmZpZ3VyYXRp
b24gJlNldHVwLHN0cnVjdCBDYWNoZURCOjpTdGF0cyAmU3RhdHMpOwogICAgIGJvb2wgR2VuU291
cmNlcyhDb25maWd1cmF0aW9uICZTZXR1cCxzdHJ1Y3QgQ2FjaGVEQjo6U3RhdHMgJlN0YXRzKTsK
LUBAIC04NjksNyArODU2LDcgQEAgc3RhdGljIGJvb2wgRG9HZW5lcmF0ZUNvbnRlbnRzKENvbmZp
Z3VyYXRpb24gJlNldHVwLAorQEAgLTg2Nyw3ICs4NTQsNyBAQCBzdGF0aWMgYm9vbCBEb0dlbmVy
YXRlQ29udGVudHMoQ29uZmlndXJhdGlvbiAmU2V0dXAsCiAgICAgICAgZWxzZQogIAkgSS0+Q29u
dGVudHNNVGltZSA9IEEuc3RfbXRpbWU7CiAgICAgfQpAQCAtNjMsNyArNjMsNyBAQCBpbmRleCAw
ZjY1ODcyODEuLjBhMjUzYjEyYiAxMDA2NDQKICAgICAKICAgICAvKiBOb3cgZm9yIENvbnRlbnRz
Li4gVGhlIHByb2Nlc3MgaGVyZSBpcyB0byBkbyBhIG1ha2UtbGlrZSBkZXBlbmRlbmN5CiAgICAg
ICAgY2hlY2suIEVhY2ggY29udGVudHMgZmlsZSBpcyB2ZXJpZmllZCB0byBiZSBuZXdlciB0aGFu
IHRoZSBwYWNrYWdlIGZpbGVzCi1AQCAtOTQxLDggKzkyOCw4IEBAIHN0YXRpYyBib29sIEdlbmVy
YXRlKENvbW1hbmRMaW5lICZDbWRMKQorQEAgLTkzOSw4ICs5MjYsOCBAQCBzdGF0aWMgYm9vbCBH
ZW5lcmF0ZShDb21tYW5kTGluZSAmQ21kTCkKICAgICBMb2FkQmluRGlyKFBrZ0xpc3QsU2V0dXAp
OwogIAogICAgIC8vIFNvcnQgYnkgY2FjaGUgREIgdG8gaW1wcm92ZSBJTyBsb2NhbGl0eS4KQEAg
LTc0LDcgKzc0LDcgQEAgaW5kZXggMGY2NTg3MjgxLi4wYTI1M2IxMmIgMTAwNjQ0CiAgCiAgICAg
Ly8gR2VuZXJhdGUgcGFja2FnZXMKICAgICBpZiAoX2NvbmZpZy0+RmluZEIoIkFQVDo6RlRQQXJj
aGl2ZTo6Q29udGVudHNPbmx5IiwgZmFsc2UpID09IGZhbHNlKQotQEAgLTk5Myw4ICs5ODAsOCBA
QCBzdGF0aWMgYm9vbCBDbGVhbihDb21tYW5kTGluZSAmQ21kTCkKK0BAIC05OTEsOCArOTc4LDgg
QEAgc3RhdGljIGJvb2wgQ2xlYW4oQ29tbWFuZExpbmUgJkNtZEwpCiAgICAgTG9hZEJpbkRpcihQ
a2dMaXN0LFNldHVwKTsKICAKICAgICAvLyBTb3J0IGJ5IGNhY2hlIERCIHRvIGltcHJvdmUgSU8g
bG9jYWxpdHkuCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0
Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJldmVydC1hbHdheXMtcnVu
LWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2gKaW5kZXggNmY0ZDViNmU3
Mi4uOGVhMDYyNThjNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQv
MDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3Vy
LnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmV2ZXJ0LWFs
d2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gYTJkZDY2MTQ4NDUzNjQ5MmI0N2Q0Yzg4OTk4ZjJiZjUxNjc0OWJjOCBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTMzODA5ZDMwZGVlNjk3OTdhNjJiN2U4OWI4
MjlmNWFlNDk5MzhmZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBL
YW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogRGF0ZTogVGh1LCAyMSBNYXkgMjAyMCAy
MDoxMzoyNSArMDAwMAogU3ViamVjdDogW1BBVENIXSBSZXZlcnQgImFsd2F5cyBydW4gJ2Rwa2cg
LS1jb25maWd1cmUgLWEnIGF0IHRoZSBlbmQgb2Ygb3VyCkBAIC0xNCwxNiArMTQsMTUgQEAgYmUg
cGFzc2VkIGludG8gZHBrZywgYW5kIGxlYWQgdG8gdGhlIGJlbG93IHNpbWlsYXIgZXJyb3I6CiAK
IFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbZW1iZWRkZWQgc3BlY2lmaWNdCiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KLQog
LS0tCiAgYXB0LXBrZy9kZWIvZHBrZ3BtLmNjIHwgOSArKy0tLS0tLS0KICAxIGZpbGUgY2hhbmdl
ZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvYXB0LXBr
Zy9kZWIvZHBrZ3BtLmNjIGIvYXB0LXBrZy9kZWIvZHBrZ3BtLmNjCi1pbmRleCA5M2VmZmE5NTku
LjQzNzU3ODFkMSAxMDA2NDQKK2luZGV4IDA5ZjNlNDcuLjU4Y2Q4MGQgMTAwNjQ0CiAtLS0gYS9h
cHQtcGtnL2RlYi9kcGtncG0uY2MKICsrKyBiL2FwdC1wa2cvZGViL2Rwa2dwbS5jYwotQEAgLTEx
OTksMTIgKzExOTksNiBAQCB2b2lkIHBrZ0RQa2dQTTo6QnVpbGRQYWNrYWdlc1Byb2dyZXNzTWFw
KCkKK0BAIC0xMjEwLDEyICsxMjEwLDYgQEAgdm9pZCBwa2dEUGtnUE06OkJ1aWxkUGFja2FnZXNQ
cm9ncmVzc01hcCgpCiAgCSB9CiAgICAgICAgfQogICAgIH0KQEAgLTM2LDcgKzM1LDcgQEAgaW5k
ZXggOTNlZmZhOTU5Li40Mzc1NzgxZDEgMTAwNjQ0CiAgfQogICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC8qfX19
Ki8KICB2b2lkIHBrZ0RQa2dQTTo6U3RhcnRQdHlNYWdpYygpCQkJCQkJLyp7e3sqLwotQEAgLTE3
NDEsNyArMTczNSw4IEBAIGJvb2wgcGtnRFBrZ1BNOjpHbyhBUFQ6OlByb2dyZXNzOjpQYWNrYWdl
TWFuYWdlciAqcHJvZ3Jlc3MpCitAQCAtMTc1Miw3ICsxNzQ2LDggQEAgYm9vbCBwa2dEUGtnUE06
OkdvKEFQVDo6UHJvZ3Jlc3M6OlBhY2thZ2VNYW5hZ2VyICpwcm9ncmVzcykKICAKICAgICAgICAv
LyBzdXBwb3J0IHN1YnByZXNzaW5nIG9mIHRyaWdnZXJzIHByb2Nlc3NpbmcgZm9yIHNwZWNpYWwK
ICAgICAgICAvLyBjYXNlcyBsaWtlIGQtaSB0aGF0IHJ1bnMgdGhlIHRyaWdnZXJzIGhhbmRsaW5n
IG1hbnVhbGx5CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LWFwdHdlYnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJheS5wYXRjaAppbmRl
eCAyYzFlNjE3ZTU1Li40MjAwNDAxYzYxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLWFwdHdlYnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtYXB0d2Vic2VydmVyLmNjLUluY2x1
ZGUtYXJyYXkucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDU5ODVmMzY2NzUwYTczYzgxYzdk
ODY4OTNhMmI5NTliNGFmMDYyYTUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDBkY2Rj
ODhjYjk5ZTU4YzE1MDA2OGEwMDI4NWJhM2NjNDIxNGRhNmIgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogV2VkLCAyNiBN
YXkgMjAyMSAyMjoxMjo0NiAtMDcwMAogU3ViamVjdDogW1BBVENIXSBhcHR3ZWJzZXJ2ZXIuY2M6
IEluY2x1ZGUgPGFycmF5PgpAQCAtMTEsMTMgKzExLDEyIEBAIHRlc3QvaW50ZXJhY3RpdmUtaGVs
cGVyL2FwdHdlYnNlcnZlci5jYzozNjo1NTogZXJyb3I6IGNvbnN0ZXhwciB2YXJpYWJsZSBjYW5u
b3QKIAogVXBzdHJlYW0tU3RhdHVzOiBTdWJtaXR0ZWQgW2h0dHBzOi8vZ2l0aHViLmNvbS9EZWJp
YW4vYXB0L3B1bGwvMTMzXQogU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWls
LmNvbT4KLQogLS0tCiAgdGVzdC9pbnRlcmFjdGl2ZS1oZWxwZXIvYXB0d2Vic2VydmVyLmNjIHwg
MSArCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCiAKIGRpZmYgLS1naXQgYS90ZXN0
L2ludGVyYWN0aXZlLWhlbHBlci9hcHR3ZWJzZXJ2ZXIuY2MgYi90ZXN0L2ludGVyYWN0aXZlLWhl
bHBlci9hcHR3ZWJzZXJ2ZXIuY2MKLWluZGV4IGY0ZjhkOTUuLjM2MWM3YTkgMTAwNjQ0CitpbmRl
eCBlOTg4MmFiLi5kMmM3ZTM1IDEwMDY0NAogLS0tIGEvdGVzdC9pbnRlcmFjdGl2ZS1oZWxwZXIv
YXB0d2Vic2VydmVyLmNjCiArKysgYi90ZXN0L2ludGVyYWN0aXZlLWhlbHBlci9hcHR3ZWJzZXJ2
ZXIuY2MKIEBAIC0yMyw2ICsyMyw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWlsZC1wby1maWxlcy5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtY21ha2UtRG8tbm90LWJ1aWxkLXBvLWZpbGVz
LnBhdGNoCmluZGV4IDAzNmNlMzU5NjMuLjk3ODU0MTYwNTkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtY21ha2UtRG8tbm90LWJ1aWxkLXBvLWZpbGVzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtY21ha2UtRG8tbm90
LWJ1aWxkLXBvLWZpbGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMzM0N2Y5ZjgzMDE2
MzNiMDFhZjRlMjA4YjdiZTVmZGZjYjBkZjBjIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBhMWI4ZWI1NzlmNGQ0YTY0NWIxZThmY2MzMmEwNjczM2IwOTQ4MGM5IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFNh
dCwgMjAgTWFyIDIwMjEgMTQ6NDU6MTggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gY21ha2U6IERv
IG5vdCBidWlsZCBwbyBmaWxlcwpAQCAtMTEsMTQgKzExLDE0IEBAIEZpeGVzCiBVcHN0cmVhbS1T
dGF0dXM6IEluYXBwcm9wcmlhdGUgW0Nyb3NzLWNvbXBpbGUgc3BlY2lmaWNdCiBTaWduZWQtb2Zm
LWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogLS0tCi0gQ01ha2VMaXN0cy50eHQg
fCA3IC0tLS0tLS0KLSAxIGZpbGUgY2hhbmdlZCwgNyBkZWxldGlvbnMoLSkKKyBDTWFrZUxpc3Rz
LnR4dCB8IDkgLS0tLS0tLS0tCisgMSBmaWxlIGNoYW5nZWQsIDkgZGVsZXRpb25zKC0pCiAKIGRp
ZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCBiZTE1N2E1
NWYuLjU0MTYzYWU2YyAxMDA2NDQKK2luZGV4IDE0YjNmZjEuLmQxMzk2OTIgMTAwNjQ0CiAtLS0g
YS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01ha2VMaXN0cy50eHQKLUBAIC0yNTIsMTUgKzI1Miw2
IEBAIGFkZF9zdWJkaXJlY3RvcnkoZnRwYXJjaGl2ZSkKK0BAIC0yNTcsMTUgKzI1Nyw2IEBAIGFk
ZF9zdWJkaXJlY3RvcnkoZnRwYXJjaGl2ZSkKICBhZGRfc3ViZGlyZWN0b3J5KG1ldGhvZHMpCiAg
YWRkX3N1YmRpcmVjdG9yeSh0ZXN0KQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0x
NS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLUFkZC1t
aXNzaW5nLWluY2x1ZGUtY3N0ZGludC1nY2MtMTUucGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAw
NjQ0CmluZGV4IGI4NmVkOGJiOTIuLjAwMDAwMDAwMDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0x
NS5wYXRjaAorKysgL2Rldi9udWxsCkBAIC0xLDI2ICswLDAgQEAKLUZyb20gOWRhMWIwZGJkY2M5
MDQ1NWJjOWRlNDlmNzNhOTZlN2QxOGY4MzQ5MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZy
b206IEp1bGlhbiBBbmRyZXMgS2xvZGUgPGp1bGlhbi5rbG9kZUBjYW5vbmljYWwuY29tPgotRGF0
ZTogVHVlLCAxOCBGZWIgMjAyNSAxMDoyOTo0MCArMDEwMAotU3ViamVjdDogW1BBVENIXSBzdHJ1
dGw6IEFkZCBtaXNzaW5nICNpbmNsdWRlIDxjc3RkaW50PiBbZ2NjIDE1XQotCi1DbG9zZXM6ICMx
MDk2MzIyCi0KLVVwc3RyZWFtLVN0YXR1czogQmFja3BvcnQgW2h0dHBzOi8vc2Fsc2EuZGViaWFu
Lm9yZy9hcHQtdGVhbS9hcHQvLS9jb21taXQvZjgyZGNkN2U0ZWJiM2Y3MGQyOGU5ZmViMzYyMTY3
NmY4YzBjYzAyNF0KLQotU2lnbmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNv
bT4KLS0tLQotIGFwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MgfCAxICsKLSAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKLQotZGlmZiAtLWdpdCBhL2FwdC1wa2cvY29udHJpYi9zdHJ1dGwu
Y2MgYi9hcHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjCi1pbmRleCA2NzEwMGYxLi5jMGExY2JjIDEw
MDY0NAotLS0tIGEvYXB0LXBrZy9jb250cmliL3N0cnV0bC5jYwotKysrIGIvYXB0LXBrZy9jb250
cmliL3N0cnV0bC5jYwotQEAgLTI2LDYgKzI2LDcgQEAKLSAKLSAjaW5jbHVkZSA8YWxnb3JpdGht
PgotICNpbmNsdWRlIDxhcnJheT4KLSsjaW5jbHVkZSA8Y3N0ZGludD4KLSAjaW5jbHVkZSA8aW9t
YW5pcD4KLSAjaW5jbHVkZSA8bGltaXRzPgotICNpbmNsdWRlIDxsb2NhbGU+CmRpZmYgLS1naXQg
YS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMS5iYiBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9hcHQvYXB0XzMuMC4xLmJiCnNpbWlsYXJpdHkgaW5kZXggOTQlCnJlbmFtZSBmcm9t
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzIuNi4xLmJiCnJlbmFtZSB0byBtZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8zLjAuMS5iYgppbmRleCBkNjA1ZDk1MGRkLi41OWYzYTU5
YmVlIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMS5iYgor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8zLjAuMS5iYgpAQCAtMTMsNyArMTMs
OCBAQCBTUkNfVVJJID0gIiR7REVCSUFOX01JUlJPUn0vbWFpbi9hL2FwdC8ke0JQTn1fJHtQVn0u
dGFyLnh6IFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtY21ha2UtRG8tbm90LWJ1aWxkLXBvLWZp
bGVzLnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtYXB0d2Vic2VydmVyLmNjLUluY2x1
ZGUtYXJyYXkucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1SZW1vdmUtdXNpbmctc3Rk
LWJpbmFyeV9mdW5jdGlvbi5wYXRjaCBcCi0gICAgICAgICAgIGZpbGU6Ly8wMDAxLXN0cnV0bC1B
ZGQtbWlzc2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoIFwKKyAgICAgICAgICAgZmls
ZTovLzAwMDEtRG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNo
IFwKKyAgICAgICAgICAgZmlsZTovLzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1
cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTph
cHBlbmQ6Y2xhc3MtbmF0aXZlID0gIiBcCkBAIC0yNiw3ICsyNyw3IEBAIFNSQ19VUkk6YXBwZW5k
OmNsYXNzLW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1SZXZlcnQtYWx3
YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIFwKICAgICAg
ICAgICAgIgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODZiODg4YzkwMWZhMmU3OGYxYmY1MmEy
YWFhMmY0MDBmZjgyYTQ3MmI5NGZmMGFjNjYzMTkzOWVlNjhmYTZmZCIKK1NSQ19VUklbc2hhMjU2
c3VtXSA9ICI2MDEyOGU2NTFmOTZmZGEyZjc0N2Q5NWQ0MjRiYmI0NmUyNWU5NWVjYThhNTg3YWU4
ZjhjZDQ3OTQ3MjhjYzZmIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5HUEw7
bWQ1PWIyMzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiAjIHRoZSBwYWNrYWdlIGlz
IHRha2VuIGZyb20gc25hcHNob3RzLmRlYmlhbi5vcmc7IHRoYXQgc291cmNlIGlzIHN0YXRpYyBh
bmQgZ29lcyBzdGFsZQotLSAKMi40Ny4xCgo=

--===============4459772240908787411==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1918 entries from dependency cache.
Parsing recipes...done.
Parsing of 937 .bb files complete (936 cached, 1 parsed). 1916 targets, 39 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.12.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:0e26b042389e82848435b171fbb57865fd2e03ee"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 337 Local 325 Mirrors 0 Missed 12 Current 472 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1663 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_recipe_qa)
NOTE: recipe apt-3.0.1-r0: task do_recipe_qa: Started
NOTE: recipe apt-3.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_recipe_qa unihash changed to 4fc33be40fa53aa239c32c097c75c754aeb85eee64503717ce994b0270c35f1d
NOTE: Setscene tasks completed
NOTE: Running task 2091 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_fetch)
NOTE: recipe apt-3.0.1-r0: task do_fetch: Started
NOTE: recipe apt-3.0.1-r0: task do_fetch: Succeeded
NOTE: Running task 2242 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_unpack)
NOTE: Running task 2243 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-3.0.1-r0: task do_unpack: Started
NOTE: recipe apt-3.0.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-3.0.1-r0: task do_unpack: Succeeded
NOTE: Running task 2244 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_patch)
NOTE: Running task 2245 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_collect_spdx_deps)
NOTE: recipe apt-3.0.1-r0: task do_patch: Started
NOTE: recipe apt-3.0.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe apt-3.0.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe apt-3.0.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apt-3.0.1-r0: task do_patch: Succeeded
NOTE: Running task 2246 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_deploy_source_date_epoch)
NOTE: Running task 2247 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_generate_toolchain_file)
NOTE: Running task 2248 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_populate_lic)
NOTE: recipe apt-3.0.1-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-3.0.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe apt-3.0.1-r0: task do_populate_lic: Started
NOTE: recipe apt-3.0.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe apt-3.0.1-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_deploy_source_date_epoch unihash changed to 64bf0af2a2aa642a14b09462e57538fbbc623f3f13e7820662f3602ae9dd16cb
NOTE: recipe apt-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2249 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_configure)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_populate_lic unihash changed to 919faa76269211a7af1e6bfa35fbe984c2a5dd16a3ef6c251fc32c529ea65ff1
NOTE: Setscene tasks completed
NOTE: recipe apt-3.0.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/p
 okybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker
 /auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'libidn2', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'attr', 'bash-completion', 'db', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libgcrypt', 'libgpg-error', 'libseccomp', 'libunistring', 'lz4', 'nettle', 'xxhash', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pseudo-native', 'bzip2-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 15.1.0
| -- The CXX compiler identification is GNU 15.1.0
| -- Detecting C compiler ABI info
| -- Detecting C compiler ABI info - done
| -- Check for working C compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-gcc - skipped
| -- Detecting C compile features
| -- Detecting C compile features - done
| -- Detecting CXX compiler ABI info
| -- Detecting CXX compiler ABI info - done
| -- Check for working CXX compiler: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot-native/usr/bin/x86_64-poky-linux/x86_64-poky-linux-g++ - skipped
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
| -- Found Iconv: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/include
| -- Found Perl: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot-native/usr/bin/perl-native/perl (found version "5.40.2")
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
| -- Found Berkeley: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/include
| -- Found OpenSSL: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot-native/usr/lib/libcrypto.so (found version "3.5.0")
| -- Found ZLIB: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/lib/libz.so (found version "1.3.1")
| -- Found BZip2: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/lib/libbz2.so (found version "1.0.8")
| -- Looking for BZ2_bzCompressInit
| -- Looking for BZ2_bzCompressInit - found
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Found LZMA: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/include
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Found LZ4: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/include
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Could NOT find Udev (missing: UDEV_INCLUDE_DIRS UDEV_LIBRARIES)
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Could NOT find Systemd (missing: SYSTEMD_INCLUDE_DIRS SYSTEMD_LIBRARIES)
| -- Could NOT find PkgConfig (missing: PKG_CONFIG_EXECUTABLE)
| -- Found XXHASH: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/recipe-sysroot/usr/include
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.3675218:163 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/apt-3.0.1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-p
 okysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCURRENT_VENDOR=debian -DWITH_DOC=False -DDPKG_DATADIR=/usr/share/dpkg -DTRIEHASH_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/sources-unpack/triehash -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True -DWITH_TESTS=False -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.3675218, line 163
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.3675218, line 142
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.3675218, line 181
NOTE: recipe apt-3.0.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2249 tasks of which 2239 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515072020.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250515072020.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/log.do_configure.3675218
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: apt-3.0.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.3675218' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/log.do_configure.3675218
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_configure) failed with exit code '1'

--===============4459772240908787411==--

