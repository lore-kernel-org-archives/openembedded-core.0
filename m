Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QrYDL-0002k1-9D
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 18:34:35 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Aug 2011 09:30:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,357,1309762800"; d="scan'208";a="38285521"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by fmsmga002.fm.intel.com with ESMTP; 11 Aug 2011 09:30:02 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 09:29:48 -0700
Message-Id: <cover.1313079549.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 00/10] Various Fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 16:34:35 -0000

Richard,

This is a series of patches that I have reviewed and built.

Sau!

The following changes since commit a1f87ec65fa1a6d5ce9a010548dbe7c01ab9b711:

  eglibc: force GLIBC_EXTRA_OECONF to not be uset for nativesdk (2011-08-10 13:26:22 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (1):
  scripts/runqemu: Make it run on ubuntu 11.10

Kumar Gala (5):
  python-dir: specify am_cv_python_pythondir & am_cv_python_pyexecdir
  xcb-proto: use python-dir class for proper path setting
  telepathy-python: utilize python-dir to respect libdir/site-packages
    path
  gnome-doc-utils: respect python-dir setting EXTRA_OECONF
  gcc: move --enable-target-optspace workaround to just gcc-4.5.1

Leandro Dorileo (1):
  scripts/combo-layer: a simple way to script the combo-layer conf

Richard Purdie (1):
  gcc: Various fixups to ensure consistent gcc builds

Xiaofeng Yan (1):
  chkconfig: remove link for update-alternatives to disambiguate

jani.uusi-rantala@nokia.com (1):
  Magic file path should be given for rpmbuild

 meta/classes/package_rpm.bbclass                   |    2 +
 meta/classes/python-dir.bbclass                    |    3 ++
 .../telepathy/telepathy-python_0.15.19.bb          |    4 +-
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |   10 +++++++++
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    4 +-
 meta/recipes-devtools/gcc/gcc-common.inc           |    9 ++++---
 meta/recipes-devtools/gcc/gcc-configure-common.inc |   17 +++++++--------
 .../gcc/gcc-cross-canadian_4.5.1.bb                |    2 -
 .../gcc/gcc-cross-initial_4.5.1.bb                 |    2 -
 .../gcc/gcc-cross-intermediate_4.5.1.bb            |    1 -
 meta/recipes-devtools/gcc/gcc-cross_4.5.1.bb       |    2 -
 .../gcc/gcc-cross_csl-arm-2008q1.bb                |    2 -
 .../gcc/gcc-crosssdk-initial_4.5.1.bb              |    2 -
 .../gcc/gcc-crosssdk-intermediate_4.5.1.bb         |    2 -
 meta/recipes-devtools/gcc/gcc-crosssdk_4.5.1.bb    |    2 -
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |    1 +
 meta/recipes-devtools/gcc/gcc-runtime_4.5.1.bb     |    2 -
 meta/recipes-devtools/gcc/gcc_4.5.1.bb             |    1 -
 meta/recipes-devtools/gcc/gcc_csl-arm-2008q1.bb    |    2 -
 .../recipes-extended/chkconfig/chkconfig_1.3.52.bb |    3 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.6.bb |    2 +-
 .../xcb/xcb-proto-1.6/aclocal.patch                |   22 --------------------
 meta/recipes-graphics/xcb/xcb-proto.inc            |    5 +--
 meta/recipes-graphics/xcb/xcb-proto_1.6.bb         |    2 +-
 meta/recipes-graphics/xcb/xcb-proto_git.bb         |    2 +-
 scripts/combo-layer                                |   13 ++++++++++-
 scripts/runqemu                                    |    1 +
 28 files changed, 54 insertions(+), 68 deletions(-)
 delete mode 100644 meta/recipes-graphics/xcb/xcb-proto-1.6/aclocal.patch

-- 
1.7.3.4



