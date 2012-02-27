Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1S2668-00027s-4J
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 20:19:00 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 27 Feb 2012 11:10:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122056426"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.15.37])
	by fmsmga001.fm.intel.com with ESMTP; 27 Feb 2012 11:10:32 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Feb 2012 11:10:18 -0800
Message-Id: <cover.1330369680.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 00/13] Updates and a missing patch
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
X-List-Received-Date: Mon, 27 Feb 2012 19:19:00 -0000

Richard,

This is a block of updates along with a missing patch for gnupg GPLv2 version.

Thanks
	Sau!


The following changes since commit e1d5a81bf78786dcb11a4840436f46ba9ec4010e:

  glib-2.0: Disable fam, we don't depend on it (2012-02-27 12:16:35 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (13):
  gnupg: Add missing patch for curl_typeof_fix
  qemu: Add glib-2.0 as depends
  util-linux: Update to 2.21
  file: Update to version 5.11
  psmisc: Update to version 22.16
  libdrm: Update to version 2.4.31
  mkfontdir: Update to version 1.0.7
  mkfontscale: Update to version 1.1.0
  boost: Update to version 1.49.0
  sqlite3: Update to version 3.7.10
  xf86-video-intel: Update to version 2.18.0
  tiff: Update to version 3.9.5
  distro_tracking: Account for updates and Manual Checking

 .../conf/distro/include/distro_tracking_fields.inc |  106 ++++++++++----------
 .../util-linux-ng-replace-siginterrupt.patch       |   25 -----
 .../{util-linux-2.20.1 => util-linux-2.21}/MCONFIG |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |   26 +++++
 meta/recipes-core/util-linux/util-linux.inc        |    8 +-
 .../{util-linux_2.20.1.bb => util-linux_2.21.bb}   |   12 +-
 .../file/{file_5.10.bb => file_5.11.bb}            |    6 +-
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/qemu/qemu_0.15.1.bb          |    2 +-
 .../psmisc/files/libintl-link.patch                |   32 ------
 meta/recipes-extended/psmisc/psmisc.inc            |    4 +-
 .../psmisc/{psmisc_22.14.bb => psmisc_22.16.bb}    |    4 +-
 .../drm/{libdrm_2.4.30.bb => libdrm_2.4.31.bb}     |    6 +-
 .../{mkfontdir_1.0.6.bb => mkfontdir_1.0.7.bb}     |    4 +-
 .../{mkfontscale_1.0.9.bb => mkfontscale_1.1.0.bb} |    4 +-
 ...-intel_2.17.0.bb => xf86-video-intel_2.18.0.bb} |    5 +-
 .../libtiff/{tiff_3.9.5.bb => tiff_4.0.1.bb}       |    8 +-
 .../boost/{boost_1.48.0.bb => boost_1.49.0.bb}     |    4 +-
 .../gnupg-1.4.7/curl_typeof_fix_backport.patch     |   27 +++++
 meta/recipes-support/sqlite/sqlite3_3.7.10.bb      |   11 ++
 meta/recipes-support/sqlite/sqlite3_3.7.9.bb       |   11 --
 29 files changed, 153 insertions(+), 154 deletions(-)
 delete mode 100644 meta/recipes-core/util-linux/util-linux-2.20.1/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.20.1 => util-linux-2.21}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 create mode 100644 meta/recipes-core/util-linux/util-linux-2.21/util-linux-ng-replace-siginterrupt.patch
 rename meta/recipes-core/util-linux/{util-linux_2.20.1.bb => util-linux_2.21.bb} (84%)
 rename meta/recipes-devtools/file/{file_5.10.bb => file_5.11.bb} (85%)
 delete mode 100644 meta/recipes-extended/psmisc/files/libintl-link.patch
 rename meta/recipes-extended/psmisc/{psmisc_22.14.bb => psmisc_22.16.bb} (46%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.30.bb => libdrm_2.4.31.bb} (59%)
 rename meta/recipes-graphics/xorg-app/{mkfontdir_1.0.6.bb => mkfontdir_1.0.7.bb} (81%)
 rename meta/recipes-graphics/xorg-app/{mkfontscale_1.0.9.bb => mkfontscale_1.1.0.bb} (80%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.17.0.bb => xf86-video-intel_2.18.0.bb} (84%)
 rename meta/recipes-multimedia/libtiff/{tiff_3.9.5.bb => tiff_4.0.1.bb} (79%)
 rename meta/recipes-support/boost/{boost_1.48.0.bb => boost_1.49.0.bb} (53%)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/curl_typeof_fix_backport.patch
 create mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.10.bb
 delete mode 100644 meta/recipes-support/sqlite/sqlite3_3.7.9.bb

-- 
1.7.7.6



