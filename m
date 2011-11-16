Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RQl2j-0007vd-30
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 20:21:09 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 Nov 2011 11:14:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,522,1315206000"; d="scan'208";a="75791493"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by azsmga001.ch.intel.com with ESMTP; 16 Nov 2011 11:14:43 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Nov 2011 11:14:31 -0800
Message-Id: <cover.1321470758.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/8] Recipe upgrades and an x32 fix
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
X-List-Received-Date: Wed, 16 Nov 2011 19:21:09 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The following changes since commit 217a90f2ab02ec3c4e9653b528d7b584f6e37a42:

  sanity.bbclass: No need to check for cvs any more (2011-11-16 17:32:46 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/work
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/work

Nitin A Kamble (8):
  libpcre: upgrade from 8.12 to 8.20
  mpfr: upgrade from 3.0.1 to 3.1.0
  btrfs-tools: update to the latest git commit
  libtool: upgrade from 2.4 to 2.4.2
  tcl: upgrade from 8.5.10 to 8.5.11
  python-gst: upgrade from 0.10.21 to 0.10.22
  update distro tracking recipe information
  insane.bbclass: avoid errors for x32 kernel

 meta/classes/insane.bbclass                        |    8 +-
 .../conf/distro/include/distro_tracking_fields.inc |   49 +-
 .../btrfs-tools/btrfs-tools/debian/01-labels.patch |   29 -
 .../btrfs-tools/btrfs-tools/debian/02-ftbfs.patch  |  125 ---
 .../btrfs-tools/btrfs-tools/debian/03-glibc.patch  |   16 -
 .../btrfs-tools/btrfs-tools/fix_use_of_gcc.patch   |   77 +--
 .../btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch   |  183 ----
 ...g-devices-so-degraded-filesystems-can-be-.patch |   64 --
 ...-Check-for-RAID10-in-set_avail_alloc_bits.patch |   35 -
 ...t-the-root-generation-in-btrfs-debug-tree.patch |   33 -
 ...low-partial-FS-opens-for-btrfsck-scanning.patch |  253 -----
 .../0005-Temporary-debugging-for-dragonn.patch     |   75 --
 ...-add-a-btrfs-select-super-command-to-over.patch |  170 ---
 ...gs-use-safe-string-manipulation-functions.patch |  152 ---
 ...0003-Btrfs-progs-utils-Informative-errors.patch |   37 -
 ...-page-to-new-defragment-command-interface.patch |   99 --
 ...prove-error-handling-in-the-btrfs-command.patch |  510 ---------
 ...progs-update-super-fields-for-space-cache.patch |   57 -
 ...-add-support-for-mixed-data-metadata-bloc.patch |  403 -------
 .../upstream-tmp/0008-Update-for-lzo-support.patch |  203 ----
 ...pdate-clean-up-btrfs-help-and-man-page-V2.patch |  272 -----
 ...0-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch |  152 ---
 ...11-Add-the-btrfs-filesystem-label-command.patch |  390 -------
 ...-Update-man-page-for-mixed-data-metadata-.patch |   42 -
 ...-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch | 1108 --------------------
 ...-fix-wrong-extent-buffer-size-when-readin.patch |   33 -
 ...5-btrfs-progs-add-discard-support-to-mkfs.patch |  110 --
 .../btrfs-tools/btrfs-tools_git.bb                 |   10 +-
 .../libtool/{libtool-2.4.inc => libtool-2.4.2.inc} |    6 +-
 ...libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} |    2 +-
 ...btool-native_2.4.bb => libtool-native_2.4.2.bb} |    2 +-
 ...nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} |    2 +-
 .../avoid_absolute_paths_for_general_utils.patch   |    8 +-
 .../libtool/libtool/fix-final-rpath.patch          |   10 +-
 .../libtool/libtool/fix-rpath.patch                |   12 +-
 .../libtool/libtool/prefix-manpage-fix.patch       |   10 +-
 meta/recipes-devtools/libtool/libtool/prefix.patch |   42 +-
 .../libtool/libtool/rename-with-sysroot.patch      |  194 ++--
 .../libtool/libtool/resolve-sysroot.patch          |   20 +-
 .../libtool/libtool/trailingslash.patch            |   10 +-
 .../libtool/libtool/use-sysroot-in-libpath.patch   |    8 +-
 .../libtool/{libtool_2.4.bb => libtool_2.4.2.bb}   |    2 +-
 ...python-gst_0.10.21.bb => python-gst_0.10.22.bb} |    6 +-
 .../tcltk/{tcl_8.5.10.bb => tcl_8.5.11.bb}         |    4 +-
 .../libpcre/{libpcre_8.12.bb => libpcre_8.20.bb}   |    8 +-
 .../mpfr/{mpfr_3.0.1.bb => mpfr_3.1.0.bb}          |    4 +-
 46 files changed, 221 insertions(+), 4824 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/01-labels.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/02-ftbfs.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/debian/03-glibc.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/mkfs-xin-fixes.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0001-Fill-missing-devices-so-degraded-filesystems-can-be-.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0002-Check-for-RAID10-in-set_avail_alloc_bits.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0003-Print-the-root-generation-in-btrfs-debug-tree.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0004-Allow-partial-FS-opens-for-btrfsck-scanning.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-for-dragonn/0005-Temporary-debugging-for-dragonn.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0001-Btrfs-progs-add-a-btrfs-select-super-command-to-over.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0002-Btrfs-progs-use-safe-string-manipulation-functions.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0003-Btrfs-progs-utils-Informative-errors.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0004-update-man-page-to-new-defragment-command-interface.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0005-Improve-error-handling-in-the-btrfs-command.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0006-Btrfs-progs-update-super-fields-for-space-cache.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0007-Btrfs-progs-add-support-for-mixed-data-metadata-bloc.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0008-Update-for-lzo-support.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0009-Update-clean-up-btrfs-help-and-man-page-V2.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0010-Deprecate-btrfsctl-btrfs-show-btrfs-vol.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0011-Add-the-btrfs-filesystem-label-command.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0012-Btrfs-progs-Update-man-page-for-mixed-data-metadata-.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0013-btrfs-progs-Add-new-feature-to-mkfs.btrfs-to-make-fi.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0014-btrfs-progs-fix-wrong-extent-buffer-size-when-readin.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/upstream-tmp/0015-btrfs-progs-add-discard-support-to-mkfs.patch
 rename meta/recipes-devtools/libtool/{libtool-2.4.inc => libtool-2.4.2.inc} (61%)
 rename meta/recipes-devtools/libtool/{libtool-cross_2.4.bb => libtool-cross_2.4.2.bb} (99%)
 rename meta/recipes-devtools/libtool/{libtool-native_2.4.bb => libtool-native_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool-nativesdk_2.4.bb => libtool-nativesdk_2.4.2.bb} (98%)
 rename meta/recipes-devtools/libtool/{libtool_2.4.bb => libtool_2.4.2.bb} (97%)
 rename meta/recipes-devtools/python/{python-gst_0.10.21.bb => python-gst_0.10.22.bb} (82%)
 rename meta/recipes-devtools/tcltk/{tcl_8.5.10.bb => tcl_8.5.11.bb} (92%)
 rename meta/recipes-support/libpcre/{libpcre_8.12.bb => libpcre_8.20.bb} (89%)
 rename meta/recipes-support/mpfr/{mpfr_3.0.1.bb => mpfr_3.1.0.bb} (70%)

-- 
1.7.6.4



