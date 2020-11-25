Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.1174.1606269664707433960
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 18:01:05 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: O1FbvxkixfilybNOUm3iTY3CR81UTr4gaRVvVIWZoIl/g9fwwxDQn/LwagyIH61CuKxJvDjMpv
 47j3GhODheUw==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="151307073"
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; 
   d="scan'208";a="151307073"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 18:01:03 -0800
IronPort-SDR: Yk1Xl92rbPOwT1eAZ9ixoacfrXRU+XAxKa2Qc7uuxCNpOxoELRttSXV0u/JTgEbXUzicozTRNs
 rFB9ZDf4ngrw==
X-IronPort-AV: E=Sophos;i="5.78,367,1599548400"; 
   d="scan'208";a="547084546"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.44.73])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 18:01:01 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/21] pull request (cover letter only)
Date: Wed, 25 Nov 2020 10:00:54 +0800
Message-Id: <cover.1606268535.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please merge these changes in gatesgarth.

Thanks,

Anuj

The following changes since commit 3a4ac9d028e6d7840660bb9640614d92fd89246f:

  diffstat: add nativesdk to BBCLASSEXTEND (2020-11-18 07:57:11 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/gatesgarth-next

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

