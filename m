Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A20CC4332F
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 05:10:36 +0000 (UTC)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web09.24368.1643260217446113039
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Jan 2022 21:10:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=GTVNncU5;
 spf=pass (domain: intel.com, ip: 192.55.52.120,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1643260234; x=1674796234;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=E7V/Sndna0MYAdqGK0UoClb5Z5BUzPKGR1aKMPxxfMI=;
  b=GTVNncU5WvV6kriitYIZ9W2oU9R4FR+KDSxLyuwgJNsMJrIq+GVQonX7
   UemhKXUnzGiCvVW/g4jKWtWJZbaKimUIl/lvgusu2P/vYPHMQ8cvmcRa+
   lLXSYbdMG4duT+3T0XI84CSe8cnjUW/wewGJ5Ppy2vZHT61AFqcn7caCr
   P9oZaasNaFdHBTA2+K7XGVpA8KS215h5x1St5wVgPfU6SCzIcaOsYUU7U
   L5LQ46tySoZsSGhzqqurk239dqTdysQHhHTQ7o49U9Cj8mvNA2b7duUpC
   X3If2j7P9phJ1+lreEUFpdoB2rHUV7XX+8goLmPHhH5cS7E2j18gRNwP8
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="245590352"
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="245590352"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:34 -0800
X-IronPort-AV: E=Sophos;i="5.88,320,1635231600";
   d="scan'208";a="618209043"
Received: from huiyinkx-mobl.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.213.134.201])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 21:10:33 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 10/17] linux-yocto/5.4: update to v5.4.170
Date: Thu, 27 Jan 2022 13:10:03 +0800
Message-Id: 
 <54caac16943df5bb6ae11c138ab93548b357e741.1643259953.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643259953.git.anuj.mittal@intel.com>
References: <cover.1643259953.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 27 Jan 2022 05:10:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161013

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

047dedaa38ce Linux 5.4.170
2c3920c58e03 perf script: Fix CPU filtering of a script's switch events
fe5838c22b98 net: fix use-after-free in tw_timer_handler
46556c4ecd63 Input: spaceball - fix parsing of movement data packets
975774ea7528 Input: appletouch - initialize work before device registration
436f6d0005d6 scsi: vmw_pvscsi: Set residual data length conditionally
103b16a8c51f binder: fix async_free_space accounting for empty parcels
98cde4dd5ec8 usb: mtu3: set interval of FS intr and isoc endpoint
585e2b244dda usb: mtu3: fix list_head check warning
50434eb6098f usb: mtu3: add memory barrier before set GPD's HWO
240fc586e83d usb: gadget: f_fs: Clear ffs_eventfd in ffs_data_clear.
20d80640fa61 xhci: Fresco FL1100 controller should not have BROKEN_MSI quirk set.
b364fcef9615 uapi: fix linux/nfc.h userspace compilation errors
245c5e43cd25 nfc: uapi: use kernel size_t to fix user-space builds
9e4a3f47eff4 i2c: validate user data in compat ioctl
a7d3a1c6d9d9 fsl/fman: Fix missing put_device() call in fman_port_probe
2dc95e936414 net/ncsi: check for error return from call to nla_put_u32
ef01d63140f5 selftests/net: udpgso_bench_tx: fix dst ip argument
20f6896787c5 net/mlx5e: Fix wrong features assignment in case of error
b85f87d30dba ionic: Initialize the 'lif->dbid_inuse' bitmap
1cd4063dbc91 NFC: st21nfca: Fix memory leak in device probe and remove
44cd64aa1c43 net: lantiq_xrx200: fix statistics of received bytes
3477f4b67ee4 net: usb: pegasus: Do not drop long Ethernet frames
831de271452b sctp: use call_rcu to free endpoint
3218d6bd6195 selftests: Calculate udpgso segment count without header adjustment
0a2e9f6a8f33 udp: using datalen to cap ipv6 udp max gso segments
db484d35a948 net/mlx5: DR, Fix NULL vs IS_ERR checking in dr_domain_init_resources
cc926b8f4d39 scsi: lpfc: Terminate string in lpfc_debugfs_nvmeio_trc_write()
44937652afdb selinux: initialize proto variable in selinux_ip_postroute_compat()
b536e357e73c recordmcount.pl: fix typo in s390 mcount regex
8d86b486e0de memblock: fix memblock_phys_alloc() section mismatch error
4606bfdaeb16 platform/x86: apple-gmux: use resource_size() with res
930d4986a432 tomoyo: Check exceeded quota early in tomoyo_domain_quota_is_ok().
7978ddae240b Input: i8042 - enable deferred probe quirk for ASUS UM325UA
f93d5dca7d84 Input: i8042 - add deferred probe support
940e68e57ab6 tee: handle lookup of shm with reference count 0
4b38b12092b4 HID: asus: Add depends on USB_HID to HID_ASUS Kconfig option

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 4954988f80..c5fa8b2380 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "66f69e8b3cc56e22c8b78f3141fd736fc1c5859b"
-SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
+SRCREV_machine ?= "693f365a839705814228d4d7a9fb362285af3542"
+SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.169"
+LINUX_VERSION ?= "5.4.170"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 60f13669e1..c5e6e16357 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.169"
+LINUX_VERSION ?= "5.4.170"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "092520553603d101c48aafd95aac45f5f455882a"
-SRCREV_machine ?= "d44538a3be2f25dc1c768d0ed31d18af18cc2aee"
-SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
+SRCREV_machine_qemuarm ?= "f0f037abc011fc633c51f9557471babb368668f3"
+SRCREV_machine ?= "0c76d34c0744a8f3d8b4a41860fc9f12624b082a"
+SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index ceb1952382..a09b29ce99 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "69471f4c5c895fe6ccef696800c7ef2bda3ad2fd"
-SRCREV_machine_qemuarm64 ?= "e0b9164ac4b0d53e7bd42bf1d2322eb5ce462d68"
-SRCREV_machine_qemumips ?= "7bf5ddb8e9ae1284cb4e02bed7f9429bec0b39c4"
-SRCREV_machine_qemuppc ?= "b0054e5e7451561a7c6a6d6a401395fbd0395801"
-SRCREV_machine_qemuriscv64 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_machine_qemux86 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_machine_qemux86-64 ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_machine_qemumips64 ?= "e8483ea124a1715790eba584ee2ad8aac1e15edf"
-SRCREV_machine ?= "01fe83c50f9aeb4da7c7c7d63a6c7afea83216ef"
-SRCREV_meta ?= "dcbd44e70b6bc80a04cc92b625b1a3eaa2f78fc0"
+SRCREV_machine_qemuarm ?= "2ee0677973f1c676d52c6864c0a227b8d0a91a3d"
+SRCREV_machine_qemuarm64 ?= "205b919a1a53a5c46ff432cfc7292cbf688f34ce"
+SRCREV_machine_qemumips ?= "ff59072d3f2b8189e65f1006357d003ef68ec03b"
+SRCREV_machine_qemuppc ?= "bd68bc38761902dea6a823853f6044f6688751ca"
+SRCREV_machine_qemuriscv64 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_machine_qemux86 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_machine_qemux86-64 ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_machine_qemumips64 ?= "8aa05337ebd7798187b81f2561de15f2074a5eca"
+SRCREV_machine ?= "d4f5a7cecc479dcfff63bd7e92507521956fb8b8"
+SRCREV_meta ?= "3ff7377107711b2670620aac2be36b3edefe7f37"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.169"
+LINUX_VERSION ?= "5.4.170"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


