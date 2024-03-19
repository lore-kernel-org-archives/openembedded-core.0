Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C401CD11DF
	for <webhook@archiver.kernel.org>; Tue, 19 Mar 2024 23:01:48 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web10.30632.1710889300265878645
 for <openembedded-core@lists.openembedded.org>;
 Tue, 19 Mar 2024 16:01:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=eqpIlqKW;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-690c1747c3cso3162686d6.0
        for <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 16:01:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710889299; x=1711494099; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AK1qjmMfvOT8/5bw3wJviWGfgaYTgAo+6DdwCyx70L8=;
        b=eqpIlqKWz89XbH99t7RpFw+UgK10sjmKUkrzyagXFlRuWbgPg2NrTlSa2EhqnqyV1a
         uHTFe+FfbKQjg5ZgrwMPKhcPszxSr+wFnxblW+CusDQK8lqxWyKtKI2g20vPvPhbXSA9
         069AQUI6ffbwAzv/OmWiUG/AHi0lC3+cLioJKeoew15uLOIJ3koi7pXIyaIb3HxN2dVe
         SMvxs0eo0VTZR3h9YwdadBtmKktR18klPfSWCvUqp90MsMcVWzhDr2KZs5dF47rBZtII
         W7AO2ICvXc9MbMM79DhdqyY7GLF+oj2s9gnHh6HulHhwPgjS3h6z0X1DAWANY0Tziirl
         uwqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710889299; x=1711494099;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AK1qjmMfvOT8/5bw3wJviWGfgaYTgAo+6DdwCyx70L8=;
        b=tSuGcmcnR6QN9qsuAuUDH3sE/fzuWuXU68RHLTp1vVEQlG6DvuUatkN8iBtzBZRKD6
         qABXgIdDXIdtCVH2w6BNSvUwk6u0+exLslvF0fkHmIYKUCxBHoVsh6GlykoQVbV0kKTY
         KXDI1axI8vU4FEe8QlF74ycylyRFUcY1YEBViJsQkOa5Nj4qZGe4H3LTUTBHxxKscCPj
         WGNc4w33+YT5OoLVpxtZyAqpClz+ZKuzrr5fbswJe7R8tCgeOZ/ln2oWN+aIdGCXjI7q
         8EJiY1kSnPnyJ7CMutBlfA85gBu+HudKeopTLApyARjJN4anXBJgYHvxO2mEiiE3rnVy
         YMIg==
X-Gm-Message-State: AOJu0Yxcx9ou2A9B4D317Eumu+l4YP7zm6+ckGOX2Bzyl5r9hCcIzDHA
	cXkiQWJSVxku5R7EHPQmVJKDYQTp1TyAz/QFx2I2KAcz7Chn4vCz32kmVWzC
X-Google-Smtp-Source: AGHT+IGw7aVpQOIyNFWw8DITbW8RzzaXySiajBEqSD5U6/fblT52M5+9nOFCwRb/0O/7eS9UaLTR+w==
X-Received: by 2002:a0c:cdd2:0:b0:693:73f9:8f72 with SMTP id a18-20020a0ccdd2000000b0069373f98f72mr1308193qvn.31.1710889299077;
        Tue, 19 Mar 2024 16:01:39 -0700 (PDT)
Received: from bruce-XPS-8940.localdomain ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id kc28-20020a056214411c00b00690bfb6aac7sm7047065qvb.51.2024.03.19.16.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 16:01:37 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/9] linux-yocto/6.6: update to v6.6.21
Date: Tue, 19 Mar 2024 19:01:26 -0400
Message-Id: <00abef81f9617aa1e687cbfcc9bbf2d74f361525.1710888915.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1710888915.git.bruce.ashfield@gmail.com>
References: <cover.1710888915.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 19 Mar 2024 23:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197338

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/6.6 to the latest korg -stable release that comprises
the following commits:

    62e5ae5007ef Linux 6.6.21
    d6ac0ee5ff95 drm/nouveau: don't fini scheduler before entity flush
    ece1aaec7f7e selftests: mptcp: rm subflow with v4/v4mapped addr
    8e7f31bf1101 selftests: mptcp: add mptcp_lib_is_v6
    9d71f43afd89 selftests: mptcp: update userspace pm test helpers
    f9190d7995a7 selftests: mptcp: add chk_subflows_total helper
    ae1fa39da991 selftests: mptcp: add evts_get_info helper
    e81742f6e2eb KVM/VMX: Move VERW closer to VMentry for MDS mitigation
    ae46691220f7 KVM/VMX: Use BT+JNC, i.e. EFLAGS.CF to select VMRESUME vs. VMLAUNCH
    7a62647efcb2 x86/bugs: Use ALTERNATIVE() instead of mds_user_clear static key
    ca13d8cd8dac x86/entry_32: Add VERW just before userspace transition
    7caf330faf16 x86/entry_64: Add VERW just before userspace transition
    2664bb298cdf block: define bvec_iter as __packed __aligned(4)
    21bbe847686c gpio: fix resource unwinding order in error path
    9c7c16109b71 gpiolib: Fix the error path order in gpiochip_add_data_with_key()
    92515c4ef1b4 gpio: 74x164: Enable output pins after registers are reset
    6b6282d56b14 powerpc/rtas: use correct function name for resetting TCE tables
    d4d1e4b1513d powerpc/pseries/iommu: IOMMU table is not initialized for kdump over SR-IOV
    5e3022ea42e4 dmaengine: idxd: Ensure safe user copy of completion record
    4d6e793eacfb dmaengine: idxd: Remove shadow Event Log head stored in idxd
    981917766b59 phy: freescale: phy-fsl-imx8-mipi-dphy: Fix alias name to use dashes
    d24fe6d5a1cf dmaengine: dw-edma: eDMA: Add sync read before starting the DMA transfer in remote setup
    227ef58a9b0c dmaengine: dw-edma: HDMA: Add sync read before starting the DMA transfer in remote setup
    55501b7359ef dmaengine: dw-edma: Add HDMA remote interrupt configuration
    3fa3dfcabf3a dmaengine: dw-edma: HDMA_V0_REMOTEL_STOP_INT_EN typo fix
    8b5657ac34b7 dmaengine: dw-edma: Fix wrong interrupt bit set for HDMA
    3adea99aa756 dmaengine: dw-edma: Fix the ch_count hdma callback
    57e869be88d0 ASoC: cs35l56: fix reversed if statement in cs35l56_dspwait_asp1tx_put()
    e9eac260369d af_unix: Drop oob_skb ref before purging queue in GC.
    69e0f04460f4 af_unix: Fix task hung while purging oob_skb in GC.
    be8a177250b2 NFS: Fix data corruption caused by congestion.
    fa8c776f4c32 mptcp: fix possible deadlock in subflow diag
    ce0809ada38d mptcp: fix double-free on socket dismantle
    b609ecda2d76 mptcp: fix potential wake-up event loss
    ae5530ccd5ef mptcp: fix snd_wnd initialization for passive socket
    536a661bfdf4 selftests: mptcp: join: add ss mptcp support check
    48428b07de4f mptcp: push at DSS boundaries
    fca4e6ab0681 mptcp: avoid printing warning once on client side
    a49ecbe8d0f0 mptcp: map v4 address to v6 when destroying subflow
    dff60a5531b5 x86/cpu/intel: Detect TME keyid bits before setting MTRR mask registers
    c43b984f0b23 x86/e820: Don't reserve SETUP_RNG_SEED in e820
    d2a9510c0e39 mm/debug_vm_pgtable: fix BUG_ON with pud advanced test
    e9eeb0dddf61 pmdomain: qcom: rpmhpd: Fix enabled_corner aggregation
    71da10e633a9 efivarfs: Request at most 512 bytes for variable names
    f1fb745ee0a6 iommufd: Fix iopt_access_list_id overwrite bug
    8db4f87fa3e1 kbuild: Add -Wa,--fatal-warnings to as-instr invocation
    9537603a5436 riscv: add CALLER_ADDRx support
    0c8a3d3354cd RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH
    aebd67a52edd mmc: sdhci-xenon: fix PHY init clock stability
    b4eacb32e066 mmc: sdhci-xenon: add timeout for PHY init complete
    4344444255a3 mmc: core: Fix eMMC initialization with 1-bit bus connection
    176e66269f0d mmc: mmci: stm32: fix DMA API overlapping mappings warning
    a69c8bbb9469 dmaengine: fsl-qdma: init irq after reg initialization
    91b001fb0b08 dmaengine: fsl-edma: correct calculation of 'nbytes' in multi-fifo scenario
    4e0fe154be7b dmaengine: ptdma: use consistent DMA masks
    1291d278b557 crypto: arm64/neonbs - fix out-of-bounds access on short input
    5b696e9c3882 dmaengine: fsl-qdma: fix SoC may hang on 16 byte unaligned read
    737d2e9300cd soc: qcom: pmic_glink: Fix boot when QRTR=m
    82dacc26e15c drm/amd/display: Add monitor patch for specific eDP
    5e476625fa8a drm/buddy: fix range bias
    baac292852c0 Revert "drm/amd/pm: resolve reboot exception for si oland"
    202e4f4bb858 btrfs: send: don't issue unnecessary zero writes for trailing hole
    b1690ced4d2d btrfs: dev-replace: properly validate device names
    eb3441093aad btrfs: fix double free of anonymous device after snapshot creation failure
    177d574be4b5 wifi: nl80211: reject iftype change with mesh ID change
    ad8ff8cff38d mtd: rawnand: marvell: fix layouts
    ba60fdf75e89 mm: cachestat: fix folio read-after-free in cache walk
    93dd420bc415 gtp: fix use-after-free and null-ptr-deref in gtp_newlink()
    f4906938bdd4 landlock: Fix asymmetric private inodes referring
    0be289ba41bb Bluetooth: hci_bcm4377: do not mark valid bd_addr as invalid
    a4904b3afed0 ALSA: hda/realtek: Add special fixup for Lenovo 14IRP8
    5cdf76fbbed9 ALSA: hda/realtek: fix mute/micmute LED For HP mt440
    46fb5e7ec337 ALSA: hda/realtek: Enable Mute LED on HP 840 G8 (MB 8AB8)
    d6ac6ffbdc39 ALSA: hda/realtek: tas2781: enable subwoofer volume control
    bb06ffbf3862 ALSA: ump: Fix the discard error code from snd_ump_legacy_open()
    22df6ff560c5 ALSA: firewire-lib: fix to check cycle continuity
    2caa60507948 tomoyo: fix UAF write bug in tomoyo_write_control()
    6f72b4458ead of: property: fw_devlink: Fix stupid bug in remote-endpoint parsing
    d43f8e58f10a btrfs: fix race between ordered extent completion and fiemap
    a278d5c60f21 riscv: Sparse-Memory/vmemmap out-of-bounds fix
    eb2571673cfc riscv: Fix pte_leaf_size() for NAPOT
    2b7ce74e19fc Revert "riscv: mm: support Svnapot in huge vmap"
    e0d17ee872cf drivers: perf: ctr_get_width function for legacy is not defined
    2f8c09478a2c drivers: perf: added capabilities for legacy PMU
    f67898867b6b afs: Fix endless loop in directory parsing
    73a6bd68a134 fbcon: always restore the old font data in fbcon_do_set_font()
    8e8c66afe27b drm/tegra: Remove existing framebuffer only if we support display
    274bf3cca13f RISC-V: Ignore V from the riscv,isa DT property on older T-Head CPUs
    fb3618f6bd49 ASoC: soc-card: Fix missing locking in snd_soc_card_get_kcontrol()
    4b5d89ace3ce ASoC: cs35l56: Fix deadlock in ASP1 mixer register initialization
    9f05fe599965 ASoC: cs35l56: Fix misuse of wm_adsp 'part' string for silicon revision
    c249f04f2bff ASoC: cs35l56: Fix for initializing ASP1 mixer registers
    044edc12fe01 ASoC: cs35l56: Don't add the same register patch multiple times
    a2f0a6846da8 ASoC: cs35l56: cs35l56_component_remove() must clean up wm_adsp
    93fc01f9b58d ASoC: cs35l56: cs35l56_component_remove() must clear cs35l56->component
    cc698db49b93 riscv: Fix build error if !CONFIG_ARCH_ENABLE_HUGEPAGE_MIGRATION
    99adc8b4d2f3 ASoC: qcom: Fix uninitialized pointer dmactl
    841361d88fae ASoC: qcom: convert not to use asoc_xxx()
    c92c96cda3e3 ASoC: soc.h: convert asoc_xxx() to snd_soc_xxx()
    ac549defb351 ALSA: Drop leftover snd-rtctimer stuff from Makefile
    4a7f5eff429b ASoC: cs35l56: Must clear HALO_STATE before issuing SYSTEM_RESET
    fbca8bae1ba7 power: supply: bq27xxx-i2c: Do not free non existing IRQ
    11aabd748785 efi/capsule-loader: fix incorrect allocation size
    81be85353b0f tls: fix use-after-free on failed backlog decryption
    dec5b6e7b211 tls: separate no-async decryption request handling from async
    11121c2ce571 tls: fix peeking with sync+async decryption
    c19fdb06d3d7 tls: decrement decrypt_pending if no async completion will be called
    9422350aea63 net: hsr: Use correct offset for HSR TLV values in supervisory HSR frames
    c88bf996e88b igb: extend PTP timestamp adjustments to i211
    167d8642daa6 rtnetlink: fix error logic of IFLA_BRIDGE_FLAGS writing back
    dbc81b032dd0 tools: ynl: fix handling of multiple mcast groups
    80cd0487f630 netfilter: bridge: confirm multicast packets before passing them up the stack
    98567dc7973f netfilter: nf_tables: allow NFPROTO_INET in nft_(match/target)_validate()
    39e39c34abb5 Bluetooth: qca: Fix triggering coredump implementation
    c50ce483c28a Bluetooth: hci_qca: Set BDA quirk bit if fwnode exists in DT
    fb3e827badce Bluetooth: qca: Fix wrong event type for patch config command
    dcd646f40a56 Bluetooth: Enforce validation on max value of connection interval
    fba268ac36ab Bluetooth: hci_event: Fix handling of HCI_EV_IO_CAPA_REQUEST
    4a9139678ede Bluetooth: hci_event: Fix wrongly recorded wakeup BD_ADDR
    6699d7ce263c Bluetooth: hci_sync: Fix accept_list when attempting to suspend
    2ab9a19d896f Bluetooth: Avoid potential use-after-free in hci_error_reset
    0a07fa1f61e4 Bluetooth: hci_sync: Check the correct flag before starting a scan
    699b103e48ce stmmac: Clear variable when destroying workqueue
    af6dfe9e9551 uapi: in6: replace temporary label with rfc9486
    2ae3d9d1d8da net: lan78xx: fix "softirq work is pending" error
    0ec3ea616a50 net: usb: dm9601: fix wrong return value in dm9601_mdio_read
    2d8003e55d12 veth: try harder when allocating queue memory
    288218b1dd26 lan78xx: enable auto speed configuration for LAN7850 if no EEPROM is detected
    44112bc5c74e ipv6: fix potential "struct net" leak in inet6_rtm_getaddr()
    16edf51f33f5 net: veth: clear GRO when clearing XDP even when down
    1a8682737600 cpufreq: intel_pstate: fix pstate limits enforcement for adjust_perf call back
    7322b217c6f0 tun: Fix xdp_rxq_info's queue_index when detaching
    fbccbb4215ae net: dpaa: fman_memac: accept phy-interface-type = "10gbase-r" in the device tree
    cbebc55ceace net: mctp: take ownership of skb in mctp_local_output
    a0a1db40b23e net: ip_tunnel: prevent perpetual headroom growth
    a2ab02815184 netlink: add nla be16/32 types to minlen array
    d3ada42e534a netlink: Fix kernel-infoleak-after-free in __skb_datagram_iter
    03f1573c9587 spi: cadence-qspi: fix pointer reference in runtime PM hooks
    c53b8d8f70c4 mtd: spinand: gigadevice: Fix the get ecc status issue
    8cb8ef0c79e3 ublk: move ublk_cancel_dev() out of ub->mutex
    2b5f1692a95b ksmbd: fix wrong allocation size update in smb2_open()
    05059601518e ASoC: cs35l34: Fix GPIO name and drop legacy include
    d3d782b5a5d3 ubifs: fix possible dereference after free

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.6.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.6.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.6.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
index fe5d70dea1..7076a40e1f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.6.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "7c5911ab2e70bf84bb38a598b2a7e094618a9620"
-SRCREV_meta ?= "d2cf51efb880ea1f34f4beaee487edf572e9adc3"
+SRCREV_machine ?= "689f65582b3d9a948903cde4e9c29e5fafd1bced"
+SRCREV_meta ?= "5b185a8716c8c62dc1c7751e6d12f8b67f58274f"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.6.20"
+LINUX_VERSION ?= "6.6.21"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
index 417cd16828..f6f4762cbc 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.6.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.6.inc
 
-LINUX_VERSION ?= "6.6.20"
+LINUX_VERSION ?= "6.6.21"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_meta ?= "d2cf51efb880ea1f34f4beaee487edf572e9adc3"
+SRCREV_machine ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_meta ?= "5b185a8716c8c62dc1c7751e6d12f8b67f58274f"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.6.bb b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
index 13b8b97619..aaea980df0 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.6.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.6.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.6/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.6/standard/base"
 KBRANCH:qemumips64 ?= "v6.6/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9d30fb4668cd7087e81b40f223cdd0090863602b"
-SRCREV_machine:qemuarm64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemuloongarch64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemumips ?= "4b49da8bb522bdaf928855c2c102fa839625c6c1"
-SRCREV_machine:qemuppc ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemuriscv64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemuriscv32 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemux86 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemux86-64 ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_machine:qemumips64 ?= "8e7605bafdfeb842396292181d524b183a1e13d6"
-SRCREV_machine ?= "a04baee60b5a7cf4d9c0c2f4856c6d5bb9b98074"
-SRCREV_meta ?= "d2cf51efb880ea1f34f4beaee487edf572e9adc3"
+SRCREV_machine:qemuarm ?= "09a926ab47d8072b7dc303cc8b99774abd792867"
+SRCREV_machine:qemuarm64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemuloongarch64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemumips ?= "b7fc266342fa1f6a304c54af0c8bc42b926bf1d8"
+SRCREV_machine:qemuppc ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemuriscv64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemuriscv32 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemux86 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemux86-64 ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_machine:qemumips64 ?= "fe3df2eeb1cca6792c09e6a6530671533ce584e5"
+SRCREV_machine ?= "4d67f3ece8ca6f730f43ea8fdb9acf79c0c7bc46"
+SRCREV_meta ?= "5b185a8716c8c62dc1c7751e6d12f8b67f58274f"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "9b4a8eac17f0d840729384618b4b1e876233026c"
+SRCREV_machine:class-devupstream ?= "62e5ae5007ef14cf9b12da6520d50fe90079d8d4"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.6/base"
 
@@ -44,7 +44,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.6;destsuffix=${KMETA};protocol=https"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.6.20"
+LINUX_VERSION ?= "6.6.21"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


