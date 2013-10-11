Return-Path: <sgw@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id E7CA66CF02
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Oct 2013 15:27:22 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Oct 2013 08:27:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,1081,1371106800"; d="scan'208";a="373506385"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.15.234])
	by azsmga001.ch.intel.com with ESMTP; 11 Oct 2013 08:27:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Oct 2013 08:27:06 -0700
Message-Id: <cover.1381505051.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH 00/18] Package Updates and patches
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
X-List-Received-Date: Fri, 11 Oct 2013 15:27:24 -0000

Richard,

Here is a set of package updates along with a few patches, I included a couple
of patches from others (out of master-next) here since I based my patches on 
them.

Sau!

The following changes since commit 1149b1fef8912f77d971242dfec151fff5a3aa51:

  build-appliance: Update SRCREV for release (2013-10-08 16:33:25 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Maxin B. John (1):
  sqlite3: update to version 3.8.0.1

Saul Wold (16):
  xz: Add nativesdk for Python3 nativesdk dependency
  cups: upgrade to 1.6.4
  desktop-file-utils-native: upgrade to 0.22
  libbsd: upgrade to 0.6.0
  man-pages: upgrade to 3.54
  rsync: upgrade to 3.1.0
  util-macros: upgrade to 1.17.1
  file: Update to 5.15
  tzcode: Update to 2013g
  tzdata: Update to 2013g
  lsbinitscripts: Update to 9.50
  libpng: Update to 1.6.6
  sqlite3: update to 3.8.0.2
  kconfig-frontends: Update to 3.11.0.0
  kmod: Add patch to fix seperate build dir of ptest
  kmod: Update to Rev 15 via git

Ting Liu (1):
  kmod-native: use bswap to work on older Linux hosts

 ...e_0.21.bb => desktop-file-utils-native_0.22.bb} |  4 +--
 .../file/{file_5.14.bb => file_5.15.bb}            |  5 ++-
 ...s_3.10.0.0.bb => kconfig-frontends_3.11.0.0.bb} |  4 +--
 .../rsync/{rsync_3.0.9.bb => rsync_3.1.0.bb}       |  5 ++-
 .../cups/{cups_1.6.3.bb => cups_1.6.4.bb}          |  4 +--
 ...binitscripts_9.48.bb => lsbinitscripts_9.50.bb} |  6 ++--
 .../{man-pages_3.53.bb => man-pages_3.54.bb}       |  4 +--
 ...code-native_2013d.bb => tzcode-native_2013g.bb} | 14 ++++----
 .../tzdata/{tzdata_2013d.bb => tzdata_2013g.bb}    |  9 ++---
 meta/recipes-extended/xz/xz_5.1.2alpha.bb          |  2 +-
 .../{util-macros_1.17.bb => util-macros_1.17.1.bb} |  5 ++-
 meta/recipes-kernel/kmod/kmod-native_git.bb        |  4 +--
 meta/recipes-kernel/kmod/kmod.inc                  | 13 ++++----
 ...alling-bswap_-instead-of-htobe-and-be-toh.patch | 39 ++++++++++++++++++++++
 .../kmod/kmod/fix-seperatebuilddir.patch           | 34 +++++++++++++++++++
 meta/recipes-kernel/kmod/kmod_git.bb               |  6 ++--
 .../libpng/{libpng_1.6.3.bb => libpng_1.6.6.bb}    | 10 +++---
 .../libbsd/{libbsd_0.5.2.bb => libbsd_0.6.0.bb}    |  4 +--
 .../{sqlite3_3071700.bb => sqlite3_3080002.bb}     |  4 +--
 19 files changed, 125 insertions(+), 51 deletions(-)
 rename meta/recipes-devtools/desktop-file-utils/{desktop-file-utils-native_0.21.bb => desktop-file-utils-native_0.22.bb} (76%)
 rename meta/recipes-devtools/file/{file_5.14.bb => file_5.15.bb} (85%)
 rename meta/recipes-devtools/kconfig-frontends/{kconfig-frontends_3.10.0.0.bb => kconfig-frontends_3.11.0.0.bb} (89%)
 rename meta/recipes-devtools/rsync/{rsync_3.0.9.bb => rsync_3.1.0.bb} (82%)
 rename meta/recipes-extended/cups/{cups_1.6.3.bb => cups_1.6.4.bb} (80%)
 rename meta/recipes-extended/lsb/{lsbinitscripts_9.48.bb => lsbinitscripts_9.50.bb} (78%)
 rename meta/recipes-extended/man-pages/{man-pages_3.53.bb => man-pages_3.54.bb} (82%)
 rename meta/recipes-extended/tzcode/{tzcode-native_2013d.bb => tzcode-native_2013g.bb} (48%)
 rename meta/recipes-extended/tzdata/{tzdata_2013d.bb => tzdata_2013g.bb} (96%)
 rename meta/recipes-graphics/xorg-util/{util-macros_1.17.bb => util-macros_1.17.1.bb} (74%)
 create mode 100644 meta/recipes-kernel/kmod/kmod/Change-to-calling-bswap_-instead-of-htobe-and-be-toh.patch
 create mode 100644 meta/recipes-kernel/kmod/kmod/fix-seperatebuilddir.patch
 rename meta/recipes-multimedia/libpng/{libpng_1.6.3.bb => libpng_1.6.6.bb} (62%)
 rename meta/recipes-support/libbsd/{libbsd_0.5.2.bb => libbsd_0.6.0.bb} (83%)
 rename meta/recipes-support/sqlite/{sqlite3_3071700.bb => sqlite3_3080002.bb} (60%)

-- 
1.8.3.1


