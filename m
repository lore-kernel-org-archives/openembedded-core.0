Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id B09EC77196
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Apr 2016 06:58:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u366wmsD011994
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 5 Apr 2016 23:58:48 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 5 Apr 2016 23:58:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 5 Apr 2016 23:58:42 -0700
Message-ID: <0a37f6e3cbca026d6019ef239cb4fbe645c71dce.1459925867.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
In-Reply-To: <cover.1459925867.git.liezhi.yang@windriver.com>
References: <cover.1459925867.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/6] cmake: remove unused dont-run-cross-binaries.patch
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
X-List-Received-Date: Wed, 06 Apr 2016 06:58:49 -0000
Content-Type: text/plain

It hasn't been used since June 2015 when upgraded the recipe, this patch
was used for crosscompiling, now the crosscompile works well without it,
so remove it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../cmake/cmake/dont-run-cross-binaries.patch      | 23 ----------------------
 1 file changed, 23 deletions(-)
 delete mode 100644 meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch

diff --git a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch b/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
deleted file mode 100644
index 0c059f1..0000000
--- a/meta/recipes-devtools/cmake/cmake/dont-run-cross-binaries.patch
+++ /dev/null
@@ -1,23 +0,0 @@
-cmake: don't run cross-binaries on host machine
-
-When doing the cross build we obviously cannot run those binaries on
-host since they can be binary incompatible.
-
-Upstream-Status: Inappropriate [embedded specific]
-
-Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
-
-Index: cmake-2.8.10.1/CMakeLists.txt
-===================================================================
---- cmake-2.8.10.1.orig/CMakeLists.txt
-+++ cmake-2.8.10.1/CMakeLists.txt
-@@ -588,7 +588,8 @@ mark_as_advanced(CMAKE_STRICT)
- 
- # build the remaining subdirectories
- add_subdirectory(Source)
--add_subdirectory(Utilities)
-+# Come on! Running the cross-binaries on host is not a good idea.
-+#add_subdirectory(Utilities)
- add_subdirectory(Tests)
- 
- if(BUILD_TESTING)
-- 
2.8.0


