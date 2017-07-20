Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 17E5877CFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 12:29:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 05:29:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="880850264"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by FMSMGA003.fm.intel.com with ESMTP; 20 Jul 2017 05:29:30 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 15:27:08 +0300
Message-Id: <20170720122708.39308-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.13.2
Subject: [PATCH] rpm/dnf: fix Upstream-Status to reflect upstream submission status
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
X-List-Received-Date: Thu, 20 Jul 2017 12:29:30 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../createrepo-c/0001-Correctly-install-the-shared-library.patch        | 2 +-
 .../dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch | 2 +-
 .../libcomps/0002-Set-library-installation-path-correctly.patch         | 2 +-
 .../0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch     | 2 +-
 .../0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch     | 2 +-
 .../libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch   | 2 +-
 .../libdnf/0003-Set-the-library-installation-directory-correctly.patch  | 2 +-
 .../0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch     | 2 +-
 .../librepo/0001-Correctly-set-the-library-installation-directory.patch | 2 +-
 .../0003-tests-fix-a-race-when-deleting-temporary-directories.patch     | 2 +-
 .../0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch     | 2 +-
 .../0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch     | 2 +-
 .../recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch | 2 +-
 13 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
index 01271246a22..cd72084ee2f 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Correctly-install-the-shared-library.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 2 Jan 2017 17:23:59 +0200
 Subject: [PATCH] Correctly install the shared library
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/createrepo_c/pull/78]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  src/CMakeLists.txt | 3 ++-
diff --git a/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch b/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch
index 0226d4fdec8..daf058bbae7 100644
--- a/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch
+++ b/meta/recipes-devtools/dnf/dnf/0001-Move-releasever-check-after-the-etc-dnf-vars-substit.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Move releasever check after the etc/dnf/vars substitutions.
 The substitutions may actually set the releasever correctly,
 and so the check is premature.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/dnf/pull/868]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  dnf/cli/cli.py | 6 +++---
diff --git a/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch b/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
index ec1fdc409bf..dc3d9763523 100644
--- a/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
+++ b/meta/recipes-devtools/libcomps/libcomps/0002-Set-library-installation-path-correctly.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:26:00 +0200
 Subject: [PATCH 2/2] Set library installation path correctly
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libcomps/pull/32]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  libcomps/src/CMakeLists.txt | 2 +-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
index 73acda6af8a..791a32e7486 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch
@@ -7,7 +7,7 @@ Subject: [PATCH 1/4] FindGtkDoc.cmake: drop the requirement for
 For some reason cmake is not able to find it when building in openembedded,
 and it's bundled with the source code anyway.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  cmake/modules/FindGtkDoc.cmake | 2 +-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 77b20c2734d..280edb7a651 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -4,7 +4,7 @@ Date: Tue, 7 Feb 2017 12:16:03 +0200
 Subject: [PATCH 5/5] Get parameters for both libsolv and libsolvext (libdnf is
  using both)
 
-Upstream-Status: Pending [depends on whether https://github.com/openSUSE/libsolv/pull/177 is accepted]
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch b/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
index 3d772a5f8a3..7eecc3d0516 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:17:19 +0200
 Subject: [PATCH 2/4] Prefix sysroot path to introspection tools path.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  libdnf/CMakeLists.txt | 4 ++--
diff --git a/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch b/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
index d7e59d8333a..81264094eb4 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0003-Set-the-library-installation-directory-correctly.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:20:01 +0200
 Subject: [PATCH 3/4] Set the library installation directory correctly.
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  CMakeLists.txt | 4 +++-
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index fc3b048b7d9..1ea93108933 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -4,7 +4,7 @@ Date: Fri, 30 Dec 2016 18:24:50 +0200
 Subject: [PATCH 4/5] Set libsolv variables with pkg-config (cmake's own module
  doesn't work properly).
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch b/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
index 01fea40467e..08a58f17554 100644
--- a/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
+++ b/meta/recipes-devtools/librepo/librepo/0001-Correctly-set-the-library-installation-directory.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:04:35 +0200
 Subject: [PATCH 1/4] Correctly set the library installation directory
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/110]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  librepo/CMakeLists.txt | 3 ++-
diff --git a/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch b/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
index 0d2fae434ad..89ca60e8186 100644
--- a/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
+++ b/meta/recipes-devtools/librepo/librepo/0003-tests-fix-a-race-when-deleting-temporary-directories.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:06:24 +0200
 Subject: [PATCH 3/4] tests: fix a race when deleting temporary directories
 
-Upstream-Status: Pending
+Upstream-Status: Submitted [https://github.com/rpm-software-management/librepo/pull/110]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  tests/python/tests/test_yum_repo_downloading.py | 2 +-
diff --git a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
index 6665b316cbb..f7d7ab3a2a1 100644
--- a/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
+++ b/meta/recipes-devtools/librepo/librepo/0004-Set-gpgme-variables-with-pkg-config-not-with-cmake-m.patch
@@ -4,7 +4,7 @@ Date: Fri, 30 Dec 2016 18:23:27 +0200
 Subject: [PATCH 4/4] Set gpgme variables with pkg-config, not with cmake
  module (which doesn't work properly)
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [gpgme upstream does not have pkg-config support and is not interested in it]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 ---
  CMakeLists.txt | 3 ++-
diff --git a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
index d99ddeb9ea9..1f61acaf431 100644
--- a/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Do-not-hardcode-lib-rpm-as-the-installation-path-for.patch
@@ -4,7 +4,7 @@ Date: Mon, 27 Feb 2017 09:43:30 +0200
 Subject: [PATCH] Do not hardcode "lib/rpm" as the installation path for
  default configuration and macros.
 
-Upstream-Status: Inappropriate [oe-core specific]
+Upstream-Status: Submitted [https://github.com/rpm-software-management/rpm/pull/263]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 ---
diff --git a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
index 95c70136bd6..edf9ec08940 100644
--- a/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
+++ b/meta/recipes-devtools/rpm/files/0001-Fix-build-with-musl-C-library.patch
@@ -3,7 +3,7 @@ From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Mon, 27 Feb 2017 14:43:21 +0200
 Subject: [PATCH] Fix build with musl C library.
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [problem already solved in master branch]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 
 
-- 
2.13.2


