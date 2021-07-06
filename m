Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by mx.groups.io with SMTP id smtpd.web09.3458.1625560452533338042
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jul 2021 01:34:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.24, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10036"; a="209032600"
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; 
   d="scan'208";a="209032600"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2021 01:34:11 -0700
X-IronPort-AV: E=Sophos;i="5.83,328,1616482800"; 
   d="scan'208";a="644778987"
Received: from sho7-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.151.151])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2021 01:34:09 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/22] pull request (cover letter only)
Date: Tue,  6 Jul 2021 16:34:01 +0800
Message-Id: <cover.1625560314.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please merge these changes in hardknott.

Thanks,

Anuj

The following changes since commit 61feebd88960eb4e074a80a0e45b36a7a1db869c:

  kernel.bbclass: fix do_sizecheck() comparison (2021-06-22 11:19:38 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Alexander Kanavin (2):
  devtool upgrade: rebase override-only patches as well
  libgcrypt: upgrade 1.9.2 -> 1.9.3

Anuj Mittal (1):
  curl: fix build when proxy is not enabled in PACKAGECONFIG

Bruce Ashfield (11):
  linux-yocto/5.10: update to v5.10.42
  linux-yocto/5.10: update to v5.10.43
  linux-yocto/5.10: cgroup1: fix leaked context root causing sporadic
    NULL deref in LTP
  linux-yocto/5.10: update to v5.10.46
  linux-yocto/5.10: features/nft_tables: refresh config options
  linux-yocto/5.4: update to v5.4.128
  linux-yocto/5.10: rcu: Fix stall-warning deadlock due to non-release
    of rcu_node ->lock
  kern-tools: add dropped options to audit output
  kern-tools: Kconfiglib: add support for bare 'modules' keyword
  kernel-devsrc: adjust NM and OBJTOOL variables for target
  lttng-modules: update to v2.12.6

Michael Ho (1):
  sstate.bbclass: fix errors about read-only sstate mirrors

Ming Liu (1):
  uboot-sign.bbclass: fix some install commands

Richard Purdie (4):
  package_pkgdata: Avoid task hash mismatches for generic task changes
  selftest/fetch: Avoid occasional selftest failure from poor temp file
    name choice
  kernel: Fix interaction when packaging disabled
  kernel-devicetree: Fix interaction when packaging disabled

Zqiang (1):
  ifupdown: Skip wrong test item

jbouchard (1):
  Use the label provided when formating a dos partition

 meta/classes/kernel-devicetree.bbclass        |  11 +-
 meta/classes/kernel.bbclass                   |   2 +
 meta/classes/package_pkgdata.bbclass          |   2 +-
 meta/classes/sstate.bbclass                   |   8 +
 meta/classes/uboot-sign.bbclass               |   8 +-
 meta/lib/oeqa/selftest/cases/fetch.py         |  27 +-
 .../0001-ifupdown-skip-wrong-test-case.patch  |  32 ++
 .../ifupdown/files/tweak-ptest-script.patch   |  15 +-
 meta/recipes-core/ifupdown/ifupdown_0.8.36.bb |   1 +
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 meta/recipes-kernel/linux/kernel-devsrc.bb    |   2 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 ...01-Fix-memory-leaks-on-event-destroy.patch |  58 ----
 ...preter-early-exits-on-uninitialized-.patch | 159 ---------
 ...ecord-slab-name-for-kmem_cache_free-.patch |  91 ------
 ...be-null-ptr-deref-on-session-destroy.patch |  41 ---
 ...block-add-a-disk_uevent-helper-v5.12.patch | 305 ------------------
 ...block-add-a-disk_uevent-helper-v5.12.patch |  48 ---
 ...free-event-name-mismatching-with-pro.patch |  71 ----
 ...ules_2.12.5.bb => lttng-modules_2.12.6.bb} |   9 +-
 .../curl/curl/vtls-fix-addsessionid.patch     |  31 ++
 .../curl/curl/vtls-fix-warning.patch          |  40 +++
 meta/recipes-support/curl/curl_7.75.0.bb      |   2 +
 ...{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb} |   4 +-
 scripts/lib/devtool/upgrade.py                |  29 +-
 .../lib/wic/plugins/source/bootimg-pcbios.py  |   6 +-
 31 files changed, 212 insertions(+), 866 deletions(-)
 create mode 100644 meta/recipes-core/ifupdown/files/0001-ifupdown-skip-wrong-test-case.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-memory-leaks-on-event-destroy.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-filter-interpreter-early-exits-on-uninitialized-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-fix-mm-tracing-record-slab-name-for-kmem_cache_free-.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-Fix-kretprobe-null-ptr-deref-on-session-destroy.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0005-fix-block-add-a-disk_uevent-helper-v5.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0006-fix-backport-block-add-a-disk_uevent-helper-v5.12.patch
 delete mode 100644 meta/recipes-kernel/lttng/lttng-modules/0007-fix-mm-tracing-kfree-event-name-mismatching-with-pro.patch
 rename meta/recipes-kernel/lttng/{lttng-modules_2.12.5.bb => lttng-modules_2.12.6.bb} (71%)
 create mode 100644 meta/recipes-support/curl/curl/vtls-fix-addsessionid.patch
 create mode 100644 meta/recipes-support/curl/curl/vtls-fix-warning.patch
 rename meta/recipes-support/libgcrypt/{libgcrypt_1.9.2.bb => libgcrypt_1.9.3.bb} (93%)

-- 
2.31.1

