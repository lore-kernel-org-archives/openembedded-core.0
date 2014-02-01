Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id D81856E9B4
	for <openembedded-core@lists.openembedded.org>;
	Sat,  1 Feb 2014 09:00:06 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id lf10so5350473pab.4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 01 Feb 2014 01:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/BAynL5Ayqki9HRnIczbLJ3PEl44+Z1/7yoFsJ9pVOE=;
	b=P2t0lWZsSVkJaGHGN16U7L/kXAymH3xcUcirGFZzNmebD1sfhzsYUHGv59FhIJ8M84
	xDKsitYHzVaHwRI/BKg7N7qa3Hbmo1syeaf2F+D5Jq81nIFJs4lIsNSi8LfLebUs1ViA
	e4ueixFxLTvCKuedZXC79iQfYQNxXEPHEl7j+4sLRUGMCL2JKZAZWO6Ymz/9tpTvfo/f
	3zlMkUZoxQqAOV2vlcTtlKXktY5I0km0TANhKKfAyI3mxq329AbXwHae1LdRPkyKymlw
	Fozfcrhc74x+LiGcHKqFriV2q+Gm5Gch/0Iq6ywoe0ZFbTkDDgLFQ7oWg+y5vgUrbFmR
	HBlg==
X-Received: by 10.68.136.66 with SMTP id py2mr25383040pbb.112.1391245207888;
	Sat, 01 Feb 2014 01:00:07 -0800 (PST)
Received: from leo.gateway.pace.com
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id qz9sm35401932pbc.3.2014.02.01.01.00.06
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 01 Feb 2014 01:00:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  1 Feb 2014 00:59:57 -0800
Message-Id: <cover.1391245078.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.rc1
Subject: [PATCH 0/2] Upgrade binutils to 2.24
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
X-List-Received-Date: Sat, 01 Feb 2014 09:00:07 -0000

This patchset upgrades binutils to 2.24
It also upgrades wireless-tools to 30.pre9 to fix
an underlinking problems thats exposed by newer binutils
in existing wireless-tools 29 version

The following changes since commit 3004eb3b7ee5fd8dfe9c4e5749b4e125d0bd4b59:

  gcc: Include patch scheduled for GCC 4.8.3 to fix epilogue on ARM (2014-01-31 15:43:42 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/binutils-2.24
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/binutils-2.24

Khem Raj (2):
  binutils: Upgrade to 2.24
  wireless-tools: Upgrade 29 -> 30.pre9

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 .../wireless-tools/wireless-tools/man.patch        |   24 +-
 ...eless-tools_29.bb => wireless-tools_30.pre9.bb} |   26 +-
 ...pc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch |  122 ---
 ...pc.c-md_assemble-Do-not-generate-APUinfo-.patch |   46 -
 ...ls.texi-elfedit-Fix-use-of-itemx-in-table.patch |   68 --
 ...lf32.em-gld-EMULATION_NAME-_before_alloca.patch |   31 -
 ...-Replace-with-when-it-is-part-of-the-text.patch |  196 ----
 ...pc.c-md_apply_fix-Sign-extend-fieldval-un.patch |   85 --
 ...lf32.em-gld-EMULATION_NAME-_before_alloca.patch |   43 -
 .../binutils-2.23.2/backport/0003-gold.patch       |  203 ----
 .../binutils-2.23.2/backport/aarch64-crn.patch     |  117 ---
 .../binutils-2.23.2/backport/aarch64-movi.patch    |  144 ---
 .../binutils-fix-ineffectual-zero-of-cache.patch   |   60 --
 .../binutils-fix-skip-whitespace-pr14887.patch     |   50 -
 .../binutils-replace-strncat-with-strcat.patch     |   26 -
 .../binutils-fix-over-array-bounds-issue.patch     |   20 -
 .../binutils-x86_64_i386_biarch.patch              |   29 -
 .../{binutils-2.23.2.inc => binutils-2.24.inc}     |   26 +-
 ...n_2.23.2.bb => binutils-cross-canadian_2.24.bb} |    0
 ...tils-cross_2.23.2.bb => binutils-cross_2.24.bb} |    0
 ...rosssdk_2.23.2.bb => binutils-crosssdk_2.24.bb} |    0
 .../binutils-armv5e.patch                          |    0
 .../binutils-poison.patch                          |   88 +-
 .../binutils-uclibc-100-uclibc-conf.patch          |    0
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |    0
 ...binutils-uclibc-300-006_better_file_error.patch |    0
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |    0
 .../binutils-uclibc-gas-needs-libm.patch           |    0
 .../binutils-xlp-support.patch                     |  390 +++----
 .../binutils/binutils/fix-pr15815.patch            |   36 +
 .../libiberty_path_fix.patch                       |    0
 .../libtool-2.4-update.patch                       | 1096 +++++++++-----------
 .../libtool-rpath-fix.patch                        |    0
 .../mips64-default-ld-emulation.patch              |   41 +-
 .../relocatable_sdk.patch                          |    0
 .../{binutils_2.23.2.bb => binutils_2.24.bb}       |    6 +-
 37 files changed, 837 insertions(+), 2138 deletions(-)
 rename meta/recipes-connectivity/wireless-tools/{wireless-tools_29.bb => wireless-tools_30.pre9.bb} (79%)
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-PPC_VLE_SPLIT16A-Delete-unused-macro.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-doc-binutils.texi-elfedit-Fix-use-of-itemx-in-table.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0001-ld.texinfo-Replace-with-when-it-is-part-of-the-text.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-config-tc-ppc.c-md_apply_fix-Sign-extend-fieldval-un.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0002-emultempl-elf32.em-gld-EMULATION_NAME-_before_alloca.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/0003-gold.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-ineffectual-zero-of-cache.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-replace-strncat-with-strcat.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/binutils-fix-over-array-bounds-issue.patch
 delete mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/binutils-x86_64_i386_biarch.patch
 rename meta/recipes-devtools/binutils/{binutils-2.23.2.inc => binutils-2.24.inc} (51%)
 rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.23.2.bb => binutils-cross-canadian_2.24.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-cross_2.23.2.bb => binutils-cross_2.24.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.23.2.bb => binutils-crosssdk_2.24.bb} (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-armv5e.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-poison.patch (78%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-100-uclibc-conf.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-300-001_ld_makefile_patch.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-300-006_better_file_error.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-300-012_check_ldrunpath_length.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-uclibc-gas-needs-libm.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/binutils-xlp-support.patch (41%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/fix-pr15815.patch
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/libiberty_path_fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/libtool-2.4-update.patch (97%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/libtool-rpath-fix.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/mips64-default-ld-emulation.patch (68%)
 rename meta/recipes-devtools/binutils/{binutils-2.23.2 => binutils}/relocatable_sdk.patch (100%)
 rename meta/recipes-devtools/binutils/{binutils_2.23.2.bb => binutils_2.24.bb} (77%)

-- 
1.9.rc1


