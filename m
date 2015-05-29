Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com
	[209.85.213.169])
	by mail.openembedded.org (Postfix) with ESMTP id 36A8E75773
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 17:32:22 +0000 (UTC)
Received: by igbsb11 with SMTP id sb11so19914943igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 May 2015 10:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=o7bFJpayFb0DF6V70Em9R20vqTZKWE2HmUTVGnCtZFE=;
	b=GmppX1z2obb8THtvMAdk3S0QEtzmfRnmdrFGCKps7GG2j4piCL6gFHyOnTAfIOY7EK
	GiJBXQ9xnsqwg69Y4oECO/+KPTKXkUefpvvnaH67oWTTtlWZJyLmLtaIvDEfuaz7NXfm
	L2qBqcWO1x0qJ2RnXskJmUwcaZWLUbG7R4rClx7uZtaEZZxec0naA63DsxO5xJqqiR01
	cNtERFHcbcl4FwsTLkI/ixA3BJfzWdD4l+79x+qZa1DheFTZsv70ylAMUAKIiZgckalD
	s+cULTGUuJZ077YAhxVRDLyg6wrxDZXlmEFwhtXd5brCKJNj2/g6TewNQQsmm6JJILje
	E0jg==
X-Received: by 10.50.117.35 with SMTP id kb3mr5495388igb.13.1432920744050;
	Fri, 29 May 2015 10:32:24 -0700 (PDT)
Received: from dvm-ch2e-038.sys.comcast.net (a-96-119-89-79.sys.comcast.net.
	[96.119.89.79])
	by mx.google.com with ESMTPSA id n14sm4628876ion.5.2015.05.29.10.32.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 29 May 2015 10:32:23 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 May 2015 10:32:16 -0700
Message-Id: <8f5812fb8de77250d2274a5715ea6a108e11261d.1432920208.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
References: <c4b8c7fca3efc2acfd4f73537395c29ff568e848.1432920208.git.raj.khem@gmail.com>
In-Reply-To: <cover.1432920208.git.raj.khem@gmail.com>
References: <cover.1432920208.git.raj.khem@gmail.com>
Subject: [PATCH 6/6] binutils: Update to tip of 2.25 branch
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
X-List-Received-Date: Fri, 29 May 2015 17:32:24 -0000

This update brings following patches

749b1c7 Fix some PPC assembler errors.
fe1e924 [AArch64][Backport] Remove Load/Store register (unscaled immediate) alias
4e4d08c [AArch64][Backport] Don't always create new frag for .inst directive
0381bf1 [AArch64][Backport] PR18270, fix handling of GOT entry for local symbol
bb22a11 [AArch64][Backport]Improve PC-relative relocation check for shared library
699dcf3 opcodes/
e700dd4 Downgrade linker error on protected symbols in .dynbss to a warning
13ccf8a Revert "Add extern_protected_data and set it for x86"
b0356a6 Add support for the Samsung Exynos M1 processor.
40dbf9d Add support for the Samsung Exynos M1 processor.
2aa5937 Don't pass unadorned zeros to varargs functions
12aca65 Relax PR 15228 protected visibility restriction
b443789 [AArch64] Fix branch stubs for BE
ab50ec0 Import fixes from mainline sources that address illegal memory access problems with the ELF targeted parts of the BFD library.
a539f2c Import patches from the master sources which fix illegal memory accesses found by running the binutils on fuzzed binaries.
a5ebc2c Fix build problem introduced by previous delta to coffgrok.c
7a57494 Import fixes from mainline that address illegal memory accesses when working with COFF/PE based files.
4f9583e Import fixes from trunk sources to correct invalid memory access issues with various binutils programs.
304a2b6 Import fixes for invalid memory access issues in the binutils DWARF parser from the trunk sources.
1dead8a Import security fixes for readelf from the master branch:
3e3feb3 Limit multi-byte nop instructions to 10 bytes
f12dd7b S/390: Disable relocation sort against code sections.
846daac Fix ppc32 synthetic symbols when __tls_get_addr_opt stub is generated
7235408 Tweak ppc32 tls_get_addr optimisation
642fe3b PowerPC64 thread-safe stubs not needed for iplt
2791b63 Use dynamic text relocs for protected vars
cff59f0 PowerPC64 GOLD: complain on misaligned _DS relocs
20951c8 Fix gold error: hidden symbol '...' is not defined locally
7428be5 [AArch64][2.25] Backport support for Cortex-A72
8093a8b [ARM][2.25] Backport support for Cortex-A72
f7cf878 [ARM] Backport "Skip private symbol when doing objdump"
031994d Add extern_protected_data and set it for x86

Additionally rearranges the local patches in sequence

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/binutils/binutils-2.25.inc                      | 4 ++--
 ...REL32.patch => 0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/binutils/binutils/{0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch => 0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch} (100%)

diff --git a/meta/recipes-devtools/binutils/binutils-2.25.inc b/meta/recipes-devtools/binutils/binutils-2.25.inc
index 269bcbb..c9a5fe0 100644
--- a/meta/recipes-devtools/binutils/binutils-2.25.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.25.inc
@@ -16,7 +16,7 @@ def binutils_branch_version(d):
 
 BINUPV = "${@binutils_branch_version(d)}"
 
-SRCREV = "f2df1e49400f9e2d8d63a5d0fec9bf8c5c2b3342"
+SRCREV = "bff55dd20499331280c96697a25b48dd4d7b69e8"
 SRC_URI = "\
      git://sourceware.org/git/binutils-gdb.git;branch=binutils-${BINUPV}-branch;protocol=git \
      file://0002-configure-widen-the-regexp-for-SH-architectures.patch \
@@ -31,7 +31,7 @@ SRC_URI = "\
      file://0011-Change-default-emulation-for-mips64-linux.patch \
      file://0012-Add-XLP-instructions-support.patch \
      file://0013-Fix-an-internal-error-in-do_print_to_mapfile-seen-wi.patch \
-     file://0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch \
+     file://0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch \
      "
 S  = "${WORKDIR}/git"
 
diff --git a/meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch b/meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
similarity index 100%
rename from meta/recipes-devtools/binutils/binutils/0001-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
rename to meta/recipes-devtools/binutils/binutils/0014-gold-arm-Skip-pic-check-for-R_ARM_REL32.patch
-- 
2.1.4


