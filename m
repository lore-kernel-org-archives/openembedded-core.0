Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 85D566CEED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Oct 2013 11:23:49 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 10 Oct 2013 04:23:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1071,1371106800"; d="scan'208";a="417158567"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.176])
	by orsmga002.jf.intel.com with ESMTP; 10 Oct 2013 04:23:50 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 10 Oct 2013 12:23:07 +0100
Message-Id: <cover.1381404113.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [dylan][PATCH 00/13] Backports from master (cover letter only)
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
X-List-Received-Date: Thu, 10 Oct 2013 11:23:49 -0000

Some backported patches to fix bugs in the dylan branch. These have been
tested on the Yocto Project autobuilder.



The following changes since commit a065c225a70ef7c0bc7f169cad961765f9366263:

  mesa: inherit gettext (2013-08-16 10:39:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-next

Chen Qi (2):
  rpm: fix typo in PACKAGECONFIG
  busybox: configure system user id to range from 100 to 999

Darren Hart (1):
  kernel.bbclass: Correct post(inst|rm) package association

Jackie Huang (1):
  findutils_4.2.31: backport fixes for doc build errors

Jason Wessel (1):
  ncurses: Fix problems expanding ncurses-libtinfo when in IMAGE_INSTALL

Khem Raj (1):
  elfutils-native: Fix build on distros with gcc 4.8

Marko Lindqvist (1):
  boost: fix build when PARALLEL_MAKE is not set

Paul Eggleton (2):
  sysvinit-inittab: ensure unique label for SERIAL_CONSOLES entries
  classes/package_rpm: fix bitbake package-index for RPM

Ross Burton (1):
  libxml2: remove patch for CVE-2012-2871

Saul Wold (3):
  mc: Don't remove libdir and split helpers into packages
  perl: Backport 2 CVE Patches
  python: Backport 2 CVE from upstream

 meta/classes/kernel.bbclass                        |  29 ++-
 meta/classes/package_rpm.bbclass                   |   5 +
 meta/recipes-core/busybox/busybox-1.20.2/defconfig |   4 +-
 .../libxml/libxml2/libxml2-CVE-2012-2871.patch     |  34 ---
 meta/recipes-core/libxml/libxml2_2.9.0.bb          |   2 -
 meta/recipes-core/ncurses/ncurses.inc              |   2 +
 .../sysvinit/sysvinit-inittab_2.88dsf.bb           |   6 +-
 .../elfutils/elfutils/fix-build-gcc-4.8.patch      |  44 ++++
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |   1 +
 .../0001-Fix-misparsing-of-maketext-strings.patch  |  86 +++++++
 ...mature-hsplit-calls-and-only-trigger-REHA.patch | 178 +++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.3.bb          |   3 +
 .../python/python/CVE-2013-4073_py27.patch         | 251 +++++++++++++++++++++
 .../python/python/pypirc-secure.patch              |  35 +++
 meta/recipes-devtools/python/python_2.7.3.bb       |   2 +
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |   2 +-
 .../findutils-fix-doc-build-error.patch            |  53 +++++
 .../recipes-extended/findutils/findutils_4.2.31.bb |   1 +
 meta/recipes-extended/mc/mc_4.7.5.2.bb             |  26 ++-
 meta/recipes-extended/mc/mc_4.8.7.bb               |  23 +-
 meta/recipes-support/boost/boost.inc               |   2 +
 21 files changed, 727 insertions(+), 62 deletions(-)
 delete mode 100644 meta/recipes-core/libxml/libxml2/libxml2-CVE-2012-2871.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Fix-misparsing-of-maketext-strings.patch
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.3/0001-Prevent-premature-hsplit-calls-and-only-trigger-REHA.patch
 create mode 100644 meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch
 create mode 100644 meta/recipes-devtools/python/python/pypirc-secure.patch
 create mode 100644 meta/recipes-extended/findutils/findutils-4.2.31/findutils-fix-doc-build-error.patch

-- 
1.8.1.2


