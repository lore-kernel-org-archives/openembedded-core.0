Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8577C433F5
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 13:07:23 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com
 [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web12.11417.1636549642427123567
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T+UKMQOx;
 spf=pass (domain: gmail.com, ip: 209.85.219.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id jo22so1761318qvb.13
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 05:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TR3iWZQU77Yi1OcR0rwROzM6rFJd/sykyIPKnYveNOA=;
        b=T+UKMQOxk+tH3RGpZfnLDxSiligZPfFHz+8g2mD3eDacEAmdji5A640SNbG/lv9TQQ
         cjNQ0dJ9UW1vw4e20DAtAxOqkyPWkxp6qo9GR9Wrqujm2y+abdaoyBtuv/pYok5Fjtni
         KxNSN193UitEWiLJeZcPjnHtsdXTpw1q4eAsyIVSlPdRu4GvrDe/kN2gw/MfbUbG3RbG
         0EQ9BmIFaC2UeA2/qg488jQNJy+oARwpe/0AKjRykAShgLncNunLDMRSsaXrFR4CtU83
         LyN2fWFbMnQetyvPw8F2b8umWWra5VsollNQEkXC0F44Ux9f9LHbrTB6peMciaO2LYVb
         SudQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TR3iWZQU77Yi1OcR0rwROzM6rFJd/sykyIPKnYveNOA=;
        b=lJoAs4wwYdPEGu040/8Zg9Y0TtjCTXkmcYiW7JEFKJk4A+C5aD99RFLFmOy3hDofBC
         W94Iufk6NqSn3KsTjQueG2JKSjb4ROIZet5LXjFiU3VIX2XtvFR/HBYRwQNSJ9zJSxgG
         UuI8zNf0TEYomt55i6F3Vc39jRnozcI5cRcS/oN+nYC0J4FanPCd1AHxqyyFCa8axexI
         fEikWtGWVLckpkOAXd+oxYnxQGIpTlgFat5Ze/Ju9RAK+pk/0M5IwDqnmEbIZsQ9w1k3
         ifERm675N7EbjpKir/rfgm3ZLhCCvDXS2+BjRyLphFS4yh12qwyAyZETxNbhXeh/W/+A
         MNOg==
X-Gm-Message-State: AOAM530k732b0X28AkSprM2EJbaWtnhTfD0BdoKFAGr9BKSnUzOkEDk8
	/ltf/qNOhXaYC+IXEAld/fna2ML8qF0Ycw==
X-Google-Smtp-Source: 
 ABdhPJz7nP5weRpVcMj+QwoxTqPr5h5tO5b4H2B2fVeS5be/iv/W9mBrc8wwD+3qC/6bwP1nYKtTLg==
X-Received: by 2002:a05:6214:da9:: with SMTP id
 h9mr15385020qvh.2.1636549641296;
        Wed, 10 Nov 2021 05:07:21 -0800 (PST)
Received: from build.lan
 (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id
 v15sm13611000qkl.91.2021.11.10.05.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:07:20 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/7] linux-yocto/5.14: update to v5.14.16
Date: Wed, 10 Nov 2021 08:07:11 -0500
Message-Id: 
 <501123f3a6677cdc9f560b8be7d454aa249bb80d.1636549444.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1636549444.git.bruce.ashfield@gmail.com>
References: <cover.1636549444.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 13:07:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158067

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.14 to the latest korg -stable release that comprises
the following commits:

    f63179c1e68c Linux 5.14.16
    e874c870dfd8 KVM: x86: Take srcu lock in post_kvm_run_save()
    9ab39a3d0cec KVM: SEV-ES: fix another issue with string I/O VMGEXITs
    eb0461c572e9 KVM: x86: switch pvclock_gtod_sync_lock to a raw spinlock
    10242cc2ad79 KVM: x86/xen: Fix kvm_xen_has_interrupt() sleeping in kvm_vcpu_block()
    669a7e147ee6 perf script: Check session->header.env.arch before using it
    e914237feb46 riscv: Fix asan-stack clang build
    4606bbb6b19c riscv: Do not re-populate shadow memory with kasan_populate_early_shadow
    7567abe63797 riscv: fix misalgned trap vector base address
    20bd764387ac scsi: ibmvfc: Fix up duplicate response detection
    f6782c0ca808 perf script: Fix PERF_SAMPLE_WEIGHT_STRUCT support
    04ced3822a66 scsi: ufs: ufs-exynos: Correct timeout value setting registers
    d748da838b21 KVM: s390: preserve deliverable_mask in __airqs_kick_single_vcpu
    4faa35ce98c7 KVM: s390: clear kicked_mask before sleeping again
    ae566351ca18 octeontx2-af: Check whether ipolicers exists
    45d9cd363786 virtio-ring: fix DMA metadata flags
    52a936b037b5 net: hns3: expand buffer len for some debugfs command
    efccb66bc917 net: hns3: add more string spaces for dumping packets number of queue info in debugfs
    e5c6ad377c07 bpf: Move BPF_MAP_TYPE for INODE_STORAGE and TASK_STORAGE outside of CONFIG_NET
    b341612b659d watchdog: sbsa: only use 32-bit accessors
    de709ec74f8b bpf: Use kvmalloc for map values in syscall
    0717c71deae6 sctp: add vtag check in sctp_sf_ootb
    1c255b5f68f4 sctp: add vtag check in sctp_sf_do_8_5_1_E_sa
    dd82b3a345ab sctp: add vtag check in sctp_sf_violation
    44ef3ecbc24a sctp: fix the processing for COOKIE_ECHO chunk
    7975f42f1038 sctp: fix the processing for INIT_ACK chunk
    6277d424ead2 sctp: fix the processing for INIT chunk
    332933f9ae0a sctp: use init_tag from inithdr for ABORT chunk
    44d44bf72591 RDMA/irdma: Do not hold qos mutex twice on QP resume
    6392f26fbe92 RDMA/irdma: Set VLAN in UD work completion correctly
    7762917173cc RDMA/irdma: Process extended CQ entries correctly
    7860484eeb90 phy: phy_ethtool_ksettings_set: Lock the PHY while changing settings
    37a1b9befb73 phy: phy_start_aneg: Add an unlocked version
    1f9c99e0bb5b phy: phy_ethtool_ksettings_set: Move after phy_start_aneg
    2191b1e8eb3d phy: phy_ethtool_ksettings_get: Lock the phy for consistency
    e2b4dd261720 net/tls: Fix flipped sign in async_wait.err assignment
    373f94d73651 net: ethernet: microchip: lan743x: Fix skb allocation failure
    228862acb549 net: hns3: fix data endian problem of some functions of debugfs
    20d88211706b net: hns3: fix pause config problem after autoneg disabled
    7cc73feb57f6 net: nxp: lpc_eth.c: avoid hang when bringing interface down
    d8774769d198 net: ethernet: microchip: lan743x: Fix dma allocation failure by using dma_set_mask_and_coherent
    69d3c7785ec4 net: ethernet: microchip: lan743x: Fix driver crash when lan743x_pm_resume fails
    18bd5e285a78 mlxsw: pci: Recycle received packet upon allocation failure
    960f4a54b909 nios2: Make NIOS2_DTB_SOURCE_BOOL depend on !COMPILE_TEST
    030f05812d81 gpio: xgs-iproc: fix parsing of ngpios property
    c653c522e521 RDMA/sa_query: Use strscpy_pad instead of memcpy to copy a string
    5f6995295f65 RDMA/mlx5: Initialize the ODP xarray when creating an ODP MR
    ed894f5439ab net: Prevent infinite while loop in skb_tx_hash()
    f435287d719b cfg80211: correct bridge/4addr mode check
    da279dac227a net-sysfs: initialize uid and gid before calling net_ns_get_ownership
    a8f7359259dd net: batman-adv: fix error handling
    50cc1462a668 regmap: Fix possible double-free in regcache_rbtree_exit()
    c9e39214fddf reset: brcmstb-rescal: fix incorrect polarity of status bit
    86f9394073d8 arm64: dts: allwinner: h5: NanoPI Neo 2: Fix ethernet node
    63a97a9f95f2 ice: check whether PTP is initialized in ice_ptp_release()
    ebd0edad1cdf RDMA/mlx5: Set user priority for DCT
    e83b3cce4722 ice: Respond to a NETDEV_UNREGISTER event for LAG
    f1e3cd1cc802 octeontx2-af: Fix possible null pointer dereference.
    98db2a8c14be octeontx2-af: Display all enabled PF VF rsrc_alloc entries.
    c7752ec9ad39 nvme-tcp: fix possible req->offset corruption
    7258a6eef5be nvme-tcp: fix data digest pointer calculation
    daa12f0c1d1b nvmet-tcp: fix data digest pointer calculation
    5d33bd6b4d4d IB/hfi1: Fix abba locking issue with sc_disable()
    0d4395477741 IB/qib: Protect from buffer overflow in struct qib_user_sdma_pkt fields
    6525bfbd546f bpf: Fix error usage of map_fd and fdget() in generic_map_update_batch()
    adb17f828177 bpf: Fix potential race in tail call compatibility check
    6f226ffe4458 tcp_bpf: Fix one concurrency problem in the tcp_bpf_send_verdict function
    e1b80a5ebe54 riscv, bpf: Fix potential NULL dereference
    b529f88d9388 cgroup: Fix memory leak caused by missing cgroup_bpf_offline
    b7ca59297fa3 Revert "watchdog: iTCO_wdt: Account for rebooting on second timeout"
    0a8b7eba95a0 drm/amd/display: Fix deadlock when falling back to v2 from v3
    a363d80566cc drm/amd/display: Fallback to clocks which meet requested voltage on DCN31
    aeadb0662478 drm/amd/display: Moved dccg init to after bios golden init
    5a5f1f070c3e drm/amd/display: Increase watermark latencies for DCN3.1
    85cf47160d0e drm/amd/display: increase Z9 latency to workaround underflow in Z9
    01f39421d590 drm/amd/display: Fix prefetch bandwidth calculation for DCN3.1
    b60efcaf5e8b drm/amd/display: Limit display scaling to up to true 4k for DCN 3.1
    c3ae5cf3e3ee drm/amdgpu: support B0&B1 external revision id for yellow carp
    d3ed72495a59 drm/amdgpu: fix out of bounds write
    9eb4bdd554fc drm/amdgpu: Fix even more out of bound writes from debugfs
    d87ac6054e3d drm/i915/dp: Skip the HW readout of DPCD on disabled encoders
    7650327e7174 drm/i915: Catch yet another unconditioal clflush
    0ed2dfb5f598 drm/i915: Convert unconditional clflush to drm_clflush_virt_range()
    132a3d998d67 drm/ttm: fix memleak in ttm_transfered_destroy
    15a4f2bdbdfd mac80211: mesh: fix HE operation element length check
    ce277959d77c arm64: dts: imx8mm-kontron: Make sure SOC and DRAM supply voltages are correct
    8c684aaceaf3 arm64: dts: imx8mm-kontron: Set lower limit of VDD_SNVS to 800 mV
    f5eaf91dd8af arm64: dts: imx8mm-kontron: Fix connection type for VSC8531 RGMII PHY
    da32086a0203 arm64: dts: imx8mm-kontron: Fix CAN SPI clock frequency
    d2bdcd23cba9 arm64: dts: imx8mm-kontron: Fix polarity of reg_rst_eth2
    5fcb6fce74ff mm: khugepaged: skip huge page collapse for special files
    5e669d8ab30a mm, thp: bail out early in collapse_file for writeback page
    6ac017254b59 mm: filemap: check if THP has hwpoisoned subpage for PMD page fault
    8821fedc7f83 mm: hwpoison: remove the unnecessary THP check
    67979d186c51 drm/amd/display: Require immediate flip support for DCN3.1 planes
    75b1b172ae5a net: lan78xx: fix division by zero in send path
    3c897f39b71f cfg80211: fix management registrations locking
    2a000d137589 cfg80211: scan: fix RCU in cfg80211_add_nontrans_list()
    e6d02b0da2df ftrace/nds32: Update the proto for ftrace_trace_function to match ftrace_stub
    ea081b13b00e nvme-tcp: fix H2CData PDU send accounting (again)
    2e382600e885 ocfs2: fix race between searching chunks and release journal_head from buffer_head
    7335acd51f6b block: Fix partition check for host-aware zoned block devices
    10bcaafc5753 mmc: sdhci-esdhc-imx: clear the buffer_read_ready to reset standard tuning circuit
    78873d5a2717 mmc: sdhci-pci: Read card detect from ACPI for Intel Merrifield
    b572d6c18511 mmc: sdhci: Map more voltage level to SDHCI_POWER_330
    ac6f66f208a1 mmc: dw_mmc: exynos: fix the finding clock sample value
    b1ad3ecffaac mmc: tmio: reenable card irqs after the reset callback
    e1b94f0e744f mmc: mediatek: Move cqhci init behind ungate clock
    9106d68c8082 mmc: cqhci: clear HALT state after CQE enable
    aa2f3e425e22 mmc: vub300: fix control-message timeouts
    e41473543f75 net/tls: Fix flipped sign in tls_err_abort() calls
    8ba94a7f7b9f Revert "net: mdiobus: Fix memory leak in __mdiobus_register"
    836f40777d58 nfc: port100: fix using -ERRNO as command type mask
    e029c9828c5b tipc: fix size validations for the MSG_CRYPTO type
    43849df432c9 ata: sata_mv: Fix the error handling of mv_chip_id()
    66a1c8748068 pinctrl: amd: disable and mask interrupts on probe
    18f31a907c9f Revert "pinctrl: bcm: ns: support updated DT binding as syscon subnode"
    b5c410a4af7d usbnet: fix error return code in usbnet_probe()
    7e8b6a4f18ed usbnet: sanity check for maxpacket
    a350df591870 ARM: 9148/1: handle CONFIG_CPU_ENDIAN_BE32 in arch/arm/kernel/head.S
    351d0f587b4c ARM: 9141/1: only warn about XIP address when not compile testing
    a51d78193d21 ARM: 9139/1: kprobes: fix arch_init_kprobes() prototype
    4108f38c05bd ARM: 9138/1: fix link warning with XIP + frame-pointer
    6aa2d9cf81f9 ARM: 9134/1: remove duplicate memcpy() definition
    78a7a2694e69 ARM: 9133/1: mm: proc-macros: ensure *_tlb_fns are 4B aligned
    e108afbd38a5 ARM: 9132/1: Fix __get_user_check failure with ARM KASAN images

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.14.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.14.bb            |  8 +++---
 meta/recipes-kernel/linux/linux-yocto_5.14.bb | 26 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
index 05f5df71b9..be4c678f65 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.14.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dcf40cf2b562e9b6ec814a9ca1912aab881de0e0"
-SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
+SRCREV_machine ?= "d1275779725dc0ebe673b10c4617e0c3bb6262d2"
+SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.14.15"
+LINUX_VERSION ?= "5.14.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
index f752b61d2b..134c4813fc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.14.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.14.15"
+LINUX_VERSION ?= "5.14.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "70f10165ff7c856cbf0512231ef9b6533efe1d1d"
-SRCREV_machine ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
+SRCREV_machine:qemuarm ?= "5fa2600d6ad51505a546646e7d4ab85eac23cc54"
+SRCREV_machine ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.14.bb b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
index f719966a7b..56a61897ba 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.14.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.14.bb
@@ -13,17 +13,17 @@ KBRANCH:qemux86  ?= "v5.14/standard/base"
 KBRANCH:qemux86-64 ?= "v5.14/standard/base"
 KBRANCH:qemumips64 ?= "v5.14/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "8b3f9104862f9486f4a6fb526e4d9cc9dc2217cb"
-SRCREV_machine:qemuarm64 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_machine:qemumips ?= "fab0cfca42f3509a5570b437f2a2df216927c055"
-SRCREV_machine:qemuppc ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_machine:qemuriscv64 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_machine:qemuriscv32 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_machine:qemux86 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_machine:qemux86-64 ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_machine:qemumips64 ?= "baf66f78949c175483eea2a5d0e7221a997d8e44"
-SRCREV_machine ?= "f04b30fc1551e290fc169b2e2f2c799a0569aec5"
-SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
+SRCREV_machine:qemuarm ?= "272e3443b607073023075ee7901933d874a86e6d"
+SRCREV_machine:qemuarm64 ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_machine:qemumips ?= "4e6b51635881e6027ea2b61885537e5d427f11f4"
+SRCREV_machine:qemuppc ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_machine:qemuriscv64 ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_machine:qemuriscv32 ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_machine:qemux86 ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_machine:qemux86-64 ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_machine:qemumips64 ?= "be5e677a1904b7f6555a1d619cd379f5031dbe24"
+SRCREV_machine ?= "9e759d64ede1347c5611633962d239661b2198e7"
+SRCREV_meta ?= "a3884078f4675c3061094525a04729eba6b11c4a"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
@@ -31,7 +31,7 @@ SRCREV_meta ?= "edb4dc09c55f317085688e3a5f6438ced46bc77d"
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
 DEFAULT_PREFERENCE:class-devupstream = "-1"
-SRCREV_machine:class-devupstream ?= "b46092c7497e5aaede15b10f162e32d6473f1862"
+SRCREV_machine:class-devupstream ?= "f63179c1e68ce99d511b683ad05d3829d0e4d9e9"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.14/base"
 
@@ -42,7 +42,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.14;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.14.15"
+LINUX_VERSION ?= "5.14.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


