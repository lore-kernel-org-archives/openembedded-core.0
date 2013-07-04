Return-Path: <radu.moisan@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 012B96AF00
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2013 15:12:12 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Jul 2013 08:09:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,995,1363158000"; d="scan'208";a="340516485"
Received: from ubuntu.rb.intel.com ([10.237.105.59])
	by orsmga001.jf.intel.com with ESMTP; 04 Jul 2013 08:12:13 -0700
From: Radu Moisan <radu.moisan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jul 2013 18:13:55 +0300
Message-Id: <cover.1372950678.git.radu.moisan@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH v2 00/10] Package Upgrades
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
X-List-Received-Date: Thu, 04 Jul 2013 15:12:13 -0000

* iputils: Removed obsolete patches & Replaced openssl with gnutls in dependency list
* busybox: Removed obsolete patches & Added a few fixes from upstream
  (http://busybox.net/downloads/fixes-1.21.0/)
	busybox-1.21.0-mdev.patch
	busybox-1.21.0-platform.patch
	busybox-1.21.0-xz.patch
* elfutils: license changed to GPLv3
	several patches were absolete so I removed them
	redhat-portability & redhat-robustify backported from  latest elfutils-portability & 
	elfutils-robustify from upstream
* The rest are basic upgrades, no issues

The following changes since commit 8a186a6b3853fc1a7dcf342d421c8926c38949c9:

  bitbake: hob: save button from settings called a nonexisting method (2013-07-03 08:13:35 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib rmoisan/branch-updates
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=rmoisan/branch-updates

Radu Moisan (10):
  iputils: Upgrade to v20121221
  busybox: Upgrade to v1.21.0
  elfutils: Upgrade to v0.155
  rxvt-unicode: Upgrade to v9.18
  ed: Upgrade to v1.8
  libdmx: Upgrade to v1.1.3
  apr: Upgrade to v1.4.8
  apr-util: Upgrade to v1.5.2
  diffutils: Upgrade to v3.3
  usbutils: Upgrade to v007

 .../usbutils/{usbutils_006.bb => usbutils_007.bb}  |    5 +-
 .../busybox/busybox-1.20.2/B921600.patch           |   24 -
 .../busybox-1.20.2/busybox-1.20.2-kernel_ver.patch |   28 -
 .../busybox-mkfs-minix-tests_bigendian.patch       |   34 -
 .../fix-for-spurious-testsuite-failure.patch       |   27 -
 .../busybox/busybox-1.20.2/sys_resource.patch      |   99 --
 .../busybox/busybox-1.20.2/wget_dl_dir_fix.patch   |   30 -
 .../busybox-1.21.0/busybox-1.21.0-mdev.patch       |  647 +++++++
 .../busybox-1.21.0/busybox-1.21.0-platform.patch   |   28 +
 .../busybox/busybox-1.21.0/busybox-1.21.0-xz.patch |   88 +
 .../busybox-appletlib-dependency.patch             |    0
 ...usybox-list-suid-and-non-suid-app-configs.patch |    0
 .../busybox-sulogin-empty-root-password.patch      |    0
 .../busybox-udhcpc-no_deconfig.patch               |    0
 .../{busybox-1.20.2 => busybox-1.21.0}/defconfig   |    0
 .../fail_on_no_media.patch                         |    0
 .../get_header_tar.patch                           |    0
 .../login-utilities.cfg                            |    0
 .../run-parts.in.usr-bin.patch                     |    6 +-
 .../stat-usr-bin.patch                             |    0
 .../strict-atime.patch                             |    0
 ...estsuite-du-du-k-works-fix-false-positive.patch |    0
 .../watch.in.usr-bin.patch                         |    0
 .../{busybox_1.20.2.bb => busybox_1.21.0.bb}       |   20 +-
 .../elfutils/elfutils-0.155/arm_backend.diff       |  450 +++++
 .../elfutils/elfutils-0.155/do-autoreconf.diff     |  215 +++
 .../elfutils/elfutils-0.155/dso-link-change.patch  |   32 +
 .../elfutils/elfutils-0.155/elf_additions.diff     |   61 +
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   |   23 +
 .../elfutils-0.155/elfutils-robustify.patch        | 1756 +++++++++++++++++++
 .../elfutils/elfutils-0.155/hppa_backend.diff      |  796 +++++++++
 .../elfutils/elfutils-0.155/i386_dis.h             | 1657 ++++++++++++++++++
 .../elfutils/elfutils-0.155/m68k_backend.diff      |  303 ++++
 .../elfutils/elfutils-0.155/mempcpy.patch          |   24 +
 .../elfutils/elfutils-0.155/mips_backend.diff      |  708 ++++++++
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch |   27 +
 .../elfutils-0.155/redhat-portability.diff         | 1775 +++++++++++++++++++
 .../elfutils/elfutils-0.155/redhat-robustify.diff  | 1824 ++++++++++++++++++++
 .../elfutils/elfutils-0.155/uclibc-support.patch   |   91 +
 .../elfutils/elfutils-0.155/x86_64_dis.h           | 1632 ++++++++++++++++++
 meta/recipes-devtools/elfutils/elfutils_0.155.bb   |   84 +
 .../diffutils-3.2/obsolete_automake_macros.patch   |   14 -
 .../diffutils/diffutils-3.2/remove-gets.patch      |   22 -
 meta/recipes-extended/diffutils/diffutils.inc      |    2 +-
 .../{diffutils_3.2.bb => diffutils_3.3.bb}         |   10 +-
 meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch |   43 -
 meta/recipes-extended/ed/{ed_1.7.bb => ed_1.8.bb}  |   11 +-
 .../files/debian/add-icmp-return-codes.diff        |   43 -
 .../iputils/files/debian/fix-arping-timeouts.diff  |   26 -
 .../files/debian/fix-dead-host-ping-stats.diff     |   16 -
 .../iputils/files/debian/targets.diff              |   14 +-
 .../iputils/files/debian/use_gethostbyname2.diff   |   36 +-
 .../{iputils_s20101006.bb => iputils_s20121221.bb} |   14 +-
 .../xorg-lib/{libdmx_1.1.2.bb => libdmx_1.1.3.bb}  |    4 +-
 .../rxvt.desktop                                   |    0
 .../rxvt.png                                       |  Bin 2847 -> 2847 bytes
 .../xwc.patch                                      |    0
 .../{rxvt-unicode_9.17.bb => rxvt-unicode_9.18.bb} |    6 +-
 .../apr/{apr-util_1.5.1.bb => apr-util_1.5.2.bb}   |    6 +-
 .../apr/{apr_1.4.6.bb => apr_1.4.8.bb}             |    6 +-
 60 files changed, 12281 insertions(+), 486 deletions(-)
 rename meta/recipes-bsp/usbutils/{usbutils_006.bb => usbutils_007.bb} (83%)
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/B921600.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-1.20.2-kernel_ver.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/busybox-mkfs-minix-tests_bigendian.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/fix-for-spurious-testsuite-failure.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/sys_resource.patch
 delete mode 100644 meta/recipes-core/busybox/busybox-1.20.2/wget_dl_dir_fix.patch
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-mdev.patch
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-platform.patch
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.0/busybox-1.21.0-xz.patch
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-appletlib-dependency.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-list-suid-and-non-suid-app-configs.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-sulogin-empty-root-password.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/busybox-udhcpc-no_deconfig.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/defconfig (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/fail_on_no_media.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/get_header_tar.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/login-utilities.cfg (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/run-parts.in.usr-bin.patch (90%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/stat-usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/strict-atime.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/testsuite-du-du-k-works-fix-false-positive.patch (100%)
 rename meta/recipes-core/busybox/{busybox-1.20.2 => busybox-1.21.0}/watch.in.usr-bin.patch (100%)
 rename meta/recipes-core/busybox/{busybox_1.20.2.bb => busybox_1.21.0.bb} (73%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/arm_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/do-autoreconf.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/dso-link-change.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elf_additions.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-ar-c-fix-num-passed-to-memset.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/elfutils-robustify.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/hppa_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/i386_dis.h
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/m68k_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/mempcpy.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/mips_backend.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/redhat-portability.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/redhat-robustify.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/uclibc-support.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.155/x86_64_dis.h
 create mode 100644 meta/recipes-devtools/elfutils/elfutils_0.155.bb
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-extended/diffutils/diffutils-3.2/remove-gets.patch
 rename meta/recipes-extended/diffutils/{diffutils_3.2.bb => diffutils_3.3.bb} (59%)
 delete mode 100644 meta/recipes-extended/ed/ed-1.7/ed-1.2-build.patch
 rename meta/recipes-extended/ed/{ed_1.7.bb => ed_1.8.bb} (49%)
 delete mode 100644 meta/recipes-extended/iputils/files/debian/add-icmp-return-codes.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-arping-timeouts.diff
 delete mode 100644 meta/recipes-extended/iputils/files/debian/fix-dead-host-ping-stats.diff
 rename meta/recipes-extended/iputils/{iputils_s20101006.bb => iputils_s20121221.bb} (80%)
 rename meta/recipes-graphics/xorg-lib/{libdmx_1.1.2.bb => libdmx_1.1.3.bb} (79%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 => rxvt-unicode-9.18}/rxvt.desktop (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 => rxvt-unicode-9.18}/rxvt.png (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode-9.17 => rxvt-unicode-9.18}/xwc.patch (100%)
 rename meta/recipes-sato/rxvt-unicode/{rxvt-unicode_9.17.bb => rxvt-unicode_9.18.bb} (92%)
 rename meta/recipes-support/apr/{apr-util_1.5.1.bb => apr-util_1.5.2.bb} (91%)
 rename meta/recipes-support/apr/{apr_1.4.6.bb => apr_1.4.8.bb} (92%)

-- 
1.7.9.5


