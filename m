Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 0668B7FAC4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 18:33:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 473v8N39fxz40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Oct 2019 19:33:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572546788;
	bh=9kMRNcO4Uu4y3+4l9g9/EQzrDY/8PEkGo6XQJ8TiJrY=;
	h=From:To:Subject:Date:From;
	b=onmJwW/SRLPbAPNVP5bCBSEuRCjbOLrhlJ7TGaOGScgYG5sQnULzOIXacmgNJJ6HN
	+FlsOTf3HiSOIB3yPdP+q2xGJ/N1MxohQjIZgywYUCCUlAILcMmkU/Tqmuu8iE+NYa
	BH0CK2fy7xACW4whGKG3KnoM/mpeJWNDaDwa3XDhp8IaFux0VSA4HvzG2UOZWwt3MU
	yzF9m7Vfp58CqSu+95vZG+r5jxQ2KoCvTf1+FRdzVmUGfBg2kQURFNPjSUUT0nRJdh
	26XvB9XYVPQWaY98Gct/omvsuYp+TcZhZ17V5lvkEWpQ2mhg4yPKjuKLlr3fOprB+b
	ATIynjB74rA/LFHwIJDVxg51cAOEgYa3EQCUatrE4nwa9ppgmaa3kxgqc4OB4spgGh
	GdRiY6LjgNijK0uNpc7CET1Sy9Lr1TRq76nncq+J6fthFnVkRGpk+qxbMSIEfbS3+5
	uhgPzYuvGCpPNG71QzQ8ilEVT3Fe8skt7wiJMVLx+SWB+YfLvpzjfa7QWPgBEe5EFt
	Wd4UlRm3Zl2RyxbN83vF52y1918etZoV1HfoLui+tVe9+xMURrzQet3RfsNJjIQ85D
	wZ69Bnf52wVyO8SDQrk0daSmCNpdqrQQJwCQKq1wGhUHylCEY/ckpBSyUCBA38l98Z
	GAOz5gSp2B1CXlcsQd3YBAtU=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Oct 2019 20:33:06 +0200
Message-Id: <20191031183306.23403-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] gnu-efi: Upgrade 3.0.10 -> 3.0.11
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
X-List-Received-Date: Thu, 31 Oct 2019 18:33:10 -0000

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...evert-efilink-fix-build-with-gcc-4.8.patch | 38 -------------------
 .../{gnu-efi_3.0.10.bb => gnu-efi_3.0.11.bb}  |  5 +--
 2 files changed, 2 insertions(+), 41 deletions(-)
 delete mode 100644 meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch
 rename meta/recipes-bsp/gnu-efi/{gnu-efi_3.0.10.bb => gnu-efi_3.0.11.bb} (92%)

diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch b/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch
deleted file mode 100644
index 8ab25113a4..0000000000
--- a/meta/recipes-bsp/gnu-efi/gnu-efi/0001-Revert-efilink-fix-build-with-gcc-4.8.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 1f7b2e5bd6603b30202a66b6317a41e2be85742b Mon Sep 17 00:00:00 2001
-From: Esben Haabendal <esben@haabendal.dk>
-Date: Tue, 26 Mar 2019 13:37:02 +0100
-Subject: Revert "efilink: fix build with gcc 4.8"
-
-This reverts commit 6335e5c697c57d8b5854b8202de3733bcb151ca6, as it breaks
-gcc builds with '-nostdinc' flag.
-
-The fix in 1a53d8f88a452847b25f9689f9a08dbcf82c86e4
-(Fix for problem with undeclared intptr_t type), which is also merged
-fixes the same problem, without causing breakage.
-
-Upstream-Status: Submitted [https://sourceforge.net/p/gnu-efi/code/merge-requests/6/]
-
-Signed-off-by: Esben Haabendal <esben@haabendal.dk>
-Signed-off-by: Adrian Bunk <bunk@stusta.de>
----
- inc/efilink.h | 4 ----
- 1 file changed, 4 deletions(-)
-
-diff --git a/inc/efilink.h b/inc/efilink.h
-index b69a6fd..cc5aa2d 100644
---- a/inc/efilink.h
-+++ b/inc/efilink.h
-@@ -1,10 +1,6 @@
- #ifndef _EFI_LINK_H
- #define _EFI_LINK_H
- 
--#if defined(__GNUC__)
--#include <stdint.h>
--#endif
--
- /*++
- 
- Copyright (c) 1998  Intel Corporation
--- 
-2.20.1
-
diff --git a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
similarity index 92%
rename from meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
rename to meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
index ac6257fab9..9954d7f57a 100644
--- a/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.10.bb
+++ b/meta/recipes-bsp/gnu-efi/gnu-efi_3.0.11.bb
@@ -16,11 +16,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/${BPN}/${BP}.tar.bz2 \
            file://parallel-make-archives.patch \
            file://lib-Makefile-fix-parallel-issue.patch \
            file://gnu-efi-3.0.9-fix-clang-build.patch \
-           file://0001-Revert-efilink-fix-build-with-gcc-4.8.patch \
            "
 
-SRC_URI[md5sum] = "960a8379b6f95ee73d7778b70bf2a089"
-SRC_URI[sha256sum] = "f12082a3a5f0c3e38c67262a9f34245d139ac2cdfc0a0bdcf03c9b1f56fa4fed"
+SRC_URI[md5sum] = "21148bbcccec385a9bfdf5f678959577"
+SRC_URI[sha256sum] = "f28da792a2532e91e18e0101468811739a22cde9eee5eacfd0efb9bf3a61d6b9"
 
 COMPATIBLE_HOST = "(x86_64.*|i.86.*|aarch64.*|arm.*)-linux"
 COMPATIBLE_HOST_armv4 = 'null'
-- 
2.17.1


