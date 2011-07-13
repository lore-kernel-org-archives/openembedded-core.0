Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qgu17-0003mD-DC
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jul 2011 09:37:57 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 13 Jul 2011 00:33:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,523,1304319600"; d="scan'208";a="25272045"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.40])
	by orsmga002.jf.intel.com with ESMTP; 13 Jul 2011 00:33:58 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Jul 2011 00:33:32 -0700
Message-Id: <cover.1310541680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [PATCH V2 00/25] Static Library Updated
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
X-List-Received-Date: Wed, 13 Jul 2011 07:37:57 -0000

Richard,

This patch includes feedback from the community.


Thanks
	Sau!

The following changes since commit a6e9edb7b4b5b0bdb067a59d691d33fba8948963:

  sato-sdk: add clutter for sato-sdk image (2011-07-12 15:23:35 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/static
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/static

Saul Wold (25):
  bitbake.conf: Add *-config to default ${PN}-dev package
  shlibpackaging.bbclass: create common class
  pciutils: repackage development files in pciutils instead of libpci
  wireless-tools: Updated for staticdevpackaging
  augeas: inherit shlibpackaging class
  gamin: inherit shlibpackaging class
  sqlite3: inherit shlibpackaging class
  curl: inherit shlibpackaging class
  attr: inherit shlibpackaging class
  rpm: Create -staticdev package
  libxft: use default bitbake.conf FILES Packaging to handle staticdev
  js: Use bitbake default FILES for packaging
  tcp-wrappers: Use bitbake default FILES for packaging
  udev: Use bitbake default FILES for packaging
  liba52: Use bitbake default FILES for packaging
  python: Use bitbake default FILES for packaging
  external-csl-toolchain: Use bitbake default FILES for packaging
  opkg: Use bitbake default FILES for packaging
  util-linux: Use bitbake default FILES for packaging
  gettext: Use bitbake default FILES for packaging
  gcc: Use bitbake default FILES for packaging
  glibc: Use bitbake default FILES for packaging
  eglibc: Use bitbake default FILES for packaging
  uclibc: Use bitbake default FILES for packaging
  binutils: Use bitbake default FILES for packaging

 meta/classes/shlibpackaging.bbclass                |    9 +++++++
 meta/conf/bitbake.conf                             |    2 +-
 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |   10 +++----
 .../wireless-tools/wireless-tools_29.bb            |   14 ++++++----
 meta/recipes-core/eglibc/eglibc-common.inc         |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 ++++--
 meta/recipes-core/gettext/gettext_0.16.1.bb        |    6 ++--
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   24 +++++++++---------
 meta/recipes-core/glibc/glibc-package.inc          |   12 ++++++---
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    2 +-
 .../meta/external-csl-toolchain_2008q3-72.bb       |   20 ++++++++-------
 meta/recipes-core/uclibc/uclibc.inc                |    7 +++--
 meta/recipes-core/udev/udev-new.inc                |   26 ++++++++++++-------
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   17 +++++++++----
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 .../binutils/binutils-cross-canadian_2.21.1.bb     |    2 +-
 meta/recipes-devtools/binutils/binutils-cross.inc  |    2 +
 .../binutils/binutils-cross_csl-arm-2008q1.bb      |    2 +-
 .../binutils/binutils-crosssdk_2.21.1.bb           |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    9 +-----
 meta/recipes-devtools/binutils/binutils_2.21.1.bb  |    2 +-
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   25 +++++++++++++-----
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |   10 ++++---
 meta/recipes-devtools/opkg/opkg_svn.bb             |   10 ++++---
 meta/recipes-devtools/python/python_2.6.6.bb       |    4 +--
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 +++++++------
 meta/recipes-extended/augeas/augeas.inc            |    7 +----
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |   13 +--------
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |   17 +++++++-----
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +----
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    4 +--
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |   16 +-----------
 meta/recipes-support/curl/curl_7.21.7.bb           |   17 ++++--------
 meta/recipes-support/js/js_1.7.0+1.8.0rc1.bb       |    3 +-
 meta/recipes-support/sqlite/sqlite3.inc            |   10 +------
 40 files changed, 176 insertions(+), 175 deletions(-)
 create mode 100644 meta/classes/shlibpackaging.bbclass

-- 
1.7.3.4



