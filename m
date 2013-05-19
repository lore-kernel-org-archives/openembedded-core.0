Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UeCJk-0001n3-EY
	for openembedded-core@lists.openembedded.org;
	Mon, 20 May 2013 00:43:05 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 19 May 2013 15:24:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,704,1363158000"; d="scan'208";a="243873583"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.171])
	by AZSMGA002.ch.intel.com with ESMTP; 19 May 2013 15:24:43 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 May 2013 01:24:43 +0300
Message-Id: <cover.1369002154.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
MIME-Version: 1.0
Subject: [CONSOLIDATED PULL 00/14] Patches and a few updates
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
X-List-Received-Date: Sun, 19 May 2013 22:43:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Richard,

Here is a group of patches along with a few package updates that
I had pending during our travels.

Yes, I am putting Robert's old image removal up again, if you are
concerned about setting an API (via the variable) then we can disuss
it further.

Thanks
	Sau!


The following changes since commit ae28ee3f7a060b9e0d13154a84f2444a98490b5b:

  python-pygobject-native: fix build dependency on python-native (2013-05-17 09:38:39 +0300)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andreas Müller (1):
  qt: fix warning -Wunused-local-typedefs introduced by gcc 4.8

Andrei Dinu (2):
  nfs-utils : upgrade to 1.2.8
  cdrtools-native : upgrade to 3.00

Chen Qi (1):
  bind: use /var/run/named instead of /var/run/bind/run

Felipe F. Tonello (1):
  qt: updated qmake2 class to export qconfig.pri mkspec

Joe Slater (1):
  zlib: put shared libraries in base_libdir

Jonathan Liu (3):
  opkg: remove unnecessary extra leading slash in run-postinsts
  systemd: fix ordering for machineid and run-postinsts services
  util-linux: Update to 2.23

Khem Raj (1):
  pam: Add libtirpc to build dependencies

Robert Yang (1):
  image_types.bbclass: remove the old images

Ross Burton (3):
  librsvg: add more PACKAGECONFIG options
  librsvg: clean up native depends
  librsvg: small cleanups

 meta/classes/image_types.bbclass                   |   6 +-
 meta/classes/qmake2.bbclass                        |   1 +
 meta/conf/local.conf.sample.extended               |   3 +
 .../bind/bind-9.8.1/conf.patch                     |   4 +-
 .../nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch |  26 -
 .../nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch  | 599 ---------------------
 .../{nfs-utils_1.2.7.bb => nfs-utils_1.2.8.bb}     |  12 +-
 .../systemd/systemd-compat-units/machineid.service |   2 +-
 .../systemd-compat-units/run-postinsts.service     |   2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   5 +-
 ...-fix-loopcxt_check_size-to-work-with-blkd.patch |  60 +++
 ...etup-use-warn_size-for-regular-files-only.patch |  29 +
 .../util-linux/util-linux/mbsalign-license.patch   |  78 ---
 .../util-linux/uclibc-__progname-conflict.patch    |  15 +-
 .../{util-linux_2.22.2.bb => util-linux_2.23.bb}   |  11 +-
 meta/recipes-core/zlib/zlib_1.2.7.bb               |  15 +
 .../cdrtools-native/glibc-conflict-rename.patch    | 236 --------
 .../cdrtools/cdrtools-native/no_usr_src.patch      |  46 +-
 ...ools-native_2.01.bb => cdrtools-native_3.00.bb} |  11 +-
 meta/recipes-devtools/opkg/opkg.inc                |   2 +-
 meta/recipes-extended/pam/libpam_1.1.6.bb          |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |  30 +-
 meta/recipes-qt/qt4/qt4-4.8.4.inc                  |   1 +
 ...emove-unnecessary-typedef-found-by-gcc4-8.patch |  37 ++
 meta/recipes-qt/qt4/qt4-embedded_4.8.4.bb          |   2 +-
 meta/recipes-qt/qt4/qt4-native.inc                 |   3 +-
 meta/recipes-qt/qt4/qt4-x11-free_4.8.4.bb          |   2 +-
 27 files changed, 229 insertions(+), 1011 deletions(-)
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils-1.2.3-uclibc-libio.h.patch
 delete mode 100644 meta/recipes-connectivity/nfs-utils/nfs-utils/nfs-utils.1.2.8.rc3.patch
 rename meta/recipes-connectivity/nfs-utils/{nfs-utils_1.2.7.bb => nfs-utils_1.2.8.bb} (88%)
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-lib-loopdev-fix-loopcxt_check_size-to-work-with-blkd.patch
 create mode 100644 meta/recipes-core/util-linux/util-linux/0001-losetup-use-warn_size-for-regular-files-only.patch
 delete mode 100644 meta/recipes-core/util-linux/util-linux/mbsalign-license.patch
 rename meta/recipes-core/util-linux/{util-linux_2.22.2.bb => util-linux_2.23.bb} (55%)
 delete mode 100644 meta/recipes-devtools/cdrtools/cdrtools-native/glibc-conflict-rename.patch
 rename meta/recipes-devtools/cdrtools/{cdrtools-native_2.01.bb => cdrtools-native_3.00.bb} (70%)
 create mode 100644 meta/recipes-qt/qt4/qt4-4.8.4/0025-Remove-unnecessary-typedef-found-by-gcc4-8.patch

-- 
1.8.0.2



