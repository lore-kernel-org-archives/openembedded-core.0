Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web11.3706.1610079500392423505
 for <openembedded-core@lists.openembedded.org>;
 Thu, 07 Jan 2021 20:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: RbznXLjPQPu3slzsGVlhThKYdh6kSfD/5gf6goSPZAXj8/Jb80IqhM+DfAjZdFi4CMrU7yY/c6
 17nUFE8cAjdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9857"; a="164613617"
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="164613617"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:18 -0800
IronPort-SDR: RfzRtsrbx61yCMGg7lT4e0oE8FD2rc6uJhMtrCPkLgiDKcrAVJLYWMTAoQZQrTQUPqu4JuQEha
 jokagP1S3HlQ==
X-IronPort-AV: E=Sophos;i="5.79,330,1602572400"; 
   d="scan'208";a="362209333"
Received: from nshamsan-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.135.192])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2021 20:18:17 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/30] patch review request
Date: Fri,  8 Jan 2021 12:17:42 +0800
Message-Id: <cover.1610079278.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for gatesgarth. Builds cleanly on
autobuilder.

Thanks,

Anuj

The following changes since commit a2eebe92daf0e0fb11422ea17f7029aeab2bcb9e:

  apr-util: Only specify --with-dbm=gdbm if gdbm support is enabled (2020-12-28 09:53:26 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Alexander Kanavin (1):
  devtool: gitsm:// should be handled same as git:// in upgrades

Bruce Ashfield (8):
  linux-yocto/cfg: qemuppc: set CONFIG_SCSI to '=y'
  linux-yocto/5.4: update to v5.4.82
  linux-yocto/cfg: qemuarm64-gfx.cfg: add CONFIG_INPUT_UINPUT
  linux-yocto/5.4: update to v5.4.83
  linux-yocto/5.8/cfg: fix -tiny warnings
  linux-yocto/5.4/cfg: fix -tiny warnings
  linux-yocto/5.4/cfg: fix FIRMWARE_LOADER warnings
  linux-yocto/5.4: update to v5.4.85

Changqing Li (1):
  libexif: fix CVE-2020-0198; CVE-2020-0452

Khem Raj (1):
  initscripts: use quotes for shell variable comparision

Lee Chee Yang (2):
  glib-2.0: fix CVE-2020-35457
  wic/direct/kparser: ensure fsuuid for vfat and msdos align with format

Li Wang (2):
  qemu: CVE-2020-25723
  qemu: CVE-2020-28916

Nathan Rossi (1):
  coreutils: enable xattrs by default for nativesdk

Ovidiu Panait (2):
  timezone: upgrade to 2020e
  timezone: upgrade to 2020f

Paul Barker (1):
  bitbake.conf: Prevent pyc file generation in pseudo context

Peter Kjellerstedt (3):
  lib/oe/path: Add canonicalize()
  bitbake.conf: Canonicalize paths in PSEUDO_IGNORE_PATHS
  wic: Pass canonicalized paths in PSEUDO_IGNORE_PATHS

Richard Purdie (3):
  grub: Further reproducibility fix
  man-db: Fix reproducibility issue
  oeqa/commands: Ensure sync can be found regardless of PATH

Robert Joslyn (1):
  openssl: Update to 1.1.1i

Ross Burton (1):
  diffstat: point the license checksum at the license

Scott Murray (2):
  grub: fix "CVE:" line in one of the patches
  patch: fix CVE-2019-20633

Steve Sakoman (1):
  oeqa/selftest/cases/devtool.py: fix typo in ignore_patterns call

 meta-selftest/lib/pseudo_pyc_test1.py         |  1 +
 meta-selftest/lib/pseudo_pyc_test2.py         |  1 +
 .../pseudo-pyc-test/pseudo-pyc-test.bb        | 15 +++++
 meta/conf/bitbake.conf                        |  6 +-
 meta/lib/oe/path.py                           | 21 ++++++
 meta/lib/oeqa/selftest/cases/devtool.py       |  2 +-
 meta/lib/oeqa/selftest/cases/pseudo.py        | 27 ++++++++
 meta/lib/oeqa/utils/commands.py               |  3 +
 ...low-checking-primitives-where-we-do-.patch |  2 +-
 meta/recipes-bsp/grub/files/determinism.patch | 16 +++++
 .../{openssl_1.1.1g.bb => openssl_1.1.1i.bb}  |  2 +-
 meta/recipes-core/coreutils/coreutils_8.32.bb |  3 +
 .../glib-2.0/glib-2.0/CVE-2020-35457.patch    | 41 ++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.64.5.bb |  1 +
 .../initscripts/initscripts-1.0/checkroot.sh  |  2 +-
 .../diffstat/diffstat_1.63.bb                 |  4 +-
 .../patch/patch/CVE-2019-20633.patch          | 31 +++++++++
 meta/recipes-devtools/patch/patch_2.7.6.bb    |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  2 +
 .../qemu/qemu/CVE-2020-25723.patch            | 51 ++++++++++++++
 .../qemu/qemu/CVE-2020-28916.patch            | 49 ++++++++++++++
 meta/recipes-extended/man-db/man-db_2.9.3.bb  |  1 +
 meta/recipes-extended/timezone/timezone.inc   |  6 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-rt_5.8.bb               |  2 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +--
 .../linux/linux-yocto-tiny_5.8.bb             |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++----
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  2 +-
 .../libexif/files/CVE-2020-0198.patch         | 66 +++++++++++++++++++
 .../libexif/files/CVE-2020-0452.patch         | 39 +++++++++++
 .../recipes-support/libexif/libexif_0.6.22.bb |  2 +
 scripts/lib/devtool/upgrade.py                |  4 +-
 scripts/lib/wic/ksparser.py                   | 17 +++++
 scripts/lib/wic/partition.py                  | 12 +++-
 scripts/lib/wic/plugins/imager/direct.py      |  7 ++
 36 files changed, 440 insertions(+), 37 deletions(-)
 create mode 100644 meta-selftest/lib/pseudo_pyc_test1.py
 create mode 100644 meta-selftest/lib/pseudo_pyc_test2.py
 create mode 100644 meta-selftest/recipes-test/pseudo-pyc-test/pseudo-pyc-test.bb
 create mode 100644 meta/lib/oeqa/selftest/cases/pseudo.py
 rename meta/recipes-connectivity/openssl/{openssl_1.1.1g.bb => openssl_1.1.1i.bb} (98%)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/CVE-2020-35457.patch
 create mode 100644 meta/recipes-devtools/patch/patch/CVE-2019-20633.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-25723.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-28916.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0198.patch
 create mode 100644 meta/recipes-support/libexif/files/CVE-2020-0452.patch

-- 
2.29.2

