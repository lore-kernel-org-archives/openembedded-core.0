Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8911.1793798470168233777
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 05:21:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@amarulasolutions.com header.s=google header.b=SAGKuTE0;
 spf=pass (domain: amarulasolutions.com, ip: 209.85.218.53, mailfrom: adam.duskett@amarulasolutions.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c33700b6435so14616866b.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 05:21:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1793798468; x=1794403268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hYHoby9liGXzMBQ5LF7E5pXsE7/XfhBAGPz2a0RhFcQ=;
        b=SAGKuTE0PJy6FoAvjCbbEXPlqpRPELTWuEVkZZqMJ9wCRp0arVuHXhdhk01FWDmg4r
         V7OJNKfb+N4Gn/XvlUspFmJvSSlWFNmS9zvynFzM6bES1TnuG7iEuN9th900n2TolaZo
         ADxVoPP/nsdb7v80cwGqLR02ADv60XI8tLho8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793798468; x=1794403268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hYHoby9liGXzMBQ5LF7E5pXsE7/XfhBAGPz2a0RhFcQ=;
        b=KCTrjJtWjhWtuWu9z7z9f7eFgyuDL7KMbmIZiUPg5ooEBJMV7MnEYNHuw4gSmDqpGK
         8o5tF4ncdkBFM9kVmSxrBKcBQcsVwTxRmHsJW8neEasNlb35Xm7t4X9JfTGkv6aecDEk
         3AEhe1py0HvMPgrAIux9F6fUYJe/ySZ3q3RC5gQrVLLEN9uoyxymfO+a5c1ZPIseSYli
         cWvXT0DaZ8bT7KjekA393RSBcUlClOZCzrX0vuwWAZkYNdeyt8pJC/9KZT+cqvC2bVmB
         5RVmqeAWHKdqEDyihwMnDxoMDwcn/nUBbwSBFvodDyoRNIMo2mjL38q4uxuRZi89Gf4x
         kbfQ==
X-Gm-Message-State: APuU4Z8Ra9mH5ZE0MGnK99YKXvBrPMKwOTqq878kKnKQTB+JZ2UcAjmL
	xe9pLT6Ic+VPHqVlEJvZGdErMpwWms36GneV1K5Oa7mUVjV4SYVxmUbCZ7Hw8bCXCcbaZ74QYwi
	jrrYBJJw=
X-Gm-Gg: AYBFou2hyvOW2ZTCn8Sbmhfdz/uCHxnyb5EUSFSZa8CU8SEKy7LzgsSmoOwZ9rwqh+O
	nyA9AsOULAMLaf6tyJ9FWeUU+KPRK/2KBU3AtmKz/wKovB3GIkd9Ty4f0+ANoZ1W4WZAQDat6o0
	0jWHzOsfw+mRPe4r00AhE1LkF9kupV7nZ0txez76/pUkGfpPa0mnEs8oUZlVHf/1LYttiWPr3KD
	fFmB8FfL3Oc6QcJEXknDrBVlTjx3HBTZkF8Cv6+w4VOyzqU0SS5Pu1KyoYPN7iIBGkvI15gAi+/
	Vzze0E4LwxQUN2XMB6K5kbemORZCqDZbbeUzmNCnQ72xAqnAAx0iP0kswdcWNE4O1ReXSCzBGha
	o9UPQW3JFsIfpbDbDkfNj/yYDOZFom7KDTjky4uwNTeucjDoMm0lJkuJ5nNWBGSZXZdJbPXa5rS
	BKOeBWNLIMrBslry4fD1/emxVwKmHPWhjwjP8NUdhIYlUdr9PN79SWzaneNJ4gRthWDHkRzdg8D
	IIsKJpvxGPxguEwcyGtWJ9PrD7EC/ZEki5n8StcEQXL+VPSZr0eUdl4XLuzgatPfCe+jqsGhY80
	D89HPp0EjZshrXyTPYp4j8NpnGyicB7OhpMS6pAapZRhHBu+sy8MPVH7eeDx7bxdYG/x+cYWc+F
	6oQwMBb/suRKaZZFQJCECePvss9kysDMozkrvUItlEhvDr3dpX/Hxv8lAFEfBzPq5Ar9Ctrqx81
	Sv2Ypv1fPjh55QJ2QOnRAGnSXM88m3WKUp
X-Received: by 2002:a17:907:ba01:b0:c25:3ec4:9e43 with SMTP id a640c23a62f3a-c4ca74025e9mr1787856466b.0.1793798468184;
        Wed, 04 Nov 2026 05:21:08 -0800 (PST)
Return-Path: <adam.duskett@amarulasolutions.com>
Received: from adam-linux.tail032493.ts.net (2001-1c00-8181-e800-030c-182b-b2a8-e89d.cable.dynamic.v6.ziggo.nl. [2001:1c00:8181:e800:30c:182b:b2a8:e89d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e140f93sm70343466b.6.2026.11.04.05.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 05:21:06 -0800 (PST)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Subject: [PATCH v12 4/4] libdnf: remove recipe
Date: Wed,  4 Nov 2026 14:20:56 +0100
Message-ID: <20261104132057.607953-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
References: <20261104132057.607953-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 13:21:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249379
Content-Type: text/plain; charset="utf-8"

libdnf is now included in the dnf5 source tree.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 -
 ...or-both-libsolv-and-libsolvext-libdn.patch | 26 ----------
 ...FNM_EXTMATCH-if-not-already-like-und.patch | 36 -------------
 .../0001-drop-FindPythonInstDir.cmake.patch   | 39 ---------------
 ...-utils.cpp-fix-compilation-with-musl.patch | 48 ------------------
 ...ables-with-pkg-config-cmake-s-own-mo.patch | 27 ----------
 .../libdnf/libdnf/armarch.patch               | 50 -------------------
 meta/recipes-devtools/libdnf/libdnf_0.76.0.bb | 33 ------------
 8 files changed, 260 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/armarch.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf_0.76.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 4ad835fca4..10763a6b14 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -332,7 +332,6 @@ RECIPE_MAINTAINER:pn-libconvert-asn1-perl = "Tim Orling <tim.orling@konsulko.com
 RECIPE_MAINTAINER:pn-libcxx = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libdaemon = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdisplay-info = "Hiago De Franco <hfranco@baylibre.com>"
-RECIPE_MAINTAINER:pn-libdnf = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libdrm = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-libedit = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER:pn-libepoxy = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
deleted file mode 100644
index f56e3ecdf9..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From cd297017bc4013764915dfc1e47d23fe193bc062 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 7 Feb 2017 12:16:03 +0200
-Subject: [PATCH] Get parameters for both libsolv and libsolvext (libdnf is
-
- using both)
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 6c866111..c56b6bab 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -58,7 +58,7 @@ endif()
- 
- 
- # build dependencies
--PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
-+PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
- set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- 
- 
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch b/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
deleted file mode 100644
index 2b64176317..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 09c7188880ca62248e7c1e8e907df66545bbc3df Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Sun, 16 Nov 2025 23:29:18 +0000
-Subject: [PATCH] dnf-repo: Define FNM_EXTMATCH if not already (like under
- musl).
-
-With musl, FNM_EXTMATCH is not defined:
-dnf-repo.cpp
-| dnf-repo.cpp: In function 'void dnf_repo_conf_load_overrides(DnfRepo*, const char*)':
-| dnf-repo.cpp:971:50: error: 'FNM_EXTMATCH' was not declared in this scope; did you mean 'FNM_NOMATCH'?
-|   971 |             if (fnmatch(repo_id_pattern, repoId, FNM_EXTMATCH) != 0) {
-|       |                                                  ^~~~~~~~~~~~
-|       |                                                  FNM_NOMATCH
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1737/commits/47ed831c1fdb32519f2d66fee91bc47f9521d1d4]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libdnf/dnf-repo.cpp | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/libdnf/dnf-repo.cpp b/libdnf/dnf-repo.cpp
-index 21d23e0c..dd91b816 100644
---- a/libdnf/dnf-repo.cpp
-+++ b/libdnf/dnf-repo.cpp
-@@ -69,6 +69,10 @@
- #include <string>
- #include <vector>
- 
-+#if !defined(FNM_EXTMATCH)
-+#define FNM_EXTMATCH 0
-+#endif
-+
- typedef struct
- {
-     DnfRepoEnabled   enabled;
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch b/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
deleted file mode 100644
index d3a7583eac..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-drop-FindPythonInstDir.cmake.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 178a1358aac59f0b06184bd60a32fcfebbff9aba Mon Sep 17 00:00:00 2001
-From: Hongxu Jia <hongxu.jia@windriver.com>
-Date: Tue, 1 Jun 2021 10:23:59 +0800
-Subject: [PATCH] drop FindPythonInstDir.cmake
-
-Since commit [1] applied, PYTHON_INSTALL_DIR is not right
-on nativesdk build
-...
-|Building for python3
-|-- Python install dir is
-|tmp-glibc/work/x86_64-nativesdk-wrlinuxsdk-linux/nativesdk-libdnf/0.63.0-r0/
-recipe-sysroot-native/usr/lib/python3.9/site-packages
-...
-
-Yocto manually set PYTHON_INSTALL_DIR from recipe, it is not
-necessary to call FindPythonInstDir.cmake which will override
-Yocto setting
-
-[1] https://github.com/rpm-software-management/libdnf/commit/f1cffbfb9f338da827e233c2d8ac3a25a6a59a69
-
-Upstream-Status: Inappropriate [Yocto specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- cmake/modules/FindPythonInstDir.cmake | 7 +------
- 1 file changed, 1 insertion(+), 6 deletions(-)
-
-diff --git a/cmake/modules/FindPythonInstDir.cmake b/cmake/modules/FindPythonInstDir.cmake
-index ed098ded..8b137891 100644
---- a/cmake/modules/FindPythonInstDir.cmake
-+++ b/cmake/modules/FindPythonInstDir.cmake
-@@ -1,6 +1 @@
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "
--from sys import stdout
--from sysconfig import get_path
--path=get_path(name='platlib', vars={'platbase':'${CMAKE_INSTALL_PREFIX}'})
--stdout.write(path)"
--OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch b/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
deleted file mode 100644
index 0a6744db9a..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-utils-utils.cpp-fix-compilation-with-musl.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From 899a524ff896d7c400e3b48f8c19feac695a7875 Mon Sep 17 00:00:00 2001
-From: Wang Mingyu <wangmy@fujitsu.com>
-Date: Mon, 17 Nov 2025 00:05:14 +0000
-Subject: [PATCH] utils/utils.cpp: fix compilation with musl
-
-The basename() function requires the libgen.h header when
-compiling with musl-libc, otherwise it complains:
-error: 'basename' was not declared in this scope; did you mean 'g_basename'?
-Also, musl's basename requires char* instead of const char* argument:
-error: invalid conversion from 'const char*' to 'char*' [-fpermissive]
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1737/commits/8720d5eeb0d348686d4c5f2ccb5a6c73d66eeff5]
-
-Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
----
- libdnf/utils/utils.cpp | 5 +++--
- 1 file changed, 3 insertions(+), 2 deletions(-)
-
-diff --git a/libdnf/utils/utils.cpp b/libdnf/utils/utils.cpp
-index f5d200b8..40866360 100644
---- a/libdnf/utils/utils.cpp
-+++ b/libdnf/utils/utils.cpp
-@@ -9,6 +9,7 @@
- #include <sys/stat.h>
- #include <dirent.h>
- #include <cstring>
-+#include <libgen.h>
- #include <glob.h>
- #include <stdexcept>
- 
-@@ -311,7 +312,7 @@ std::vector<std::string> createSortedFileList(
-             auto * path_fname = basename(path);
-             bool found{false};
-             for (const auto & path_in_list : paths) {
--                if (strcmp(path_fname, basename(path_in_list.c_str())) == 0) {
-+                if (strcmp(path_fname, basename((char*)path_in_list.c_str())) == 0) {
-                     found = true;
-                     break;
-                 }
-@@ -325,7 +326,7 @@ std::vector<std::string> createSortedFileList(
- 
-     // sort all drop-in configuration files alphabetically by their names
-     std::sort(paths.begin(), paths.end(), [](const std::string & p1, const std::string & p2) {
--        return strcmp(basename(p1.c_str()), basename(p2.c_str())) < 0;
-+        return strcmp(basename((char*)p1.c_str()), basename((char*)p2.c_str())) < 0;
-     });
- 
-     return paths;
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
deleted file mode 100644
index ff4db81d98..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 514b377d6c37ede0db0e3947f2870b22c1f8cf4c Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Fri, 30 Dec 2016 18:24:50 +0200
-Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
-
- doesn't work properly).
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- CMakeLists.txt | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 63e69888..6c866111 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -58,7 +58,8 @@ endif()
- 
- 
- # build dependencies
--find_package(LibSolv 0.7.21 REQUIRED COMPONENTS ext)
-+PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
-+set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- 
- 
- # build dependencies via pkg-config
diff --git a/meta/recipes-devtools/libdnf/libdnf/armarch.patch b/meta/recipes-devtools/libdnf/libdnf/armarch.patch
deleted file mode 100644
index 9080024bf5..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/armarch.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From ec69d285812fc442ee04fe37144e7de4fecd24f1 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Thu, 9 Nov 2023 10:29:31 +0000
-Subject: [PATCH] libdnf: Fix arm arch mapping issues for qemuarmv5
-
-We change the way rpm architectures work, we make the machine name the default machine
-specific package architecture.
-
-This arm mapping code can work or in the case of qemuarmv5, it doesn't as it creates
-armv5hl which doesn't exist and causes errrors. We can simply remove it, we don't need it.
-
-Upstream-Status: Inappropriate [Relies on OE rpm config]
----
- libdnf/hy-util.cpp | 23 -----------------------
- 1 file changed, 23 deletions(-)
-
-diff --git a/libdnf/hy-util.cpp b/libdnf/hy-util.cpp
-index 82f24edd..43cdea69 100644
---- a/libdnf/hy-util.cpp
-+++ b/libdnf/hy-util.cpp
-@@ -117,29 +117,6 @@ hy_detect_arch(char **arch)
-     if (uname(&un) < 0)
-         return DNF_ERROR_FAILED;
- 
--    if (!strncmp(un.machine, "armv", 4)) {
--        /* un.machine is armvXE, where X is version number and E is
--         * endianness (b or l); we need to add modifiers such as
--         * h (hardfloat), n (neon). Neon is a requirement of armv8 so
--         * as far as rpm is concerned armv8l is the equivilent of armv7hnl
--         * (or 7hnb) so we don't explicitly add 'n' for 8+ as it's expected. */
--        char endian = un.machine[strlen(un.machine)-1];
--        char *modifier = un.machine + 5;
--        while(isdigit(*modifier)) /* keep armv7, armv8, armv9, armv10, armv100, ... */
--            modifier++;
--        if (getauxval(AT_HWCAP) & HWCAP_ARM_VFP)
--            *modifier++ = 'h';
--        if ((atoi(un.machine+4) == 7) && (getauxval(AT_HWCAP) & HWCAP_ARM_NEON))
--            *modifier++ = 'n';
--        *modifier++ = endian;
--        *modifier = 0;
--    }
--#ifdef __MIPSEL__
--    if (!strcmp(un.machine, "mips"))
--        strcpy(un.machine, "mipsel");
--    else if (!strcmp(un.machine, "mips64"))
--        strcpy(un.machine, "mips64el");
--#endif
- #if defined(__e2k__)
-     if (__builtin_cpu_is("elbrus-v4") || __builtin_cpu_is("elbrus-8c") || __builtin_cpu_is("elbrus-1c+"))
-         strcpy(un.machine, "e2kv4");
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb
deleted file mode 100644
index e8a2dca4d8..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf_0.76.0.bb
+++ /dev/null
@@ -1,33 +0,0 @@
-SUMMARY = "Library providing simplified C and Python API to libsolv"
-HOMEPAGE = "https://github.com/rpm-software-management/libdnf"
-DESCRIPTION = "This library provides a high level package-manager. It's core library of dnf, PackageKit and rpm-ostree. It's replacement for deprecated hawkey library which it contains inside and uses librepo under the hood."
-LICENSE = "LGPL-2.1-or-later"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4bf661c1e3793e55c8d1051bc5e0ae21"
-
-SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;protocol=https;tag=${PV} \
-           file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
-           file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
-           file://0001-drop-FindPythonInstDir.cmake.patch \
-           file://armarch.patch \
-           file://0001-dnf-repo-Define-FNM_EXTMATCH-if-not-already-like-und.patch \
-           file://0001-utils-utils.cpp-fix-compilation-with-musl.patch \
-           "
-
-SRCREV = "56370b044f6efdfd14240e3dccac62b833dbe027"
-UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
-
-DEPENDS = "glib-2.0 libsolv librepo rpm libmodulemd json-c swig-native util-linux"
-
-inherit cmake pkgconfig setuptools3-base gettext
-
-COMPATIBLE_HOST_libc-musl = 'null'
-
-EXTRA_OECMAKE = " -DPYTHON_INSTALL_DIR=${PYTHON_SITEPACKAGES_DIR} -DPYTHON_DESIRED=3 \
-                  -DWITH_GTKDOC=OFF -DWITH_MAN=OFF -DWITH_HTML=OFF \
-                  -DWITH_TESTS=OFF \
-                  -DWITH_ZCHUNK=OFF \
-                "
-
-BBCLASSEXTEND = "native nativesdk"
-
-SKIP_RECIPE[libdnf] ?= "${@bb.utils.contains('PACKAGE_CLASSES', 'package_rpm', '', 'Does not build without package_rpm in PACKAGE_CLASSES due disabled rpm support in libsolv', d)}"
-- 
2.56.0

