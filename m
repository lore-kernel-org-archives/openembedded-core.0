Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web09.29749.1607916926828189768
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Dec 2020 19:35:26 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: 6FlFeH6OtIb8wMH6IsaE0HEI2zVC6KwK680VckYzPZ8W07B+kkXEyfLDZtuRtYU3Uv6h8XDHn7
 nME5hHMQ5Eng==
X-IronPort-AV: E=McAfee;i="6000,8403,9834"; a="238752349"
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="238752349"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:22 -0800
IronPort-SDR: 2mUu1RDhMsD+RuLJNcFXYhgcQ1tyfIxrC0EwRsbdNPMe1JUVxGYmjcE/q8c12RkVV3bigaZZ2d
 H9+dUq+vN6Hw==
X-IronPort-AV: E=Sophos;i="5.78,417,1599548400"; 
   d="scan'208";a="447670737"
Received: from gohpeibo-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.173.90])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2020 19:35:20 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/19] patch review request
Date: Mon, 14 Dec 2020 11:34:57 +0800
Message-Id: <cover.1607916826.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. Builds cleanly
on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1672

Thanks,

Anuj

The following changes since commit d11ab9cb77bf91f939035417b757773a5d80242c:

  build-appliance-image: Update to gatesgarth head revision (2020-12-07 16:25:27 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Alexander Kanavin (3):
  meta/lib/oe/reproducible.py: gitsm:// works just as fine as git:// for
    timestamps
  llvm: fix reproducibility
  webkitgtk: fix reproducibility

Chandana kalluri (1):
  populate_sdk_ext: use SDK_CUSTOM_TEPLATECONF variable to enable custom
    templateconf.cfg

Changqing Li (1):
  buildtools-tarball: add wic dependency into extended buildtools

Gratian Crisan (1):
  kernel-module-split.bbclass: fix kernel modules getting marked as
    CONFFILES

Kai Kang (1):
  sudo: fix multilib conflict

Li Wang (2):
  qemu: CVE-2020-29129 CVE-2020-29130
  qemu: CVE-2020-25624

Mark Jonas (1):
  libsdl2: Add directfb to PACKAGECONFIG rdepends

Richard Purdie (2):
  lz4: Use the new branch naming from upstream
  uninative: Don't use single sstate for pseudo-native

Ross Burton (5):
  cve-update-db-native: handle all-wildcard versions
  oeqa/devtool: use Yocto mirror for pv-1.5.3 tarball
  image_types: sort tarball file listings
  image_types: remove obsolete tar comment
  coreutils: add SUSE-specific issues to CVE whitelist

sangeeta jain (1):
  meta/lib/oeqa/manual/oe-core.json: Update test_bitbake_devshell

zangrc (1):
  wireless-regdb: upgrade 2020.04.29 -> 2020.11.20

 meta/classes/base.bbclass                     |   1 +
 meta/classes/image_types.bbclass              |  12 +--
 meta/classes/kernel-module-split.bbclass      |   5 +-
 meta/classes/populate_sdk_ext.bbclass         |   6 +-
 meta/classes/sstate.bbclass                   |   4 +
 meta/lib/oe/reproducible.py                   |   2 +-
 meta/lib/oe/sstatesig.py                      |   2 +-
 meta/lib/oeqa/manual/oe-core.json             |   2 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   2 +-
 meta/recipes-core/coreutils/coreutils_8.32.bb |   3 +
 .../meta/buildtools-extended-tarball.bb       |   3 +
 .../recipes-core/meta/cve-update-db-native.bb |   7 +-
 meta/recipes-devtools/llvm/llvm_git.bb        |   5 +
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2020-25624.patch            | 101 ++++++++++++++++++
 .../qemu/CVE-2020-29129-CVE-2020-29130.patch  |  64 +++++++++++
 ...o.conf.in-fix-conflict-with-multilib.patch |  52 +++++++++
 meta/recipes-extended/sudo/sudo_1.9.3.bb      |   6 +-
 .../libsdl2/libsdl2_2.0.12.bb                 |   2 +-
 ....04.29.bb => wireless-regdb_2020.11.20.bb} |   2 +-
 meta/recipes-sato/webkit/webkitgtk_2.28.4.bb  |  12 +++
 meta/recipes-support/lz4/lz4_1.9.2.bb         |   2 +-
 22 files changed, 274 insertions(+), 23 deletions(-)
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25624.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29129-CVE-2020-29130.patch
 create mode 100644 meta/recipes-extended/sudo/files/0001-sudo.conf.in-fix-conflict-with-multilib.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.04.29.bb => wireless-regdb_2020.11.20.bb} (94%)

-- 
2.29.2

