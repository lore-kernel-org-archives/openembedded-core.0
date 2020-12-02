Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.692.1606871435470691931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 01 Dec 2020 17:10:35 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: GKJ4pnI6v177S0LBYRS+lr4eEV/T/iXMya1avo/E2z8HGnnKplVPeWPJ16taBW1bc3iTlI7dtl
 Zy9DqANaOv8Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9822"; a="170369245"
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="170369245"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:10:31 -0800
IronPort-SDR: 5Ncheia8cgholHpooLXY/YFQ/ljo4p4473U5ZUWwSIZF155MxFIxAzX1LMBZfvFiUIELRArfJX
 3EoB/Q6k1Faw==
X-IronPort-AV: E=Sophos;i="5.78,385,1599548400"; 
   d="scan'208";a="549814887"
Received: from kshekara-mobl2.amr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.112.62])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2020 17:10:28 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/21] pull request (cover letter only)
Date: Wed,  2 Dec 2020 09:10:21 +0800
Message-Id: <cover.1606871252.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit 12bee66a42a7c2a38789ddb37cb098bcbf0b3841:

  qemu: fix CVE-2020-24352 (2020-11-20 23:02:39 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

Alexander Kanavin (1):
  lttng-modules: update 2.12.2 -> 2.12.3

Anuj Mittal (2):
  glib-2.0: RDEPEND on dbusmock only when GI_DATA_ENABLED is True
  distutils-common-base: fix LINKSHARED expansion

Bruce Ashfield (4):
  linux-yocto/5.4: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
    arches with 64bit time_t
  linux-yocto/5.8: perf: Alias SYS_futex with SYS_futex_time64 on 32-bit
    arches with 64bit time_t
  linux-yocto/5.8: ext4/tipc warning fixups
  linux-yocto/5.4: update to v5.4.78

Fedor Ross (2):
  sysvinit: remove bashism to be compatible with dash
  eudev: remove bashism to be compatible with dash

He Zhe (1):
  lttng-modules: Backport a patch to fix btrfs build failure

INC@Cisco) (1):
  kernel-devsrc: improve reproducibility for arm64

Khem Raj (1):
  binutils: Fix linker errors on chromium/ffmpeg on aarch64

Richard Purdie (2):
  fs-perms: Ensure /usr/src/debug/ file modes are correct
  e2fsprogs: Fix a ptest permissions determinism issue

Ross Burton (5):
  cve-check: show real PN/PV
  python3: add CVE-2007-4559 to whitelist
  sqlite3: add CVE-2015-3717 to whitelist
  gstreamer1.0-rtsp-server: set CVE_PRODUCT
  gstreamer1.0-plugins-base: set CVE_PRODUCT

Stacy Gaikovaia (1):
  valgrind: helgrind: Intercept libc functions

Vyacheslav Yurkov (1):
  license_image.bbclass: use canonical name for license files

 meta/classes/cve-check.bbclass                |   9 +-
 meta/classes/distutils-common-base.bbclass    |   2 +-
 meta/classes/license_image.bbclass            |   3 +-
 meta/classes/package.bbclass                  |   2 +-
 meta/conf/abi_version.conf                    |   2 +-
 meta/files/fs-perms-persistent-log.txt        |   2 +-
 meta/files/fs-perms.txt                       |   2 +-
 meta/recipes-core/glib-2.0/glib.inc           |   2 +-
 meta/recipes-core/sysvinit/sysvinit/rc        |   2 +-
 meta/recipes-core/udev/eudev/init             |   2 +-
 .../binutils/binutils-2.35.inc                |   1 +
 ...n-error-on-conditional-branch-to-an-.patch | 135 +++
 .../e2fsprogs/e2fsprogs_1.45.6.bb             |   2 +
 meta/recipes-devtools/python/python3_3.8.5.bb |   2 +
 ...01-helgrind-Intercept-libc-functions.patch |  54 ++
 .../valgrind/valgrind_3.16.1.bb               |   1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   4 +
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-rt_5.8.bb               |   2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 .../linux/linux-yocto-tiny_5.8.bb             |   4 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  18 +-
 ...ndency-issue-when-building-in-tree-w.patch |  54 --
 ...oints-output-proper-root-owner-for-t.patch | 318 ++++++
 ...ce.h-into-the-mmu-sub-directory-v5.9.patch |  41 -
 ...Make-kvm_mmu_page-definition-and-acc.patch |  39 -
 ...he-length-of-per-inode-prealloc-list.patch |  84 --
 ...e-via-a-block-bitmap-read-is-prefetc.patch |  63 --
 ...al-of-smp_-read_barrier_depends-v5.9.patch | 391 --------
 ...teback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch |  59 --
 ...x-sync-livelock-due-to-b_dirty_time-.patch | 117 ---
 ...es-for-ext4_discard_preallocations-a.patch |  52 -
 .../0010-Fix-system-call-filter-table.patch   | 918 ------------------
 ...ules_2.12.2.bb => lttng-modules_2.12.3.bb} |  13 +-
 .../gstreamer1.0-plugins-base_1.16.3.bb       |   2 +
 .../gstreamer1.0-rtsp-server_1.16.3.bb        |   2 +
 meta/recipes-support/sqlite/sqlite3_3.33.0.bb |   2 +
 38 files changed, 571 insertions(+), 1871 deletions(-)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-aarch64-Return-an-error-on-conditional-branch-to-an-.patch
 create mode 100644 meta/recipes-devtools/valgrind/valgrind/0001-helgrind-Intercept-libc-functions.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Kconfig-fix-dependency-issue-when-building-in-tree-w.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-fix-btrfs-tracepoints-output-proper-root-owner-for-t.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-fix-Move-mmutrace.h-into-the-mmu-sub-directory-v5.9.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-KVM-x86-mmu-Make-kvm_mmu_page-definition-and-acc.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-fix-ext4-limit-the-length-of-per-inode-prealloc-list.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-ext4-indicate-via-a-block-bitmap-read-is-prefetc.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-removal-of-smp_-read_barrier_depends-v5.9.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-writeback-Drop-I_DIRTY_TIME_EXPIRE-v5.9.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0008-fix-writeback-Fix-sync-livelock-due-to-b_dirty_time-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0009-fix-version-ranges-for-ext4_discard_preallocations-a.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0010-Fix-system-call-filter-table.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.2.bb => lttng-modules_2.12.3.bb} (64%)

-- 
2.28.0

