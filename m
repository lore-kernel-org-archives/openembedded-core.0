Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B20877D6F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 10:31:44 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v6AAVjvM012527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jul 2017 03:31:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 10 Jul 2017 03:31:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Jul 2017 03:31:43 -0700
Message-ID: <3ffb0a95642dacb288efc4d636c6c09a2bd57927.1499682633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1499682633.git.liezhi.yang@windriver.com>
References: <cover.1499682633.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] libiconv: remove 0001-Fix-link-error-when-compiling-with-gcc-O0.patch
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
X-List-Received-Date: Mon, 10 Jul 2017 10:31:44 -0000
Content-Type: text/plain

The recipe and patches (including this patch) had been moved into meta-mingw,
this dangling patch is useless here, so should be removed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...Fix-link-error-when-compiling-with-gcc-O0.patch | 36 ----------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 meta/recipes-support/libiconv/libiconv-1.14/0001-Fix-link-error-when-compiling-with-gcc-O0.patch

diff --git a/meta/recipes-support/libiconv/libiconv-1.14/0001-Fix-link-error-when-compiling-with-gcc-O0.patch b/meta/recipes-support/libiconv/libiconv-1.14/0001-Fix-link-error-when-compiling-with-gcc-O0.patch
deleted file mode 100644
index 15af15f..0000000
--- a/meta/recipes-support/libiconv/libiconv-1.14/0001-Fix-link-error-when-compiling-with-gcc-O0.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-This fix is also needed for GCC7.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From b29089d8b43abc8fba073da7e6dccaeba56b2b70 Mon Sep 17 00:00:00 2001
-From: Bruno Haible <bruno@clisp.org>
-Date: Sat, 19 Nov 2016 17:13:56 +0100
-Subject: [PATCH] Fix link error when compiling with gcc -O0.
-
----
- ChangeLog   | 7 +++++++
- lib/iconv.c | 6 +++++-
- 2 files changed, 12 insertions(+), 1 deletion(-)
-
-diff --git a/lib/iconv.c b/lib/iconv.c
-index 5a1a325..31853a7 100644
---- a/lib/iconv.c
-+++ b/lib/iconv.c
-@@ -178,8 +178,12 @@ static const struct alias sysdep_aliases[] = {
- };
- #ifdef __GNUC__
- __inline
-+#else
-+#ifdef __cplusplus
-+inline
-+#endif
- #endif
--const struct alias *
-+static const struct alias *
- aliases2_lookup (register const char *str)
- {
-   const struct alias * ptr;
--- 
-2.8.1
-
-- 
2.10.2


