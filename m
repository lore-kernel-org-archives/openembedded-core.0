Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web10.32239.1630998134073784612
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Sep 2021 00:02:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10099"; a="207344433"
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="207344433"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:12 -0700
X-IronPort-AV: E=Sophos;i="5.85,274,1624345200"; 
   d="scan'208";a="537804465"
Received: from tengjieg-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.137.164])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2021 00:02:11 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/11] Patch review request
Date: Tue,  7 Sep 2021 15:01:56 +0800
Message-Id: <cover.1630997270.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. Builds cleanly on autobuilder
except for an intermittent failure.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2550

Thanks,

Anuj

The following changes since commit e3a7eaf9fe1420b2525e14f0c0f2936e7818b8a3:

  build-appliance-image: Update to hardknott head revision (2021-09-01 16:28:21 +0100)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

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

