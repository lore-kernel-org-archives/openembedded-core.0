Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D04DD7F11C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 09:33:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45z7XX5b9Dz3n
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2019 11:33:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1564565628;
	bh=z43tOgtnSn6KW+zORXSmrnHkb1d4iRQpeZEVPswfXOw=;
	h=From:To:Subject:Date:From;
	b=XNlSS6fwYSGmwurc9lmTLwS2C2Mbv8Fp0nL5MFiu2ROvThwMU2gMcct+OmxGd9uyh
	o7E2MAQo9WM/wHQhmVDm5IwogLH/t5wVwEMepZ5MFYUKsAGDFMTZ300/oQfDHTMZku
	1Knh7KOTNphj9oRgJrDNEB/7I+QNELoPk8fSW0Gv3XH+qPuK1JrmWtKUT6XNd2+dzs
	Cd2qkFLSnWBbbgaH4K7wTnEgI9AX7uebIZijgcSna5gIgyHueiz2ZgoYgHwmHuTBi/
	EwuTwhfhO/16opje6OmnUP1YD3kZPUOAFy9Nld/U02z6SzE1bc+snMvci45aS1JBxd
	hce6dWUZc6KUTP7djMo82KGCo1U4lO6X8w3E9N6JjmO7LVHylecoZVixHUExao86PN
	C1usUNnLTpPj13IT827X3p/neJ58y6VXFOlx/Kb0LrZ8LtmcCGN44EDGOrsJXO+2qL
	Vo/z4abu7Cvwc/RKBvGN2sJZ3qZo6pOKB6iLX11YPxQlXprTA1GCmFww60JGboVCjZ
	wy8whPIO5l8S6Ysjy3rsICltTAr0OmuNZcg9kYPmuRRHUKzGVrErrqreFPcV9B3jhg
	mSQXb/W8ZTPH+oSoqrZy4Fl6l+885vDFCUuO5xobvj0h48C1k/atMoX5OBzSmg9Yaq
	B0LtU56nkfB2FS6s0wRTIbT0=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2019 12:33:47 +0300
Message-Id: <20190731093347.16834-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] mtd-utils: Upgrade to 2.1.1
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
X-List-Received-Date: Wed, 31 Jul 2019 09:33:49 -0000

Move from a git snapshot to a tarball release.

Add zstd PACKAGECONFIG to disable the zstd support that upstream
enables by default, zstd is not in oe-core.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../mtd/{mtd-utils_git.bb => mtd-utils_2.1.1.bb}       | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)
 rename meta/recipes-devtools/mtd/{mtd-utils_git.bb => mtd-utils_2.1.1.bb} (92%)

diff --git a/meta/recipes-devtools/mtd/mtd-utils_git.bb b/meta/recipes-devtools/mtd/mtd-utils_2.1.1.bb
similarity index 92%
rename from meta/recipes-devtools/mtd/mtd-utils_git.bb
rename to meta/recipes-devtools/mtd/mtd-utils_2.1.1.bb
index 49a650a9ef..dc39ee6058 100644
--- a/meta/recipes-devtools/mtd/mtd-utils_git.bb
+++ b/meta/recipes-devtools/mtd/mtd-utils_2.1.1.bb
@@ -10,14 +10,11 @@ inherit autotools pkgconfig update-alternatives
 DEPENDS = "zlib e2fsprogs util-linux"
 RDEPENDS_mtd-utils-tests += "bash"
 
-PV = "2.1.0+${SRCPV}"
-
-SRCREV = "b5027be5f470830ac9543db3c52e076b13abd313"
-SRC_URI = "git://git.infradead.org/mtd-utils.git \
+SRC_URI = "ftp://ftp.infradead.org/pub/${BPN}/${BPN}-${PV}.tar.bz2 \
            file://add-exclusion-to-mkfs-jffs2-git-2.patch \
 "
-
-S = "${WORKDIR}/git/"
+SRC_URI[md5sum] = "94bbd31b217a5169ae26ab8c0442f691"
+SRC_URI[sha256sum] = "8d15e8b70f036d6af1a66011f8ca0e048e9675fa7983d33bea92c24313a232d2"
 
 EXTRA_OECONF += "--enable-install-tests"
 
@@ -30,6 +27,7 @@ PACKAGECONFIG[xattr] = "--with-xattr,--without-xattr,acl"
 PACKAGECONFIG[crypto] = "--with-crypto,--without-crypto,openssl"
 PACKAGECONFIG[jffs] = "--with-jffs,--without-jffs"
 PACKAGECONFIG[ubifs] = "--with-ubifs,--without-ubifs"
+PACKAGECONFIG[zstd] = "--with-zstd,--without-zstd,zstd"
 
 CPPFLAGS_append_riscv64  = " -pthread -D_REENTRANT"
 
-- 
2.17.1


