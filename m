Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id CFFCD79223
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:54 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id f1-v6so5643629pgq.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=S1HeSbOJ6PBeqxXGCZUBDleeT5vtmdhRKVlzlj3NFAU=;
	b=GESTv7Og2l+T/n4ogwbB353w6/lyQ9/g06esFumSOzE+M9ndzYsUTbrR1oykQyWJGj
	Rq8t4cBvDu+hL2cOOG8sQOzI9TC+bb0u7ppNHhmrj/RFDDOLBgfqxVSNbW1pcgMq/bFz
	Drs2klY4o0cmQOK0vzwkTkWedFzFjLyf3W6Rd6xY4mXhwy0nEIz1za1zLi5XTPm0LDWN
	0beLCnPStSBoaj/Vrjbc7cjGiU4SKFNMSHJLyztUt/kJWqrBnohLHJPkpNICs90NYJWh
	683YnMxzTHPXxoD09Q7UcNLDivZj30vf3sbFQwIO6D/NELQs4weEhawE74GA657BYbOg
	Lf/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=S1HeSbOJ6PBeqxXGCZUBDleeT5vtmdhRKVlzlj3NFAU=;
	b=X3dYdTxdgawKR0/qWKP4VTVAf40qk1slt6G+CUsP/U4P0sgEijVRpuiPmtF01Y4PN9
	OjZr4IEvHVr0YPubE4VXDbAtiq3atK3c62BbxC83bK71Kcv1VxjBCOTrOWTxfZ4JVaag
	At8ynBKuABFIIyDZaozzCN4Mq+9ncO3BaDDztaJAygA1zWHNkKCXsYUlnyzmZZ7BtC4v
	AxoEEqEp8ltXjTc5IAawJPeDWY2kMBwwws4E2cNN8VuhWOze5kLo+D/D/4tkJuG3jjjv
	5wYa3V8gp+jdeKMb1AGr2lNQG+vEib9oqhoFrPfgUeioskymm3goOQa0t/Gn2jzkQ/As
	V5ig==
X-Gm-Message-State: AOUpUlHno87VHRt4GhCFihhYuh3eXr7XOlnMXQp+Y13FhbbruGwMK40A
	XUQGGbiBjXMhrjdTyq48LZ6XgWWA
X-Google-Smtp-Source: AA+uWPw1OVaTRVRAYyjPd0K//YUi3Y0I4X+hSI2bu3MvwgRZDo21vD6aWmLLosac22wim5jQefVqyA==
X-Received: by 2002:a63:cf10:: with SMTP id
	j16-v6mr40247455pgg.238.1534699435533; 
	Sun, 19 Aug 2018 10:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm8293466pgr.59.2018.08.19.10.23.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:54 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:39 -0700
Message-Id: <8ac6b6754204928da9be1f83f3a979ec421cb52a.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534699224.git.raj.khem@gmail.com>
References: <cover.1534699224.git.raj.khem@gmail.com>
Subject: [PATCH 7/9] binutils: Update past 2.31.1 release
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:54 -0000

list of changes in this rev bump

* a69de9c7cf ld-x86-64/pr23486b.d: Swap pr23486a.s and pr23486a.s
* 28a27bdbb9 x86: Properly add X86_ISA_1_NEEDED property
* d692290444 x86: Replace evex-no-scale.s with evex-no-scale-[32|64].s
* d55c3e3609 x86: Properly merge GNU_PROPERTY_X86_ISA_1_USED
* 381c1eb6ec x86: Update assembler tests for non-ELF targets
* 9b075c7167 x32: Align the .note.gnu.property section to 4 bytes
* 4aa5eb02fd __tls_get_addr_opt stubs and tocsave optimization
* 95fbde6791 Re: PowerPC64 __tls_get_addr_opt stub .eh_frame fix
* 079a6882b5 PowerPC64 __tls_get_addr_opt stub .eh_frame fix
* 1d8f56a971 Updated Bulgarian translation for the ld/ directory
* b7991db94c Add --warn-drop-version option; by default, do not warn when discarding version info.
* dbf924a63a Fix type checking errors.
* 60b3b24ca1 Fix spurious check-ld failures on aarch64-elf
* feaed90494 [PATCH, LD, AArch64] Fix ifunc testisms
* 2069ccaf8d x86: don't mistakenly scale non-8-bit displacements
* 254ade2586 Fix unwind offset for call_info->start_symbol.
* 29153520a8 S/390: Set the htm flag on PPA
* 6737a6b34f x86: Add a GNU_PROPERTY_X86_ISA_1_USED note if needed
* 01683b308a x86: Split vcvtps2{,u}qq and vcvttps2{,u}qq
* be8a252e18 Set the development flag back to true.
* 0860693812 (tag: binutils-2_31_1) Regenerate files and add changelog entries for 2.31.1 release
* 4afd6a72e3 Fix typo in src-release.sh script.  Update French translation for gold and Spanish translation for ld.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.31.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/binutils/binutils-2.31.inc b/meta/recipes-devtools/binutils/binutils-2.31.inc
index 6603873ba2..bc951d73e4 100644
--- a/meta/recipes-devtools/binutils/binutils-2.31.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.31.inc
@@ -18,7 +18,7 @@ BINUPV = "${@binutils_branch_version(d)}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "binutils-(?P<pver>\d+_(\d_?)*)"
 
-SRCREV ?= "f8b4d71490df766ca9c474f7ab9c82b3a8029a5a"
+SRCREV ?= "4568e49ff799192fea4f66063fe13e2b871ec75a"
 BINUTILS_GIT_URI ?= "git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git"
 SRC_URI = "\
      ${BINUTILS_GIT_URI} \
-- 
2.18.0


