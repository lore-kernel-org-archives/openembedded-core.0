Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 249D67318E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 01:37:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u671bDAZ019733
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Jul 2016 18:37:14 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 6 Jul 2016 18:37:13 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 6 Jul 2016 18:37:06 -0700
Message-ID: <eb5011f6fde24ba0aef04aacb140c7546ec16eae.1467855356.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
In-Reply-To: <cover.1467855356.git.liezhi.yang@windriver.com>
References: <cover.1467855356.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 7/7] file: 5.27 -> 5.28
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
X-List-Received-Date: Thu, 07 Jul 2016 01:37:13 -0000
Content-Type: text/plain

Remove host-file.patch which is already in the source.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-devtools/file/file/host-file.patch    | 32 ----------------------
 .../file/{file_5.27.bb => file_5.28.bb}            |  3 +-
 2 files changed, 1 insertion(+), 34 deletions(-)
 delete mode 100644 meta/recipes-devtools/file/file/host-file.patch
 rename meta/recipes-devtools/file/{file_5.27.bb => file_5.28.bb} (94%)

diff --git a/meta/recipes-devtools/file/file/host-file.patch b/meta/recipes-devtools/file/file/host-file.patch
deleted file mode 100644
index a7efbdc..0000000
--- a/meta/recipes-devtools/file/file/host-file.patch
+++ /dev/null
@@ -1,32 +0,0 @@
-Upstream-Status: Submitted (http://bugs.gw.com/view.php?id=485)
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 3cde199d03b39632361c275cd30fa0612a03138b Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@intel.com>
-Date: Mon, 19 Oct 2015 10:30:57 +0100
-Subject: [PATCH 2/2] When using the host file, respect FILE_COMPILE
-
-If we're cross-compiling and not using the file binary that was just built,
-execute the binary that we've been told to use (via FILE_COMPILE) when checking
-the version instead of assuming that "file" is correct as the actual compile
-uses FILE_COMPILE so different binaries may be used.
----
- magic/Makefile.am | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/magic/Makefile.am b/magic/Makefile.am
-index 89ac844..67067fe 100644
---- a/magic/Makefile.am
-+++ b/magic/Makefile.am
-@@ -293,7 +293,7 @@ ${MAGIC}: $(EXTRA_DIST) $(FILE_COMPILE_DEP)
- 	@(if expr "${FILE_COMPILE}" : '.*/.*' > /dev/null; then \
- 	    echo "Using ${FILE_COMPILE} to generate ${MAGIC}" > /dev/null; \
- 	  else \
--	    v=$$(file --version | sed -e s/file-// -e q); \
-+	    v=$$(${FILE_COMPILE} --version | sed -e s/file-// -e q); \
- 	    if [ "$$v" != "${PACKAGE_VERSION}" ]; then \
- 		echo "Cannot use the installed version of file ($$v) to"; \
- 		echo "cross-compile file ${PACKAGE_VERSION}"; \
--- 
-2.1.4
-
diff --git a/meta/recipes-devtools/file/file_5.27.bb b/meta/recipes-devtools/file/file_5.28.bb
similarity index 94%
rename from meta/recipes-devtools/file/file_5.27.bb
rename to meta/recipes-devtools/file/file_5.28.bb
index d1bbf6b..516c8c5 100644
--- a/meta/recipes-devtools/file/file_5.27.bb
+++ b/meta/recipes-devtools/file/file_5.28.bb
@@ -17,10 +17,9 @@ UPSTREAM_CHECK_GITTAGREGEX = "FILE(?P<pver>(?!6_23).+)"
 SRC_URI = "git://github.com/file/file.git \
         file://debian-742262.patch \
         file://0001-Add-P-prompt-into-Usage-info.patch \
-        file://host-file.patch \
         "
 
-SRCREV = "72da5ae78ed7b5ecbbe84c36ddb493f7907099bc"
+SRCREV = "3c521817322a6bf5160cfeb09b9145ccde587b2a"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.9.0


