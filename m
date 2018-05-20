Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f43.google.com (mail-pg0-f43.google.com [74.125.83.43])
	by mail.openembedded.org (Postfix) with ESMTP id 4F56774CB9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 22:04:42 +0000 (UTC)
Received: by mail-pg0-f43.google.com with SMTP id a3-v6so557316pgt.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 May 2018 15:04:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=NBd7Ia/f6YHY3Qs6z8zPmvpPPArwNxCq1fe0SECx1tY=;
	b=j1YMNonk0//7IxkdrB9hrYjMKakCOLOLWk9tF1Vv6YxZyoYtt+F1VzWLr5H8e09G9y
	iLltIk1CvjZeatZZuaIMb3fCan+dz1iNQPH1e3S80VcQCrFsPxDvIzY17DcoX/DFz/66
	XFzYCwoYoUP7UCvMaflp/iu6Q/faadiGKPWiMaDFjGDavY/InuMXXLoQ6BajqK69+l6q
	6/gyAZWfXi8cnhE94K5CDsKxjhTwKZI6blcLCjLj6P3UMP83CPPQUrvgo48QPJjLMF8y
	0rdew8Mm/UMat6NGhcMjw+aouHXk8K8kY9UNtduNxLd3QcPVM0lMdYAL359UPSX+EGhd
	R28A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NBd7Ia/f6YHY3Qs6z8zPmvpPPArwNxCq1fe0SECx1tY=;
	b=QZlFi+d6NMavYjm2vqQ1rOKnLzLGPmPBUSPHzx8zUHE5kvsO+b8Y/BJpu7SSuCFPO0
	cehQ7dXt+Q/EvFfarKc4gUI6xrugK4YxxiRb3nfbokIHnvrdNeF5dcTIPwYRN466WCFT
	+sRcvQ1N3mPV22vxDUP0eMdGx/rqtDpDMnPlwQRfO/szBBuhrgsfbHRXdxHK2c2J1dmI
	H2ZBbeE/w1MbFeWocoQuvazUdgoMH4r6FemdNq2kK0xrTL+l1XBBLLUOJutXrvF0+jdi
	y/lizL36bUv+re50RvXKEZ1K4T+n7K3JxBb4ATwOtoHkrZXIbGgvyxyUxch8wyh7aM8f
	uBVg==
X-Gm-Message-State: ALKqPwfJUkzRKC1q7mDs3UE8yFVPVqYnUG7qxzS34EHlY/FKmYoxdFtZ
	D1wT0FY+J14m1Jc+dhn/VW0VkA==
X-Google-Smtp-Source: AB8JxZrG7oB+eryzBL32KJ3gjRgovK6iZKAw7TqXzukwv94IbZBezOSBgL/MMif9DmrSU+4PPfSXEQ==
X-Received: by 2002:a62:c615:: with SMTP id
	m21-v6mr17555292pfg.232.1526853883653; 
	Sun, 20 May 2018 15:04:43 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	c18-v6sm16667913pgu.63.2018.05.20.15.04.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 20 May 2018 15:04:42 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 May 2018 15:04:41 -0700
Message-Id: <20180520220442.16092-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 1/2] acpica: Upgrade to 20180508 release
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
X-List-Received-Date: Sun, 20 May 2018 22:04:43 -0000

Drop upstreamed patches

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...{acpica_20170303.bb => acpica_20180508.bb} | 11 +++----
 ...-add-support-for-X32-ABI-compilation.patch | 31 -------------------
 .../manipulate-fds-instead-of-FILE.patch      | 29 +++++++++--------
 3 files changed, 19 insertions(+), 52 deletions(-)
 rename meta/recipes-extended/acpica/{acpica_20170303.bb => acpica_20180508.bb} (84%)
 delete mode 100644 meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch

diff --git a/meta/recipes-extended/acpica/acpica_20170303.bb b/meta/recipes-extended/acpica/acpica_20180508.bb
similarity index 84%
rename from meta/recipes-extended/acpica/acpica_20170303.bb
rename to meta/recipes-extended/acpica/acpica_20180508.bb
index 51ae77b784..dfa9a18ccb 100644
--- a/meta/recipes-extended/acpica/acpica_20170303.bb
+++ b/meta/recipes-extended/acpica/acpica_20180508.bb
@@ -17,12 +17,11 @@ COMPATIBLE_HOST = "(i.86|x86_64|arm|aarch64).*-linux"
 DEPENDS = "bison flex"
 
 SRC_URI = "https://acpica.org/sites/acpica/files/acpica-unix2-${PV}.tar.gz \
-    file://rename-yy_scan_string-manually.patch \
-    file://manipulate-fds-instead-of-FILE.patch;striplevel=2 \
-    file://0001-Linux-add-support-for-X32-ABI-compilation.patch \
-    "
-SRC_URI[md5sum] = "48ef4314fb4ffdd0c96f14dcf20544e1"
-SRC_URI[sha256sum] = "b2d81e84107ac9a02be86ea43cbea7afa8fd4b4150270bc88c2d4c9fea0b8aad"
+           file://rename-yy_scan_string-manually.patch \
+           file://manipulate-fds-instead-of-FILE.patch \
+           "
+SRC_URI[md5sum] = "31691e2eb82b2064f78536a3423c18d6"
+SRC_URI[sha256sum] = "5d8fc9d9db9e04830d40bec9add04b21c05d466e0187d354815006fdd823cf15"
 UPSTREAM_CHECK_URI = "https://acpica.org/downloads"
 
 S = "${WORKDIR}/acpica-unix2-${PV}"
diff --git a/meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch b/meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch
deleted file mode 100644
index df74200068..0000000000
--- a/meta/recipes-extended/acpica/files/0001-Linux-add-support-for-X32-ABI-compilation.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From d22241efc0708c9799f17a20eabb52a48d6d6ea1 Mon Sep 17 00:00:00 2001
-From: Anuj Mittal <anuj.mittal@intel.com>
-Date: Tue, 2 Jan 2018 12:35:32 +0800
-Subject: [PATCH] Linux: add support for X32 ABI compilation
-
-X32 follows ILP32 model. Check for ILP32 as well when checking for
-x86_64 to ensure the defines are correct for X32 ABI.
-
-Upstream-Status: Submitted [https://github.com/acpica/acpica/pull/348]
-
-Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
----
- source/include/platform/aclinux.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/source/include/platform/aclinux.h b/source/include/platform/aclinux.h
-index 75b1d82..6b8ff73 100644
---- a/source/include/platform/aclinux.h
-+++ b/source/include/platform/aclinux.h
-@@ -315,7 +315,7 @@
- #define ACPI_FLUSH_CPU_CACHE()
- #define ACPI_CAST_PTHREAD_T(Pthread) ((ACPI_THREAD_ID) (Pthread))
- 
--#if defined(__ia64__)    || defined(__x86_64__) ||\
-+#if defined(__ia64__)    || (defined(__x86_64__) && !defined(__ILP32__)) ||\
-     defined(__aarch64__) || defined(__PPC64__) ||\
-     defined(__s390x__)
- #define ACPI_MACHINE_WIDTH          64
--- 
-2.7.4
-
diff --git a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
index 5610ed9beb..d8b5f9aa8a 100644
--- a/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
+++ b/meta/recipes-extended/acpica/files/manipulate-fds-instead-of-FILE.patch
@@ -1,4 +1,4 @@
-From 69171c22f3872ecb4c1ab27985e93ca44084595e Mon Sep 17 00:00:00 2001
+From 540d80469e6a7dce6baf7214df90e86daffc5175 Mon Sep 17 00:00:00 2001
 From: Fan Xin <fan.xin@jp.fujitsu.com>
 Date: Mon, 5 Jun 2017 13:26:38 +0900
 Subject: [PATCH] aslfiles.c: manipulate fds instead of FILE
@@ -16,18 +16,20 @@ Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
 Rebase on acpica 20170303
 
 Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
 ---
- acpica-unix2-20170303/source/compiler/aslfiles.c | 14 +++++++++++---
- 1 file changed, 11 insertions(+), 3 deletions(-)
+ source/compiler/aslfiles.c | 15 ++++++++++++---
+ 1 file changed, 12 insertions(+), 3 deletions(-)
 
-diff --git a/acpica-unix2-20170303/source/compiler/aslfiles.c b/acpica-unix2-20170303/source/compiler/aslfiles.c
-index 809090c..97898b1 100644
---- a/acpica-unix2-20170303/source/compiler/aslfiles.c
-+++ b/acpica-unix2-20170303/source/compiler/aslfiles.c
-@@ -44,6 +44,10 @@
+diff --git a/source/compiler/aslfiles.c b/source/compiler/aslfiles.c
+index 82865db..cc072dc 100644
+--- a/source/compiler/aslfiles.c
++++ b/source/compiler/aslfiles.c
+@@ -43,6 +43,11 @@
+ 
  #include "aslcompiler.h"
  #include "acapps.h"
- #include "dtcompiler.h"
++#include "dtcompiler.h"
 +#include <sys/types.h>
 +#include <sys/stat.h>
 +#include <fcntl.h>
@@ -35,7 +37,7 @@ index 809090c..97898b1 100644
  
  #define _COMPONENT          ACPI_COMPILER
          ACPI_MODULE_NAME    ("aslfiles")
-@@ -607,6 +611,8 @@ FlOpenMiscOutputFiles (
+@@ -606,6 +611,8 @@ FlOpenMiscOutputFiles (
  
      if (Gbl_DebugFlag)
      {
@@ -44,7 +46,7 @@ index 809090c..97898b1 100644
          Filename = FlGenerateFilename (FilenamePrefix, FILE_SUFFIX_DEBUG);
          if (!Filename)
          {
-@@ -618,10 +624,10 @@ FlOpenMiscOutputFiles (
+@@ -617,10 +624,10 @@ FlOpenMiscOutputFiles (
          /* Open the debug file as STDERR, text mode */
  
          Gbl_Files[ASL_FILE_DEBUG_OUTPUT].Filename = Filename;
@@ -58,7 +60,7 @@ index 809090c..97898b1 100644
          {
              /*
               * A problem with freopen is that on error, we no longer
-@@ -635,6 +641,8 @@ FlOpenMiscOutputFiles (
+@@ -634,6 +641,8 @@ FlOpenMiscOutputFiles (
              exit (1);
          }
  
@@ -67,6 +69,3 @@ index 809090c..97898b1 100644
          AslCompilerSignon (ASL_FILE_DEBUG_OUTPUT);
          AslCompilerFileHeader (ASL_FILE_DEBUG_OUTPUT);
      }
--- 
-1.9.1
-
-- 
2.17.0


