Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QUvDv-0001Os-Py
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Jun 2011 08:29:40 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Jun 2011 23:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,345,1304319600"; d="scan'208";a="12490361"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.12.216])
	by orsmga001.jf.intel.com with ESMTP; 09 Jun 2011 23:26:18 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2011 23:26:12 -0700
Message-Id: <cover.1307686598.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
Subject: [CONSOLIDATED PULL 0/4] 10-June
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
X-List-Received-Date: Fri, 10 Jun 2011 06:29:40 -0000

Richard,

This has the contiuation of the static library work (staticdev)
along with some community contribtions.

Thanks
	Sau!


The following changes since commit f183c7cfe377fa6ed2777605c3590a9dda2060df:

  native/nativesdk: Clean up the depends ordering after bitbake override handling updates (2011-06-09 22:48:56 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Kang Kai (1):
  ghostscript: update SRC_URI

Nitin A Kamble (1):
  gcc: rebase the patch to avoid patch rejection

Phil Blundell (1):
  busybox: backport distro-features handling from oe master

Saul Wold (1):
  multiple recipes converted to -staticdev packages

 meta/recipes-bsp/pciutils/pciutils_3.1.7.bb        |    7 +-
 .../wireless-tools/wireless-tools_29.bb            |    9 +-
 meta/recipes-core/busybox/busybox.inc              |   80 +-
 meta/recipes-core/busybox/busybox_1.18.4.bb        |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    8 +-
 meta/recipes-core/eglibc/eglibc_2.12.bb            |    2 +-
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |   16 +-
 meta/recipes-core/glibc/glibc-package.inc          |    9 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |    2 +-
 .../meta/external-csl-toolchain_2008q3-72.bb       |    8 +-
 meta/recipes-core/uclibc/uclibc.inc                |   10 +-
 meta/recipes-core/udev/udev-new.inc                |   14 +-
 meta/recipes-core/udev/udev_164.bb                 |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   11 +-
 meta/recipes-core/util-linux/util-linux_2.19.1.bb  |    2 +-
 meta/recipes-devtools/binutils/binutils.inc        |    1 -
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    2 +-
 ...-de.po-el.po-es.po-fi.po-fr.po-id.po-ja.p.patch |161900 +-------------------
 meta/recipes-devtools/gcc/gcc-package-runtime.inc  |   24 +-
 meta/recipes-devtools/gcc/libgcc_4.6.0.bb          |    2 +-
 meta/recipes-devtools/opkg/opkg_0.1.8.bb           |    8 +-
 meta/recipes-devtools/opkg/opkg_svn.bb             |    8 +-
 meta/recipes-devtools/python/python_2.6.6.bb       |    2 -
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |   18 +-
 meta/recipes-extended/augeas/augeas.inc            |    4 +-
 meta/recipes-extended/augeas/augeas_0.8.1.bb       |    2 +-
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |    9 +-
 .../ghostscript/ghostscript_9.02.bb                |    7 +-
 .../tcp-wrappers/tcp-wrappers_7.6.bb               |    9 +-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    9 +-
 meta/recipes-graphics/xorg-lib/libxft_2.2.0.bb     |    7 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    5 +-
 meta/recipes-support/attr/acl_2.2.51.bb            |    2 +-
 meta/recipes-support/attr/attr_2.4.46.bb           |    2 +-
 meta/recipes-support/attr/ea-acl.inc               |    8 +-
 meta/recipes-support/curl/curl_7.21.6.bb           |    8 +-
 meta/recipes-support/sqlite/sqlite3.inc            |    7 +-
 meta/recipes-support/sqlite/sqlite3_3.7.6.2.bb     |    2 +-
 38 files changed, 2605 insertions(+), 159623 deletions(-)

-- 
1.7.3.4



