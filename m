Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RJYBm-0002iM-Th
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Oct 2011 00:12:43 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 27 Oct 2011 15:06:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,415,1315206000"; d="scan'208";a="83263162"
Received: from unknown (HELO swold-mobl.Mikenopa.local) ([10.255.15.81])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2011 15:06:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 28 Oct 2011 00:06:20 +0200
Message-Id: <cover.1319753141.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/18] Patches, QA & Bug Fixes
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
X-List-Received-Date: Thu, 27 Oct 2011 22:12:43 -0000

Richard,

This includes some patches that have been pending, along with some
QA packaging fixes that I worked up.  This also includes the fix for
creating a the xuser and avahi user.

Thanks
        Sau!

The following changes since commit ddc9a58b8553599d2328ac1c4449b41681ae45d1:

  Add readline as dependecy for gdb-cross-canadian (2011-10-27 08:37:53 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Khem Raj (1):
  libtool: Upgrade from 2.4 -> 2.4.2

Paul Eggleton (3):
  dbus: remove unused initscript
  util-linux: split out mkfs into its own package
  e2fsprogs: move mke2fs.conf to e2fsprogs-mke2fs package

Saul Wold (12):
  wget: Add recipe from OE
  dbus-glib: fix QA Packaging issues
  libgcc: fix QA Packaging issues
  at: fix QA Packaging issues
  man: fix QA Packaging issues
  mdadm: fix QA Packaging issues
  libatomics-ops: fix QA Packaging issues
  libproxy: fix QA Packaging issues
  abiword: convert to svn
  avahi: use useradd to create user
  connman: create xuser
  xserver-nodm-init: use useradd to create xuser

Scott Garman (1):
  documentation-audit.sh: script for auditing documentation build
    status

Wenzong Fan (1):
  distro_tracking_fields: update packages tracking fields

 meta-demoapps/recipes-gnome/abiword/abiword.inc    |    4 +-
 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb |   10 -
 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb |   10 +
 .../conf/distro/include/distro_tracking_fields.inc |   12 +
 meta/recipes-connectivity/avahi/avahi.inc          |   22 +--
 meta/recipes-connectivity/connman/connman.inc      |    6 +-
 meta/recipes-connectivity/connman/connman_0.75.bb  |    2 +-
 meta/recipes-core/dbus/dbus-glib.inc               |    4 +-
 meta/recipes-core/dbus/dbus-glib_0.92.bb           |    2 +-
 meta/recipes-core/dbus/dbus.inc                    |    3 +
 meta/recipes-core/dbus/dbus_1.4.12.bb              |    3 +
 meta/recipes-core/util-linux/util-linux.inc        |    5 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 +-
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    2 +
 .../libtool/{libtool.inc => libtool-2.4.2.inc}     |   26 ++-
 meta/recipes-devtools/libtool/libtool-2.4.inc      |   13 -
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   46 ++--
 .../libtool/libtool/resolve-sysroot.patch          |   42 ---
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 meta/recipes-extended/at/at_3.1.12.bb              |    4 +-
 meta/recipes-extended/man/man_1.6f.bb              |    4 +-
 meta/recipes-extended/mdadm/mdadm_3.2.2.bb         |    3 +-
 .../wget/wget-1.12/fix_makefile.patch              |   59 +++++
 .../wget/wget-1.12/gnutls.bzr.patch                |  266 ++++++++++++++++++++
 meta/recipes-extended/wget/wget.inc                |   24 ++
 meta/recipes-extended/wget/wget_1.12.bb            |   11 +
 .../x11-common/xserver-nodm-init.bb                |   26 +--
 .../pulseaudio/libatomics-ops_1.2.bb               |    6 +-
 meta/recipes-support/libproxy/libproxy_0.4.7.bb    |    4 +-
 scripts/contrib/documentation-audit.sh             |   92 +++++++
 33 files changed, 571 insertions(+), 152 deletions(-)
 delete mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_cvs.bb
 create mode 100644 meta-demoapps/recipes-gnome/abiword/abiword_svn.bb
 rename meta/recipes-devtools/libtool/{libtool.inc => libtool-2.4.2.inc} (57%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool-2.4.inc
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (96%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (97%)
 delete mode 100644 meta/recipes-devtools/libtool/libtool/resolve-sysroot.patch
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (94%)
 create mode 100644 meta/recipes-extended/wget/wget-1.12/fix_makefile.patch
 create mode 100644 meta/recipes-extended/wget/wget-1.12/gnutls.bzr.patch
 create mode 100644 meta/recipes-extended/wget/wget.inc
 create mode 100644 meta/recipes-extended/wget/wget_1.12.bb
 create mode 100755 scripts/contrib/documentation-audit.sh

-- 
1.7.6.4



