Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by mail.openembedded.org (Postfix) with ESMTP id DE36B78449
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 12:51:15 +0000 (UTC)
Received: by mail-qt0-f172.google.com with SMTP id s18so23394243qta.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Sep 2017 05:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:organization;
	bh=E5zbnSxr4OgvKb/LuxGrUnSS9n7vTBR1kYEAXiSk6LA=;
	b=UkZo8wenaw/+hr8woNfidEQCnwPfCU5yO+vKG8h9otE7xAudNK4AbMjYgVQjqPAL2t
	53UUnj2UoaV2kxK1/df4C6eDL6a3h/sg73GFrq5hJ7UAAUacnUiaA2t6SNCAC3aZ6y7w
	UGhQMu9KX+WWVcFqzusPJaRykeO7YekUK616Cy3nas1MAVgntwcGBxg2oJRUcn/K3AhJ
	fO+UFXgvmec9rIw7E0DFDUhLS1jSlAqr2TGBkRVko72wlt8Z/YgwknpG+6pWDokPg1C0
	NIP8xCQBK3gwSEkNVrWIYkFZ3xMq3mnyQ5Ux+B63uSnk87wRu+Qrwx4CScn950YOoFW2
	PwOA==
X-Gm-Message-State: AHPjjUg+u4KPvG6INqelNZe+D19TTAtHV6smxdNFMLrOfBRl+e2o16RC
	26okOgVwkbti2mS+
X-Google-Smtp-Source: AOwi7QB/vQdJnKDIjhWa4yp1KxrOrBefsd55altwzV3VJd1iYyD9XJJuGPuAZfjqHLDYtvMQQhrzSg==
X-Received: by 10.200.51.211 with SMTP id d19mr12276206qtb.227.1505220676545; 
	Tue, 12 Sep 2017 05:51:16 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	z22sm7468874qti.42.2017.09.12.05.51.12
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 12 Sep 2017 05:51:15 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Tue, 12 Sep 2017 09:51:07 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Sep 2017 09:50:20 -0300
Message-Id: <20170912125031.4009-3-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170912125031.4009-1-otavio@ossystems.com.br>
References: <20170912125031.4009-1-otavio@ossystems.com.br>
Organization: O.S. Systems Software LTDA.
Cc: Will Newton <willn@resin.io>, Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v8 02/13] go-bootstrap-native: remove recipe
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
X-List-Received-Date: Tue, 12 Sep 2017 12:51:17 -0000

From: Matt Madison <matt@madison.systems>

No longer needed, with go-native handling its own
bootstrap phase.

Signed-off-by: Matt Madison <matt@madison.systems>
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

Changes in v8: None
Changes in v7: None
Changes in v6:
- new patch

 meta/recipes-devtools/go/go-1.4.inc                |  16 --
 ...alignment-for-the-.rel.plt-section-on-32-.patch |  33 ---
 .../go/go-1.4/016-armhf-elf-header.patch           |  24 ---
 ...ckport-cmd-link-support-new-386-amd64-rel.patch | 225 ---------------------
 meta/recipes-devtools/go/go-1.4/syslog.patch       |  62 ------
 .../recipes-devtools/go/go-bootstrap-native_1.4.bb |   3 -
 6 files changed, 363 deletions(-)
 delete mode 100644 meta/recipes-devtools/go/go-1.4.inc
 delete mode 100644 meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
 delete mode 100644 meta/recipes-devtools/go/go-1.4/syslog.patch
 delete mode 100644 meta/recipes-devtools/go/go-bootstrap-native_1.4.bb

diff --git a/meta/recipes-devtools/go/go-1.4.inc b/meta/recipes-devtools/go/go-1.4.inc
deleted file mode 100644
index 2f500f32b9..0000000000
--- a/meta/recipes-devtools/go/go-1.4.inc
+++ /dev/null
@@ -1,16 +0,0 @@
-require go-common.inc
-
-PV = "1.4.3"
-GO_BASEVERSION = "1.4"
-FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
-
-SRC_URI += "\
-        file://016-armhf-elf-header.patch \
-        file://go-cross-backport-cmd-link-support-new-386-amd64-rel.patch \
-        file://syslog.patch \
-        file://0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch \
-"
-
-LIC_FILES_CHKSUM = "file://LICENSE;md5=591778525c869cdde0ab5a1bf283cd81"
-SRC_URI[md5sum] = "dfb604511115dd402a77a553a5923a04"
-SRC_URI[sha256sum] = "9947fc705b0b841b5938c48b22dc33e9647ec0752bae66e50278df4f23f64959"
diff --git a/meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch b/meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
deleted file mode 100644
index f2adc200b1..0000000000
--- a/meta/recipes-devtools/go/go-1.4/0001-cmd-ld-set-alignment-for-the-.rel.plt-section-on-32-.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 855145d5c03c4b4faf60736c38d7a299c682af4a Mon Sep 17 00:00:00 2001
-From: Shenghou Ma <minux@golang.org>
-Date: Sat, 7 Feb 2015 14:06:02 -0500
-Subject: [PATCH] cmd/ld: set alignment for the .rel.plt section on 32-bit
- architectures
-
-Fixes #9802.
-
-Change-Id: I22c52a37bdb23a14cc4615c9519431bb14ca81ca
-Reviewed-on: https://go-review.googlesource.com/4170
-Reviewed-by: Ian Lance Taylor <iant@golang.org>
----
-Upstream-Status: Backport
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
- src/cmd/ld/elf.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/cmd/ld/elf.c b/src/cmd/ld/elf.c
-index 12ced98..97ed4bd 100644
---- a/src/cmd/ld/elf.c
-+++ b/src/cmd/ld/elf.c
-@@ -1363,6 +1363,7 @@ asmbelf(vlong symo)
- 			sh->type = SHT_REL;
- 			sh->flags = SHF_ALLOC;
- 			sh->entsize = ELF32RELSIZE;
-+			sh->addralign = 4;
- 			sh->link = elfshname(".dynsym")->shnum;
- 			shsym(sh, linklookup(ctxt, ".rel.plt", 0));
- 
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch b/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
deleted file mode 100644
index e6e414e52f..0000000000
--- a/meta/recipes-devtools/go/go-1.4/016-armhf-elf-header.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Description: Use correct ELF header for armhf binaries.
-Author: Adam Conrad <adconrad@ubuntu.com>
-Last-Update: 2013-07-08
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Index: go/src/cmd/ld/elf.c
-===================================================================
---- go.orig/src/cmd/ld/elf.c	2015-02-20 10:49:58.763451586 -0800
-+++ go/src/cmd/ld/elf.c	2015-02-20 10:49:27.895478521 -0800
-@@ -57,7 +57,11 @@
- 	case '5':
- 		// we use EABI on both linux/arm and freebsd/arm.
- 		if(HEADTYPE == Hlinux || HEADTYPE == Hfreebsd)
--			hdr.flags = 0x5000002; // has entry point, Version5 EABI
-+#ifdef __ARM_PCS_VFP
-+			hdr.flags = 0x5000402; // has entry point, Version5 EABI, hard-float ABI
-+#else
-+			hdr.flags = 0x5000202; // has entry point, Version5 EABI, soft-float ABI
-+#endif
- 		// fallthrough
- 	default:
- 		hdr.phoff = ELF32HDRSIZE;	/* Must be be ELF32HDRSIZE: first PHdr must follow ELF header */
diff --git a/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch b/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
deleted file mode 100644
index 95ca9d3aa9..0000000000
--- a/meta/recipes-devtools/go/go-1.4/go-cross-backport-cmd-link-support-new-386-amd64-rel.patch
+++ /dev/null
@@ -1,225 +0,0 @@
-From d6eefad445831c161fca130f9bdf7b3848aac23c Mon Sep 17 00:00:00 2001
-From: Paul Gortmaker <paul.gortmaker@windriver.com>
-Date: Tue, 29 Mar 2016 21:14:33 -0400
-Subject: [PATCH] go-cross: backport "cmd/link: support new 386/amd64
- relocations"
-
-Newer binutils won't support building older go-1.4.3 as per:
-
-https://github.com/golang/go/issues/13114
-
-Upstream commit 914db9f060b1fd3eb1f74d48f3bd46a73d4ae9c7 (see subj)
-was identified as the fix and nominated for 1.4.4 but that release
-never happened.  The paths in 1.4.3 aren't the same as go1.6beta1~662
-where this commit appeared, but the NetBSD folks indicated what a
-1.4.3 backport would look like here: https://gnats.netbsd.org/50777
-
-This is based on that, but without the BSD wrapper infrastructure
-layer that makes things look like patches of patches.
-
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
-Upstream-Status: Backport [ Partial ]
-
-diff --git a/src/cmd/6l/asm.c b/src/cmd/6l/asm.c
-index 18b5aa311981..2e9d339aef87 100644
---- a/src/cmd/6l/asm.c
-+++ b/src/cmd/6l/asm.c
-@@ -118,6 +118,8 @@ adddynrel(LSym *s, Reloc *r)
- 		return;
- 	
- 	case 256 + R_X86_64_GOTPCREL:
-+	case 256 + R_X86_64_GOTPCRELX:
-+	case 256 + R_X86_64_REX_GOTPCRELX:
- 		if(targ->type != SDYNIMPORT) {
- 			// have symbol
- 			if(r->off >= 2 && s->p[r->off-2] == 0x8b) {
-diff --git a/src/cmd/8l/asm.c b/src/cmd/8l/asm.c
-index 98c04240374f..cff29488e8af 100644
---- a/src/cmd/8l/asm.c
-+++ b/src/cmd/8l/asm.c
-@@ -115,6 +115,7 @@ adddynrel(LSym *s, Reloc *r)
- 		return;		
- 	
- 	case 256 + R_386_GOT32:
-+	case 256 + R_386_GOT32X:
- 		if(targ->type != SDYNIMPORT) {
- 			// have symbol
- 			if(r->off >= 2 && s->p[r->off-2] == 0x8b) {
-diff --git a/src/cmd/ld/elf.h b/src/cmd/ld/elf.h
-index e84d996f2596..bbf2cfaa3cc0 100644
---- a/src/cmd/ld/elf.h
-+++ b/src/cmd/ld/elf.h
-@@ -478,32 +478,47 @@ typedef struct {
-  * Relocation types.
-  */
- 
--#define	R_X86_64_NONE	0	/* No relocation. */
--#define	R_X86_64_64	1	/* Add 64 bit symbol value. */
--#define	R_X86_64_PC32	2	/* PC-relative 32 bit signed sym value. */
--#define	R_X86_64_GOT32	3	/* PC-relative 32 bit GOT offset. */
--#define	R_X86_64_PLT32	4	/* PC-relative 32 bit PLT offset. */
--#define	R_X86_64_COPY	5	/* Copy data from shared object. */
--#define	R_X86_64_GLOB_DAT 6	/* Set GOT entry to data address. */
--#define	R_X86_64_JMP_SLOT 7	/* Set GOT entry to code address. */
--#define	R_X86_64_RELATIVE 8	/* Add load address of shared object. */
--#define	R_X86_64_GOTPCREL 9	/* Add 32 bit signed pcrel offset to GOT. */
--#define	R_X86_64_32	10	/* Add 32 bit zero extended symbol value */
--#define	R_X86_64_32S	11	/* Add 32 bit sign extended symbol value */
--#define	R_X86_64_16	12	/* Add 16 bit zero extended symbol value */
--#define	R_X86_64_PC16	13	/* Add 16 bit signed extended pc relative symbol value */
--#define	R_X86_64_8	14	/* Add 8 bit zero extended symbol value */
--#define	R_X86_64_PC8	15	/* Add 8 bit signed extended pc relative symbol value */
--#define	R_X86_64_DTPMOD64 16	/* ID of module containing symbol */
--#define	R_X86_64_DTPOFF64 17	/* Offset in TLS block */
--#define	R_X86_64_TPOFF64 18	/* Offset in static TLS block */
--#define	R_X86_64_TLSGD	19	/* PC relative offset to GD GOT entry */
--#define	R_X86_64_TLSLD	20	/* PC relative offset to LD GOT entry */
--#define	R_X86_64_DTPOFF32 21	/* Offset in TLS block */
--#define	R_X86_64_GOTTPOFF 22	/* PC relative offset to IE GOT entry */
--#define	R_X86_64_TPOFF32 23	/* Offset in static TLS block */
--
--#define	R_X86_64_COUNT	24	/* Count of defined relocation types. */
-+#define	R_X86_64_NONE           0
-+#define	R_X86_64_64             1
-+#define	R_X86_64_PC32           2
-+#define	R_X86_64_GOT32          3
-+#define	R_X86_64_PLT32          4
-+#define	R_X86_64_COPY           5
-+#define	R_X86_64_GLOB_DAT       6
-+#define	R_X86_64_JMP_SLOT       7
-+#define	R_X86_64_RELATIVE       8
-+#define	R_X86_64_GOTPCREL       9
-+#define	R_X86_64_32             10
-+#define	R_X86_64_32S            11
-+#define	R_X86_64_16             12
-+#define	R_X86_64_PC16           13
-+#define	R_X86_64_8              14
-+#define	R_X86_64_PC8            15
-+#define	R_X86_64_DTPMOD64       16
-+#define	R_X86_64_DTPOFF64       17
-+#define	R_X86_64_TPOFF64        18
-+#define	R_X86_64_TLSGD          19
-+#define	R_X86_64_TLSLD          20
-+#define	R_X86_64_DTPOFF32       21
-+#define	R_X86_64_GOTTPOFF       22
-+#define	R_X86_64_TPOFF32        23
-+#define	R_X86_64_PC64           24
-+#define	R_X86_64_GOTOFF64       25
-+#define	R_X86_64_GOTPC32        26
-+#define	R_X86_64_GOT64          27
-+#define	R_X86_64_GOTPCREL64     28
-+#define	R_X86_64_GOTPC64        29
-+#define	R_X86_64_GOTPLT64       30
-+#define	R_X86_64_PLTOFF64       31
-+#define	R_X86_64_SIZE32         32
-+#define	R_X86_64_SIZE64         33
-+#define	R_X86_64_GOTPC32_TLSDEC 34
-+#define	R_X86_64_TLSDESC_CALL   35
-+#define	R_X86_64_TLSDESC        36
-+#define	R_X86_64_IRELATIVE      37
-+#define	R_X86_64_PC32_BND       40
-+#define	R_X86_64_GOTPCRELX      41
-+#define	R_X86_64_REX_GOTPCRELX  42
- 
- 
- #define	R_ALPHA_NONE		0	/* No reloc */
-@@ -581,39 +596,42 @@ typedef struct {
- #define	R_ARM_COUNT		38	/* Count of defined relocation types. */
- 
- 
--#define	R_386_NONE	0	/* No relocation. */
--#define	R_386_32	1	/* Add symbol value. */
--#define	R_386_PC32	2	/* Add PC-relative symbol value. */
--#define	R_386_GOT32	3	/* Add PC-relative GOT offset. */
--#define	R_386_PLT32	4	/* Add PC-relative PLT offset. */
--#define	R_386_COPY	5	/* Copy data from shared object. */
--#define	R_386_GLOB_DAT	6	/* Set GOT entry to data address. */
--#define	R_386_JMP_SLOT	7	/* Set GOT entry to code address. */
--#define	R_386_RELATIVE	8	/* Add load address of shared object. */
--#define	R_386_GOTOFF	9	/* Add GOT-relative symbol address. */
--#define	R_386_GOTPC	10	/* Add PC-relative GOT table address. */
--#define	R_386_TLS_TPOFF	14	/* Negative offset in static TLS block */
--#define	R_386_TLS_IE	15	/* Absolute address of GOT for -ve static TLS */
--#define	R_386_TLS_GOTIE	16	/* GOT entry for negative static TLS block */
--#define	R_386_TLS_LE	17	/* Negative offset relative to static TLS */
--#define	R_386_TLS_GD	18	/* 32 bit offset to GOT (index,off) pair */
--#define	R_386_TLS_LDM	19	/* 32 bit offset to GOT (index,zero) pair */
--#define	R_386_TLS_GD_32	24	/* 32 bit offset to GOT (index,off) pair */
--#define	R_386_TLS_GD_PUSH 25	/* pushl instruction for Sun ABI GD sequence */
--#define	R_386_TLS_GD_CALL 26	/* call instruction for Sun ABI GD sequence */
--#define	R_386_TLS_GD_POP 27	/* popl instruction for Sun ABI GD sequence */
--#define	R_386_TLS_LDM_32 28	/* 32 bit offset to GOT (index,zero) pair */
--#define	R_386_TLS_LDM_PUSH 29	/* pushl instruction for Sun ABI LD sequence */
--#define	R_386_TLS_LDM_CALL 30	/* call instruction for Sun ABI LD sequence */
--#define	R_386_TLS_LDM_POP 31	/* popl instruction for Sun ABI LD sequence */
--#define	R_386_TLS_LDO_32 32	/* 32 bit offset from start of TLS block */
--#define	R_386_TLS_IE_32	33	/* 32 bit offset to GOT static TLS offset entry */
--#define	R_386_TLS_LE_32	34	/* 32 bit offset within static TLS block */
--#define	R_386_TLS_DTPMOD32 35	/* GOT entry containing TLS index */
--#define	R_386_TLS_DTPOFF32 36	/* GOT entry containing TLS offset */
--#define	R_386_TLS_TPOFF32 37	/* GOT entry of -ve static TLS offset */
--
--#define	R_386_COUNT	38	/* Count of defined relocation types. */
-+#define	R_386_NONE          0
-+#define	R_386_32            1
-+#define	R_386_PC32          2
-+#define	R_386_GOT32         3
-+#define	R_386_PLT32         4
-+#define	R_386_COPY          5
-+#define	R_386_GLOB_DAT      6
-+#define	R_386_JMP_SLOT      7
-+#define	R_386_RELATIVE      8
-+#define	R_386_GOTOFF        9
-+#define	R_386_GOTPC         10
-+#define	R_386_TLS_TPOFF     14
-+#define	R_386_TLS_IE        15
-+#define	R_386_TLS_GOTIE     16
-+#define	R_386_TLS_LE        17
-+#define	R_386_TLS_GD        18
-+#define	R_386_TLS_LDM       19
-+#define	R_386_TLS_GD_32     24
-+#define	R_386_TLS_GD_PUSH   25
-+#define	R_386_TLS_GD_CALL   26
-+#define	R_386_TLS_GD_POP    27
-+#define	R_386_TLS_LDM_32    28
-+#define	R_386_TLS_LDM_PUSH  29
-+#define	R_386_TLS_LDM_CALL  30
-+#define	R_386_TLS_LDM_POP   31
-+#define	R_386_TLS_LDO_32    32
-+#define	R_386_TLS_IE_32     33
-+#define	R_386_TLS_LE_32     34
-+#define	R_386_TLS_DTPMOD32  35
-+#define	R_386_TLS_DTPOFF32  36
-+#define	R_386_TLS_TPOFF32   37
-+#define	R_386_TLS_GOTDESC   39
-+#define	R_386_TLS_DESC_CALL 40
-+#define	R_386_TLS_DESC      41
-+#define	R_386_IRELATIVE     42
-+#define	R_386_GOT32X        43
- 
- #define	R_PPC_NONE		0	/* No relocation. */
- #define	R_PPC_ADDR32		1
-diff --git a/src/cmd/ld/ldelf.c b/src/cmd/ld/ldelf.c
-index dd5fa0d2a839..2e2fbd17377f 100644
---- a/src/cmd/ld/ldelf.c
-+++ b/src/cmd/ld/ldelf.c
-@@ -888,12 +888,15 @@ reltype(char *pn, int elftype, uchar *siz)
- 	case R('6', R_X86_64_PC32):
- 	case R('6', R_X86_64_PLT32):
- 	case R('6', R_X86_64_GOTPCREL):
-+	case R('6', R_X86_64_GOTPCRELX):
-+	case R('6', R_X86_64_REX_GOTPCRELX):
- 	case R('8', R_386_32):
- 	case R('8', R_386_PC32):
- 	case R('8', R_386_GOT32):
- 	case R('8', R_386_PLT32):
- 	case R('8', R_386_GOTOFF):
- 	case R('8', R_386_GOTPC):
-+	case R('8', R_386_GOT32X):
- 		*siz = 4;
- 		break;
- 	case R('6', R_X86_64_64):
--- 
-2.7.2
-
diff --git a/meta/recipes-devtools/go/go-1.4/syslog.patch b/meta/recipes-devtools/go/go-1.4/syslog.patch
deleted file mode 100644
index 29be06f1bd..0000000000
--- a/meta/recipes-devtools/go/go-1.4/syslog.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-Add timeouts to logger
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-Upstream-Status: Pending
-
-diff -r -u go/src/log/syslog/syslog.go /home/achang/GOCOPY/go/src/log/syslog/syslog.go
---- go/src/log/syslog/syslog.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog.go	2014-10-03 11:44:37.710403200 -0700
-@@ -33,6 +33,9 @@
- const severityMask = 0x07
- const facilityMask = 0xf8
- 
-+var writeTimeout = 1 * time.Second
-+var connectTimeout = 1 * time.Second
-+
- const (
- 	// Severity.
- 
-@@ -100,6 +103,7 @@
- type serverConn interface {
- 	writeString(p Priority, hostname, tag, s, nl string) error
- 	close() error
-+	setWriteDeadline(t time.Time) error
- }
- 
- type netConn struct {
-@@ -273,7 +277,11 @@
- 		nl = "\n"
- 	}
- 
--	err := w.conn.writeString(p, w.hostname, w.tag, msg, nl)
-+	err := w.conn.setWriteDeadline(time.Now().Add(writeTimeout))
-+	if err != nil {
-+		return 0, err
-+	}
-+	err = w.conn.writeString(p, w.hostname, w.tag, msg, nl)
- 	if err != nil {
- 		return 0, err
- 	}
-@@ -305,6 +313,10 @@
- 	return n.conn.Close()
- }
- 
-+func (n *netConn) setWriteDeadline(t time.Time) error {
-+	return n.conn.SetWriteDeadline(t)
-+}
-+
- // NewLogger creates a log.Logger whose output is written to
- // the system log service with the specified priority. The logFlag
- // argument is the flag set passed through to log.New to create
-diff -r -u go/src/log/syslog/syslog_unix.go /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go
---- go/src/log/syslog/syslog_unix.go	2013-11-28 13:38:28.000000000 -0800
-+++ /home/achang/GOCOPY/go/src/log/syslog/syslog_unix.go	2014-10-03 11:44:39.010403175 -0700
-@@ -19,7 +19,7 @@
- 	logPaths := []string{"/dev/log", "/var/run/syslog"}
- 	for _, network := range logTypes {
- 		for _, path := range logPaths {
--			conn, err := net.Dial(network, path)
-+			conn, err := net.DialTimeout(network, path, connectTimeout)
- 			if err != nil {
- 				continue
- 			} else {
diff --git a/meta/recipes-devtools/go/go-bootstrap-native_1.4.bb b/meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
deleted file mode 100644
index 3d4141e879..0000000000
--- a/meta/recipes-devtools/go/go-bootstrap-native_1.4.bb
+++ /dev/null
@@ -1,3 +0,0 @@
-BOOTSTRAP = "1.4"
-require go-native.inc
-require go-${PV}.inc
-- 
2.14.1


