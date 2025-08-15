Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3C61CA0FE7
	for <webhook@archiver.kernel.org>; Fri, 15 Aug 2025 13:07:11 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.web11.11318.1755263214708443277
 for <openembedded-core@lists.openembedded.org>;
 Fri, 15 Aug 2025 06:07:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SjtUApgZ;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=Cs2e3zmW;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 01010198add740d0-7c50ec77-39cb-45f7-b492-60047c767d5b-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1755263222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=r7P1kkw0fWdZyZ+4SxFEo3uuNlCnST3u3fZwj3UKrTI=;
	b=SjtUApgZ0mE6eJz+mpk+55yJcnm1RCw5/omhkBjAV4JDxAwmedlhXjk6YgJCFvBE
	wcq+PCqIZr6rLJxCQM2iGWLs0LJqcKFvY5jHVHQwmCrHSDj27GLwDI4uV8aIQU0FKdd
	BAe2Ktkp8qeDH3VYFIn+Dt4/yKLg1u64m86lK1AU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1755263222;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=r7P1kkw0fWdZyZ+4SxFEo3uuNlCnST3u3fZwj3UKrTI=;
	b=Cs2e3zmWUn344r0zE83mwbF57nG462AWg5lXfkIbS/vAU7sqgy80YxnF++7DIC6z
	nUURzMBFz0SsZjbQJXBcfzLhozvKOOPcqJde8IrujBW36fYNgMnbFhPmhY9IGQV1IhK
	jDEaIIOjalgesU3gsVUz5coqmUf8BLMNcIgiX9J0=
Content-Type: multipart/mixed; boundary="===============7640481084177044478=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] apt: upgrading to 3.0.3 FAILED
Message-ID: <01010198add740d0-7c50ec77-39cb-45f7-b492-60047c767d5b-000000@us-west-2.amazonses.com>
Date: Fri, 15 Aug 2025 13:07:01 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.08.15-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 15 Aug 2025 13:07:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221899

--===============7640481084177044478==
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
From de04dc227fb7aed8a47a50f81ca8e20734802905 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Fri, 15 Aug 2025 08:28:26 +0000
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
index 199f11bf20..2e2e68cec1 100644
--- a/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
+++ b/meta/recipes-devtools/apt/apt/0001-CMakeLists.txt-avoid-changing-install-paths-based-on.patch
@@ -1,4 +1,4 @@
-From 9023589317843df4e57f8ebef1d9a8398ddb929d Mon Sep 17 00:00:00 2001
+From a4e63b0284c17e55596d36681eb540991b5460b5 Mon Sep 17 00:00:00 2001
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
index 5443ff6caa..8d68b12e34 100644
--- a/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Disable-documentation-directory-altogether.patch
@@ -1,4 +1,4 @@
-From f629d1c3fcfb560ed24efc3e73d4e4999b1eab33 Mon Sep 17 00:00:00 2001
+From 18ea04543369ec2345cfbeb1792eae39b29c29f6 Mon Sep 17 00:00:00 2001
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
index 37a3133010..aa29593c3e 100644
--- a/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Do-not-init-tables-from-dpkg-configuration.patch
@@ -1,4 +1,4 @@
-From b84280fec4e1d0d33eca78e76556023f8f8fe5b7 Mon Sep 17 00:00:00 2001
+From 65b6ffb949c98ad95036ba5d7e469e6a787c9f69 Mon Sep 17 00:00:00 2001
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
index 0cefbedd6d..d0d12b1228 100644
--- a/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Fix-musl-build.patch
@@ -1,4 +1,4 @@
-From 6b8547161b902b01b639d05a4cdf849d7694556f Mon Sep 17 00:00:00 2001
+From 42e6b0cb08df4a2e87bfedc0e68eb57ae79cc2b5 Mon Sep 17 00:00:00 2001
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
index 15b036b90d..6046dfe795 100644
--- a/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Remove-using-std-binary_function.patch
@@ -1,4 +1,4 @@
-From e91fb0618ce0a5d42f239d0fca602544858f0819 Mon Sep 17 00:00:00 2001
+From dcbf5dbbc22df32dae49334ee47a4a7d63b4819c Mon Sep 17 00:00:00 2001
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
index 6f4d5b6e72..1c7d42e901 100644
--- a/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
+++ b/meta/recipes-devtools/apt/apt/0001-Revert-always-run-dpkg-configure-a-at-the-end-of-our.patch
@@ -1,4 +1,4 @@
-From a2dd661484536492b47d4c88998f2bf516749bc8 Mon Sep 17 00:00:00 2001
+From 26fc58f574f0a585e18d42cd65831914a84ae470 Mon Sep 17 00:00:00 2001
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
index 2c1e617e55..db624ac705 100644
--- a/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
+++ b/meta/recipes-devtools/apt/apt/0001-aptwebserver.cc-Include-array.patch
@@ -1,4 +1,4 @@
-From 5985f366750a73c81c7d86893a2b959b4af062a5 Mon Sep 17 00:00:00 2001
+From b0a2e5942bee89ad86592605a7336ead62a91307 Mon Sep 17 00:00:00 2001
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
index 036ce35963..0981e4d2d7 100644
--- a/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
+++ b/meta/recipes-devtools/apt/apt/0001-cmake-Do-not-build-po-files.patch
@@ -1,4 +1,4 @@
-From 33347f9f8301633b01af4e208b7be5fdfcb0df0c Mon Sep 17 00:00:00 2001
+From 908b0323ce5a5faf8ec6776d6639cffd471749c7 Mon Sep 17 00:00:00 2001
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


--===============7640481084177044478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 1943 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (943 cached, 1 parsed). 1941 targets, 42 skipped, 0 masked, 0 errors.
Removing 1 recipes from the core2-64 sysroot...done.
Removing 1 recipes from the qemux86_64 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-30d3ec7ab6c980e7fe25760be1834b680d5914ab"
TUNE_FEATURES        = "m64 core2"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:30d3ec7ab6c980e7fe25760be1834b680d5914ab"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 365 Local 354 Mirrors 0 Missed 11 Current 430 (96% match, 98% complete)
done.
NOTE: Executing Tasks
NOTE: Running setscene task 774 of 795 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_recipe_qa_setscene)
NOTE: recipe apt-3.0.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe apt-3.0.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1658 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_fetch)
NOTE: recipe apt-3.0.3-r0: task do_fetch: Started
NOTE: recipe apt-3.0.3-r0: task do_fetch: Succeeded
NOTE: Running task 2190 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_unpack)
NOTE: Running task 2191 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_prepare_recipe_sysroot)
NOTE: recipe apt-3.0.3-r0: task do_unpack: Started
NOTE: recipe apt-3.0.3-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe apt-3.0.3-r0: task do_unpack: Succeeded
NOTE: Running task 2213 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_patch)
NOTE: Running task 2214 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_collect_spdx_deps)
NOTE: recipe apt-3.0.3-r0: task do_patch: Started
NOTE: recipe apt-3.0.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe apt-3.0.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_patch: Succeeded
NOTE: Running task 2215 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_deploy_source_date_epoch)
NOTE: Running task 2216 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_generate_toolchain_file)
NOTE: Running task 2217 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_populate_lic)
NOTE: recipe apt-3.0.3-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe apt-3.0.3-r0: task do_generate_toolchain_file: Started
NOTE: recipe apt-3.0.3-r0: task do_populate_lic: Started
NOTE: recipe apt-3.0.3-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_populate_lic: Succeeded
NOTE: recipe apt-3.0.3-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_populate_lic unihash changed to d79cb02248e42e8c4053aa99c1e61dcac8a605ae6530b2e334b6adc45571f380
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_deploy_source_date_epoch unihash changed to 9aa24d14c3614a0d5c79fe3f26a3b903456ef88e0a923d23871988a46ca2d9e3
NOTE: Setscene tasks completed
NOTE: Running task 2218 of 2230 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure)
NOTE: recipe apt-3.0.3-r0: task do_configure: Started
Log data follows:
| DEBUG: Executing python function extend_recipe_sysroot
| NOTE: Direct dependencies are ['/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glibc/glibc_2.42.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/cmake/cmake-native_4.1.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/quilt/quilt-native_0.69.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot', '/srv/po
 kybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/db/db_5.3.28.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.1.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/lz4/lz4_1.10.0.bb:do_populate_sysroot', '/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/xxhash/xxhash_0.8.3.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker
 /auh/build/meta/recipes-devtools/ninja/ninja_1.13.1.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/patch/patch_2.8.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/pseudo/pseudo_git.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot', 'virtual:native:/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot']
| NOTE: Installed into sysroot: []
| NOTE: Skipping as already exists in sysroot: ['base-files', 'base-passwd', 'gettext-minimal-native', 'glibc', 'libxcrypt', 'zlib', 'binutils-cross-x86_64', 'cmake-native', 'gcc-cross-x86_64', 'gcc-runtime', 'libgcc', 'libtool-native', 'm4-native', 'opkg-utils', 'quilt-native', 'bzip2', 'libidn2', 'libpam', 'shadow-sysroot', 'shadow', 'texinfo-dummy-native', 'xz', 'linux-libc-headers', 'attr', 'bash-completion', 'db', 'gmp', 'gnutls', 'libtasn1', 'libcap', 'libgcrypt', 'libgpg-error', 'libseccomp', 'libunistring', 'lz4', 'nettle', 'xxhash', 'openssl-native', 'ncurses-native', 'zlib-native', 'flex-native', 'gnu-config-native', 'make-native', 'ninja-native', 'patch-native', 'perl-native', 'pseudo-native', 'bzip2-native', 'shadow-native', 'xz-native', 'zstd-native', 'attr-native', 'gdbm-native', 'gmp-native', 'libbsd-native', 'libmd-native', 'libmpc-native', 'mpfr-native', 're2c-native', 'sqlite3-native']
| DEBUG: Python function extend_recipe_sysroot finished
| DEBUG: Executing shell function do_configure
| -- The C compiler identification is GNU 15.2.0
| -- The CXX compiler identification is GNU 15.2.0
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
| -- Found OpenSSL: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/recipe-sysroot-native/usr/lib/libcrypto.so (found version "3.5.2")
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
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2912211:163 exit 1 from 'cmake -G 'Ninja' -DCMAKE_MAKE_PROGRAM=ninja $oecmake_sitefile /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/sources/apt-3.0.3 -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_BINDIR:PATH=bin -DCMAKE_INSTALL_SBINDIR:PATH=sbin -DCMAKE_INSTALL_LIBEXECDIR:PATH=libexec -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc -DCMAKE_INSTALL_SHAREDSTATEDIR:PATH=../com -DCMAKE_INSTALL_LOCALSTATEDIR:PATH=/var -DCMAKE_INSTALL_LIBDIR:PATH=lib -DCMAKE_INSTALL_INCLUDEDIR:PATH=include -DCMAKE_INSTALL_DATAROOTDIR:PATH=share -DPYTHON_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/x86_64-pokysdk-linux/usr/bin/python3 -DPython3_EXECUTABLE:PATH=/srv/pokybuild/yocto-worker/auh/build/buildtools/sysroots/
 x86_64-pokysdk-linux/usr/bin/python3 -DLIB_SUFFIX= -DCMAKE_INSTALL_SO_NO_EXE=0 -DCMAKE_TOOLCHAIN_FILE:FILEPATH=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/toolchain.cmake -DCMAKE_NO_SYSTEM_FROM_IMPORTED=1 -DCMAKE_EXPORT_NO_PACKAGE_REGISTRY=ON -DFETCHCONTENT_FULLY_DISCONNECTED=ON -DCMAKE_EXPORT_COMPILE_COMMANDS:BOOL=ON -DCURRENT_VENDOR=debian -DWITH_DOC=False -DDPKG_DATADIR=/usr/share/dpkg -DTRIEHASH_EXECUTABLE=/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/sources/triehash -DCMAKE_DISABLE_FIND_PACKAGE_ZSTD=True -DCMAKE_DISABLE_FIND_PACKAGE_SECCOMP=True -DWITH_TESTS=False -Wno-dev'
| WARNING: Backtrace (BB generated script):
| 	#1: cmake_do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2912211, line 163
| 	#2: do_configure, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2912211, line 142
| 	#3: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2912211, line 181
NOTE: recipe apt-3.0.3-r0: task do_configure: Failed
NOTE: Tasks Summary: Attempted 2218 tasks of which 2209 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815082811.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20250815082811.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/log.do_configure.2912211
Summary: There was 1 ERROR message, returning a non-zero exit code.
ERROR: apt-3.0.3-r0 do_configure: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/run.do_configure.2912211' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/core2-64-poky-linux/apt/3.0.3/temp/log.do_configure.2912211
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/apt/apt_3.0.3.bb:do_configure) failed with exit code '1'

--===============7640481084177044478==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-apt-upgrade-2.6.1-3.0.3.patch"

RnJvbSBkZTA0ZGMyMjdmYjdhZWQ4YTQ3YTUwZjgxY2E4ZTIwNzM0ODAyOTA1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IEZyaSwgMTUgQXVnIDIwMjUgMDg6Mjg6MjYgKzAwMDAKU3ViamVjdDogW1BBVENIXSBh
cHQ6IHVwZ3JhZGUgMi42LjEgLT4gMy4wLjMKCi0tLQogLi4udm9pZC1jaGFuZ2luZy1pbnN0YWxs
LXBhdGhzLWJhc2VkLW9uLnBhdGNoIHwgIDYgKy0tCiAuLi5lLWRvY3VtZW50YXRpb24tZGlyZWN0
b3J5LWFsdG9nZXRoZXIucGF0Y2ggfCAgNyArKy0KIC4uLi1pbml0LXRhYmxlcy1mcm9tLWRwa2ct
Y29uZmlndXJhdGlvbi5wYXRjaCB8ICA3ICsrLQogLi4uY29tcGlsYXRpb24tZXJyb3Itd2l0aC1j
bGFuZy1saWJjLTE4LnBhdGNoIHwgMjkgLS0tLS0tLS0tLS0tCiAuLi4vYXB0L2FwdC8wMDAxLUZp
eC1tdXNsLWJ1aWxkLnBhdGNoICAgICAgICAgfCAgNyArLS0KIC4uLm11bV9yZXF1aXJlZC10by0z
LjEzLXRvLWF2b2lkLXdhcm5pbi5wYXRjaCB8IDQ3IC0tLS0tLS0tLS0tLS0tLS0tLS0KIC4uLjAw
MS1SZW1vdmUtdXNpbmctc3RkLWJpbmFyeV9mdW5jdGlvbi5wYXRjaCB8IDEwICsrLS0KIC4uLm4t
ZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5kLW9mLW91ci5wYXRjaCB8ICA5ICsrLS0KIC4uLi8w
MDAxLWFwdHdlYnNlcnZlci5jYy1JbmNsdWRlLWFycmF5LnBhdGNoICB8ICA1ICstCiAuLi4vMDAw
MS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmlsZXMucGF0Y2ggICAgfCAxMCArKy0tCiAuLi5sLUFk
ZC1taXNzaW5nLWluY2x1ZGUtY3N0ZGludC1nY2MtMTUucGF0Y2ggfCAyNiAtLS0tLS0tLS0tCiAu
Li4vYXB0L3thcHRfMi42LjEuYmIgPT4gYXB0XzMuMC4zLmJifSAgICAgICAgfCAgNyArKy0KIDEy
IGZpbGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDE0MCBkZWxldGlvbnMoLSkKIGRlbGV0
ZSBtb2RlIDEwMDY0NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1jb21w
aWxhdGlvbi1lcnJvci13aXRoLWNsYW5nLWxpYmMtMTgucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJhaXNlLWNtYWtlX21pbmltdW1f
cmVxdWlyZWQtdG8tMy4xMy10by1hdm9pZC13YXJuaW4ucGF0Y2gKIGRlbGV0ZSBtb2RlIDEwMDY0
NCBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLXN0cnV0bC1BZGQtbWlzc2luZy1p
bmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xz
L2FwdC97YXB0XzIuNi4xLmJiID0+IGFwdF8zLjAuMy5iYn0gKDkzJSkKCmRpZmYgLS1naXQgYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUNNYWtlTGlzdHMudHh0LWF2b2lkLWNo
YW5naW5nLWluc3RhbGwtcGF0aHMtYmFzZWQtb24ucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLUNNYWtlTGlzdHMudHh0LWF2b2lkLWNoYW5naW5nLWluc3RhbGwtcGF0
aHMtYmFzZWQtb24ucGF0Y2gKaW5kZXggMTk5ZjExYmYyMC4uMmUyZTY4Y2VjMSAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1DTWFrZUxpc3RzLnR4dC1hdm9p
ZC1jaGFuZ2luZy1pbnN0YWxsLXBhdGhzLWJhc2VkLW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtQ01ha2VMaXN0cy50eHQtYXZvaWQtY2hhbmdpbmctaW5z
dGFsbC1wYXRocy1iYXNlZC1vbi5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTAyMzU4OTMx
Nzg0M2RmNGU1N2Y4ZWJlZjFkOWE4Mzk4ZGRiOTI5ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gYTRlNjNiMDI4NGMxN2U1NTU5NmQzNjY4MWViNTQwOTkxYjU0NjBiNSBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21h
aWwuY29tPgogRGF0ZTogVGh1LCAyOCBNYXkgMjAyMCAxNTozNDowNSArMDAwMAogU3ViamVjdDog
W1BBVENIXSBDTWFrZUxpc3RzLnR4dDogYXZvaWQgY2hhbmdpbmcgaW5zdGFsbCBwYXRocyBiYXNl
ZCBvbiBob3N0CkBAIC0xMSwxMCArMTEsMTAgQEAgU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEth
bmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0
aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL0NNYWtlTGlzdHMudHh0IGIv
Q01ha2VMaXN0cy50eHQKLWluZGV4IDJjZDRmOGUuLjQ3NTk4MTIgMTAwNjQ0CitpbmRleCAxMDFm
YmZiLi5iMGI5NmE5IDEwMDY0NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlz
dHMudHh0Ci1AQCAtMjEsOSArMjEsOSBAQCBzZXQoQ01BS0VfRVhFX0xJTktFUl9GTEFHU19DT1ZF
UkFHRSAiLWxnY292IikKK0BAIC0yOCw5ICsyOCw5IEBAIHNldChDTUFLRV9FWEVfTElOS0VSX0ZM
QUdTX0NPVkVSQUdFICItbGdjb3YiKQogIHNldChDTUFLRV9TSEFSRURfTElOS0VSX0ZMQUdTX0NP
VkVSQUdFICItbGdjb3YiKQogIAogICMgV29yayBhcm91bmQgYnVnIGluIEdOVUluc3RhbGxEaXJz
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLURpc2FibGUt
ZG9jdW1lbnRhdGlvbi1kaXJlY3RvcnktYWx0b2dldGhlci5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9hcHQvYXB0LzAwMDEtRGlzYWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRv
Z2V0aGVyLnBhdGNoCmluZGV4IDU0NDNmZjZjYWEuLjhkNjhiMTJlMzQgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRGlzYWJsZS1kb2N1bWVudGF0aW9uLWRp
cmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQv
YXB0LzAwMDEtRGlzYWJsZS1kb2N1bWVudGF0aW9uLWRpcmVjdG9yeS1hbHRvZ2V0aGVyLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmNjI5ZDFjM2ZjZmI1NjBlZDI0ZWZjM2U3M2Q0ZTQ5OTli
MWVhYjMzIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAxOGVhMDQ1NDMzNjllYzIzNDVj
ZmJlYjE3OTJlYWUzOWIyOWMyOWY2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxl
eGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDEwIE1h
eSAyMDE5IDE0OjE2OjQ3ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERpc2FibGUgZG9jdW1lbnRh
dGlvbiBkaXJlY3RvcnkgYWx0b2dldGhlcgpAQCAtNywxNiArNywxNSBAQCBFdmVuIHdoZW4gV0lU
SF9ET0M9RmFsc2UsIHRoZSBidWlsZCByZXF1aXJlcyBwbzRhIHRvIGdlbmVyYXRlIG1hbnBhZ2Vz
LgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29lLWNvcmUgc3BlY2lmaWNdCiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4K
LQogLS0tCiAgQ01ha2VMaXN0cy50eHQgfCAyICstCiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCiAKIGRpZmYgLS1naXQgYS9DTWFrZUxpc3RzLnR4dCBiL0NN
YWtlTGlzdHMudHh0Ci1pbmRleCA2NjhlMmQ3NjIuLjYyZjQ0MWJmYSAxMDA2NDQKK2luZGV4IGYz
N2I3MDAuLjEwMWZiZmIgMTAwNjQ0CiAtLS0gYS9DTWFrZUxpc3RzLnR4dAogKysrIGIvQ01ha2VM
aXN0cy50eHQKLUBAIC0yNDYsNyArMjQ2LDcgQEAgYWRkX3N1YmRpcmVjdG9yeShhcHQtcHJpdmF0
ZSkKK0BAIC0yNTEsNyArMjUxLDcgQEAgYWRkX3N1YmRpcmVjdG9yeShhcHQtcHJpdmF0ZSkKICBl
bmRpZigpCiAgYWRkX3N1YmRpcmVjdG9yeShjbWRsaW5lKQogIGFkZF9zdWJkaXJlY3RvcnkoY29t
cGxldGlvbnMpCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAx
LURvLW5vdC1pbml0LXRhYmxlcy1mcm9tLWRwa2ctY29uZmlndXJhdGlvbi5wYXRjaCBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBr
Zy1jb25maWd1cmF0aW9uLnBhdGNoCmluZGV4IDM3YTMxMzMwMTAuLmFhMjk1OTNjM2UgMTAwNjQ0
Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQtdGFi
bGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9hcHQvYXB0LzAwMDEtRG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0
aW9uLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBiODQyODBmZWM0ZTFkMGQzM2VjYTc4ZTc2
NTU2MDIzZjhmOGZlNWI3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2NWI2ZmZiOTQ5
Yzk4YWQ5NTAzNmJhNWQ3ZTQ2OWU2YTc4N2M5ZjY5IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBG
cmksIDEwIE1heSAyMDE5IDE2OjQ3OjM4ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIERvIG5vdCBp
bml0IHRhYmxlcyBmcm9tIGRwa2cgY29uZmlndXJhdGlvbgpAQCAtNywxNiArNywxNSBAQCBUaGlz
IHdvdWxkIHJlcXVpcmUgc3lzcm9vdCByZWxvY2F0aW9uIGxvZ2ljLCBhbmQgaXQncyBlYXNpZXIg
dG8ganVzdCBkaXNhYmxlIHRoZQogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW29l
LWNvcmUgc3BlY2lmaWNdCiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kZXIgS2FuYXZpbiA8YWxleC5r
YW5hdmluQGdtYWlsLmNvbT4KLQogLS0tCiAgYXB0LXBrZy9pbml0LmNjIHwgNCArKy0tCiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdp
dCBhL2FwdC1wa2cvaW5pdC5jYyBiL2FwdC1wa2cvaW5pdC5jYwotaW5kZXggYjlkOWIxNWQyLi4x
NzI1YzU5NjYgMTAwNjQ0CitpbmRleCA2MWQ0NWUzLi45NzAxN2QyIDEwMDY0NAogLS0tIGEvYXB0
LXBrZy9pbml0LmNjCiArKysgYi9hcHQtcGtnL2luaXQuY2MKLUBAIC0yODEsOCArMjgxLDggQEAg
Ym9vbCBwa2dJbml0U3lzdGVtKENvbmZpZ3VyYXRpb24gJkNuZixwa2dTeXN0ZW0gKiZTeXMpCitA
QCAtMjk1LDggKzI5NSw4IEBAIGJvb2wgcGtnSW5pdFN5c3RlbShDb25maWd1cmF0aW9uICZDbmYs
cGtnU3lzdGVtIComU3lzKQogIAkgcmV0dXJuIF9lcnJvci0+RXJyb3IoXygiVW5hYmxlIHRvIGRl
dGVybWluZSBhIHN1aXRhYmxlIHBhY2thZ2luZyBzeXN0ZW0gdHlwZSIpKTsKICAgICB9CiAgCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1jb21waWxh
dGlvbi1lcnJvci13aXRoLWNsYW5nLWxpYmMtMTgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvYXB0L2FwdC8wMDAxLUZpeC1jb21waWxhdGlvbi1lcnJvci13aXRoLWNsYW5nLWxpYmMtMTgu
cGF0Y2gKZGVsZXRlZCBmaWxlIG1vZGUgMTAwNjQ0CmluZGV4IGU1NTIwNWNhM2YuLjAwMDAwMDAw
MDAKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtY29tcGlsYXRp
b24tZXJyb3Itd2l0aC1jbGFuZy1saWJjLTE4LnBhdGNoCisrKyAvZGV2L251bGwKQEAgLTEsMjkg
KzAsMCBAQAotRnJvbSBiNDQ4ODU4MzQyNGIzM2Y1MWNiMDMxNTYyYTllOGRmODIwZmZkYTIzIE1v
biBTZXAgMTcgMDA6MDA6MDAgMjAwMQotRnJvbTogQ2hvbmd5dW4gTGVlIDxsaWN5MTgzQHRlcm11
eC5kZXY+Ci1EYXRlOiBUaHUsIDE1IEF1ZyAyMDI0IDIxOjMxOjI0ICswODAwCi1TdWJqZWN0OiBb
UEFUQ0hdIEZpeCBjb21waWxhdGlvbiBlcnJvciB3aXRoIGNsYW5nL2xpYmMrKyAxOAotCi1VcHN0
cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3NhbHNhLmRlYmlhbi5vcmcvYXB0LXRlYW0v
YXB0Ly0vY29tbWl0L2I0NDg4NTgzNDI0YjMzZjUxY2IwMzE1NjJhOWU4ZGY4MjBmZmRhMjNdCi1T
aWduZWQtb2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgotLS0tCi0gYXB0LXBr
Zy9jYWNoZXNldC5oIHwgNCArKy0tCi0gMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkKLQotZGlmZiAtLWdpdCBhL2FwdC1wa2cvY2FjaGVzZXQuaCBiL2FwdC1w
a2cvY2FjaGVzZXQuaAotaW5kZXggNWRiYjliZjA4Li4xYzY3YTY1ZDYgMTAwNjQ0Ci0tLS0gYS9h
cHQtcGtnL2NhY2hlc2V0LmgKLSsrKyBiL2FwdC1wa2cvY2FjaGVzZXQuaAotQEAgLTIxOCwxMSAr
MjE4LDExIEBAIHB1YmxpYzoKLSAJb3BlcmF0b3IgY29udGFpbmVyX2l0ZXJhdG9yKHZvaWQpIGNv
bnN0IHsgcmV0dXJuIF9pdGVyOyB9Ci0gCWlubGluZSBpdGVyYXRvcl90eXBlJiBvcGVyYXRvcisr
KCkgeyArK19pdGVyOyByZXR1cm4gc3RhdGljX2Nhc3Q8aXRlcmF0b3JfdHlwZSY+KCp0aGlzKTsg
fQotIAlpbmxpbmUgaXRlcmF0b3JfdHlwZSBvcGVyYXRvcisrKGludCkgeyBpdGVyYXRvcl90eXBl
IHRtcCgqdGhpcyk7IG9wZXJhdG9yKysoKTsgcmV0dXJuIHRtcDsgfQotLQlpbmxpbmUgaXRlcmF0
b3JfdHlwZSBvcGVyYXRvcisodHlwZW5hbWUgY29udGFpbmVyX2l0ZXJhdG9yOjpkaWZmZXJlbmNl
X3R5cGUgY29uc3QgJm4pIHsgcmV0dXJuIGl0ZXJhdG9yX3R5cGUoX2l0ZXIgKyBuKTsgfQotKwlp
bmxpbmUgaXRlcmF0b3JfdHlwZSBvcGVyYXRvcisodHlwZW5hbWUgY29udGFpbmVyX2l0ZXJhdG9y
OjpkaWZmZXJlbmNlX3R5cGUgY29uc3QgJm4pIGNvbnN0IHsgcmV0dXJuIGl0ZXJhdG9yX3R5cGUo
X2l0ZXIgKyBuKTsgfQotIAlpbmxpbmUgaXRlcmF0b3JfdHlwZSBvcGVyYXRvcis9KHR5cGVuYW1l
IGNvbnRhaW5lcl9pdGVyYXRvcjo6ZGlmZmVyZW5jZV90eXBlIGNvbnN0ICZuKSB7IF9pdGVyICs9
IG47IHJldHVybiBzdGF0aWNfY2FzdDxpdGVyYXRvcl90eXBlJj4oKnRoaXMpOyB9Ci0gCWlubGlu
ZSBpdGVyYXRvcl90eXBlJiBvcGVyYXRvci0tKCkgeyAtLV9pdGVyOzsgcmV0dXJuIHN0YXRpY19j
YXN0PGl0ZXJhdG9yX3R5cGUmPigqdGhpcyk7IH0KLSAJaW5saW5lIGl0ZXJhdG9yX3R5cGUgb3Bl
cmF0b3ItLShpbnQpIHsgaXRlcmF0b3JfdHlwZSB0bXAoKnRoaXMpOyBvcGVyYXRvci0tKCk7IHJl
dHVybiB0bXA7IH0KLS0JaW5saW5lIGl0ZXJhdG9yX3R5cGUgb3BlcmF0b3ItKHR5cGVuYW1lIGNv
bnRhaW5lcl9pdGVyYXRvcjo6ZGlmZmVyZW5jZV90eXBlIGNvbnN0ICZuKSB7IHJldHVybiBpdGVy
YXRvcl90eXBlKF9pdGVyIC0gbik7IH0KLSsJaW5saW5lIGl0ZXJhdG9yX3R5cGUgb3BlcmF0b3It
KHR5cGVuYW1lIGNvbnRhaW5lcl9pdGVyYXRvcjo6ZGlmZmVyZW5jZV90eXBlIGNvbnN0ICZuKSBj
b25zdCB7IHJldHVybiBpdGVyYXRvcl90eXBlKF9pdGVyIC0gbik7IH0KLSAJaW5saW5lIHR5cGVu
YW1lIGNvbnRhaW5lcl9pdGVyYXRvcjo6ZGlmZmVyZW5jZV90eXBlIG9wZXJhdG9yLShpdGVyYXRv
cl90eXBlIGNvbnN0ICZiKSB7IHJldHVybiAoX2l0ZXIgLSBiLl9pdGVyKTsgfQotIAlpbmxpbmUg
aXRlcmF0b3JfdHlwZSBvcGVyYXRvci09KHR5cGVuYW1lIGNvbnRhaW5lcl9pdGVyYXRvcjo6ZGlm
ZmVyZW5jZV90eXBlIGNvbnN0ICZuKSB7IF9pdGVyIC09IG47IHJldHVybiBzdGF0aWNfY2FzdDxp
dGVyYXRvcl90eXBlJj4oKnRoaXMpOyB9Ci0gCWlubGluZSBib29sIG9wZXJhdG9yIT0oaXRlcmF0
b3JfdHlwZSBjb25zdCAmaSkgY29uc3QgeyByZXR1cm4gX2l0ZXIgIT0gaS5faXRlcjsgfQpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtbXVzbC1idWls
ZC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtRml4LW11c2wtYnVp
bGQucGF0Y2gKaW5kZXggMGNlZmJlZGQ2ZC4uZDBkMTJiMTIyOCAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1GaXgtbXVzbC1idWlsZC5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLUZpeC1tdXNsLWJ1aWxkLnBhdGNoCkBA
IC0xLDQgKzEsNCBAQAotRnJvbSA2Yjg1NDcxNjFiOTAyYjAxYjYzOWQwNWE0Y2RmODQ5ZDc2OTQ1
NTZmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA0MmU2YjBjYjA4ZGY0YTJlODdiZmVk
YzBlNjhlYjU3YWU3OWNjMmI1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQWxleGFu
ZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5jb20+CiBEYXRlOiBGcmksIDIyIE1heSAy
MDIwIDE1OjI5OjIzICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIGFwdC1wa2cvY29udHJpYi9zcnZy
ZWMuaDogRXhwbGljaXRseSBpbmNsdWRlIHN5cy90eXBlcy5oCkBAIC0xMiw3ICsxMiw3IEBAIFNp
Z25lZC1vZmYtYnk6IEFsZXhhbmRlciBLYW5hdmluIDxhbGV4LmthbmF2aW5AZ21haWwuY29tPgog
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0IGEvYXB0LXBrZy9j
b250cmliL3NydnJlYy5oIGIvYXB0LXBrZy9jb250cmliL3NydnJlYy5oCi1pbmRleCBlNWQwZjQz
Li4yMDEwMTg0IDEwMDY0NAoraW5kZXggMWU5ODFkMy4uZjRlMjZmMSAxMDA2NDQKIC0tLSBhL2Fw
dC1wa2cvY29udHJpYi9zcnZyZWMuaAogKysrIGIvYXB0LXBrZy9jb250cmliL3NydnJlYy5oCiBA
QCAtOSw2ICs5LDcgQEAKQEAgLTIzLDYgKzIzLDMgQEAgaW5kZXggZTVkMGY0My4uMjAxMDE4NCAx
MDA2NDQKICAjaW5jbHVkZSA8c3RyaW5nPgogICNpbmNsdWRlIDx2ZWN0b3I+CiAgI2luY2x1ZGUg
PGFycGEvbmFtZXNlci5oPgotLS0gCi0yLjIwLjEKLQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SYWlzZS1jbWFrZV9taW5pbXVtX3JlcXVpcmVkLXRvLTMu
MTMtdG8tYXZvaWQtd2FybmluLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQv
MDAwMS1SYWlzZS1jbWFrZV9taW5pbXVtX3JlcXVpcmVkLXRvLTMuMTMtdG8tYXZvaWQtd2Fybmlu
LnBhdGNoCmRlbGV0ZWQgZmlsZSBtb2RlIDEwMDY0NAppbmRleCBjM2E1ZGVkNDk0Li4wMDAwMDAw
MDAwCi0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmFpc2UtY21ha2Vf
bWluaW11bV9yZXF1aXJlZC10by0zLjEzLXRvLWF2b2lkLXdhcm5pbi5wYXRjaAorKysgL2Rldi9u
dWxsCkBAIC0xLDQ3ICswLDAgQEAKLUZyb20gZGM3YThiMzA1MGEyYTQzZjQ5NTE1YTAzYWUxOTcx
M2RmY2VkNzVkYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKLUZyb206IERhdmlkIEthbG5pc2No
a2llcyA8ZGF2aWRAa2FsbmlzY2hraWVzLmRlPgotRGF0ZTogU2F0LCAxOCBOb3YgMjAyMyAxMzox
MDowNSArMDAwMAotU3ViamVjdDogW1BBVENIXSBSYWlzZSBjbWFrZV9taW5pbXVtX3JlcXVpcmVk
IHRvIDMuMTMgdG8gYXZvaWQgd2FybmluZ3MKLQotQ01ha2UgRGVwcmVjYXRpb24gV2FybmluZyBh
dCBDTWFrZUxpc3RzLnR4dDo2IChjbWFrZV9taW5pbXVtX3JlcXVpcmVkKToKLSAgQ29tcGF0aWJp
bGl0eSB3aXRoIENNYWtlIDwgMy41IHdpbGwgYmUgcmVtb3ZlZCBmcm9tIGEgZnV0dXJlIHZlcnNp
b24gb2YKLSAgQ01ha2UuCi0KLSAgVXBkYXRlIHRoZSBWRVJTSU9OIGFyZ3VtZW50IDxtaW4+IHZh
bHVlIG9yIHVzZSBhIC4uLjxtYXg+IHN1ZmZpeCB0byB0ZWxsCi0gIENNYWtlIHRoYXQgdGhlIHBy
b2plY3QgZG9lcyBub3QgbmVlZCBjb21wYXRpYmlsaXR5IHdpdGggb2xkZXIgdmVyc2lvbnMuCi0K
LVBpY2tpbmcgMy4xMyBoZXJlIGlzIGEgc2VtaS1yYW5kb20gY2hvaWNlIHRvIGF2b2lkIHJhaXNp
bmcgdGhlIHJlcXVpcmVtZW50Ci10b28gbXVjaCBuZWVkbGVzc2x5IHdoaWxlIGFsc28gaG9wZWZ1
bGx5IGF2b2lkaW5nIG5lZWRpbmcgdG8gcmFpc2UgaXQKLXNvb24gYWdhaW4gYmFzZWQgb24gdGhl
IHJlZmVyZW5jZWQgbWFpbC4KLQotV2hpbGUgd2UgYXJlIGF0IGl0LCBsZXRzIGFsc28gZml4IHRo
ZSBvdGhlciBzcGV3ZWQgd2FybmluZzoKLQotQ01ha2UgV2FybmluZyAoZGV2KSBhdCBDTWFrZUxp
c3RzLnR4dDo1IChwcm9qZWN0KToKLSAgY21ha2VfbWluaW11bV9yZXF1aXJlZCgpIHNob3VsZCBi
ZSBjYWxsZWQgcHJpb3IgdG8gdGhpcyB0b3AtbGV2ZWwgcHJvamVjdCgpCi0gIGNhbGwuICBQbGVh
c2Ugc2VlIHRoZSBjbWFrZS1jb21tYW5kcyg3KSBtYW51YWwgZm9yIHVzYWdlIGRvY3VtZW50YXRp
b24gb2YKLSAgYm90aCBjb21tYW5kcy4KLQotUmVmZXJlbmNlczogaHR0cHM6Ly9saXN0cy5kZWJp
YW4ub3JnL21zZ2lkLXNlYXJjaC8yMDIzMDYxNzE2Mjk1Ny42cGtsYjY2MzJ6ZjRuaWpjQG1haWwu
Z2F1c3NnbG9ja2UuZGUKLQotVXBzdHJlYW0tU3RhdHVzOiBCYWNrcG9ydCBbaHR0cHM6Ly9zYWxz
YS5kZWJpYW4ub3JnL2FwdC10ZWFtL2FwdC8tL2NvbW1pdC9kYzdhOGIzMDUwYTJhNDNmNDk1MTVh
MDNhZTE5NzEzZGZjZWQ3NWRjXQotU2lnbmVkLW9mZi1ieTogTW9yaXR6IEhhYXNlIDxNb3JpdHou
SGFhc2VAYm13LmRlPgotLS0tCi0gQ01ha2VMaXN0cy50eHQgfCAyICstCi0gMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCi0KLWRpZmYgLS1naXQgYS9DTWFrZUxp
c3RzLnR4dCBiL0NNYWtlTGlzdHMudHh0Ci1pbmRleCA2MjE4MmNkZGYuLmRhZTEyZTdjMyAxMDA2
NDQKLS0tLSBhL0NNYWtlTGlzdHMudHh0Ci0rKysgYi9DTWFrZUxpc3RzLnR4dAotQEAgLTIsOCAr
Miw4IEBACi0gIyBMaWNlbnNlZCB1bmRlciB0aGUgc2FtZSB0ZXJtcyBhcyBBUFQ7IGkuZS4gR1BM
IDIgb3IgbGF0ZXIuCi0KLSAjIHNldCBtaW5pbXVtIHZlcnNpb24KLStjbWFrZV9taW5pbXVtX3Jl
cXVpcmVkKFZFUlNJT04gMy4xMykKLSBwcm9qZWN0KGFwdCkKLS1jbWFrZV9taW5pbXVtX3JlcXVp
cmVkKFZFUlNJT04gMy40LjApCi0gIyBHZW5lcmljIGhlYWRlciBsb2NhdGlvbnMKLSBpbmNsdWRl
X2RpcmVjdG9yaWVzKCR7UFJPSkVDVF9CSU5BUllfRElSfS9pbmNsdWRlKQotCi0tLQotR2l0TGFi
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJlbW92ZS11
c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2Fw
dC9hcHQvMDAwMS1SZW1vdmUtdXNpbmctc3RkLWJpbmFyeV9mdW5jdGlvbi5wYXRjaAppbmRleCAx
NWIwMzZiOTBkLi42MDQ2ZGZlNzk1IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMv
YXB0L2FwdC8wMDAxLVJlbW92ZS11c2luZy1zdGQtYmluYXJ5X2Z1bmN0aW9uLnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtUmVtb3ZlLXVzaW5nLXN0ZC1iaW5h
cnlfZnVuY3Rpb24ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGU5MWZiMDYxOGNlMGE1ZDQy
ZjIzOWQwZmNhNjAyNTQ0ODU4ZjA4MTkgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGRj
YmY1ZGJiYzIyZGYzMmRhZTQ5MzM0ZWU0N2E0YTdkNjNiNDgxOWMgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogVHVlLCAx
NiBBdWcgMjAyMiAwODo0NDoxOCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBSZW1vdmUgdXNpbmcg
c3RkOjpiaW5hcnlfZnVuY3Rpb24KQEAgLTE0LDcgKzE0LDcgQEAgU2lnbmVkLW9mZi1ieTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9u
cygrKSwgMjMgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9mdHBhcmNoaXZlL2FwdC1mdHBh
cmNoaXZlLmNjIGIvZnRwYXJjaGl2ZS9hcHQtZnRwYXJjaGl2ZS5jYwotaW5kZXggMGY2NTg3Mjgx
Li4wYTI1M2IxMmIgMTAwNjQ0CitpbmRleCA5Yzg2ZDE4Li5iODc3ZDQ5IDEwMDY0NAogLS0tIGEv
ZnRwYXJjaGl2ZS9hcHQtZnRwYXJjaGl2ZS5jYwogKysrIGIvZnRwYXJjaGl2ZS9hcHQtZnRwYXJj
aGl2ZS5jYwogQEAgLTQ4LDYgKzQ4LDExIEBACkBAIC01NCw3ICs1NCw3IEBAIGluZGV4IDBmNjU4
NzI4MS4uMGEyNTNiMTJiIDEwMDY0NAogICAgIHZvaWQgR2V0R2VuZXJhbChDb25maWd1cmF0aW9u
ICZTZXR1cCxDb25maWd1cmF0aW9uICZCbG9jayk7CiAgICAgYm9vbCBHZW5QYWNrYWdlcyhDb25m
aWd1cmF0aW9uICZTZXR1cCxzdHJ1Y3QgQ2FjaGVEQjo6U3RhdHMgJlN0YXRzKTsKICAgICBib29s
IEdlblNvdXJjZXMoQ29uZmlndXJhdGlvbiAmU2V0dXAsc3RydWN0IENhY2hlREI6OlN0YXRzICZT
dGF0cyk7Ci1AQCAtODY5LDcgKzg1Niw3IEBAIHN0YXRpYyBib29sIERvR2VuZXJhdGVDb250ZW50
cyhDb25maWd1cmF0aW9uICZTZXR1cCwKK0BAIC04NjcsNyArODU0LDcgQEAgc3RhdGljIGJvb2wg
RG9HZW5lcmF0ZUNvbnRlbnRzKENvbmZpZ3VyYXRpb24gJlNldHVwLAogICAgICAgIGVsc2UKICAJ
IEktPkNvbnRlbnRzTVRpbWUgPSBBLnN0X210aW1lOwogICAgIH0KQEAgLTYzLDcgKzYzLDcgQEAg
aW5kZXggMGY2NTg3MjgxLi4wYTI1M2IxMmIgMTAwNjQ0CiAgICAgCiAgICAgLyogTm93IGZvciBD
b250ZW50cy4uIFRoZSBwcm9jZXNzIGhlcmUgaXMgdG8gZG8gYSBtYWtlLWxpa2UgZGVwZW5kZW5j
eQogICAgICAgIGNoZWNrLiBFYWNoIGNvbnRlbnRzIGZpbGUgaXMgdmVyaWZpZWQgdG8gYmUgbmV3
ZXIgdGhhbiB0aGUgcGFja2FnZSBmaWxlcwotQEAgLTk0MSw4ICs5MjgsOCBAQCBzdGF0aWMgYm9v
bCBHZW5lcmF0ZShDb21tYW5kTGluZSAmQ21kTCkKK0BAIC05MzksOCArOTI2LDggQEAgc3RhdGlj
IGJvb2wgR2VuZXJhdGUoQ29tbWFuZExpbmUgJkNtZEwpCiAgICAgTG9hZEJpbkRpcihQa2dMaXN0
LFNldHVwKTsKICAKICAgICAvLyBTb3J0IGJ5IGNhY2hlIERCIHRvIGltcHJvdmUgSU8gbG9jYWxp
dHkuCkBAIC03NCw3ICs3NCw3IEBAIGluZGV4IDBmNjU4NzI4MS4uMGEyNTNiMTJiIDEwMDY0NAog
IAogICAgIC8vIEdlbmVyYXRlIHBhY2thZ2VzCiAgICAgaWYgKF9jb25maWctPkZpbmRCKCJBUFQ6
OkZUUEFyY2hpdmU6OkNvbnRlbnRzT25seSIsIGZhbHNlKSA9PSBmYWxzZSkKLUBAIC05OTMsOCAr
OTgwLDggQEAgc3RhdGljIGJvb2wgQ2xlYW4oQ29tbWFuZExpbmUgJkNtZEwpCitAQCAtOTkxLDgg
Kzk3OCw4IEBAIHN0YXRpYyBib29sIENsZWFuKENvbW1hbmRMaW5lICZDbWRMKQogICAgIExvYWRC
aW5EaXIoUGtnTGlzdCxTZXR1cCk7CiAgCiAgICAgLy8gU29ydCBieSBjYWNoZSBEQiB0byBpbXBy
b3ZlIElPIGxvY2FsaXR5LgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9h
cHQvMDAwMS1SZXZlcnQtYWx3YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Yt
b3VyLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHQvMDAwMS1SZXZlcnQtYWx3
YXlzLXJ1bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoCmluZGV4IDZm
NGQ1YjZlNzIuLjFjN2Q0MmU5MDEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9h
cHQvYXB0LzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1hdC10aGUtZW5k
LW9mLW91ci5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLVJl
dmVydC1hbHdheXMtcnVuLWRwa2ctY29uZmlndXJlLWEtYXQtdGhlLWVuZC1vZi1vdXIucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIGEyZGQ2NjE0ODQ1MzY0OTJiNDdkNGM4ODk5OGYyYmY1MTY3
NDliYzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDI2ZmM1OGY1NzRmMGE1ODVlMThk
NDJjZDY1ODMxOTE0YTg0YWU0NzAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBBbGV4
YW5kZXIgS2FuYXZpbiA8YWxleC5rYW5hdmluQGdtYWlsLmNvbT4KIERhdGU6IFRodSwgMjEgTWF5
IDIwMjAgMjA6MTM6MjUgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gUmV2ZXJ0ICJhbHdheXMgcnVu
ICdkcGtnIC0tY29uZmlndXJlIC1hJyBhdCB0aGUgZW5kIG9mIG91cgpAQCAtMTQsMTYgKzE0LDE1
IEBAIGJlIHBhc3NlZCBpbnRvIGRwa2csIGFuZCBsZWFkIHRvIHRoZSBiZWxvdyBzaW1pbGFyIGVy
cm9yOgogCiBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW2VtYmVkZGVkIHNwZWNpZmlj
XQogU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEthbmF2aW4gPGFsZXgua2FuYXZpbkBnbWFpbC5j
b20+Ci0KIC0tLQogIGFwdC1wa2cvZGViL2Rwa2dwbS5jYyB8IDkgKystLS0tLS0tCiAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2FwdC1wa2cvZGViL2Rwa2dwbS5jYyBiL2FwdC1wa2cvZGViL2Rwa2dwbS5jYwotaW5kZXggOTNl
ZmZhOTU5Li40Mzc1NzgxZDEgMTAwNjQ0CitpbmRleCAwOWYzZTQ3Li41OGNkODBkIDEwMDY0NAog
LS0tIGEvYXB0LXBrZy9kZWIvZHBrZ3BtLmNjCiArKysgYi9hcHQtcGtnL2RlYi9kcGtncG0uY2MK
LUBAIC0xMTk5LDEyICsxMTk5LDYgQEAgdm9pZCBwa2dEUGtnUE06OkJ1aWxkUGFja2FnZXNQcm9n
cmVzc01hcCgpCitAQCAtMTIxMCwxMiArMTIxMCw2IEBAIHZvaWQgcGtnRFBrZ1BNOjpCdWlsZFBh
Y2thZ2VzUHJvZ3Jlc3NNYXAoKQogIAkgfQogICAgICAgIH0KICAgICB9CkBAIC0zNiw3ICszNSw3
IEBAIGluZGV4IDkzZWZmYTk1OS4uNDM3NTc4MWQxIDEwMDY0NAogIH0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAvKn19fSovCiAgdm9pZCBwa2dEUGtnUE06OlN0YXJ0UHR5TWFnaWMoKQkJCQkJCS8qe3t7Ki8K
LUBAIC0xNzQxLDcgKzE3MzUsOCBAQCBib29sIHBrZ0RQa2dQTTo6R28oQVBUOjpQcm9ncmVzczo6
UGFja2FnZU1hbmFnZXIgKnByb2dyZXNzKQorQEAgLTE3NTIsNyArMTc0Niw4IEBAIGJvb2wgcGtn
RFBrZ1BNOjpHbyhBUFQ6OlByb2dyZXNzOjpQYWNrYWdlTWFuYWdlciAqcHJvZ3Jlc3MpCiAgCiAg
ICAgICAgLy8gc3VwcG9ydCBzdWJwcmVzc2luZyBvZiB0cmlnZ2VycyBwcm9jZXNzaW5nIGZvciBz
cGVjaWFsCiAgICAgICAgLy8gY2FzZXMgbGlrZSBkLWkgdGhhdCBydW5zIHRoZSB0cmlnZ2VycyBo
YW5kbGluZyBtYW51YWxseQpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9h
cHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJheS5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtYXB0d2Vic2VydmVyLmNjLUluY2x1ZGUtYXJyYXkucGF0
Y2gKaW5kZXggMmMxZTYxN2U1NS4uZGI2MjRhYzcwNSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1hcHR3ZWJzZXJ2ZXIuY2MtSW5jbHVkZS1hcnJheS5wYXRj
aAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWFwdHdlYnNlcnZlci5j
Yy1JbmNsdWRlLWFycmF5LnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA1OTg1ZjM2Njc1MGE3
M2M4MWM3ZDg2ODkzYTJiOTU5YjRhZjA2MmE1IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSBiMGEyZTU5NDJiZWU4OWFkODY1OTI2MDVhNzMzNmVhZDYyYTkxMzA3IE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IFdl
ZCwgMjYgTWF5IDIwMjEgMjI6MTI6NDYgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gYXB0d2Vic2Vy
dmVyLmNjOiBJbmNsdWRlIDxhcnJheT4KQEAgLTExLDEzICsxMSwxMiBAQCB0ZXN0L2ludGVyYWN0
aXZlLWhlbHBlci9hcHR3ZWJzZXJ2ZXIuY2M6MzY6NTU6IGVycm9yOiBjb25zdGV4cHIgdmFyaWFi
bGUgY2Fubm90CiAKIFVwc3RyZWFtLVN0YXR1czogU3VibWl0dGVkIFtodHRwczovL2dpdGh1Yi5j
b20vRGViaWFuL2FwdC9wdWxsLzEzM10KIFNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hl
bUBnbWFpbC5jb20+Ci0KIC0tLQogIHRlc3QvaW50ZXJhY3RpdmUtaGVscGVyL2FwdHdlYnNlcnZl
ci5jYyB8IDEgKwogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQogCiBkaWZmIC0tZ2l0
IGEvdGVzdC9pbnRlcmFjdGl2ZS1oZWxwZXIvYXB0d2Vic2VydmVyLmNjIGIvdGVzdC9pbnRlcmFj
dGl2ZS1oZWxwZXIvYXB0d2Vic2VydmVyLmNjCi1pbmRleCBmNGY4ZDk1Li4zNjFjN2E5IDEwMDY0
NAoraW5kZXggZTk4ODJhYi4uZDJjN2UzNSAxMDA2NDQKIC0tLSBhL3Rlc3QvaW50ZXJhY3RpdmUt
aGVscGVyL2FwdHdlYnNlcnZlci5jYwogKysrIGIvdGVzdC9pbnRlcmFjdGl2ZS1oZWxwZXIvYXB0
d2Vic2VydmVyLmNjCiBAQCAtMjMsNiArMjMsNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL2FwdC9hcHQvMDAwMS1jbWFrZS1Eby1ub3QtYnVpbGQtcG8tZmlsZXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWlsZC1w
by1maWxlcy5wYXRjaAppbmRleCAwMzZjZTM1OTYzLi4wOTgxZTRkMmQ3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtlLURvLW5vdC1idWlsZC1wby1m
aWxlcy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLWNtYWtl
LURvLW5vdC1idWlsZC1wby1maWxlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMzMzNDdm
OWY4MzAxNjMzYjAxYWY0ZTIwOGI3YmU1ZmRmY2IwZGYwYyBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gOTA4YjAzMjNjZTVhNWZhZjhlYzY3NzZkNjYzOWNmZmQ0NzE3NDljNyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEtoZW0gUmFqIDxyYWoua2hlbUBnbWFpbC5jb20+CiBE
YXRlOiBTYXQsIDIwIE1hciAyMDIxIDE0OjQ1OjE4IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNt
YWtlOiBEbyBub3QgYnVpbGQgcG8gZmlsZXMKQEAgLTExLDE0ICsxMSwxNCBAQCBGaXhlcwogVXBz
dHJlYW0tU3RhdHVzOiBJbmFwcHJvcHJpYXRlIFtDcm9zcy1jb21waWxlIHNwZWNpZmljXQogU2ln
bmVkLW9mZi1ieTogS2hlbSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIC0tLQotIENNYWtlTGlz
dHMudHh0IHwgNyAtLS0tLS0tCi0gMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCisgQ01h
a2VMaXN0cy50eHQgfCA5IC0tLS0tLS0tLQorIDEgZmlsZSBjaGFuZ2VkLCA5IGRlbGV0aW9ucygt
KQogCiBkaWZmIC0tZ2l0IGEvQ01ha2VMaXN0cy50eHQgYi9DTWFrZUxpc3RzLnR4dAotaW5kZXgg
YmUxNTdhNTVmLi41NDE2M2FlNmMgMTAwNjQ0CitpbmRleCBiMGI5NmE5Li42MGFlMmY0IDEwMDY0
NAogLS0tIGEvQ01ha2VMaXN0cy50eHQKICsrKyBiL0NNYWtlTGlzdHMudHh0Ci1AQCAtMjUyLDE1
ICsyNTIsNiBAQCBhZGRfc3ViZGlyZWN0b3J5KGZ0cGFyY2hpdmUpCitAQCAtMjU3LDE1ICsyNTcs
NiBAQCBhZGRfc3ViZGlyZWN0b3J5KGZ0cGFyY2hpdmUpCiAgYWRkX3N1YmRpcmVjdG9yeShtZXRo
b2RzKQogIGFkZF9zdWJkaXJlY3RvcnkodGVzdCkKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLUFkZC1taXNzaW5nLWluY2x1ZGUtY3N0ZGlu
dC1nY2MtMTUucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdC8wMDAxLXN0cnV0
bC1BZGQtbWlzc2luZy1pbmNsdWRlLWNzdGRpbnQtZ2NjLTE1LnBhdGNoCmRlbGV0ZWQgZmlsZSBt
b2RlIDEwMDY0NAppbmRleCBiODZlZDhiYjkyLi4wMDAwMDAwMDAwCi0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9hcHQvYXB0LzAwMDEtc3RydXRsLUFkZC1taXNzaW5nLWluY2x1ZGUtY3N0ZGlu
dC1nY2MtMTUucGF0Y2gKKysrIC9kZXYvbnVsbApAQCAtMSwyNiArMCwwIEBACi1Gcm9tIDlkYTFi
MGRiZGNjOTA0NTViYzlkZTQ5ZjczYTk2ZTdkMThmODM0OTMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCi1Gcm9tOiBKdWxpYW4gQW5kcmVzIEtsb2RlIDxqdWxpYW4ua2xvZGVAY2Fub25pY2FsLmNv
bT4KLURhdGU6IFR1ZSwgMTggRmViIDIwMjUgMTA6Mjk6NDAgKzAxMDAKLVN1YmplY3Q6IFtQQVRD
SF0gc3RydXRsOiBBZGQgbWlzc2luZyAjaW5jbHVkZSA8Y3N0ZGludD4gW2djYyAxNV0KLQotQ2xv
c2VzOiAjMTA5NjMyMgotCi1VcHN0cmVhbS1TdGF0dXM6IEJhY2twb3J0IFtodHRwczovL3NhbHNh
LmRlYmlhbi5vcmcvYXB0LXRlYW0vYXB0Ly0vY29tbWl0L2Y4MmRjZDdlNGViYjNmNzBkMjhlOWZl
YjM2MjE2NzZmOGMwY2MwMjRdCi0KLVNpZ25lZC1vZmYtYnk6IEtoZW0gUmFqIDxyYWoua2hlbUBn
bWFpbC5jb20+Ci0tLS0KLSBhcHQtcGtnL2NvbnRyaWIvc3RydXRsLmNjIHwgMSArCi0gMSBmaWxl
IGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCi0KLWRpZmYgLS1naXQgYS9hcHQtcGtnL2NvbnRyaWIv
c3RydXRsLmNjIGIvYXB0LXBrZy9jb250cmliL3N0cnV0bC5jYwotaW5kZXggNjcxMDBmMS4uYzBh
MWNiYyAxMDA2NDQKLS0tLSBhL2FwdC1wa2cvY29udHJpYi9zdHJ1dGwuY2MKLSsrKyBiL2FwdC1w
a2cvY29udHJpYi9zdHJ1dGwuY2MKLUBAIC0yNiw2ICsyNiw3IEBACi0gCi0gI2luY2x1ZGUgPGFs
Z29yaXRobT4KLSAjaW5jbHVkZSA8YXJyYXk+Ci0rI2luY2x1ZGUgPGNzdGRpbnQ+Ci0gI2luY2x1
ZGUgPGlvbWFuaXA+Ci0gI2luY2x1ZGUgPGxpbWl0cz4KLSAjaW5jbHVkZSA8bG9jYWxlPgpkaWZm
IC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMi42LjEuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8zLjAuMy5iYgpzaW1pbGFyaXR5IGluZGV4IDkzJQpyZW5h
bWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvYXB0L2FwdF8yLjYuMS5iYgpyZW5hbWUgdG8g
bWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMy4wLjMuYmIKaW5kZXggYjAzOTU5OTM5NS4u
MDFlM2ZiYmY5NyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMi42
LjEuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2FwdC9hcHRfMy4wLjMuYmIKQEAgLTEz
LDkgKzEzLDggQEAgU1JDX1VSSSA9ICIke0RFQklBTl9NSVJST1J9L21haW4vYS9hcHQvJHtCUE59
XyR7UFZ9LnRhci54eiBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWNtYWtlLURvLW5vdC1idWls
ZC1wby1maWxlcy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLWFwdHdlYnNlcnZlci5j
Yy1JbmNsdWRlLWFycmF5LnBhdGNoIFwKICAgICAgICAgICAgZmlsZTovLzAwMDEtUmVtb3ZlLXVz
aW5nLXN0ZC1iaW5hcnlfZnVuY3Rpb24ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1z
dHJ1dGwtQWRkLW1pc3NpbmctaW5jbHVkZS1jc3RkaW50LWdjYy0xNS5wYXRjaCBcCi0gICAgICAg
ICAgIGZpbGU6Ly8wMDAxLVJhaXNlLWNtYWtlX21pbmltdW1fcmVxdWlyZWQtdG8tMy4xMy10by1h
dm9pZC13YXJuaW4ucGF0Y2ggXAotICAgICAgICAgICBmaWxlOi8vMDAwMS1GaXgtY29tcGlsYXRp
b24tZXJyb3Itd2l0aC1jbGFuZy1saWJjLTE4LnBhdGNoIFwKKyAgICAgICAgICAgZmlsZTovLzAw
MDEtRG8tbm90LWluaXQtdGFibGVzLWZyb20tZHBrZy1jb25maWd1cmF0aW9uLnBhdGNoIFwKKyAg
ICAgICAgICAgZmlsZTovLzAwMDEtUmV2ZXJ0LWFsd2F5cy1ydW4tZHBrZy1jb25maWd1cmUtYS1h
dC10aGUtZW5kLW9mLW91ci5wYXRjaCBcCiAgICAgICAgICAgICIKIAogU1JDX1VSSTphcHBlbmQ6
Y2xhc3MtbmF0aXZlID0gIiBcCkBAIC0yOCw3ICsyNyw3IEBAIFNSQ19VUkk6YXBwZW5kOmNsYXNz
LW5hdGl2ZXNkayA9ICIgXAogICAgICAgICAgICBmaWxlOi8vMDAwMS1SZXZlcnQtYWx3YXlzLXJ1
bi1kcGtnLWNvbmZpZ3VyZS1hLWF0LXRoZS1lbmQtb2Ytb3VyLnBhdGNoIFwKICAgICAgICAgICAg
IgogCi1TUkNfVVJJW3NoYTI1NnN1bV0gPSAiODZiODg4YzkwMWZhMmU3OGYxYmY1MmEyYWFhMmY0
MDBmZjgyYTQ3MmI5NGZmMGFjNjYzMTkzOWVlNjhmYTZmZCIKK1NSQ19VUklbc2hhMjU2c3VtXSA9
ICI1YjVmNmY2ZDI2MTIxNzQyYTgzYWE4MGQ0ZWQwZWIwYzZjZTliZWEyNTk1MThkYjQxMmVkZWZk
OTU3NjBlNGVmIgogTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vQ09QWUlORy5HUEw7bWQ1PWIy
MzRlZTRkNjlmNWZjZTQ0ODZhODBmZGFmNGE0MjYzIgogCiAjIHRoZSBwYWNrYWdlIGlzIHRha2Vu
IGZyb20gc25hcHNob3RzLmRlYmlhbi5vcmc7IHRoYXQgc291cmNlIGlzIHN0YXRpYyBhbmQgZ29l
cyBzdGFsZQotLSAKMi40Ny4xCgo=

--===============7640481084177044478==--

