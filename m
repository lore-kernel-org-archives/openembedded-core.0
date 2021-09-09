Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by mx.groups.io with SMTP id smtpd.web08.1640.1631150364361540949
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Sep 2021 18:19:24 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.31, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10101"; a="281659546"
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="281659546"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2021 18:19:23 -0700
X-IronPort-AV: E=Sophos;i="5.85,279,1624345200"; 
   d="scan'208";a="648694735"
Received: from mshovon-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.138.179])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2021 18:19:22 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/11] Pull request (cover letter only)
Date: Thu,  9 Sep 2021 09:19:18 +0800
Message-Id: <cover.1631150280.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes.

Thanks,

Anuj

The following changes since commit e3a7eaf9fe1420b2525e14f0c0f2936e7818b8a3:

  build-appliance-image: Update to hardknott head revision (2021-09-01 16:28:21 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/hardknott-next

Andrej Valek (1):
  vim: add option to disable NLS support

Armin Kuster (1):
  lz4: Security Fix for CVE-2021-3520

Bruce Ashfield (3):
  linux-yocto/5.10: update to v5.10.59
  linux-yocto/5.10: update to v5.10.60
  parselogs.py: ignore intermittent CD/DVDROM identification failure

Paul Barker (1):
  kernel-yocto: Simplify no git repo case in do_kernel_checkout

Richard Purdie (3):
  sdk: Decouple default install path from built in path
  oeqa/runtime/parselogs: Make DVD ata error apply to all qemux86
    machines
  xdg-utils: Add fix for CVE-2020-27748

Ross Burton (1):
  cpio: backport fix for CVE-2021-38185

Trevor Gamblin (1):
  bluez5: fix CVE-2021-3658

 meta/classes/kernel-yocto.bbclass             |  30 +-
 meta/classes/populate_sdk_base.bbclass        |   1 +
 meta/conf/bitbake.conf                        |   4 +-
 meta/files/toolchain-shar-extract.sh          |   3 +-
 meta/files/toolchain-shar-relocate.sh         |   2 +-
 meta/lib/oeqa/runtime/cases/parselogs.py      |   1 +
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...ter-Fix-storing-discoverable-setting.patch | 100 +++
 .../cpio/cpio-2.13/CVE-2021-38185.patch       | 581 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 ...9813e0eb0246f63b54e9e154970e609575af.patch |  58 ++
 .../xdg-utils/xdg-utils_1.1.3.bb              |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 .../lz4/files/CVE-2021-3520.patch             |  27 +
 meta/recipes-support/lz4/lz4_1.9.3.bb         |   1 +
 meta/recipes-support/vim/vim.inc              |   4 +-
 18 files changed, 815 insertions(+), 38 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-adapter-Fix-storing-discoverable-setting.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils/1f199813e0eb0246f63b54e9e154970e609575af.patch
 create mode 100644 meta/recipes-support/lz4/files/CVE-2021-3520.patch

-- 
2.31.1

