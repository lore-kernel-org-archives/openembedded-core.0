Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TdjoC-0004ax-L0
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Nov 2012 16:44:21 +0100
Received: by mail-pa0-f47.google.com with SMTP id fa10so4111473pad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Nov 2012 07:30:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=H3BWvboAs8GyY8YD4MtSgiSzJ8QIDyMOUR4yP0s6/MA=;
	b=lLk3d3uGGj+hb3q88h7wId+3seZaq35mYYG0+Y+jckIXtL/2gjnTGNcTQ+h9O0aun0
	TFKrKMH8KxFH9BPzHSr+TYIPiB+hQZtE5DpCC4TQyXuCO37A1GeYibhGvtj7nTqgukeg
	1u0KPuTSCKkZGwVbSdQHEuxylr0Q9r+iRtmVX8m7t3OwlqSGukYeVD+Zaz1Gq+UpmhM6
	E9mLuUJ7Zz8+98nvhTyUapn8iKrxkU2Lc17Ag11oum8hCa24soB/R0hozOztBFtm/t2r
	BfwMPjQh2mmKe/l/h3C+nEQ4MN5rnl4dOk6yHLNwT/gcqGfbGB4FAUxAYPF5obN23b/o
	MB7A==
Received: by 10.68.213.33 with SMTP id np1mr58923581pbc.64.1354116605372;
	Wed, 28 Nov 2012 07:30:05 -0800 (PST)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id gu5sm12607809pbc.10.2012.11.28.07.30.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 07:30:04 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Nov 2012 07:29:24 -0800
Message-Id: <cover.1354116375.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Upgrade binutils to 2.23.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Nov 2012 15:44:21 -0000

This patchset updates binutils to 2.23 branch I have tested systemd-image
meta-toolchain and core-image-sato target with it they all built fine
I did not (yet) delete the 2.22 recipes since there must be some time
given for folks to try 2.23 in couple of weeks 2.22 recipes will move
out of OE-Core. Preferably deleted if need be moved into toolchain-layer


The following changes since commit bdce08215396e5ab99ada5fa0f62c3b002a44582:

  openssh: CVE-2011-4327 (2012-11-28 07:38:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/binutils-2.23
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/binutils-2.23

Khem Raj (3):
  binutils-2.23.1: Add recipes
  oprofile: Define PACKAGE and PACKAGE_VERSION
  tcmode-default.inc: Use binutils 2.23.1

 meta/conf/distro/include/tcmode-default.inc        |    2 +-
 meta/recipes-devtools/binutils/binutils-2.23.1.inc |   46 +
 .../binutils-2.23.1/backport/0001-bfd.patch        |   58 +
 ...3-Assemble-all-sources-files-in-each-test.patch |  187 +
 .../binutils-2.23.1/backport/0005-bfd.patch        |  103 +
 .../backport/0010-bfd-ChangeLog.patch              |   95 +
 ...012-Fix-TLS-LD-to-LE-optimization-for-x32.patch |   57 +
 .../backport/0013-gas-ChangeLog.patch              |   43 +
 .../0014-Fix-opcode-for-64-bit-jecxz.patch         |  112 +
 ...-data.exp-Add-XFAIL-for-arm-targets-refer.patch |   40 +
 .../binutils-2.23.1/backport/0018-bfd.patch        |   78 +
 .../binutils-2.23.1/backport/0024-bfd.patch        |   49 +
 .../backport/0026-ld-testsuite.patch               |   65 +
 .../binutils/binutils-2.23.1/binutils-armv5e.patch |   25 +
 .../binutils/binutils-2.23.1/binutils-poison.patch |  259 +
 .../binutils-uclibc-100-uclibc-conf.patch          |   40 +
 ...binutils-uclibc-300-001_ld_makefile_patch.patch |   55 +
 ...binutils-uclibc-300-006_better_file_error.patch |   45 +
 ...ils-uclibc-300-012_check_ldrunpath_length.patch |   49 +
 .../binutils-uclibc-gas-needs-libm.patch           |   38 +
 .../binutils-x86_64_i386_biarch.patch              |   29 +
 .../binutils-2.23.1/libiberty_path_fix.patch       |   22 +
 .../binutils-2.23.1/libtool-2.4-update.patch       |19407 ++++++++++++++++++++
 .../binutils-2.23.1/libtool-rpath-fix.patch        |   39 +
 .../mips64-default-ld-emulation.patch              |   49 +
 .../binutils/binutils-2.23.1/relocatable_sdk.patch |   49 +
 .../binutils/binutils-cross-canadian_2.23.1.bb     |    3 +
 .../binutils/binutils-cross_2.23.1.bb              |    3 +
 .../binutils/binutils-crosssdk_2.23.1.bb           |   14 +
 meta/recipes-devtools/binutils/binutils_2.23.1.bb  |   35 +
 meta/recipes-kernel/oprofile/oprofile.inc          |    4 +-
 31 files changed, 21097 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1.inc
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0001-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0003-Assemble-all-sources-files-in-each-test.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0005-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0010-bfd-ChangeLog.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0012-Fix-TLS-LD-to-LE-optimization-for-x32.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0013-gas-ChangeLog.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0014-Fix-opcode-for-64-bit-jecxz.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0017-ld-elf-comm-data.exp-Add-XFAIL-for-arm-targets-refer.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0018-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0024-bfd.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/backport/0026-ld-testsuite.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-armv5e.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-poison.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-100-uclibc-conf.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-001_ld_makefile_patch.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-006_better_file_error.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-300-012_check_ldrunpath_length.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-uclibc-gas-needs-libm.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/binutils-x86_64_i386_biarch.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/libiberty_path_fix.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/libtool-2.4-update.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/libtool-rpath-fix.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/mips64-default-ld-emulation.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.1/relocatable_sdk.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross-canadian_2.23.1.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils-cross_2.23.1.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils-crosssdk_2.23.1.bb
 create mode 100644 meta/recipes-devtools/binutils/binutils_2.23.1.bb

-- 
1.7.9.5



