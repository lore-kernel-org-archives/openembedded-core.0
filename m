Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF7BC433FE
	for <webhook@archiver.kernel.org>; Tue,  9 Nov 2021 14:38:19 +0000 (UTC)
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web08.12976.1636468691816879860
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Nov 2021 06:38:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="229915844"
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="229915844"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:18 -0800
X-IronPort-AV: E=Sophos;i="5.87,220,1631602800";
   d="scan'208";a="641956830"
Received: from chinboon-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl1.gar.corp.intel.com) ([10.215.234.207])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2021 06:38:17 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 07/26] linux-yocto/5.10: update to v5.10.76
Date: Tue,  9 Nov 2021 22:37:42 +0800
Message-Id: 
 <512e0c418ff1a185289fd23ee21afa8eac75f992.1636467986.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1636467986.git.anuj.mittal@intel.com>
References: <cover.1636467986.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Nov 2021 14:38:19 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158028

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    378e85d1aeb5 Linux 5.10.76
    cfa79faf7e1f pinctrl: stm32: use valid pin identifier in stm32_pinctrl_resume()
    c56c801391c3 ARM: 9122/1: select HAVE_FUTEX_CMPXCHG
    d088db8637bb selftests: bpf: fix backported ASSERT_FALSE
    3a845fa00fd7 e1000e: Separate TGP board type from SPT
    021b6d11e590 tracing: Have all levels of checks prevent recursion
    3a0dc2e35a5d net: mdiobus: Fix memory leak in __mdiobus_register
    cfe9266213c4 bpf, test, cgroup: Use sk_{alloc,free} for test cases
    188907c25218 s390/pci: fix zpci_zdev_put() on reserve
    f18b90e9366f can: isotp: isotp_sendmsg(): fix TX buffer concurrent access in isotp_sendmsg()
    2304dfb548a4 scsi: core: Fix shost->cmd_per_lun calculation in scsi_add_host_with_dma()
    c58654f344dd net: hns3: fix for miscalculation of rx unused desc
    96fe5061291d sched/scs: Reset the shadow stack when idle_task_exit
    96f0aebf29be scsi: qla2xxx: Fix a memory leak in an error path of qla2x00_process_els()
    90c8e8c0829b scsi: iscsi: Fix set_param() handling
    0eb254479685 Input: snvs_pwrkey - add clk handling
    ea9c1f5d8a3a perf/x86/msr: Add Sapphire Rapids CPU support
    7a5a1f09c8b4 libperf tests: Fix test_stat_cpu
    e56a3e7ae353 ALSA: hda: avoid write to STATESTS if controller is in reset
    85c8d8c1609d platform/x86: intel_scu_ipc: Update timeout value in comment
    9f591cbdbed3 isdn: mISDN: Fix sleeping function called from invalid context
    ab4f542b515b ARM: dts: spear3xx: Fix gmac node
    15d3ad79885b net: stmmac: add support for dwmac 3.40a
    f9d16a428489 btrfs: deal with errors when checking if a dir entry exists during log replay
    369db2a91d5c ALSA: hda: intel: Allow repeatedly probing on codec configuration errors
    81d8e70cdce4 gcc-plugins/structleak: add makefile var for disabling structleak
    69078a94365a net: hns3: fix the max tx size according to user manual
    f40c2281d2c0 drm: mxsfb: Fix NULL pointer dereference crash on unload
    96835b68d7b3 net: bridge: mcast: use multicast_membership_interval for IGMPv3
    0e033cb40761 selftests: netfilter: remove stray bash debug line
    f8a6541345c2 netfilter: Kconfig: use 'default y' instead of 'm' for bool config option
    7f221ccbee4e isdn: cpai: check ctr->cnr to avoid array index out of bound
    77c0ef979e32 nfc: nci: fix the UAF of rf_conn_info object
    8f042315fcc4 KVM: nVMX: promptly process interrupts delivered while in guest mode
    b41fd8f5d2ad mm, slub: fix incorrect memcg slab count for bulk free
    568f906340b4 mm, slub: fix potential memoryleak in kmem_cache_open()
    48843dd23c7b mm, slub: fix mismatch between reconstructed freelist depth and cnt
    c5c2a80368e9 powerpc/idle: Don't corrupt back chain when going idle
    197ec50b2df1 KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return 0 if it went to guest
    fbd724c49bea KVM: PPC: Book3S HV: Fix stack handling in idle_kvm_start_guest()
    9258f58432c5 powerpc64/idle: Fix SP offsets when saving GPRs
    3e16d9d525a7 net: dsa: mt7530: correct ds->num_ports
    16802fa4c33e audit: fix possible null-pointer dereference in audit_filter_rules
    0d867a359979 ASoC: DAPM: Fix missing kctl change notifications
    a2606acf418e ALSA: hda/realtek: Add quirk for Clevo PC50HS
    6411397b6d7a ALSA: usb-audio: Provide quirk for Sennheiser GSP670 Headset
    b721500c979b vfs: check fd has read access in kernel_read_file_from_fd()
    895ceeff31b1 elfcore: correct reference to CONFIG_UML
    3cda4bfffd4f userfaultfd: fix a race between writeprotect and exit_mmap()
    93be0eeea14c ocfs2: mount fails with buffer overflow in strlen
    f1b98569e81c ocfs2: fix data corruption after conversion from inline format
    1727e8688d2e ceph: fix handling of "meta" errors
    603d4bcc0fcd ceph: skip existing superblocks that are blocklisted or shut down when mounting
    d48db508f911 can: j1939: j1939_xtp_rx_rts_session_new(): abort TP less than 9 bytes
    5abc9b9d3ca5 can: j1939: j1939_xtp_rx_dat_one(): cancel session if receive TP.DT with error length
    864e77771a24 can: j1939: j1939_netdev_start(): fix UAF for rx_kref of j1939_priv
    ecfccb1c58c9 can: j1939: j1939_tp_rxtimer(): fix errant alert in j1939_tp_rxtimer
    053bc12df0d6 can: isotp: isotp_sendmsg(): add result check for wait_event_interruptible()
    0917fb04069a can: isotp: isotp_sendmsg(): fix return error on FC timeout on TX path
    28f28e4bc3a5 can: peak_pci: peak_pci_remove(): fix UAF
    9697ad6395f9 can: peak_usb: pcan_usb_fd_decode_status(): fix back to ERROR_ACTIVE state notification
    4758e92e75ca can: rcar_can: fix suspend/resume
    4a0928c3ebca net: enetc: fix ethtool counter name for PM0_TERR
    00ad7a015409 drm/panel: ilitek-ili9881c: Fix sync for Feixin K101-IM2BYL02 panel
    eccd00728b1a ice: Add missing E810 device ids
    6418508a3ac2 e1000e: Fix packet loss on Tiger Lake and later
    29f1bdcaa3dd net: stmmac: Fix E2E delay mechanism
    d36b15e3e7b5 net: hns3: disable sriov before unload hclge layer
    6a72e1d78a2f net: hns3: fix vf reset workqueue cannot exit
    32b860d364d2 net: hns3: schedule the polling again when allocation fails
    96c013f40c9b net: hns3: add limit ets dwrr bandwidth cannot be 0
    21f61d10435c net: hns3: reset DWRR of unused tc to zero
    53770a411559 powerpc/smp: do not decrement idle task preempt count in CPU offline
    81dbd898fb7b NIOS2: irqflags: rename a redefined register name
    6edf99b000d6 net: dsa: lantiq_gswip: fix register definition
    ef97219d5fec ipv6: When forwarding count rx stats on the orig netdev
    38d984e5e845 tcp: md5: Fix overlap between vrf and non-vrf keys
    c28bea6b876f lan78xx: select CRC32
    9c8943812dac netfilter: ipvs: make global sysctl readonly in non-init netns
    911e01990c70 netfilter: ip6t_rt: fix rt0_hdr parsing in rt_mt6
    69ea08c1b539 ice: fix getting UDP tunnel entry
    842fce43190c ASoC: wm8960: Fix clock configuration on slave mode
    39afed394cc6 dma-debug: fix sg checks in debug_dma_map_sg()
    2a670c323055 netfilter: xt_IDLETIMER: fix panic that occurs when timer_type has garbage value
    0f4308a164a9 NFSD: Keep existing listeners on portlist error
    546c04c85791 xtensa: xtfpga: Try software restart before simulating CPU reset
    bfef5d826276 xtensa: xtfpga: use CONFIG_USE_OF instead of CONFIG_OF
    d8284c981c1c drm/amdgpu/display: fix dependencies for DRM_AMD_DC_SI
    101e1bcb1147 xen/x86: prevent PVH type from getting clobbered
    a6285b1b2212 block: decode QUEUE_FLAG_HCTX_ACTIVE in debugfs output
    85c1827eeee7 ARM: dts: at91: sama5d2_som1_ek: disable ISC node by default
    5489c1bed5b8 arm: dts: vexpress-v2p-ca9: Fix the SMB unit-address
    f59da9f7efa7 io_uring: fix splice_fd_in checks backport typo
    b6f32897af19 xhci: add quirk for host controllers that don't update endpoint DCS
    b3b7f831a49b parisc: math-emu: Fix fall-through warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 61f8f7d18417334e3b13e4447f318107372dcfe0)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 2795887b92..34bb95e4fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "1d0eb980c3f825c193b07e925090a1a3dd752dbc"
-SRCREV_meta ?= "9ff1e75562075e35b5c8649b0a1aece50d8531b7"
+SRCREV_machine ?= "f7d2419be110c618b74cbaddaafbabf4a886b91b"
+SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.75"
+LINUX_VERSION ?= "5.10.76"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 94d0473098..e898bc1325 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.75"
+LINUX_VERSION ?= "5.10.76"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "773ad5db722c1cbac17a944ab2fd4f1d9d72c55d"
-SRCREV_machine ?= "b1ee56b4baf8a85fa02965b76dbc4ba7de898540"
-SRCREV_meta ?= "9ff1e75562075e35b5c8649b0a1aece50d8531b7"
+SRCREV_machine:qemuarm ?= "4575e0b8282d99c79dac96a77c03685d66fb0a08"
+SRCREV_machine ?= "da50565d028a2d87eabc7a53ee73a53f82f10f39"
+SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index e7f8cc188f..b4f9faf0f3 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "eaf94169288a0cdaa7f919e81b9cde11637328a0"
-SRCREV_machine:qemuarm64 ?= "0a2409ae4ca5c3efc6633891d807c189f8c2e6ec"
-SRCREV_machine:qemumips ?= "73ca3b526488435d4f2a404642078b3b111879af"
-SRCREV_machine:qemuppc ?= "14edaae440f2835071ffacced9f240cdd8cf7094"
-SRCREV_machine:qemuriscv64 ?= "97699547a2625645320510db2237e8619a7954ef"
-SRCREV_machine:qemuriscv32 ?= "97699547a2625645320510db2237e8619a7954ef"
-SRCREV_machine:qemux86 ?= "97699547a2625645320510db2237e8619a7954ef"
-SRCREV_machine:qemux86-64 ?= "97699547a2625645320510db2237e8619a7954ef"
-SRCREV_machine:qemumips64 ?= "9e86c3417c2c6a61a52664ebcfdd541f6af7e099"
-SRCREV_machine ?= "97699547a2625645320510db2237e8619a7954ef"
-SRCREV_meta ?= "9ff1e75562075e35b5c8649b0a1aece50d8531b7"
+SRCREV_machine:qemuarm ?= "da5f8508e569eb5d64a2efe5a5c4aa138c8f2738"
+SRCREV_machine:qemuarm64 ?= "a473fe3ad480df6565134d42a95826e71ae77a1a"
+SRCREV_machine:qemumips ?= "317762b8a9da49cd12eb51e879b6eba2b7c3a4a4"
+SRCREV_machine:qemuppc ?= "8a3eb888460464e612b79ab983c99cf868f82780"
+SRCREV_machine:qemuriscv64 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
+SRCREV_machine:qemuriscv32 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
+SRCREV_machine:qemux86 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
+SRCREV_machine:qemux86-64 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
+SRCREV_machine:qemumips64 ?= "efe59773d3289e7b34d99684547968849a2e6aa9"
+SRCREV_machine ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
+SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE:qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.75"
+LINUX_VERSION ?= "5.10.76"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.31.1


