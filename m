Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 10885782EF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 07:50:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v8D7opjt009702
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 13 Sep 2017 00:50:51 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.361.1;
	Wed, 13 Sep 2017 00:50:50 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <raj.khem@gmail.com>,
	<randy.macleod@windriver.com>
Date: Wed, 13 Sep 2017 15:49:54 +0800
Message-ID: <1505288995-19743-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH] binutils: bump SRCREV to latest 2.29 branch
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
X-List-Received-Date: Wed, 13 Sep 2017 07:50:52 -0000
Content-Type: text/plain

There are 47 effecitve commits since last update. All changes are for 
bug fixing, so it is safe to update:

$ git log --oneline dd24168...binutils-2_29-branch | grep -v "Automatic date"
4c73077 Import fix from mainline that fixes buffer overrun errors when parsing corrupt DWARF debug information string sections.
38d47c2 PowerPC64 --plt-align
21ac709 x86: Remove restriction on NOTRACK prefix position
bb0216e x86: Check for valid PLT section size
64aa124 Import patches from mainline to fix minor binutils bugs:
5709459 Import patch from mainline to fix memory leak.
81d80fc Import parch from mainline to prevent buffer overrun.
35e0127 Import patch from mainline to improve padding of .eh_frame sections.
d6f8dea Import patch from mainline to fix address violation errors when parsing corrupt ELF binaries.
3a6dbb3 Import patch from mainline to allows 16-bit MSP430 absolute branches to be relaxed ino 1-bit PC-relative branches.
deeb3d2 Import patch from mainline to fix address violation errors when parsing corrupt VMS and MACHO binaries.
a541116 Import patch from mainline to improve reporting of corrupt archives.
7e693dd Import patch from mainline to fix address violations when parsing corrupt COFF binaries
353c868 Import patch from mainline to replace an abort when parsing a corrupt COFF binary with an error message instead.
4b2b2ee PR22067, x86 check_relocs invalid read
78a6a9c x86-64: Check ELF_COMMON_DEF_P for common symbols
e6d76f0 x86: Correct unwind information for the second PLT
6bdd626 Prevent an address violation parsing corrupt DWARF information by fixing the test for an overlong debug line info structure.
d4ea954 Import latest bug fixes for the libiberty sources from GCC mainline.
30326b0 Check for an invalid note size when parsing ELF notes.
aceaeff Fix buffer overrun when parsing an ELF attribute string that is not NUL terminated.
c1c56a2 Add updated French translations for opcodes and gprof
31939e5 MIPS/BFD: Correct microMIPS cross-mode BAL to JALX relaxation
012daee MIPS/GAS: Also respect `-mignore-branch-isa' with MIPS16 code
ee5d69b Import from mainline to fix PR gold/21868.
796337a Import patch from mainline to fix address violation issues when parsing corrupt binaries.
188f4b1 [GOLD] Symbol flag for PowerPC64 localentry:0 tracking
dbb8f8b ld: Early detection of orphans we know will be discarded
e59c711 Remove pr19161 test hppa xfail
3c08b8d Make undefined symbols in allocate_dynrelocs dynamic
f399679 Make __start/__stop symbols protected visibility
3256967 Collision between NT_GNU_BUILD_ATTRIBUTE_OPEN and NT_PPC_VMX
ee24a27 PR21910, segfault in common symbol override test when hash-style=gnu
bf234c7 Don't fail in elf32_hppa_set_gp
7476906 Add more targets to the list of architectures not supporting format changing during linking.  Fix seg-faults triggered when this is attempted.
247a9b4 __tls_get_addr_opt stub eh_frame info
eaaf8fb ppc32 tlsopt tests
ebe412a Fix buffer overrun when parsing a corrupt tekhex binary.
ba07ff6 [AArch64] Skip IFUNC relocations in debug sections
6f0f222 [AArch64] Fix PR18841 ifunc relocation ordering
9bb8332 [Patch AArch64] Turn lr, fp, ip0 and ip1 into proper aliases
ffb6dbf ld: Replace --rpath with -Wl,--rpath,
df41feb ld: Restore linker scripts in PR ld/21884 tests
d9c6cab Fix i686-nacl and x86_64-nacl pr21884 failures
4a1c35c Do not choose a non-ELF format input file to hold the linker created GOT sections.
5d8b167 Backport fix for a Darwin x86 assembler bug from the mainline.
cd83295 [ARM] Don't warn on REG_SP when used in CRC32 instructions


Yi Zhao (1):
  binutils: bump SRCREV to latest 2.29 branch

 meta/recipes-devtools/binutils/binutils-2.29.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.7.4


