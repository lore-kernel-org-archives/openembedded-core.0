Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE4FC433EF
	for <webhook@archiver.kernel.org>; Mon, 22 Nov 2021 02:20:30 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by mx.groups.io with SMTP id smtpd.web10.1399.1637547629207164788
 for <openembedded-core@lists.openembedded.org>;
 Sun, 21 Nov 2021 18:20:29 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: intel.com, ip: 134.134.136.100, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="298122185"
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="298122185"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,253,1631602800";
   d="scan'208";a="739428768"
Received: from kkleong1-mobl1.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.239.135])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2021 18:20:27 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 02/16] linux-yocto/5.10: update to v5.10.77
Date: Mon, 22 Nov 2021 10:20:06 +0800
Message-Id: 
 <0595d5cdfb0b0d72b484c174b2637baf3ffdac35.1637546583.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637546583.git.anuj.mittal@intel.com>
References: <cover.1637546583.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Nov 2021 02:20:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158538

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    09df347cfd18 Linux 5.10.77
    fbb91dadb512 perf script: Check session->header.env.arch before using it
    6f416815c505 riscv: Fix asan-stack clang build
    7a4cf25d8329 riscv: fix misalgned trap vector base address
    acb8832f6a1c scsi: ufs: ufs-exynos: Correct timeout value setting registers
    8ecddaca7942 KVM: s390: preserve deliverable_mask in __airqs_kick_single_vcpu
    e11a7355fb98 KVM: s390: clear kicked_mask before sleeping again
    727e5deca802 lan743x: fix endianness when accessing descriptors
    a7112b8eeb14 sctp: add vtag check in sctp_sf_ootb
    c2442f721972 sctp: add vtag check in sctp_sf_do_8_5_1_E_sa
    14c1e02b11c2 sctp: add vtag check in sctp_sf_violation
    dad2486414b5 sctp: fix the processing for COOKIE_ECHO chunk
    8c50693d25e4 sctp: fix the processing for INIT_ACK chunk
    ad111d4435d8 sctp: use init_tag from inithdr for ABORT chunk
    4509000a2515 phy: phy_ethtool_ksettings_set: Lock the PHY while changing settings
    5b88bb9377ee phy: phy_start_aneg: Add an unlocked version
    81780b624d1c phy: phy_ethtool_ksettings_set: Move after phy_start_aneg
    258c5fea44cf phy: phy_ethtool_ksettings_get: Lock the phy for consistency
    58722323d4bc net/tls: Fix flipped sign in async_wait.err assignment
    44e8c93e1e49 net: nxp: lpc_eth.c: avoid hang when bringing interface down
    c2af2092c9bb net: ethernet: microchip: lan743x: Fix dma allocation failure by using dma_set_mask_and_coherent
    bfa6fbdb4e39 net: ethernet: microchip: lan743x: Fix driver crash when lan743x_pm_resume fails
    e81bed557fe7 mlxsw: pci: Recycle received packet upon allocation failure
    be98be1a17e9 nios2: Make NIOS2_DTB_SOURCE_BOOL depend on !COMPILE_TEST
    aead02927af3 gpio: xgs-iproc: fix parsing of ngpios property
    863a423ee07b RDMA/sa_query: Use strscpy_pad instead of memcpy to copy a string
    2b7c5eed19d3 net: Prevent infinite while loop in skb_tx_hash()
    04121b10cdf0 cfg80211: correct bridge/4addr mode check
    aed897e96b19 net-sysfs: initialize uid and gid before calling net_ns_get_ownership
    b0a2cd38553c net: batman-adv: fix error handling
    36e911a16b37 regmap: Fix possible double-free in regcache_rbtree_exit()
    e51371bd687e reset: brcmstb-rescal: fix incorrect polarity of status bit
    2cf7d935d6ba arm64: dts: allwinner: h5: NanoPI Neo 2: Fix ethernet node
    10e40fb2f508 RDMA/mlx5: Set user priority for DCT
    24fd8e2f027d octeontx2-af: Display all enabled PF VF rsrc_alloc entries.
    c63d7f2ca99a nvme-tcp: fix possible req->offset corruption
    32f3db20f126 nvme-tcp: fix data digest pointer calculation
    4286c72c5321 nvmet-tcp: fix data digest pointer calculation
    d98883f6c33e IB/hfi1: Fix abba locking issue with sc_disable()
    c3e17e58f571 IB/qib: Protect from buffer overflow in struct qib_user_sdma_pkt fields
    ee4908f909b3 bpf: Fix error usage of map_fd and fdget() in generic_map_update_batch()
    dd2260ec643d bpf: Fix potential race in tail call compatibility check
    15dec6d8f864 tcp_bpf: Fix one concurrency problem in the tcp_bpf_send_verdict function
    cac6b043cea3 riscv, bpf: Fix potential NULL dereference
    01599bf7cc2b cgroup: Fix memory leak caused by missing cgroup_bpf_offline
    eb3b6805e3e9 drm/amdgpu: fix out of bounds write
    c21b4002214c drm/ttm: fix memleak in ttm_transfered_destroy
    69a7fa5cb0de mm, thp: bail out early in collapse_file for writeback page
    8fb858b74ac5 net: lan78xx: fix division by zero in send path
    4c22227e39c7 cfg80211: fix management registrations locking
    fa29cec42c2d cfg80211: scan: fix RCU in cfg80211_add_nontrans_list()
    db1191a529e4 nvme-tcp: fix H2CData PDU send accounting (again)
    5043fbd294f5 ocfs2: fix race between searching chunks and release journal_head from buffer_head
    01169a43353d mmc: sdhci-esdhc-imx: clear the buffer_read_ready to reset standard tuning circuit
    ee3213b117ce mmc: sdhci: Map more voltage level to SDHCI_POWER_330
    a95a76fc01a0 mmc: dw_mmc: exynos: fix the finding clock sample value
    12a46f72f499 mmc: mediatek: Move cqhci init behind ungate clock
    44c2bc2a6bbe mmc: cqhci: clear HALT state after CQE enable
    efe934629fff mmc: vub300: fix control-message timeouts
    f3dec7e7ace3 net/tls: Fix flipped sign in tls_err_abort() calls
    c828115a14ea Revert "net: mdiobus: Fix memory leak in __mdiobus_register"
    11c0406b4c33 nfc: port100: fix using -ERRNO as command type mask
    0b1b3e086b0a tipc: fix size validations for the MSG_CRYPTO type
    5aa5bab57957 ata: sata_mv: Fix the error handling of mv_chip_id()
    9a52798dce73 pinctrl: amd: disable and mask interrupts on probe
    01c2881bb0e0 Revert "pinctrl: bcm: ns: support updated DT binding as syscon subnode"
    017718dfbb6f usbnet: fix error return code in usbnet_probe()
    693ecbe8f799 usbnet: sanity check for maxpacket
    b663890d8544 ext4: fix possible UAF when remounting r/o a mmp-protected file system
    d4d9c065988c arm64: Avoid premature usercopy failure
    e184a21b5ccc powerpc/bpf: Fix BPF_MOD when imm == 1
    3f2c12ec8a3f io_uring: don't take uring_lock during iowq cancel
    5a768b4d3e1a ARM: 9141/1: only warn about XIP address when not compile testing
    15b278f94bbb ARM: 9139/1: kprobes: fix arch_init_kprobes() prototype
    c06d7d9bfcf6 ARM: 9138/1: fix link warning with XIP + frame-pointer
    8a6af97c31be ARM: 9134/1: remove duplicate memcpy() definition
    6ad8bbc9d301 ARM: 9133/1: mm: proc-macros: ensure *_tlb_fns are 4B aligned
    3ceaa85c331d ARM: 9132/1: Fix __get_user_check failure with ARM KASAN images

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit d57bc7281015d09e2ff7a8a028dbf31559ff7331)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 6975bd16ae..3ebb5e979f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "f01089784fd6234111851aad756297e0f258276c"
-SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
+SRCREV_machine ?= "3a416eeb4d0bdbba2a133744a465f2c9a46e3a96"
+SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.76"
+LINUX_VERSION ?= "5.10.77"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 89c4329fc7..169185f685 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.76"
+LINUX_VERSION ?= "5.10.77"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "4575e0b8282d99c79dac96a77c03685d66fb0a08"
-SRCREV_machine ?= "da50565d028a2d87eabc7a53ee73a53f82f10f39"
-SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
+SRCREV_machine_qemuarm ?= "c5c9d2c5c8ce7a84f6aebf02b3ae824a4c5f9d56"
+SRCREV_machine ?= "c3e3199c6359736c373aaecc8f447eaec7cf9432"
+SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 2c33a04df1..f994cfc2d4 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,17 +13,17 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "da5f8508e569eb5d64a2efe5a5c4aa138c8f2738"
-SRCREV_machine_qemuarm64 ?= "a473fe3ad480df6565134d42a95826e71ae77a1a"
-SRCREV_machine_qemumips ?= "317762b8a9da49cd12eb51e879b6eba2b7c3a4a4"
-SRCREV_machine_qemuppc ?= "8a3eb888460464e612b79ab983c99cf868f82780"
-SRCREV_machine_qemuriscv64 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
-SRCREV_machine_qemuriscv32 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
-SRCREV_machine_qemux86 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
-SRCREV_machine_qemux86-64 ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
-SRCREV_machine_qemumips64 ?= "efe59773d3289e7b34d99684547968849a2e6aa9"
-SRCREV_machine ?= "be6faea8fdece878f8cebfda0969df78df07fbf8"
-SRCREV_meta ?= "e1979ceb171bc91ef2cb71cfcde548a101dab687"
+SRCREV_machine_qemuarm ?= "51e48df3dbbc2b03579e95b296bf7b2625cf456b"
+SRCREV_machine_qemuarm64 ?= "c437750233de239844757e4c79bfd9e9c56e1b0d"
+SRCREV_machine_qemumips ?= "f2acb9e5f819ce240b530851f9e8ed45a8f7d878"
+SRCREV_machine_qemuppc ?= "b36a906729ef754c48d730f15a7f079eb4942356"
+SRCREV_machine_qemuriscv64 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
+SRCREV_machine_qemuriscv32 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
+SRCREV_machine_qemux86 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
+SRCREV_machine_qemux86-64 ?= "789500dfe326ab238562529175d99d33a3db1d0c"
+SRCREV_machine_qemumips64 ?= "1b436658828965d7f96ff5e532ff0bb6b1099cff"
+SRCREV_machine ?= "789500dfe326ab238562529175d99d33a3db1d0c"
+SRCREV_meta ?= "257ed971bc7fd76ccb27f622df1ef6412f6b340d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.76"
+LINUX_VERSION ?= "5.10.77"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.33.1


