Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BC29C4706E
	for <webhook@archiver.kernel.org>; Thu, 21 Dec 2023 14:25:20 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.51767.1703168717415955419
 for <openembedded-core@lists.openembedded.org>;
 Thu, 21 Dec 2023 06:25:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=jt47htc1;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-78120bb5592so27561085a.3
        for <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 06:25:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703168716; x=1703773516; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bi7JfuKdlVTN9x+Vez4FumUs/e3BnQLuZVjRlrZV3g8=;
        b=jt47htc1CVH1Rz/k1BoZrLXmA8RJ17UeiNEgGnZY0D7+mJh0s9E8fbf8j676VdhDAP
         vqaLfFcODRd3JwvqSouQ0vwx7BhqubYBArf0Fv8XZjU1PeAWhzPqkHmJy/VwXDFPRJQs
         PbGyPStjp8yP0hqs6H4B2O+Z71W4CnVZcg7mMru37AZOXNRUesuK7A9xdHy6/ZjTaX71
         Su5Yy7Uy/FUC63DiAyOiWXUTFDr4uxT7YxZCtdv9LpIlMmVmS+qURx6/W8lqpXNmce7A
         x5KmqqDk36Wmqdk2nWJ0agLR4Rp92P5QZHudWdcP9XJow4t8SxoVoqFpb4h65ikuqvLk
         Lzeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703168716; x=1703773516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bi7JfuKdlVTN9x+Vez4FumUs/e3BnQLuZVjRlrZV3g8=;
        b=kbz9h9S2c37FuPsIq04yWlaD6VKK5b5iVSXlBByeaihXA/LfVwQLDgzwVMTwiuKwOu
         WhIr8PXJFK+pj5rP7Z011ni8eFxxkWVseDO13Cmbtt/KEAlJHk0yNWXVDselcaT7ugmy
         eqdLxsIi1B3JY9oMku39779D/bkW5UT/o3jb+YluL7jF9IURI4DKyfY42b7wgltnop/B
         FbVB6SqIOSpMOo0447S5uXHSyAYhtlURWMjr25PaLeI9A/WqlI+vVm4n/oCPKLpjtSx0
         aLbSeNXmctjP8qAx2jwHxZgQwWuVLiO5QxrCcWOWekGHjovJ5Pp5b0N9Uo2M71RivG7O
         uqiA==
X-Gm-Message-State: AOJu0YyY8BLbb2iZjTdKHfguXLzG81XF86r0L8l4vsypNwU0jPdp6LnZ
	hvtpNwboHnxn6TtQYasVJTfoln+Gy+R4Exd2
X-Google-Smtp-Source: AGHT+IEvQaTPDBC7SgZ6m+p84CbcULTwk9vj62wTbFS8eK63gy0Oj60BrRkIPakeiXFfmgB5O6w70A==
X-Received: by 2002:a05:620a:47:b0:781:b2:37ee with SMTP id t7-20020a05620a004700b0078100b237eemr4319251qkt.137.1703168716196;
        Thu, 21 Dec 2023 06:25:16 -0800 (PST)
Received: from bruce-XPS-8940.. ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id g4-20020a37e204000000b0077eff6eece8sm679490qki.62.2023.12.21.06.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 06:25:15 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/7] linux-yocto/6.1: update to v6.1.66
Date: Thu, 21 Dec 2023 09:25:06 -0500
Message-Id: <ced1f4329b308c3733dc41c2540de84461cb3ca3.1703168370.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1703168370.git.bruce.ashfield@gmail.com>
References: <cover.1703168370.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Dec 2023 14:25:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192833

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    6c6a6c7e211c Linux 6.1.66
    ea574927fc0b iomap: update ki_pos a little later in iomap_dio_complete
    adf0ecebf00a x86/apic/msi: Fix misconfigured non-maskable MSI quirk
    b3b839fb636b x86/xen: fix percpu vcpu_info allocation
    00bc8b2cf44c xen: simplify evtchn_do_upcall() call maze
    9311a0ff388a xen: Allow platform PCI interrupt to be shared
    402b8323461c r8169: fix deadlock on RTL8125 in jumbo mtu mode
    22ee0ddb2af7 r8169: disable ASPM in case of tx timeout
    10ce6301009f drm/amd/display: Fix MPCC 1DLUT programming
    8332cb6c6339 drm/amd/display: Fix the delta clamping for shaper LUT
    442a4d4d0157 drm/amd/display: clean code-style issues in dcn30_set_mpc_shaper_3dlut
    6cd736272165 drm/amd/display: Expand kernel doc for DC
    8b01195be4a9 mmc: sdhci-sprd: Fix vqmmc not shutting down after the card was pulled
    38d3216032c9 mmc: core: add helpers mmc_regulator_enable/disable_vqmmc
    0e0a95166882 drm/amd/pm: fix a memleak in aldebaran_tables_init
    59862b869275 iommu/vt-d: Make context clearing consistent with context mapping
    ee2c2247690c iommu/vt-d: Disable PCI ATS in legacy passthrough mode
    8f39d297a26a iommu/vt-d: Add device_block_translation() helper
    3787b3168b6c iommu/vt-d: Allocate pasid table in device probe path
    681aeeda413d iommu/vt-d: Omit devTLB invalidation requests when TES=0
    8aaed5b81d26 cpufreq: imx6q: Don't disable 792 Mhz OPP unnecessarily
    d3788f6e9d5a cpufreq: imx6q: don't warn for disabling a non-existing frequency
    195514bda626 drm/amd/display: Guard against invalid RPTR/WPTR being set
    395a63ca1ad2 drm/amd/display: Restore rptr/wptr for DMCUB as workaround
    4ec4508db975 spi: Fix null dereference on suspend
    b57eebfb80e8 fbdev: stifb: Make the STI next font pointer a 32-bit signed offset
    5bc8d96fedce PCI: qcom-ep: Add dedicated callback for writing to DBI2 registers
    10c3d86fea04 octeontx2-af: Initialize 'cntr_val' to fix uninitialized symbol error
    1c8f75ee9233 PCI: Lengthen reset delay for VideoPropulsion Torrent QN16e card
    7545ddda9c98 KVM: x86: Fix lapic timer interrupt lost after loading a snapshot.
    21feaf558f93 net: ravb: Keep reverse order of operations in ravb_remove()
    8d04278ff48b net: ravb: Stop DMA in case of failures on ravb_open()
    52b751686cbf net: ravb: Start TX queues after HW initialization succeeded
    e2db25d16cdd net: ravb: Make write access to CXR35 first before accessing other EMAC registers
    f5c649ce7975 net: ravb: Use pm_runtime_resume_and_get()
    149b2fe12aca net: ravb: Check return value of reset_control_deassert()
    7ed2e4c2d016 ravb: Fix races between ravb_tx_timeout_work() and net related ops
    8b1d088be5f1 r8169: prevent potential deadlock in rtl8169_close
    9c4ac2d98a48 octeontx2-pf: Restore TC ingress police rules when interface is up
    aef2d5b3e56e octeontx2-af: Install TC filter rules in hardware based on priority
    662b88708408 octeontx2-pf: Fix adding mbox work queue entry when num_vfs > 64
    5d5bcfb1ca8d net: stmmac: xgmac: Disable FPE MMC interrupts
    334e6378c28c octeontx2-af: Fix possible buffer overflow
    c3e974e9c4bb selftests/net: mptcp: fix uninitialized variable warnings
    12dd4c1bf3bd selftests/net: unix: fix unused variable compiler warning
    4e999af7cf8a selftests/net: fix a char signedness issue
    249ceee95caf selftests/net: ipsec: fix constant out of range
    e01249a83939 uapi: propagate __struct_group() attributes to the container union
    fd91b48f108d dpaa2-eth: increase the needed headroom to account for alignment
    94445d958307 ipv4: igmp: fix refcnt uaf issue when receiving igmp query packet
    f89fef7710b2 usb: config: fix iteration issue in 'usb_get_bos_descriptor()'
    9aff7c51b440 USB: core: Change configuration warnings to notices
    c89b34eef336 USB: xhci-plat: fix legacy PHY double init
    307a6525c82a wifi: cfg80211: fix CQM for non-range use
    e8c1105c0ccc serial: sc16is7xx: add missing support for rs485 devicetree properties
    55061c323075 serial: sc16is7xx: Put IOControl register into regmap_volatile
    a491c7be35ed auxdisplay: hd44780: move cursor home after clear display command
    7f2116777541 Input: xpad - add HyperX Clutch Gladiate Support
    7a105de27538 btrfs: fix 64bit compat send ioctl arguments not initializing version member
    32912ee86931 btrfs: make error messages more clear when getting a chunk map
    4fc9c61c02c0 btrfs: send: ensure send_fd is writable
    86742a963fe6 btrfs: fix off-by-one when checking chunk map includes logical address
    9fe447c485ed btrfs: ref-verify: fix memory leaks in btrfs_ref_tree_mod()
    3f26d9b257ad btrfs: add dmesg output for first mount and last unmount of a filesystem
    0ad7d59e7901 parisc: Mark altinstructions read-only and 32-bit aligned
    cf2ae6494d1f parisc: Ensure 32-bit alignment on parisc unwind section
    2acfff573042 parisc: Mark jump_table naturally aligned
    3793cd2ded7c parisc: Drop the HP-UX ENOSYM and EREMOTERELEASE error codes
    79a1fdf4c212 parisc: Mark lock_aligned variables 16-byte aligned on SMP
    41d7852a0a39 parisc: Use natural CPU alignment for bug_table
    c7c78a4aa60a parisc: Mark ex_table entries 32-bit aligned in uaccess.h
    645e4b693b5e parisc: Mark ex_table entries 32-bit aligned in assembly.h
    c23b9eaca80c powerpc: Don't clobber f0/vs0 during fp|altivec register save
    e6bc42fae6b8 KVM: PPC: Book3S HV: Fix KVM_RUN clobbering FP/VEC user registers
    59419ebcc0a6 iommu/vt-d: Add MTL to quirk list to skip TE disabling
    0b48970ce102 bcache: revert replacing IS_ERR_OR_NULL with IS_ERR
    fc98ea2699c0 dma-buf: fix check in dma_resv_add_fence
    4da1556996fa cpufreq/amd-pstate: Fix the return value of amd_pstate_fast_switch()
    9d4c721c1866 powercap: DTPM: Fix unneeded conversions to micro-Watts
    a62ca58bb3cc nvme: check for valid nvme_identify_ns() before using it
    82b5e603edd4 dm verity: don't perform FEC for failed readahead IO
    6f5a9fc94bfc dm verity: initialize fec io before freeing it
    7cfc3884a8bb drm/amd/display: fix ABM disablement
    859a3a9f1e6b drm/amd/display: Update min Z8 residency time to 2100 for DCN314
    6ef7f13c72df drm/amd/display: Use DRAM speed from validation for dummy p-state
    a67c18704706 drm/amd/display: Remove min_dst_y_next_start check for Z8
    33ed892f0cde drm/amd/display: Include udelay when waiting for INBOX0 ACK
    c5cf436c8969 drm/amdgpu: Force order between a read and write to the same address
    c60884296300 drm/amd: Enable PCIe PME from D3
    cebccbe80165 scsi: sd: Fix system start for ATA devices
    181fd67dc5b9 scsi: Change SCSI device boolean fields to single bit flags
    7d2faae81b57 dm-verity: align struct dm_verity_fec_io properly
    da9f55393f69 ALSA: hda/realtek: Add supported ALC257 for ChromeOS
    f4b130213497 ALSA: hda/realtek: Headset Mic VREF to 100%
    65654af4c8a6 ALSA: hda: Disable power-save on KONTRON SinglePC
    ba911edc6c0c mmc: block: Be sure to wait while busy in CQE error recovery
    eab9ec644637 mmc: block: Do not lose cache flush during CQE error recovery
    e121f6d73d2e mmc: block: Retry commands in CQE error recovery
    3a9a9c256f02 mmc: cqhci: Fix task clearing in CQE error recovery
    def67fd8efde mmc: cqhci: Warn of halt or task clear failure
    2ebc8b758c7d mmc: cqhci: Increase recovery halt timeout
    d2fc10e262b5 mmc: sdhci-pci-gli: Disable LPM during initialization
    87ceaa8521fc firewire: core: fix possible memory leak in create_units()
    db0b69e46da6 pinctrl: avoid reload of p state in list iteration
    74820f7406a1 smb: client: report correct st_size for SMB and NFS symlinks
    60fed17ca5b8 cifs: Fix FALLOC_FL_INSERT_RANGE by setting i_size after EOF moved
    6406cce4b22d cifs: Fix FALLOC_FL_ZERO_RANGE by setting i_size if EOF moved

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 78e7dd4d13..54f7f4efef 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "4c0acd6ff800dc4d1630b11640984343bffe7825"
-SRCREV_meta ?= "c5b4dd4dc469548ca1f7129c5c131f8d6cf5ff94"
+SRCREV_machine ?= "97d59da1d2d5a9ace6b4e7695b1eabbcd6197c4c"
+SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine;protocol=https \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA};protocol=https"
 
-LINUX_VERSION ?= "6.1.65"
+LINUX_VERSION ?= "6.1.66"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index d91ed65999..3e025e6726 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.65"
+LINUX_VERSION ?= "6.1.66"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_meta ?= "c5b4dd4dc469548ca1f7129c5c131f8d6cf5ff94"
+SRCREV_machine ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
 
 PV = "${LINUX_VERSION}+git"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index f431e4a937..18beb3c3a1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -18,25 +18,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "b14dc32b21c8770b4e635ec69611aa32fff230b3"
-SRCREV_machine:qemuarm64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemuloongarch64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemumips ?= "072df281d6a919a505df072b4741d49145cf3781"
-SRCREV_machine:qemuppc ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemuriscv64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemuriscv32 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemux86 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemux86-64 ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_machine:qemumips64 ?= "a5de8564807b47662da3670c5b358a1494faef77"
-SRCREV_machine ?= "e083231c43f3773e5ca1f6d46411e1fda1081a6e"
-SRCREV_meta ?= "c5b4dd4dc469548ca1f7129c5c131f8d6cf5ff94"
+SRCREV_machine:qemuarm ?= "7f7eb326b47065b720ad4c760b77d52021336f95"
+SRCREV_machine:qemuarm64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemuloongarch64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemumips ?= "638a98e4a2146f79a588b125d74addaae42f75a2"
+SRCREV_machine:qemuppc ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemuriscv64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemuriscv32 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemux86 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemux86-64 ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_machine:qemumips64 ?= "d39acda588fe786b00969ade6eef057d86386578"
+SRCREV_machine ?= "504b0b3be8465541ffb1c9a896d32841459efa0f"
+SRCREV_meta ?= "211dccdc1a71cd953c83f88a025adfa6b5c58ad4"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "c6114c845984144944f1abc07c61de219367a4da"
+SRCREV_machine:class-devupstream ?= "6c6a6c7e211cc02943dcb8c073919d2105054886"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -45,7 +45,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
 SRC_URI += "file://0001-perf-cpumap-Make-counter-as-unsigned-ints.patch"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.65"
+LINUX_VERSION ?= "6.1.66"
 
 PV = "${LINUX_VERSION}+git"
 
-- 
2.39.2


