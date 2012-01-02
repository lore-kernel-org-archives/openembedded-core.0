Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RhlcP-0000w7-Qi
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jan 2012 18:24:22 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 02 Jan 2012 09:16:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="102388493"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.13.112])
	by fmsmga001.fm.intel.com with ESMTP; 02 Jan 2012 09:16:53 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  2 Jan 2012 09:06:07 -0800
Message-Id: <cover.1325523894.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/9] Updates and fixes
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
X-List-Received-Date: Mon, 02 Jan 2012 17:24:22 -0000

Richard,

Some updates and build fixes

(

Sau!

The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/updates
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/updates

Saul Wold (9):
  resolvconf: Update to 1.63
  libiconv: Update to 1.14
  dropbear: fix CRYPTLIB patch
  python: add md5module support
  boost: Update to 1.48 and Clean ups
  util-linux: Update to 2.20.1
  rxvt-unicode: Update to 9.14
  distro_tracking: Updated for Upgrades and Manual Check Dates
  Add Upstream-Status to patches

 .../openswan/openswan-2.4.7/installflags.patch     |    2 +
 .../openswan-2.4.7/ld-library-path-breakage.patch  |    2 +
 .../openswan-2.4.7/openswan-2.4.7-gentoo.patch     |    2 +
 .../wbxml/files/no-doc-install.patch               |    2 +
 .../gcalctool/gcalctool/fix-includedir.patch       |    2 +
 .../libfribidi/files/libtool-update.patch          |    2 +
 .../openobex/files/disable-cable-test.patch        |    3 +-
 .../openobex/files/libusb_crosscompile_check.patch |    2 +
 .../conf/distro/include/distro_tracking_fields.inc |   51 ++++++++-------
 .../use_correct_strip_in_cross_environment.patch   |    2 +-
 .../connman/connman/disable_alg-test.patch         |    2 +-
 .../connman/connman/ethernet_default.patch         |    2 +-
 .../{resolvconf_1.62.bb => resolvconf_1.63.bb}     |    4 +-
 .../dropbear-0.53.1-static_build_fix.patch         |   67 ++++++++++++++------
 meta/recipes-core/dropbear/dropbear_2011.54.bb     |    2 +-
 .../MCONFIG                                        |    0
 .../defines.h                                      |    0
 .../make_include                                   |    0
 .../remove-lscpu.patch                             |    0
 .../remove_sigsetmark.patch                        |    0
 .../swapargs.h                                     |    0
 .../uclibc-__progname-conflict.patch               |    0
 .../uclibc-compile.patch                           |    0
 .../util-linux-ng-2.16-mount_lock_path.patch       |    0
 .../util-linux-ng-replace-siginterrupt.patch       |    0
 meta/recipes-core/util-linux/util-linux.inc        |    6 +-
 .../{util-linux_2.19.1.bb => util-linux_2.20.1.bb} |   11 ++--
 .../prefer-cpio-over-pax-for-ustar-archives.patch  |    2 +
 .../dosfstools/fix_populated_dosfs_creation.patch  |    2 +-
 .../dosfstools/dosfstools/nofat32_autoselect.patch |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    2 +-
 .../installer/files/wget_cache.patch               |    2 +
 .../intltool-0.40.6/remove-xml-check.patch         |    3 +
 .../opkg-utils/arfile_header_split.patch           |    2 +-
 .../pseudo/pseudo/static_sqlite.patch              |    2 +
 .../python/python-native/multilib.patch            |    3 +
 .../recipes-devtools/python/python-native_2.7.2.bb |    6 +-
 .../python/python/add-md5module-support.patch      |   18 +++++
 meta/recipes-devtools/python/python/multilib.patch |    3 +
 meta/recipes-devtools/python/python_2.7.2.bb       |    3 +-
 .../rpm/rpm/header-include-fix.patch               |    2 +
 .../rpm/rpm/remove-compiled-tests.patch            |    3 +
 meta/recipes-devtools/rpm/rpm/rpm-autoconf.patch   |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-autogen.patch    |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-canonarch.patch  |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-libsql-fix.patch |    2 +
 .../recipes-devtools/rpm/rpm/rpm-log-auto-rm.patch |    3 +
 meta/recipes-devtools/rpm/rpm/rpm-no-loopmsg.patch |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-nofsync.patch    |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-platform.patch   |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-showrc.patch     |    2 +
 meta/recipes-devtools/rpm/rpm/rpm-solvedb.patch    |    2 +
 .../rpm/rpm/rpm-tools-mtree-LDFLAGS.patch          |    2 +-
 .../strace/strace-4.5.20/sigmask.patch             |    1 +
 .../use-usr-bin-env-for-python.patch               |    2 +
 .../libglade-2.6.4/python_environment.patch        |    2 +-
 .../blktrace/blktrace/blktrace-makefile.patch      |    2 +
 meta/recipes-kernel/dtc/dtc/make_install.patch     |    2 +
 .../linux-yocto/tools-perf-no-scripting.patch      |    3 +
 meta/recipes-kernel/sysprof/files/rmb-arm.patch    |    3 +
 meta/recipes-kernel/sysprof/files/rmb-mips.patch   |    2 +
 .../allow-libdir-override.patch                    |    2 +
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.12.bb => rxvt-unicode_9.14.bb} |    9 ++-
 meta/recipes-support/boost/boost.inc               |   16 ++++-
 meta/recipes-support/boost/boost_1.47.0.bb         |   27 --------
 meta/recipes-support/boost/boost_1.48.0.bb         |   10 +++
 meta/recipes-support/gmp/gmp/gmp_bugfix.patch      |    2 +-
 .../autoconf.patch                                 |    0
 .../{libiconv_1.13.1.bb => libiconv_1.14.bb}       |    4 +-
 73 files changed, 223 insertions(+), 108 deletions(-)
 rename meta/recipes-connectivity/resolvconf/{resolvconf_1.62.bb => resolvconf_1.63.bb} (88%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/MCONFIG (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/defines.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/make_include (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove-lscpu.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/remove_sigsetmark.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/swapargs.h (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-__progname-conflict.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/uclibc-compile.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-2.16-mount_lock_path.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux-2.19.1 => util-linux-2.20.1}/util-linux-ng-replace-siginterrupt.patch (100%)
 rename meta/recipes-core/util-linux/{util-linux_2.19.1.bb => util-linux_2.20.1.bb} (84%)
 create mode 100644 meta/recipes-devtools/python/python/add-md5module-support.patch
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.12 => rxvt-unicode-9.14}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.12.bb => rxvt-unicode_9.14.bb} (88%)
 delete mode 100644 meta/recipes-support/boost/boost_1.47.0.bb
 create mode 100644 meta/recipes-support/boost/boost_1.48.0.bb
 rename meta/recipes-support/libiconv/{libiconv-1.13.1 => libiconv-1.14}/autoconf.patch (100%)
 rename meta/recipes-support/libiconv/{libiconv_1.13.1.bb => libiconv_1.14.bb} (88%)

-- 
1.7.6.4



