Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2788C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 11:22:49 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.1])
 by mx.groups.io with SMTP id smtpd.web11.9583.1647343367828150677
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 04:22:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=IwuYL5D0;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.1,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1647343366; i=@fujitsu.com;
	bh=rTKHKQJJNNB0dUZSDKf5wfvz43I8ZwJbBr+DqQjLDyE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=IwuYL5D0e1BqzcJjAs11oGQmjGjyaafXPLCF8u0nF95XORkAxlJApdxQcrg0VDlrD
	 T8sU+OJQGnpMvoW1B2XEoA2I5D3C7kY4FXoJMexBrq3w3ZFHxXbZ3aestH484v/EGJ
	 7HVvAR8AisdSPF1EgMYKJmQEkvX5/oOpLHAehIwU+nTc71zD54MeuzGpYkMxKlIgqv
	 9Ag6RFUXzXyX48gxA6s3qK+30Upc6GKg0ngd+dhHW9JkbCbjEcctN62MaRjXKdP/he
	 Xi8IICCkh+oAogR5rzsoNfEgcNkMa3frErdpKBNExghaIUbrxv92buJYsvbZr2m8BP
	 KjaGGOF7ZKyYg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrAIsWRWlGSWpSXmKPExsViZ8MxSZe13CD
  JYPpUBYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNaP5wAvmgluuFRv6BBoYN9p1MXJyCAk8ZpSY
  9p+9i5ELyD7PJPHv/gJWCOcEo8Sxr2uZQarYBNQkpt+6AZTg4BAR0JO4+k8UJMwsoCLx4ncPO
  4gtLGAj8XNhDyuIzSKgKrF6zzMWEJtXwEni48YZYDUSAgoSUx6+BxvJKeAscfnOQ1aII5wkbr
  SsY4WoF5Q4OfMJC8R8CYmDL14wQ/QqSsy+3MwCYVdIzJrVxgRhq0lcPbeJeQKj4Cwk7bOQtC9
  gZFrFaJVUlJmeUZKbmJmja2hgoGtoaKprbK5raKmXWKWbqJdaqlueWlyia6SXWF6sl1pcrFdc
  mZuck6KXl1qyiREYwCnFqsI7GDtW/tQ7xCjJwaQkyssiYpAkxJeUn1KZkVicEV9UmpNafIhRh
  oNDSYI3thQoJ1iUmp5akZaZA4wmmLQEB4+SCO9LkDRvcUFibnFmOkTqFKMlx84tl/cyc1y9cg
  VI3gCRQix5+XmpUuK870EaBEAaMkrz4MbBIv4So6yUMC8jAwODEE9BalFuZgmq/CtGcQ5GJWF
  esTKgKTyZeSVwW18BHcQEdNA8aT2Qg0oSEVJSDUx60t86d0lMrl64TNKZP35t/9HMbzH9e0N+
  H+5IKRf2Yt/sJyV0jEM5pfbDwu/LM33qt0/9GxbgYnWEM/UGf2ybVOqbr/uKDs9Vi2sRYZga/
  frXvoLDMZEn3tXFWe3u3VotKPp6+8P+bl/F1LMzArUT1adN7XsQZP/pecPyCzPnvltX/9l0/n
  61CUtK7j7MTbG7xSjE+SLq/tnFvXt8n0zj+W+jqvymMXTatxhtq6v/HjsdqPTw/dsTNj/21Yr
  LtsoRvG5FE7KusORN0lp36WtDstTvSZyJ3osyLptrVcczG55MmDXVtM3elZfrh2rWs8NsZ9KP
  e2/gaT0pcHHd50VTo5Ne/LT3nvdK4uuiXZ5KLMUZiYZazEXFiQC62ylMcwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-571.messagelabs.com!1647343365!6309!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.9; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 5510 invoked from network); 15 Mar 2022 11:22:45 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-571.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 15 Mar 2022 11:22:45 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 1C5C010045E
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 0AE3D100445
	for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 11:22:45 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.28; Tue, 15 Mar 2022 11:22:34 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [OE-core] [PATCH] libdnf: upgrade  0.65.0 -> 0.66.0
Date: Tue, 15 Mar 2022 19:22:17 +0800
Message-ID: <1647343339-78926-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
References: <1647343339-78926-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 11:22:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163232

0001-Add-WITH_TESTS-option.patch
0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
removed since they're included in 0.66.0

0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
modified for new version

Changelog:
=========
Use rpmdbCookie from librpm, remove hawkey.Sack._rpmdb_version
Fix handling transaction id in resolveTransactionItemReason (RhBug:2010259,2053014)
Remove deprecated assertions (RhBug:2027383)
Skip rich deps for autodetection of unmet dependencies (RhBug:2033130, 2048394)
Increase required rpm version since we use rpmdbCookie()

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libdnf/0001-Add-WITH_TESTS-option.patch   | 49 -------------------
 ...or-both-libsolv-and-libsolvext-libdn.patch |  4 +-
 ...nly-if-documentation-is-actually-ena.patch | 42 ----------------
 ...ables-with-pkg-config-cmake-s-own-mo.patch | 10 ++--
 .../{libdnf_0.65.0.bb => libdnf_0.66.0.bb}    |  4 +-
 5 files changed, 9 insertions(+), 100 deletions(-)
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
 rename meta/recipes-devtools/libdnf/{libdnf_0.65.0.bb => libdnf_0.66.0.bb} (91%)

diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
deleted file mode 100644
index 607995a394..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Add-WITH_TESTS-option.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 7d60d62b5c5374156703ca7262fb2f85ec5db119 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 6 Nov 2018 13:54:43 +0100
-Subject: [PATCH] Add WITH_TESTS option
-
-This makes a dependency on cppunit optional.
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1382]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
----
- CMakeLists.txt               | 3 +++
- python/hawkey/CMakeLists.txt | 2 ++
- 2 files changed, 5 insertions(+)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 9c6e1b2f..8599c540 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -33,6 +33,7 @@ option(WITH_MAN "Enables hawkey man page generation" ON)
- option(WITH_ZCHUNK "Build with zchunk support" ON)
- option(ENABLE_RHSM_SUPPORT "Build with Red Hat Subscription Manager support?" OFF)
- option(ENABLE_SOLV_URPMREORDER "Build with support for URPM-like solution reordering?" OFF)
-+option(WITH_TESTS "Enables unit tests" ON)
- 
- 
- # build options - debugging
-@@ -179,8 +180,10 @@ endif()
- 
- 
- # build tests
-+IF (WITH_TESTS)
- enable_testing()
- add_subdirectory(tests)
-+ENDIF()
- if(WITH_BINDINGS)
-     add_subdirectory(python/hawkey)
- endif()
-diff --git a/python/hawkey/CMakeLists.txt b/python/hawkey/CMakeLists.txt
-index d9645346..84d17204 100644
---- a/python/hawkey/CMakeLists.txt
-+++ b/python/hawkey/CMakeLists.txt
-@@ -50,4 +50,6 @@ target_link_libraries(_hawkeymodule ${PYTHON_LIBRARY})
- install(FILES __init__.py DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
- install(TARGETS _hawkeymodule LIBRARY DESTINATION ${PYTHON_INSTALL_DIR}/hawkey)
- 
-+IF (WITH_TESTS)
- add_subdirectory(tests)
-+ENDIF()
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
index 10450defbe..c7b2af89d1 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch
@@ -16,12 +16,12 @@ diff --git a/CMakeLists.txt b/CMakeLists.txt
 index b722d4fb..ce88b9e3 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -45,7 +45,7 @@ endif()
+@@ -52,7 +52,7 @@ endif()
  
  # build dependencies
  find_package(Gpgme REQUIRED)
 -PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv libsolvext)
  set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- find_package(OpenSSL REQUIRED)
+
  
diff --git a/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch b/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
deleted file mode 100644
index 2d8213cc87..0000000000
--- a/meta/recipes-devtools/libdnf/libdnf/0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From b570c7f8bd089deec7da2b108aa789a27025a473 Mon Sep 17 00:00:00 2001
-From: Alexander Kanavin <alex.kanavin@gmail.com>
-Date: Tue, 19 Nov 2019 13:46:09 +0100
-Subject: [PATCH] Look fo sphinx only if documentation is actually enabled
-
-Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/1383]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- docs/hawkey/CMakeLists.txt | 20 +++++++++++---------
- 1 file changed, 11 insertions(+), 9 deletions(-)
-
-diff --git a/docs/hawkey/CMakeLists.txt b/docs/hawkey/CMakeLists.txt
-index 52cc35c6..63c7672f 100644
---- a/docs/hawkey/CMakeLists.txt
-+++ b/docs/hawkey/CMakeLists.txt
-@@ -2,15 +2,17 @@
- # tell sphinx-build to do them both in one go:
- 
- 
--find_program(SPHINX_PROGRAM NAMES "sphinx-build-${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}")
--if(NOT EXISTS ${SPHINX_PROGRAM})
--    find_program(SPHINX_PROGRAM NAMES sphinx-build-${PYTHON_VERSION_MAJOR})
--endif()
--if(NOT EXISTS ${SPHINX_PROGRAM})
--    find_program(SPHINX_PROGRAM NAMES sphinx-build)
--endif()
--if(NOT EXISTS ${SPHINX_PROGRAM})
--    message(FATAL_ERROR "Sphinx program not found." )
-+if (WITH_HTML OR WITH_MAN)
-+    find_program(SPHINX_PROGRAM NAMES "sphinx-build-${PYTHON_VERSION_MAJOR}.${PYTHON_VERSION_MINOR}")
-+    if(NOT EXISTS ${SPHINX_PROGRAM})
-+        find_program(SPHINX_PROGRAM NAMES sphinx-build-${PYTHON_VERSION_MAJOR})
-+    endif()
-+    if(NOT EXISTS ${SPHINX_PROGRAM})
-+        find_program(SPHINX_PROGRAM NAMES sphinx-build)
-+    endif()
-+    if(NOT EXISTS ${SPHINX_PROGRAM})
-+        message(FATAL_ERROR "Sphinx program not found." )
-+    endif()
- endif()
- 
- if(WITH_HTML)
diff --git a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
index 475c8f120b..9adb345b68 100644
--- a/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
+++ b/meta/recipes-devtools/libdnf/libdnf/0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch
@@ -7,22 +7,24 @@ Subject: [PATCH] Set libsolv variables with pkg-config (cmake's own module
 
 Upstream-Status: Submitted [https://github.com/rpm-software-management/libdnf/pull/312]
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
-
 ---
  CMakeLists.txt | 3 ++-
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 16b63308..b722d4fb 100644
+index fd6e3f0..5383744 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -45,7 +45,8 @@ endif()
+@@ -52,7 +52,8 @@ endif()
  
  # build dependencies
  find_package(Gpgme REQUIRED)
 -find_package(LibSolv 0.6.30 REQUIRED COMPONENTS ext)
 +PKG_CHECK_MODULES (LIBSOLV REQUIRED libsolv)
 +set(LIBSOLV_LIBRARY ${LIBSOLV_LIBRARIES})
- find_package(OpenSSL REQUIRED)
  
  
+ # build dependencies via pkg-config
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
similarity index 91%
rename from meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
rename to meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
index 03c56e934a..1bfe901c8a 100644
--- a/meta/recipes-devtools/libdnf/libdnf_0.65.0.bb
+++ b/meta/recipes-devtools/libdnf/libdnf_0.66.0.bb
@@ -8,14 +8,12 @@ SRC_URI = "git://github.com/rpm-software-management/libdnf;branch=dnf-4-master;p
            file://0001-FindGtkDoc.cmake-drop-the-requirement-for-GTKDOC_SCA.patch \
            file://0004-Set-libsolv-variables-with-pkg-config-cmake-s-own-mo.patch \
            file://0001-Get-parameters-for-both-libsolv-and-libsolvext-libdn.patch \
-           file://0001-Add-WITH_TESTS-option.patch \
-           file://0001-Look-fo-sphinx-only-if-documentation-is-actually-ena.patch \
            file://enable_test_data_dir_set.patch \
            file://0001-drop-FindPythonInstDir.cmake.patch \
            file://0001-libdnf-dnf-context.cpp-do-not-try-to-access-BDB-data.patch \
            "
 
-SRCREV = "cee3e1c59f849d9be1bb8d7db3090cea5c59f4b6"
+SRCREV = "add5d5418b140a86d08667dd2b14793093984875"
 UPSTREAM_CHECK_GITTAGREGEX = "(?P<pver>(?!4\.90)\d+(\.\d+)+)"
 
 S = "${WORKDIR}/git"
-- 
2.25.1


