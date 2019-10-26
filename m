Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9651D7FC05
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 20:42:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 470tFl3GytzMV
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Oct 2019 22:42:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1572122539;
	bh=N3KEnNrrYDHPFDvMeaQ0YLvXV42aWfS5fQQ7dJAo178=;
	h=From:To:Subject:Date:From;
	b=VI7K4Qaf4pG7yRq3GjPhVLrgZKx63uFjnA0GBHnXDTSAGFXO5/60NZdSBJfR35cts
	LpZbHPKJ96laOw6pPqZ4Fp+SHwSIKTHs5z22VlwI/4riv2tgJg6uhsICejhM3750aD
	zqs5jPdaN+iLTfDkIGGMpA4qRdtSm6R6Rhi77yLYJG0zy87jorEbSHjmnICHBb/sQ1
	E6ZNrB8EPYznGa2FGrXNHwy1tgvcHvrAWiOetvrnx0bmg24Ez1IgQdn/LtyLFRAxnJ
	MdE1ij2ScKKm6GUjSc3fQOjb1MmPPrOu2DNPOl1kuUYl48NALqax7HHkqyMc9aI06o
	bzLcfHb+Yfo5UY4APTdhjNvyO6MbfdzSIn8J3rYzBixRhPgBR4a4Y/okZzJ4zORB8N
	VzE5kRsPb58TAmxbXrB5K+AaEW0UQCFG6c5vWQHMuJNbt8jt2PMZsAzDuToM+6upKM
	UbnxClgRUSKWzqbpmLXl/H++udWNGcp2wXHGBI1KG58DYVayqXbyzLMlwJKlQl/r3M
	f/D3n0KGahfxZpZ2iWTyxn05dOCrn92eY9N8sxy3YNTSpdy/2PtN9LAyWZMWO9Auze
	OHTUvVdDUZ0YVTApkgjNAStUH8Rij4q9GgX7ZOmtoK6T3wsZ71ZfkuHM3F73z1HPzi
	RY9jNDYVAjJl2HU7/mpwPBIQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sat, 26 Oct 2019 23:42:16 +0300
Message-Id: <20191026204216.9298-6-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] nspr: Upgrade 4.21 -> 4.23
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
X-List-Received-Date: Sat, 26 Oct 2019 20:42:20 -0000

Patch applied upstream removed.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 .../nspr/nspr/0004-Add-ARC-support.patch      | 88 -------------------
 .../nspr/{nspr_4.21.bb => nspr_4.23.bb}       |  5 +-
 2 files changed, 2 insertions(+), 91 deletions(-)
 delete mode 100644 meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
 rename meta/recipes-support/nspr/{nspr_4.21.bb => nspr_4.23.bb} (95%)

diff --git a/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch b/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
deleted file mode 100644
index 9d686017df..0000000000
--- a/meta/recipes-support/nspr/nspr/0004-Add-ARC-support.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-From 6cb5b0be8837222a1e01745f2cf57cd0e593186d Mon Sep 17 00:00:00 2001
-From: Antoine Tenart <antoine.tenart@free-electrons.com>
-Date: Mon, 23 Oct 2017 10:28:20 +0200
-Subject: [PATCH] Add ARC support
-
-[Alexey: Rebased on top of other patches like RiscV, NIOS2 etc].
-
-Signed-off-by: Antoine Tenart <antoine.tenart@bootlin.com>
-Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
-
-Upstream-Status: Submitted [ https://bugzilla.mozilla.org/show_bug.cgi?id=1492378 ]
----
- pr/include/md/_linux.cfg | 45 ++++++++++++++++++++++++++++++++++++++++
- pr/include/md/_linux.h   |  2 ++
- 2 files changed, 47 insertions(+)
-
-diff --git a/pr/include/md/_linux.cfg b/pr/include/md/_linux.cfg
-index fec8525378dc..5f4fa0eac783 100644
---- a/pr/include/md/_linux.cfg
-+++ b/pr/include/md/_linux.cfg
-@@ -1157,6 +1157,51 @@
- #define PR_BYTES_PER_WORD_LOG2  3
- #define PR_BYTES_PER_DWORD_LOG2 3
- 
-+#elif defined(__arc__)
-+
-+#define IS_LITTLE_ENDIAN 1
-+#undef  IS_BIG_ENDIAN
-+
-+#define PR_BYTES_PER_BYTE   1
-+#define PR_BYTES_PER_SHORT  2
-+#define PR_BYTES_PER_INT    4
-+#define PR_BYTES_PER_INT64  8
-+#define PR_BYTES_PER_LONG   4
-+#define PR_BYTES_PER_FLOAT  4
-+#define PR_BYTES_PER_DOUBLE 8
-+#define PR_BYTES_PER_WORD   4
-+#define PR_BYTES_PER_DWORD  8
-+
-+#define PR_BITS_PER_BYTE    8
-+#define PR_BITS_PER_SHORT   16
-+#define PR_BITS_PER_INT     32
-+#define PR_BITS_PER_INT64   64
-+#define PR_BITS_PER_LONG    32
-+#define PR_BITS_PER_FLOAT   32
-+#define PR_BITS_PER_DOUBLE  64
-+#define PR_BITS_PER_WORD    32
-+
-+#define PR_BITS_PER_BYTE_LOG2   3
-+#define PR_BITS_PER_SHORT_LOG2  4
-+#define PR_BITS_PER_INT_LOG2    5
-+#define PR_BITS_PER_INT64_LOG2  6
-+#define PR_BITS_PER_LONG_LOG2   5
-+#define PR_BITS_PER_FLOAT_LOG2  5
-+#define PR_BITS_PER_DOUBLE_LOG2 6
-+#define PR_BITS_PER_WORD_LOG2   5
-+
-+#define PR_ALIGN_OF_SHORT   2
-+#define PR_ALIGN_OF_INT     4
-+#define PR_ALIGN_OF_LONG    4
-+#define PR_ALIGN_OF_INT64   4
-+#define PR_ALIGN_OF_FLOAT   4
-+#define PR_ALIGN_OF_DOUBLE  4
-+#define PR_ALIGN_OF_POINTER 4
-+#define PR_ALIGN_OF_WORD    4
-+
-+#define PR_BYTES_PER_WORD_LOG2   2
-+#define PR_BYTES_PER_DWORD_LOG2  3
-+
- #else
- 
- #error "Unknown CPU architecture"
-diff --git a/pr/include/md/_linux.h b/pr/include/md/_linux.h
-index 8e04fad479a1..628b1217e9c8 100644
---- a/pr/include/md/_linux.h
-+++ b/pr/include/md/_linux.h
-@@ -63,6 +63,8 @@
- #define _PR_SI_ARCHITECTURE "riscv32"
- #elif defined(__riscv) && (__riscv_xlen == 64)
- #define _PR_SI_ARCHITECTURE "riscv64"
-+#elif defined(__arc__)
-+#define _PR_SI_ARCHITECTURE "arc"
- #else
- #error "Unknown CPU architecture"
- #endif
--- 
-2.17.1
-
diff --git a/meta/recipes-support/nspr/nspr_4.21.bb b/meta/recipes-support/nspr/nspr_4.23.bb
similarity index 95%
rename from meta/recipes-support/nspr/nspr_4.21.bb
rename to meta/recipes-support/nspr/nspr_4.23.bb
index 25563e50f1..8e2761c20e 100644
--- a/meta/recipes-support/nspr/nspr_4.21.bb
+++ b/meta/recipes-support/nspr/nspr_4.23.bb
@@ -11,7 +11,6 @@ SRC_URI = "http://ftp.mozilla.org/pub/nspr/releases/v${PV}/src/nspr-${PV}.tar.gz
            file://remove-srcdir-from-configure-in.patch \
            file://0002-Add-nios2-support.patch \
            file://0001-md-Fix-build-with-musl.patch \
-           file://0004-Add-ARC-support.patch \
            file://Makefile.in-remove-_BUILD_STRING-and-_BUILD_TIME.patch \
            file://nspr.pc.in \
 "
@@ -24,8 +23,8 @@ CACHED_CONFIGUREVARS_append_libc-musl = " CFLAGS='${CFLAGS} -D_PR_POLL_AVAILABLE
 UPSTREAM_CHECK_URI = "http://ftp.mozilla.org/pub/nspr/releases/"
 UPSTREAM_CHECK_REGEX = "v(?P<pver>\d+(\.\d+)+)/"
 
-SRC_URI[md5sum] = "b865586f19912a50acc3755d8a45dbaa"
-SRC_URI[sha256sum] = "15ea32c7b100217b6e3193bc03e77f485d9bf7504051443ba9ce86d1c17c6b5a"
+SRC_URI[md5sum] = "90af0450423b0588f0eba6255c07ab79"
+SRC_URI[sha256sum] = "4b9d821037faf5723da901515ed9cac8b23ef1ea3729022259777393453477a4"
 
 CVE_PRODUCT = "netscape_portable_runtime"
 
-- 
2.17.1


