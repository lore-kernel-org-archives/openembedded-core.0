Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ACD8CD8CB9
	for <webhook@archiver.kernel.org>; Thu, 11 Jun 2026 07:25:19 +0000 (UTC)
Received: from esa5.hc324-48.eu.iphmx.com (esa5.hc324-48.eu.iphmx.com [207.54.71.60])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40170.1781162697245945947
 for <openembedded-core@lists.openembedded.org>;
 Thu, 11 Jun 2026 00:24:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=Ho1l89PU;
 spf=permerror, err=parse error for token &{10 18 256wvd6dc.spf.checkpoint-spf.com}: parse error for token &{10 18 %{ir}.256wvd6dc.spf.checkpoint-spf.com}: invalid domain name (domain: bmw.de, ip: 207.54.71.60, mailfrom: prvs=6153e13a0=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1781162697; x=1812698697;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7QO41BCrC8+L9Kqf3IEyfDTKRvdle588JQoDEzZayas=;
  b=Ho1l89PUCVYsNjS5G7XX8L8+hiYVIE19vYiKqEch0jnuriS3WdLZnDeq
   mj4yl5JMx+bFGSOHhdCIQIw+3Npuml70hlmy9O4bk9XonePTVjTldtSWw
   nFsHGHIwb7p0YmxfYgC5TqDeYTi1mMcqNe4vNMw8mej/pqsZdR6q2l1Yj
   I=;
X-CSE-ConnectionGUID: VVZyw6xzRWaDBjqJmWXfQg==
X-CSE-MsgGUID: H3tr/Is6RMqyeXufQl26zw==
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
 esa5.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jun 2026 09:24:54 +0200
Received: from unknown (HELO esabb4.muc) ([10.31.187.135]) by esagw1.muc with
 ESMTP/TLS; 11 Jun 2026 09:24:54 +0200
Received: from smucmp17a.bmwgroup.net (HELO smucmp17a.europe.bmw.corp)
 ([10.30.13.151]) by esabb4.muc with ESMTP/TLS; 11 Jun 2026 09:24:54 +0200
Received: from smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) by
 smucmp17a.europe.bmw.corp (2a03:1e80:a15:58f::1:3a) with Microsoft SMTP
 Server (version=TLS; Thu, 11 Jun 2026 09:24:54 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.214) by
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44) with Microsoft SMTP
 Server (version=TLS; Thu, 11 Jun 2026 09:24:54 +0200
X-CSE-ConnectionGUID: oGGtrymqRkmf26RaGpf0LQ==
X-CSE-MsgGUID: 1zmu5hmLSuKvQgqTK+bZ3w==
X-CSE-ConnectionGUID: S6WabTO7S1SFj4tFKWaXPw==
X-CSE-MsgGUID: z//jg+xyTFq9552TDSKDAA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-core@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [PATCH] createrepo-c: upgrade 1.2.3 -> 1.2.4
Date: Thu, 11 Jun 2026 09:24:33 +0200
Message-ID: <20260611072433.1888259-1-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: smucmp18b.europe.bmw.corp (2a03:1e80:a15:58f::1:51) To
 smucmp21a.europe.bmw.corp (2a03:1e80:a01:524::1:44)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 11 Jun 2026 07:25:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238426

Full list of changes in this release is available at [0].

[0]: https://github.com/rpm-software-management/createrepo_c/releases/tag/1.2.4

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...PYTHON_INSTALL_DIR-by-running-python.patch | 22 ++++++++++---------
 ...erepo-c_1.2.3.bb => createrepo-c_1.2.4.bb} |  2 +-
 2 files changed, 13 insertions(+), 11 deletions(-)
 rename meta/recipes-devtools/createrepo-c/{createrepo-c_1.2.3.bb => createrepo-c_1.2.4.bb} (96%)

diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
index ca3f0782a8a80a3769c878a88c2fc8269cb2c56b..e2f90644c277174adb88a07e4640801eb31943e7 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c/0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch
@@ -1,25 +1,27 @@
-From 20aec3f83a7ab6ebb89f40ee8c5df1af65eba32b Mon Sep 17 00:00:00 2001
+From 71df5a5471081cf2338f9f046cdc51d064534297 Mon Sep 17 00:00:00 2001
 From: Alexander Kanavin <alex.kanavin@gmail.com>
 Date: Fri, 30 Dec 2016 18:31:02 +0200
 Subject: [PATCH] Do not set PYTHON_INSTALL_DIR by running python
 
 Upstream-Status: Inappropriate [oe-core specific]
+
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
 Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
+Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
 ---
  src/python/CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/python/CMakeLists.txt b/src/python/CMakeLists.txt
-index a31b14d..01fd8ca 100644
+index 05ac89f9f491f93367283974ea38b5e314f0c5b6..44e38b386abc1c8eb135721d89509c649fdc6297 100644
 --- a/src/python/CMakeLists.txt
 +++ b/src/python/CMakeLists.txt
-@@ -14,7 +14,7 @@ if (NOT SKBUILD)
-     FIND_PACKAGE(PythonLibs 3 REQUIRED)
- endif (NOT SKBUILD)
- 
--EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
-+#EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
- INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
+@@ -48,7 +48,7 @@ IF (SKBUILD)
+     find_package(Python REQUIRED COMPONENTS Interpreter Development.Module)
+     Python_add_library(_createrepo_c MODULE WITH_SOABI ${createrepo_cmodule_SRCS})
+ ELSE ()
+-    EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
++    #EXECUTE_PROCESS(COMMAND ${PYTHON_EXECUTABLE} -c "from sys import stdout; from sysconfig import get_path; stdout.write(get_path('platlib'))" OUTPUT_VARIABLE PYTHON_INSTALL_DIR)
+     INCLUDE_DIRECTORIES (${PYTHON_INCLUDE_PATH})
+     MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
  
- MESSAGE(STATUS "Python install dir is ${PYTHON_INSTALL_DIR}")
diff --git a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
similarity index 96%
rename from meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
rename to meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
index a5c1a9dd440d5f8a7b85a6456f8ed88e427b89af..f6da852f0dc4e969899228a2746830f8d4b6909b 100644
--- a/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.3.bb
+++ b/meta/recipes-devtools/createrepo-c/createrepo-c_1.2.4.bb
@@ -8,7 +8,7 @@ SRC_URI = "git://github.com/rpm-software-management/createrepo_c;branch=master;p
            file://0001-Do-not-set-PYTHON_INSTALL_DIR-by-running-python.patch \
            "
 
-SRCREV = "5ecca5e6c85cca1399378af5756344eb1c7448a1"
+SRCREV = "47ab8a418fb3abd58ef3760a7eace1481610c659"
 
 DEPENDS = "expat curl glib-2.0 libxml2 openssl bzip2 zlib file sqlite3 xz rpm"
 DEPENDS:append:class-native = " file-replacement-native"

