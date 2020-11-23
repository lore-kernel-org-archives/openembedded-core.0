Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web10.35991.1606144018748201149
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 Nov 2020 07:06:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: pKObAAchznvi2uJLvXXrzxRQtv1LWwUS7M+HmL0m+WXUYgvOFlDo04XsJDhgY8U5hq0/SG/hbc
 vC/CfGj940WQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9813"; a="159547240"
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="159547240"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:06:57 -0800
IronPort-SDR: ErivPP7ieAfIdJDatZ1fF3LHWh8RCvf5OGI9T/n9nD0uT5aqte8k4MZXI/fkfm1wm+3B3SifaH
 /SH4C4Rgz2bw==
X-IronPort-AV: E=Sophos;i="5.78,363,1599548400"; 
   d="scan'208";a="361475068"
Received: from kpteh-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.244.15])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2020 07:06:56 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/21] gatesgarth patch review request
Date: Mon, 23 Nov 2020 23:06:30 +0800
Message-Id: <cover.1606111370.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. These build
cleanly on the autobuilder except for one unrelated failure while
running ltp tests:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1619

Thanks,

Anuj

The following changes since commit 3a4ac9d028e6d7840660bb9640614d92fd89246f:

  diffstat: add nativesdk to BBCLASSEXTEND (2020-11-18 07:57:11 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Alistair (1):
  weston-init: Fix incorrect idle-time setting

Bruce Ashfield (13):
  linux-yocto/5.8: update to v5.8.15
  linux-yocto/5.4: update to v5.4.71
  linux-yocto/5.8: update to v5.8.16
  linux-yocto/5.4: update to v5.4.72
  linux-yocto/5.8: update to v5.8.17
  linux-yocto/5.4: update to v5.4.73
  linux-yocto-dev: move to v5.10-rc
  linux-yocto/5.4: config cleanup / warnings
  linux-yocto/5.8: config cleanup / warnings
  linux-yocto/5.8: update to v5.8.18
  linux-yocto/5.4: update to v5.4.75
  kernel: provide module.lds for out of tree builds in v5.10+
  kernel: relocate copy of module.lds to module compilation task

Chee Yang Lee (1):
  bluez5: update to 5.55

Lee Chee Yang (3):
  libproxy: fix CVE-2020-26154
  python3: fix CVE-2020-27619
  qemu: fix CVE-2020-24352

Loic Domaigne (1):
  roofs_*.bbclass: fix missing vardeps for do_rootfs

Max Krummenacher (1):
  linux-firmware: rdepend on license for all nvidia packages

Wonmin Jung (1):
  kernel: Set proper LD in KERNEL_KCONFIG_COMMAND

 meta/classes/kernel.bbclass                   |  6 +-
 meta/classes/rootfs_deb.bbclass               |  2 +-
 meta/classes/rootfs_ipk.bbclass               |  2 +-
 meta/classes/rootfs_rpm.bbclass               |  2 +-
 .../bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} |  4 +-
 .../python/python3/CVE-2020-27619.patch       | 71 ++++++++++++++
 meta/recipes-devtools/python/python3_3.8.5.bb |  1 +
 meta/recipes-devtools/qemu/qemu.inc           |  1 +
 .../qemu/qemu/CVE-2020-24352.patch            | 52 ++++++++++
 meta/recipes-graphics/wayland/weston-init.bb  |  2 +-
 .../linux-firmware/linux-firmware_20200817.bb |  1 +
 meta/recipes-kernel/linux/kernel-devsrc.bb    |  6 ++
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  6 +-
 .../linux/linux-yocto-rt_5.8.bb               |  6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +-
 .../linux/linux-yocto-tiny_5.8.bb             |  8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 ++---
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  | 22 ++---
 .../libproxy/libproxy/CVE-2020-26154.patch    | 98 +++++++++++++++++++
 .../libproxy/libproxy_0.4.15.bb               |  1 +
 21 files changed, 279 insertions(+), 44 deletions(-)
 rename meta/recipes-connectivity/bluez5/{bluez5_5.54.bb => bluez5_5.55.bb} (91%)
 create mode 100644 meta/recipes-devtools/python/python3/CVE-2020-27619.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-24352.patch
 create mode 100644 meta/recipes-support/libproxy/libproxy/CVE-2020-26154.patch

-- 
2.28.0

