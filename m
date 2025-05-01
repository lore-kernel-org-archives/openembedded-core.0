Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592CBC3ABD5
	for <webhook@archiver.kernel.org>; Thu,  1 May 2025 15:33:45 +0000 (UTC)
Received: from a27-31.smtp-out.us-west-2.amazonses.com (a27-31.smtp-out.us-west-2.amazonses.com [54.240.27.31])
 by mx.groups.io with SMTP id smtpd.web11.1806.1746113613097356396
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 May 2025 08:33:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx header.b=cJ02O+Iv;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=s8LJRZxA;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.31, mailfrom: 010101968c7b5659-2fa4054c-d2f4-4e7f-9ff6-f65b91b2ee09-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=rnkzp2s7ci3kogmesvov2nwn7wcc2dgx; d=yoctoproject.org;
	t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=fe3csW/QtxSJrFwRnt4MJb/SGSf6vY847Z3onrG6Ugc=;
	b=cJ02O+IvrFIFMvkiBT6JYdBcUkYwMTIl3wkQ0nbZs/Kkz4ZrKHIWT+p7ilc7vGfu
	SRxrmFUxt1qrqO4pT70+1yvBzjrQX21koi5J5kbZzUE7F1tYIollz0VAoyNJPTV0HkW
	gxSqgioBG4G5rtj7Myo6nRT/GeqTaLVXz91l1yuE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1746113615;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=fe3csW/QtxSJrFwRnt4MJb/SGSf6vY847Z3onrG6Ugc=;
	b=s8LJRZxA2BP7+i5SLQwVifRmZpiSuyA/5Jr00/CyV7SLhf9wdZaF+WhnrPcc8g3s
	NQ62dcfCl1DGmHE6luNg4e6ytB1cP2c+/mNdvZxBkDQY3QldBZge6f2tGRju2LeLUXu
	kPrSA1h/IKUa4+mh6cGwhSqZDG7e2j8RFP/d806U=
Content-Type: multipart/mixed; boundary="===============7656691038934785300=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] apt: upgrading to 3.0.1 FAILED
Message-ID: <010101968c7b5659-2fa4054c-d2f4-4e7f-9ff6-f65b91b2ee09-000000@us-west-2.amazonses.com>
Date: Thu, 1 May 2025 15:33:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.05.01-54.240.27.31
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 May 2025 15:33:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215803

--===============7656691038934785300==
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
From e2fc7fbdf1d6a09ffe875cd4eb43fe7179bbe338 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Thu, 1 May 2025 08:05:01 +0000
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
index 199f11bf20..72806cc39d 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -1,4 +1,4 @@
-From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From 9bc4ecf8e9d088d0b83e9ff896aaa1e19e8c30bd Mon Sep 17 00:00:00 2001
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
index 5443ff6caa..51fa4e8ef2 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
+From 53c3a92fe20a57b34be54bc30b0a2350e8980aa5 Mon Sep 17 00:00:00 2001
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
index 37a3133010..98123bcc30 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
+From ced4be551ed5459e3e17d8a82520cb735ae11af4 Mon Sep 17 00:00:00 2001
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
index 0cefbedd6d..679f401889 100644
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
+From 66e5db29523dd51fd7dfbf77bd4fe8658b26a330 Mon Sep 17 00:00:00 2001
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
index 15b036b90d..45665336e4 100644
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -1,4 +1,4 @@
-From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
+From 644b5b86233a6185230183a71b5f04e54704f630 Mon Sep 17 00:00:00 2001
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
index 6f4d5b6e72..141f9ee2df 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
+From 042550a23746146f2b84ebe8200cf089d7fe905a Mon Sep 17 00:00:00 2001
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
index 2c1e617e55..cad058e669 100644
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -1,4 +1,4 @@
-From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
+From 6ca291d777c687ac18a10b84ac1ca2d8629d1177 Mon Sep 17 00:00:00 2001
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
index 036ce35963..89282d86e0 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -1,4 +1,4 @@
-From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From dcda339a27f3ccbd8df783a40269963534a0dfa1 Mon Sep 17 00:00:00 2001
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


--===============7656691038934785300==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-2.6.1-3.0.1.patch"

RnJvbSBlMmZjN2ZiZGYxZDZhMDlmZmU4NzVjZDRlYjQzZmU3MTc5YmJlMzM4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFRodSwgMSBNYXkgMjAyNSAwODowNTowMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGFw
dDogdXBncmFkZSAyLjYuMSAtPiAzLjAuMQoKLS0tCiAuLi52b2lkLWNoYW5naW5nLWluc3RhbGwt
cGF0aHMtYmFzZWQtb24ucGF0Y2ggfCAgNiArKy0tLQogLi4uZS1kb2N1bWVudGF0aW9uLWRpcmVj
dG9yeS1hbHRvZ2V0aGVyLnBhdGNoIHwgIDcgKysrLS0KIC4uLi1pbml0LXRhYmxlcy1mcm9tLWRw
a2ctY29uZmlndXJhdGlvbi5wYXRjaCB8ICA3ICsrKy0tCiAuLi4vYXB0L2FwdC8wMDAxLUZpeC1t
dXNsLWJ1aWxkLnBhdGNoICAgICAgICAgfCAgNyArKy0tLQogLi4uMDAxLVJlbW92ZS11c2luZy1z
dGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoIHwgMTAgKysrLS0tLQogLi4ubi1kcGtnLWNvbmZpZ3Vy
ZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIHwgIDkgKysrLS0tLQogLi4uLzAwMDEtYXB0d2Vi
c2VydmVyLmNjLUluY2x1ZGUtYXJyYXkucGF0Y2ggIHwgIDUgKystLQogLi4uLzAwMDEtY21ha2Ut
RG8tbm90LWJ1aWxkLXBvLWZpbGVzLnBhdGNoICAgIHwgMTAgKysrLS0tLQogLi4ubC1BZGQtbWlz
c2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoIHwgMjYgLS0tLS0tLS0tLS0tLS0tLS0t
LQogLi4uL2FwdC97YXB0XzIuNi4xLmJiID0+IGFwdF8zLjAuMS5iYn0gICAgICAgIHwgIDUgKyst
LQogMTAgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKSwgNjIgZGVsZXRpb25zKC0pCiBk
ZWxldGUgbW9kZSAxMDA2NDQgbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1
dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaAogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQve2FwdF8yLjYuMS5iYiA9PiBhcHRfMy4wLjEuYmJ9ICg5NCUp
CgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxp
c3RzLnR4dC1hdm9pZC1jaGFuZ2luZy1pbnN0YWxsLXBhdGhzLWJhc2VkLW9uLnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1hdm9pZC1jaGFu
Z2luZy1pbnN0YWxsLXBhdGhzLWJhc2VkLW9uLnBhdGNoCmluZGV4IDE5OWYxMWJmMjAuLjcyODA2
Y2MzOWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtQ01h
a2VMaXN0cy50eHQtYXZvaWQtY2hhbmdpbmctaW5zdGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaAor
KysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUNNYWtlTGlzdHMudHh0LWF2
b2lkLWNoYW5naW5nLWluc3RhbGwtcGF0aHMtYmFzZWQtb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDkwMjM1ODkzMTc4NDNkZjRlNTdmOGViZWYxZDlhODM5OGRkYjkyOWQgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDliYzRlY2Y4ZTlkMDg4ZDBiODNlOWZmODk2YWFhMWUxOWU4
YzMwYmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4YW5kZXIgS2FuYXZpbiA8
YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjggTWF5IDIwMjAgMTU6MzQ6MDUg
KzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gQ01ha2VMaXN0cy50eHQ6IGF2b2lkIGNoYW5naW5nIGlu
c3RhbGwgcGF0aHMgYmFzZWQgb24gaG9zdApAQCAtMTEsMTAgKzExLDEwIEBAIFNpZ25lZC1vZmYt
Ynk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9D
TWFrZUxpc3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCAyY2Q0ZjhlLi40NzU5ODEyIDEw
MDY0NAoraW5kZXggYzViODZjMi4uMTRiM2ZmMSAxMDA2NDQKIC0tLSBhL0NNYWtlTGlzdHMudHh0
CiArKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTIxLDkgKzIxLDkgQEAgc2V0KENNQUtFX0VYRV9M
SU5LRVJfRkxBR1NfQ09WRVJBR0UgIi1sZ2NvdiIpCitAQCAtMjgsOSArMjgsOSBAQCBzZXQoQ01B
S0VfRVhFX0xJTktFUl9GTEFHU19DT1ZFUkFHRSAiLWxnY292IikKICBzZXQoQ01BS0VfU0hBUkVE
X0xJTktFUl9GTEFHU19DT1ZFUkFHRSAiLWxnY292IikKICAKICAjIFdvcmsgYXJvdW5kIGJ1ZyBp
biBHTlVJbnN0YWxsRGlycwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9h
cHQvMDAwMS1EaXNhYmxlLWRvY3VtZW50YXRpb24tZGlyZWN0b3J5LWFsdG9nZXRoZXIucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUtZG9jdW1lbnRhdGlv
bi1kaXJlY3RvcnktYWx0b2dldGhlci5wYXRjaAppbmRleCA1NDQzZmY2Y2FhLi41MWZhNGU4ZWYy
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUt
ZG9jdW1lbnRhdGlvbi1kaXJlY3RvcnktYWx0b2dldGhlci5wYXRjaAorKysgYi9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUtZG9jdW1lbnRhdGlvbi1kaXJlY3Rvcnkt
YWx0b2dldGhlci5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjYyOWQxYzNmY2ZiNTYwZWQy
NGVmYzNlNzNkNGU0OTk5YjFlYWIzMyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTNj
M2E5MmZlMjBhNTdiMzRiZTU0YmMzMGIwYTIzNTBlODk4MGFhNSBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
RGF0ZTogRnJpLCAxMCBNYXkgMjAxOSAxNDoxNjo0NyArMDIwMAogU3ViamVjdDogW1BBVENIXSBE
aXNhYmxlIGRvY3VtZW50YXRpb24gZGlyZWN0b3J5IGFsdG9nZXRoZXIKQEAgLTcsMTYgKzcsMTUg
QEAgRXZlbiB3aGVuIFdJVEhfRE9DPUZhbHNlLCB0aGUgYnVpbGQgcmVxdWlyZXMgcG80YSB0byBn
ZW5lcmF0ZSBtYW5wYWdlcy4KIAogVXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtvZS1j
b3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2Fu
YXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIENNYWtlTGlzdHMudHh0IHwgMiArLQogIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEvQ01h
a2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXggNjY4ZTJkNzYyLi42MmY0NDFiZmEg
MTAwNjQ0CitpbmRleCBiMDc2NzhiLi5jNWI4NmMyIDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50
eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtMjQ2LDcgKzI0Niw3IEBAIGFkZF9zdWJkaXJl
Y3RvcnkoYXB0LXByaXZhdGUpCitAQCAtMjUxLDcgKzI1MSw3IEBAIGFkZF9zdWJkaXJlY3Rvcnko
YXB0LXByaXZhdGUpCiAgZW5kaWYoKQogIGFkZF9zdWJkaXJlY3RvcnkoY21kbGluZSkKICBhZGRf
c3ViZGlyZWN0b3J5KGNvbXBsZXRpb25zKQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL2FwdC9hcHQvMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRp
b24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURvLW5vdC1pbml0
LXRhYmxlcy1mcm9tLWRwa2ctY29uZmlndXJhdGlvbi5wYXRjaAppbmRleCAzN2EzMTMzMDEwLi45
ODEyM2JjYzMwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LURvLW5vdC1pbml0LXRhYmxlcy1mcm9tLWRwa2ctY29uZmlndXJhdGlvbi5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURvLW5vdC1pbml0LXRhYmxlcy1mcm9t
LWRwa2ctY29uZmlndXJhdGlvbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gYjg0MjgwZmVj
NGUxZDBkMzNlY2E3OGU3NjU1NjAyM2Y4ZjhmZTViNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gY2VkNGJlNTUxZWQ1NDU5ZTNlMTdkOGE4MjUyMGNiNzM1YWUxMWFmNCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogRnJpLCAxMCBNYXkgMjAxOSAxNjo0NzozOCArMDIwMAogU3ViamVjdDog
W1BBVENIXSBEbyBub3QgaW5pdCB0YWJsZXMgZnJvbSBkcGtnIGNvbmZpZ3VyYXRpb24KQEAgLTcs
MTYgKzcsMTUgQEAgVGhpcyB3b3VsZCByZXF1aXJlIHN5c3Jvb3QgcmVsb2NhdGlvbiBsb2dpYywg
YW5kIGl0J3MgZWFzaWVyIHRvIGp1c3QgZGlzYWJsZSB0aGUKIAogVXBzdHJlYW0tU3RhdHVzOiBJ
bmFwcHJvcHJpYXRlIFtvZS1jb3JlIHNwZWNpZmljXQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVy
IEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+Ci0KIC0tLQogIGFwdC1wa2cvaW5pdC5j
YyB8IDQgKystLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCiAKIGRpZmYgLS1naXQgYS9hcHQtcGtnL2luaXQuY2MgYi9hcHQtcGtnL2luaXQuY2MKLWlu
ZGV4IGI5ZDliMTVkMi4uMTcyNWM1OTY2IDEwMDY0NAoraW5kZXggNjFkNDVlMy4uOTcwMTdkMiAx
MDA2NDQKIC0tLSBhL2FwdC1wa2cvaW5pdC5jYwogKysrIGIvYXB0LXBrZy9pbml0LmNjCi1AQCAt
MjgxLDggKzI4MSw4IEBAIGJvb2wgcGtnSW5pdFN5c3RlbShDb25maWd1cmF0aW9uICZDbmYscGtn
U3lzdGVtIComU3lzKQorQEAgLTI5NSw4ICsyOTUsOCBAQCBib29sIHBrZ0luaXRTeXN0ZW0oQ29u
ZmlndXJhdGlvbiAmQ25mLHBrZ1N5c3RlbSAqJlN5cykKICAJIHJldHVybiBfZXJyb3ItPkVycm9y
KF8oIlVuYWJsZSB0byBkZXRlcm1pbmUgYSBzdWl0YWJsZSBwYWNrYWdpbmcgc3lzdGVtIHR5cGUi
KSk7CiAgICAgfQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQv
MDAwMS1GaXgtbXVzbC1idWlsZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0
LzAwMDEtRml4LW11c2wtYnVpbGQucGF0Y2gKaW5kZXggMGNlZmJlZGQ2ZC4uNjc5ZjQwMTg4OSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtbXVzbC1i
dWlsZC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1t
dXNsLWJ1aWxkLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA2Yjg1NDcxNjFiOTAyYjAxYjYz
OWQwNWE0Y2RmODQ5ZDc2OTQ1NTZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NmU1
ZGIyOTUyM2RkNTFmZDdkZmJmNzdiZDRmZTg2NThiMjZhMzMwIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBE
YXRlOiBGcmksIDIyIE1heSAyMDIwIDE1OjI5OjIzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFw
dC1wa2cvY29udHJpYi9zcnZyZWMuaDogRXhwbGljaXRseSBpbmNsdWRlIHN5cy90eXBlcy5oCkBA
IC0xMiw3ICsxMiw3IEBAIFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4Lmth
bmF2aW5AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZm
IC0tZ2l0IGEvYXB0LXBrZy9jb250cmliL3NydnJlYy5oIGIvYXB0LXBrZy9jb250cmliL3NydnJl
Yy5oCi1pbmRleCBlNWQwZjQzLi4yMDEwMTg0IDEwMDY0NAoraW5kZXggMWU5ODFkMy4uZjRlMjZm
MSAxMDA2NDQKIC0tLSBhL2FwdC1wa2cvY29udHJpYi9zcnZyZWMuaAogKysrIGIvYXB0LXBrZy9j
b250cmliL3NydnJlYy5oCiBAQCAtOSw2ICs5LDcgQEAKQEAgLTIzLDYgKzIzLDMgQEAgaW5kZXgg
ZTVkMGY0My4uMjAxMDE4NCAxMDA2NDQKICAjaW5jbHVkZSA8c3RyaW5nPgogICNpbmNsdWRlIDx2
ZWN0b3I+CiAgI2luY2x1ZGUgPGFycGEvbmFtZXNlci5oPgotLS0gCi0yLjIwLjEKLQpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZW1vdmUtdXNpbmctc3Rk
LWJpbmFyeV9mdW5jdGlvbi5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAw
MDEtUmVtb3ZlLXVzaW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2gKaW5kZXggMTViMDM2Yjkw
ZC4uNDU2NjUzMzZlNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQv
MDAwMS1SZW1vdmUtdXNpbmctc3RkLWJpbmFyeV9mdW5jdGlvbi5wYXRjaAorKysgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJlbW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0
aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlOTFmYjA2MThjZTBhNWQ0MmYyMzlkMGZj
YTYwMjU0NDg1OGYwODE5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NDRiNWI4NjIz
M2E2MTg1MjMwMTgzYTcxYjVmMDRlNTQ3MDRmNjMwIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFR1ZSwgMTYgQXVnIDIw
MjIgMDg6NDQ6MTggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIHVzaW5nIHN0ZDo6Ymlu
YXJ5X2Z1bmN0aW9uCkBAIC0xNCw3ICsxNCw3IEBAIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxy
YWoua2hlbUBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIz
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvZnRwYXJjaGl2ZS9hcHQtZnRwYXJjaGl2ZS5j
YyBiL2Z0cGFyY2hpdmUvYXB0LWZ0cGFyY2hpdmUuY2MKLWluZGV4IDBmNjU4NzI4MS4uMGEyNTNi
MTJiIDEwMDY0NAoraW5kZXggOWM4NmQxOC4uYjg3N2Q0OSAxMDA2NDQKIC0tLSBhL2Z0cGFyY2hp
dmUvYXB0LWZ0cGFyY2hpdmUuY2MKICsrKyBiL2Z0cGFyY2hpdmUvYXB0LWZ0cGFyY2hpdmUuY2MK
IEBAIC00OCw2ICs0OCwxMSBAQApAQCAtNTQsNyArNTQsNyBAQCBpbmRleCAwZjY1ODcyODEuLjBh
MjUzYjEyYiAxMDA2NDQKICAgICB2b2lkIEdldEdlbmVyYWwoQ29uZmlndXJhdGlvbiAmU2V0dXAs
Q29uZmlndXJhdGlvbiAmQmxvY2spOwogICAgIGJvb2wgR2VuUGFja2FnZXMoQ29uZmlndXJhdGlv
biAmU2V0dXAsc3RydWN0IENhY2hlREI6OlN0YXRzICZTdGF0cyk7CiAgICAgYm9vbCBHZW5Tb3Vy
Y2VzKENvbmZpZ3VyYXRpb24gJlNldHVwLHN0cnVjdCBDYWNoZURCOjpTdGF0cyAmU3RhdHMpOwot
QEAgLTg2OSw3ICs4NTYsNyBAQCBzdGF0aWMgYm9vbCBEb0dlbmVyYXRlQ29udGVudHMoQ29uZmln
dXJhdGlvbiAmU2V0dXAsCitAQCAtODY3LDcgKzg1NCw3IEBAIHN0YXRpYyBib29sIERvR2VuZXJh
dGVDb250ZW50cyhDb25maWd1cmF0aW9uICZTZXR1cCwKICAgICAgICBlbHNlCiAgCSBJLT5Db250
ZW50c01UaW1lID0gQS5zdF9tdGltZTsKICAgICB9CkBAIC02Myw3ICs2Myw3IEBAIGluZGV4IDBm
NjU4NzI4MS4uMGEyNTNiMTJiIDEwMDY0NAogICAgIAogICAgIC8qIE5vdyBmb3IgQ29udGVudHMu
LiBUaGUgcHJvY2VzcyBoZXJlIGlzIHRvIGRvIGEgbWFrZS1saWtlIGRlcGVuZGVuY3kKICAgICAg
ICBjaGVjay4gRWFjaCBjb250ZW50cyBmaWxlIGlzIHZlcmlmaWVkIHRvIGJlIG5ld2VyIHRoYW4g
dGhlIHBhY2thZ2UgZmlsZXMKLUBAIC05NDEsOCArOTI4LDggQEAgc3RhdGljIGJvb2wgR2VuZXJh
dGUoQ29tbWFuZExpbmUgJkNtZEwpCitAQCAtOTM5LDggKzkyNiw4IEBAIHN0YXRpYyBib29sIEdl
bmVyYXRlKENvbW1hbmRMaW5lICZDbWRMKQogICAgIExvYWRCaW5EaXIoUGtnTGlzdCxTZXR1cCk7
CiAgCiAgICAgLy8gU29ydCBieSBjYWNoZSBEQiB0byBpbXByb3ZlIElPIGxvY2FsaXR5LgpAQCAt
NzQsNyArNzQsNyBAQCBpbmRleCAwZjY1ODcyODEuLjBhMjUzYjEyYiAxMDA2NDQKICAKICAgICAv
LyBHZW5lcmF0ZSBwYWNrYWdlcwogICAgIGlmIChfY29uZmlnLT5GaW5kQigiQVBUOjpGVFBBcmNo
aXZlOjpDb250ZW50c09ubHkiLCBmYWxzZSkgPT0gZmFsc2UpCi1AQCAtOTkzLDggKzk4MCw4IEBA
IHN0YXRpYyBib29sIENsZWFuKENvbW1hbmRMaW5lICZDbWRMKQorQEAgLTk5MSw4ICs5NzgsOCBA
QCBzdGF0aWMgYm9vbCBDbGVhbihDb21tYW5kTGluZSAmQ21kTCkKICAgICBMb2FkQmluRGlyKFBr
Z0xpc3QsU2V0dXApOwogIAogICAgIC8vIFNvcnQgYnkgY2FjaGUgREIgdG8gaW1wcm92ZSBJTyBs
b2NhbGl0eS4KZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEt
UmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRj
aCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4t
ZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaAppbmRleCA2ZjRkNWI2ZTcy
Li4xNDFmOWVlMmRmIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8w
MDAxLVJldmVydC1hbHdheXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZXZlcnQtYWx3
YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoCkBAIC0xLDQg
KzEsNCBAQAotRnJvbSBhMmRkNjYxNDg0NTM2NDkyYjQ3ZDRjODg5OThmMmJmNTE2NzQ5YmM4IE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNDI1NTBhMjM3NDYxNDZmMmI4NGViZTgyMDBj
ZjA4OWQ3ZmU5MDVhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBUaHUsIDIxIE1heSAyMDIwIDIw
OjEzOjI1ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIFJldmVydCAiYWx3YXlzIHJ1biAnZHBrZyAt
LWNvbmZpZ3VyZSAtYScgYXQgdGhlIGVuZCBvZiBvdXIKQEAgLTE0LDE2ICsxNCwxNSBAQCBiZSBw
YXNzZWQgaW50byBkcGtnLCBhbmQgbGVhZCB0byB0aGUgYmVsb3cgc2ltaWxhciBlcnJvcjoKIAog
VXBzdHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtlbWJlZGRlZCBzcGVjaWZpY10KIFNpZ25l
ZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgotCiAt
LS0KICBhcHQtcGtnL2RlYi9kcGtncG0uY2MgfCA5ICsrLS0tLS0tLQogIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9hcHQtcGtn
L2RlYi9kcGtncG0uY2MgYi9hcHQtcGtnL2RlYi9kcGtncG0uY2MKLWluZGV4IDkzZWZmYTk1OS4u
NDM3NTc4MWQxIDEwMDY0NAoraW5kZXggMDlmM2U0Ny4uNThjZDgwZCAxMDA2NDQKIC0tLSBhL2Fw
dC1wa2cvZGViL2Rwa2dwbS5jYwogKysrIGIvYXB0LXBrZy9kZWIvZHBrZ3BtLmNjCi1AQCAtMTE5
OSwxMiArMTE5OSw2IEBAIHZvaWQgcGtnRFBrZ1BNOjpCdWlsZFBhY2thZ2VzUHJvZ3Jlc3NNYXAo
KQorQEAgLTEyMTAsMTIgKzEyMTAsNiBAQCB2b2lkIHBrZ0RQa2dQTTo6QnVpbGRQYWNrYWdlc1By
b2dyZXNzTWFwKCkKICAJIH0KICAgICAgICB9CiAgICAgfQpAQCAtMzYsNyArMzUsNyBAQCBpbmRl
eCA5M2VmZmE5NTkuLjQzNzU3ODFkMSAxMDA2NDQKICB9CiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLyp9fX0q
LwogIHZvaWQgcGtnRFBrZ1BNOjpTdGFydFB0eU1hZ2ljKCkJCQkJCQkvKnt7eyovCi1AQCAtMTc0
MSw3ICsxNzM1LDggQEAgYm9vbCBwa2dEUGtnUE06OkdvKEFQVDo6UHJvZ3Jlc3M6OlBhY2thZ2VN
YW5hZ2VyICpwcm9ncmVzcykKK0BAIC0xNzUyLDcgKzE3NDYsOCBAQCBib29sIHBrZ0RQa2dQTTo6
R28oQVBUOjpQcm9ncmVzczo6UGFja2FnZU1hbmFnZXIgKnByb2dyZXNzKQogIAogICAgICAgIC8v
IHN1cHBvcnQgc3VicHJlc3Npbmcgb2YgdHJpZ2dlcnMgcHJvY2Vzc2luZyBmb3Igc3BlY2lhbAog
ICAgICAgIC8vIGNhc2VzIGxpa2UgZC1pIHRoYXQgcnVucyB0aGUgdHJpZ2dlcnMgaGFuZGxpbmcg
bWFudWFsbHkKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEt
YXB0d2Vic2VydmVyLmNjLUluY2x1ZGUtYXJyYXkucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLWFwdHdlYnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoCmluZGV4
IDJjMWU2MTdlNTUuLmNhZDA1OGU2NjkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9hcHQvYXB0LzAwMDEtYXB0d2Vic2VydmVyLmNjLUluY2x1ZGUtYXJyYXkucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVk
ZS1hcnJheS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gNTk4NWYzNjY3NTBhNzNjODFjN2Q4
Njg5M2EyYjk1OWI0YWYwNjJhNSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNmNhMjkx
ZDc3N2M2ODdhYzE4YTEwYjg0YWMxY2EyZDg2MjlkMTE3NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBEYXRlOiBXZWQsIDI2IE1h
eSAyMDIxIDIyOjEyOjQ2IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFwdHdlYnNlcnZlci5jYzog
SW5jbHVkZSA8YXJyYXk+CkBAIC0xMSwxMyArMTEsMTIgQEAgdGVzdC9pbnRlcmFjdGl2ZS1oZWxw
ZXIvYXB0d2Vic2VydmVyLmNjOjM2OjU1OiBlcnJvcjogY29uc3RleHByIHZhcmlhYmxlIGNhbm5v
dAogCiBVcHN0cmVhbS1TdGF0dXM6IFN1Ym1pdHRlZCBbaHR0cHM6Ly9naXRodWIuY29tL0RlYmlh
bi9hcHQvcHVsbC8xMzNdCiBTaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwu
Y29tPgotCiAtLS0KICB0ZXN0L2ludGVyYWN0aXZlLWhlbHBlci9hcHR3ZWJzZXJ2ZXIuY2MgfCAx
ICsKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKIAogZGlmZiAtLWdpdCBhL3Rlc3Qv
aW50ZXJhY3RpdmUtaGVscGVyL2FwdHdlYnNlcnZlci5jYyBiL3Rlc3QvaW50ZXJhY3RpdmUtaGVs
cGVyL2FwdHdlYnNlcnZlci5jYwotaW5kZXggZjRmOGQ5NS4uMzYxYzdhOSAxMDA2NDQKK2luZGV4
IGU5ODgyYWIuLmQyYzdlMzUgMTAwNjQ0CiAtLS0gYS90ZXN0L2ludGVyYWN0aXZlLWhlbHBlci9h
cHR3ZWJzZXJ2ZXIuY2MKICsrKyBiL3Rlc3QvaW50ZXJhY3RpdmUtaGVscGVyL2FwdHdlYnNlcnZl
ci5jYwogQEAgLTIzLDYgKzIzLDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9hcHQvYXB0LzAwMDEtY21ha2UtRG8tbm90LWJ1aWxkLXBvLWZpbGVzLnBhdGNoIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmlsZXMu
cGF0Y2gKaW5kZXggMDM2Y2UzNTk2My4uODkyODJkODZlMCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmlsZXMucGF0
Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1ub3Qt
YnVpbGQtcG8tZmlsZXMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDMzMzQ3ZjlmODMwMTYz
M2IwMWFmNGUyMDhiN2JlNWZkZmNiMGRmMGMgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IGRjZGEzMzlhMjdmM2NjYmQ4ZGY3ODNhNDAyNjk5NjM1MzRhMGRmYTEgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogU2F0
LCAyMCBNYXIgMjAyMSAxNDo0NToxOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBjbWFrZTogRG8g
bm90IGJ1aWxkIHBvIGZpbGVzCkBAIC0xMSwxNCArMTEsMTQgQEAgRml4ZXMKIFVwc3RyZWFtLVN0
YXR1czogSW5hcHByb3ByaWF0ZSBbQ3Jvc3MtY29tcGlsZSBzcGVjaWZpY10KIFNpZ25lZC1vZmYt
Ynk6IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiAtLS0KLSBDTWFrZUxpc3RzLnR4dCB8
IDcgLS0tLS0tLQotIDEgZmlsZSBjaGFuZ2VkLCA3IGRlbGV0aW9ucygtKQorIENNYWtlTGlzdHMu
dHh0IHwgOSAtLS0tLS0tLS0KKyAxIGZpbGUgY2hhbmdlZCwgOSBkZWxldGlvbnMoLSkKIAogZGlm
ZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIvQ01ha2VMaXN0cy50eHQKLWluZGV4IGJlMTU3YTU1
Zi4uNTQxNjNhZTZjIDEwMDY0NAoraW5kZXggMTRiM2ZmMS4uZDEzOTY5MiAxMDA2NDQKIC0tLSBh
L0NNYWtlTGlzdHMudHh0CiArKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTI1MiwxNSArMjUyLDYg
QEAgYWRkX3N1YmRpcmVjdG9yeShmdHBhcmNoaXZlKQorQEAgLTI1NywxNSArMjU3LDYgQEAgYWRk
X3N1YmRpcmVjdG9yeShmdHBhcmNoaXZlKQogIGFkZF9zdWJkaXJlY3RvcnkobWV0aG9kcykKICBh
ZGRfc3ViZGlyZWN0b3J5KHRlc3QpCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLXN0cnV0bC1BZGQtbWlzc2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1
LnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1zdHJ1dGwtQWRkLW1p
c3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaApkZWxldGVkIGZpbGUgbW9kZSAxMDA2
NDQKaW5kZXggYjg2ZWQ4YmI5Mi4uMDAwMDAwMDAwMAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLXN0cnV0bC1BZGQtbWlzc2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1
LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjYgKzAsMCBAQAotRnJvbSA5ZGExYjBkYmRjYzkw
NDU1YmM5ZGU0OWY3M2E5NmU3ZDE4ZjgzNDkzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJv
bTogSnVsaWFuIEFuZHJlcyBLbG9kZSA8anVsaWFuLmtsb2RlQGNhbm9uaWNhbC5jb20+Ci1EYXRl
OiBUdWUsIDE4IEZlYiAyMDI1IDEwOjI5OjQwICswMTAwCi1TdWJqZWN0OiBbUEFUQ0hdIHN0cnV0
bDogQWRkIG1pc3NpbmcgI2luY2x1ZGUgPGNzdGRpbnQ+IFtnY2MgMTVdCi0KLUNsb3NlczogIzEw
OTYzMjIKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9zYWxzYS5kZWJpYW4u
b3JnL2FwdC10ZWFtL2FwdC8tL2NvbW1pdC9mODJkY2Q3ZTRlYmIzZjcwZDI4ZTlmZWIzNjIxNjc2
ZjhjMGNjMDI0XQotCi1TaWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29t
PgotLS0tCi0gYXB0LXBrZy9jb250cmliL3N0cnV0bC5jYyB8IDEgKwotIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKQotCi1kaWZmIC0tZ2l0IGEvYXB0LXBrZy9jb250cmliL3N0cnV0bC5j
YyBiL2FwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MKLWluZGV4IDY3MTAwZjEuLmMwYTFjYmMgMTAw
NjQ0Ci0tLS0gYS9hcHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjCi0rKysgYi9hcHQtcGtnL2NvbnRy
aWIvc3RydXRsLmNjCi1AQCAtMjYsNiArMjYsNyBAQAotIAotICNpbmNsdWRlIDxhbGdvcml0aG0+
Ci0gI2luY2x1ZGUgPGFycmF5PgotKyNpbmNsdWRlIDxjc3RkaW50PgotICNpbmNsdWRlIDxpb21h
bmlwPgotICNpbmNsdWRlIDxsaW1pdHM+Ci0gI2luY2x1ZGUgPGxvY2FsZT4KZGlmZiAtLWdpdCBh
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzIuNi4xLmJiIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL2FwdC9hcHRfMy4wLjEuYmIKc2ltaWxhcml0eSBpbmRleCA5NCUKcmVuYW1lIGZyb20g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMi42LjEuYmIKcmVuYW1lIHRvIG1ldGEvcmVj
aXBlcy1kZXZ0b29scy9hcHQvYXB0XzMuMC4xLmJiCmluZGV4IGQ2MDVkOTUwZGQuLjU5ZjNhNTli
ZWUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzIuNi4xLmJiCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0XzMuMC4xLmJiCkBAIC0xMyw3ICsxMyw4
IEBAIFNSQ19VUkkgPSAiJHtERUJJQU5fTUlSUk9SfS9tYWluL2EvYXB0LyR7QlBOfV8ke1BWfS50
YXIueHogXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmls
ZXMucGF0Y2ggXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVk
ZS1hcnJheS5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJlbW92ZS11c2luZy1zdGQt
YmluYXJ5X2Z1bmN0aW9uLnBhdGNoIFwKLSAgICAgICAgICAgZmlsZTovLzAwMDEtc3RydXRsLUFk
ZC1taXNzaW5nLWluY2x1ZGUtY3N0ZGludC1nY2MtMTUucGF0Y2ggXAorICAgICAgICAgICBmaWxl
Oi8vMDAwMS1Eby1ub3QtaW5pdC10YWJsZXMtZnJvbS1kcGtnLWNvbmZpZ3VyYXRpb24ucGF0Y2gg
XAorICAgICAgICAgICBmaWxlOi8vMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3Vy
ZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIFwKICAgICAgICAgICAgIgogCiBTUkNfVVJJOmFw
cGVuZDpjbGFzcy1uYXRpdmUgPSAiIFwKQEAgLTI2LDcgKzI3LDcgQEAgU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtbmF0aXZlc2RrID0gIiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVJldmVydC1hbHdh
eXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2ggXAogICAgICAg
ICAgICAiCiAKLVNSQ19VUklbc2hhMjU2c3VtXSA9ICI4NmI4ODhjOTAxZmEyZTc4ZjFiZjUyYTJh
YWEyZjQwMGZmODJhNDcyYjk0ZmYwYWM2NjMxOTM5ZWU2OGZhNmZkIgorU1JDX1VSSVtzaGEyNTZz
dW1dID0gIjYwMTI4ZTY1MWY5NmZkYTJmNzQ3ZDk1ZDQyNGJiYjQ2ZTI1ZTk1ZWNhOGE1ODdhZThm
OGNkNDc5NDcyOGNjNmYiCiBMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6Ly9DT1BZSU5HLkdQTDtt
ZDU9YjIzNGVlNGQ2OWY1ZmNlNDQ4NmE4MGZkYWY0YTQyNjMiCiAKICMgdGhlIHBhY2thZ2UgaXMg
dGFrZW4gZnJvbSBzbmFwc2hvdHMuZGViaWFuLm9yZzsgdGhhdCBzb3VyY2UgaXMgc3RhdGljIGFu
ZCBnb2VzIHN0YWxlCi0tIAoyLjQ3LjEKCg==

--===============7656691038934785300==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1899 entries from dependency cache.
Parsing recipes...done.
Parsing of 928 .bb files complete (927 cached, 1 parsed). 1897 targets, 39 skipped, 0 masked, 0 errors.
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
workspace            = "tmp-auh-upgrades:c79feba5f8e1448bc835e46ef9b57ba993d1106d"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 312 Local 300 Mirrors 0 Missed 12 Current 497 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Setscene tasks completed
NOTE: Running task 1663 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_recipe_qa)
NOTE: recipe apt-3.0.1-r0: task do_recipe_qa: Started
NOTE: recipe apt-3.0.1-r0: task do_recipe_qa: Succeeded
NOTE: Running task 2118 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_fetch)
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
NOTE: recipe apt-3.0.1-r0: task do_populate_lic: Succeeded
NOTE: Running task 2249 of 2261 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_configure)
NOTE: recipe apt-3.0.1-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.41.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_3.31.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_14.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.68.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/p
 okybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.9.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker
 /auh/build/meta/recipes-devtools/ninja/ninja_1.12.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.7.6.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.17.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'libidn2', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'attr', 'bash-completion', 'db', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libgcrypt', 'libgpg-error', 'libseccomp', 'libunistring', 'lz4', 'nettle', 'xxhash', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pseudo-native', 'bzip2-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 14.2.0
| -- The CXX compiler identification is GNU 14.2.0
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.1993722:163 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/apt-3.0.1 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-p
 okysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCURRENT_VENDOR=debian -DWITH_DOC=False -DDPKG_DATADIR=/usr/share/dpkg -DTRIEHASH_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/sources-unpack/triehash -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True -DWITH_TESTS=False -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.1993722, line 163
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.1993722, line 142
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.1993722, line 181
NOTE: recipe apt-3.0.1-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2249 tasks of which 2239 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501080442.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250501080442.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/log.do_configure.1993722
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: apt-3.0.1-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/run.do_configure.1993722' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.1/temp/log.do_configure.1993722
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.1.bb:do_configure) failed with exit code '1'

--===============7656691038934785300==--

