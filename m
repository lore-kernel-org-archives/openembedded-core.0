Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A2EDC433F5
	for <webhook@archiver.kernel.org>; Wed,  1 Dec 2021 07:16:26 +0000 (UTC)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by mx.groups.io with SMTP id smtpd.web11.88428.1638342984806416470
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Nov 2021 23:16:25 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.65, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="236344594"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="236344594"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:24 -0800
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800";
   d="scan'208";a="459918797"
Received: from mwong12-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com)
 ([10.213.129.81])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:16:23 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 03/14] linux-yocto/5.4: update to v5.4.156
Date: Wed,  1 Dec 2021 15:16:03 +0800
Message-Id: 
 <19aa6fe989fcf82439babf3c698812657c263f9d.1638342222.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1638342222.git.anuj.mittal@intel.com>
References: <cover.1638342222.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Dec 2021 07:16:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159005

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    89b6869b942b Linux 5.4.156
    7cdcaa7c765b pinctrl: stm32: use valid pin identifier in stm32_pinctrl_resume()
    a9c4e246f7c3 ARM: 9122/1: select HAVE_FUTEX_CMPXCHG
    a98c81ab1751 tracing: Have all levels of checks prevent recursion
    b0feaa8376f5 net: mdiobus: Fix memory leak in __mdiobus_register
    0ab35e707462 scsi: core: Fix shost->cmd_per_lun calculation in scsi_add_host_with_dma()
    9068beaa049a Input: snvs_pwrkey - add clk handling
    8de335e8199f ALSA: hda: avoid write to STATESTS if controller is in reset
    570bc60dcd00 platform/x86: intel_scu_ipc: Update timeout value in comment
    4054b869dc26 isdn: mISDN: Fix sleeping function called from invalid context
    5001160d3ed5 ARM: dts: spear3xx: Fix gmac node
    e9d9ffa19367 net: stmmac: add support for dwmac 3.40a
    044fa2afd676 btrfs: deal with errors when checking if a dir entry exists during log replay
    d49a293b946d gcc-plugins/structleak: add makefile var for disabling structleak
    e8ef9984418f selftests: netfilter: remove stray bash debug line
    b7fdebde2c9b netfilter: Kconfig: use 'default y' instead of 'm' for bool config option
    285e9210b1fa isdn: cpai: check ctr->cnr to avoid array index out of bound
    1f75f8883b4f nfc: nci: fix the UAF of rf_conn_info object
    4f5d1c29cfab mm, slub: fix potential memoryleak in kmem_cache_open()
    a1ec195a1943 mm, slub: fix mismatch between reconstructed freelist depth and cnt
    8e25a62e8dab powerpc/idle: Don't corrupt back chain when going idle
    d0148cfaf89c KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest
    80bbb0bc3a02 KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()
    722e6f6ac818 powerpc64/idle: Fix SP offsets when saving GPRs
    d6f451f1f60c audit: fix possible null-pointer dereference in audit_filter_rules
    c974f2f92c31 ASoC: DAPM: Fix missing kctl change notifications
    5307a77b7149 ALSA: hda/realtek: Add quirk for Clevo PC50HS
    50fc52e5ca59 ALSA: usb-audio: Provide quirk for Sennheiser GSP670 Headset
    0f218ba4c8aa vfs: check fd has read access in kernel_read_file_from_fd()
    f439d2bcb679 elfcore: correct reference to CONFIG_UML
    d3a83576378b ocfs2: mount fails with buffer overflow in strlen
    b05caf023b14 ocfs2: fix data corruption after conversion from inline format
    bce53fbee948 ceph: fix handling of "meta" errors
    151c72bba129 can: j1939: j1939_xtp_rx_rts_session_new(): abort TP less than 9 bytes
    0ddf781882ac can: j1939: j1939_xtp_rx_dat_one(): cancel session if receive TP.DT with error length
    a0e47d2833b4 can: j1939: j1939_netdev_start(): fix UAF for rx_kref of j1939_priv
    7e66cfed66f9 can: j1939: j1939_tp_rxtimer(): fix errant alert in j1939_tp_rxtimer
    1248582e47a9 can: peak_pci: peak_pci_remove(): fix UAF
    ea82c2463e22 can: peak_usb: pcan_usb_fd_decode_status(): fix back to ERROR_ACTIVE state notification
    c26dcd1cb8db can: rcar_can: fix suspend/resume
    8c5585eae3ae net: enetc: fix ethtool counter name for PM0_TERR
    c0b0baade9b8 net: stmmac: Fix E2E delay mechanism
    c4b64011e458 net: hns3: disable sriov before unload hclge layer
    472acf1582fd net: hns3: add limit ets dwrr bandwidth cannot be 0
    b1f9380ee230 net: hns3: reset DWRR of unused tc to zero
    12bdcbc04341 NIOS2: irqflags: rename a redefined register name
    599766696f69 net: dsa: lantiq_gswip: fix register definition
    f49ce82f9b7c lan78xx: select CRC32
    83094f8c44cb netfilter: ipvs: make global sysctl readonly in non-init netns
    ce70ee94dde6 ASoC: wm8960: Fix clock configuration on slave mode
    0f5b08ca22e1 dma-debug: fix sg checks in debug_dma_map_sg()
    50aefa9acc91 NFSD: Keep existing listeners on portlist error
    4a5bf3e729d9 xtensa: xtfpga: Try software restart before simulating CPU reset
    31137288b946 xtensa: xtfpga: use CONFIG_USE_OF instead of CONFIG_OF
    d946a39bad58 ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default
    e7c4819c0b67 tee: optee: Fix missing devices unregister during optee_remove
    b1e9b4e0f656 net: switchdev: do not propagate bridge updates across bridges
    2d22cd048289 parisc: math-emu: Fix fall-through warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index f092b28bc5..72facfd4e9 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "b02e867b0f32d3a2a6f74a4ce0622da02fc2f64d"
-SRCREV_meta ?= "6d740b62bd24b1d77ccd287e25e2cbb09ea98e11"
+SRCREV_machine ?= "9ad54377b929c3646bc8c76b1087810948425fda"
+SRCREV_meta ?= "2f0c77d118926b6666062a752a8c9d9a7c07320d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.155"
+LINUX_VERSION ?= "5.4.156"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 3df9c478df..907fc31211 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.155"
+LINUX_VERSION ?= "5.4.156"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "43bbfba52ea9da370694e070fc0a9dfac656075c"
-SRCREV_machine ?= "34ea81635909c42198e86298c0d4544a3e3530c2"
-SRCREV_meta ?= "6d740b62bd24b1d77ccd287e25e2cbb09ea98e11"
+SRCREV_machine_qemuarm ?= "204fb292d2a413e6b9118cbcdc5109781180f603"
+SRCREV_machine ?= "d97030bff131365e3ee7073ce14320206e6fb5d3"
+SRCREV_meta ?= "2f0c77d118926b6666062a752a8c9d9a7c07320d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 355f2882bb..884cebd49b 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "f4e3842e04fc154f280aa93e590aac66a136dd4f"
-SRCREV_machine_qemuarm64 ?= "848ee4a4a53a07cc1c0d2fc35f4c65466949e15a"
-SRCREV_machine_qemumips ?= "88b6eeb87f18d6bfc7986a272c4b6822bafb2ed5"
-SRCREV_machine_qemuppc ?= "58318412f0f5d5a25767d2444ff8198378b74f8d"
-SRCREV_machine_qemuriscv64 ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
-SRCREV_machine_qemux86 ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
-SRCREV_machine_qemux86-64 ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
-SRCREV_machine_qemumips64 ?= "70b1c7289102ce9981713c42f3f11950fb6a1bc7"
-SRCREV_machine ?= "0313ce700b74810a20abc122ed0c72e5e3efe19a"
-SRCREV_meta ?= "6d740b62bd24b1d77ccd287e25e2cbb09ea98e11"
+SRCREV_machine_qemuarm ?= "c22c6be0814013c3c3f8f1173b2e8ab323db7661"
+SRCREV_machine_qemuarm64 ?= "63ee4c9651f167d55ee38f6ec31542f498a29d7b"
+SRCREV_machine_qemumips ?= "43d6560683e8e02bef6070c6ada08d9cc9c6058d"
+SRCREV_machine_qemuppc ?= "4f7df1e46cb36f85c3bd08d05ac5d4a4e2157790"
+SRCREV_machine_qemuriscv64 ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
+SRCREV_machine_qemux86 ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
+SRCREV_machine_qemux86-64 ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
+SRCREV_machine_qemumips64 ?= "c9610166a2e23065edc2930b722d4a02b6b31ae3"
+SRCREV_machine ?= "9d3037272eba80cd9a033faa0d294b96ce844fb5"
+SRCREV_meta ?= "2f0c77d118926b6666062a752a8c9d9a7c07320d"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.155"
+LINUX_VERSION ?= "5.4.156"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1


