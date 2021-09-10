Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web08.9692.1631282884387499596
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Sep 2021 07:08:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=LwntimOF;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id a66so2063019qkc.1
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Sep 2021 07:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=s/6G4FpIbJDAtp1pzT8erP+gDTk3kuIYNUMh2o7CSgg=;
        b=LwntimOFxou3gNK/GMtQJW1eJtT/7dEy86ehhKkfL0ldLt3ZrFL2027cYn9LnqWvcn
         aO7YzzwiotzixKkhTSKxxvX+K4yjkogo/iSN+J2RQwn8XNHPg0eEY07n72fNwBeZzbqq
         3+pqGYM9pb35t5Su8EHtLu2dJoXObyKiKSObMk/L/tAJ9Am0UQ5rwZsfrp2sc+mXd6si
         eOV6O8mf6M5ujWsC6ozm9rNnwUqKcJH1NrzK+cfvm+CMxZgQ6BdKrS+cfEGfRXFodw+3
         /oXD8Vg3nXV3ApascWvIXD9rNv7g4DP+eWjQQope2plV0WX46QMLFfTg20b7SgPf9QcL
         jesA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=s/6G4FpIbJDAtp1pzT8erP+gDTk3kuIYNUMh2o7CSgg=;
        b=b/3+Hk9kI0GBLMJ13ThbTiHOI6LDUJu8hf2mHns0uayDfQNSlTaDX5aXNz7IOR+L86
         zBt095yiZwOiqosPCeHMI4/E546FT8uktYAo4uX0T9K5NdcQRGStjXcQ7kLsiSWhvgXI
         PQlSxl56wo3mH/7WWc/T2oD2kUgmPggOTMT0sfeDt+MAcnX4Xz4AVH8IkX0z77iaOykG
         LeVkHMXpuhEeOsku4vcrG1Ld6XcVBiR/4Zisn1sT4WHia9wxmmHAo4HrgZR6nDUEzHw5
         jOWgpzMXB+zs4bd6/eZpWbBpgKw36wsSBKqvSPW3OwbwUvkWVIMpE9zyVARhRYMgnmlo
         floQ==
X-Gm-Message-State: AOAM53252yLQjjJa2PdDQLOXzMgVfGuRWRT083jVvW9R3etuF2R4763N
	IVqV11msqksHXAk97BHBLTtSBm3dfTxFcw==
X-Google-Smtp-Source: ABdhPJyqxNmowA4DdQfOAxciBO6TNKp/lu3/PU94uEcJtNYa11pg/nEZ0ZPWHhvxJNvR/2p2gLj2aw==
X-Received: by 2002:a05:620a:290d:: with SMTP id m13mr7707972qkp.426.1631282883340;
        Fri, 10 Sep 2021 07:08:03 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from build.lan (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id i16sm3128240qtq.52.2021.09.10.07.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Sep 2021 07:08:02 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/4] linux-yocto/5.10: update to v5.10.61
Date: Fri, 10 Sep 2021 10:07:57 -0400
Message-Id: <7fa8f673550e494e43b3993ec6f7df33eae20fe7.1631282594.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1631282594.git.bruce.ashfield@gmail.com>
References: <cover.1631282594.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    452ea6a15ed2 Linux 5.10.61
    f15e64267393 io_uring: only assign io_uring_enter() SQPOLL error in actual error case
    695ab28a7fa1 io_uring: fix xa_alloc_cycle() error return value check
    0d5fcfc6406e fs: warn about impending deprecation of mandatory locks
    8132fc2bf4b7 mm: memcontrol: fix occasional OOMs due to proportional memory.low reclaim
    53e81668e119 ASoC: intel: atom: Fix breakage for PCM buffer address setup
    88f65f57a0b9 ALSA: hda/realtek: Limit mic boost on HP ProBook 445 G8
    b6672f67ec28 PCI: Increase D3 delay for AMD Renoir/Cezanne XHCI
    a69326e134d4 s390/pci: fix use after free of zpci_dev
    05b56e05543c ALSA: hda/via: Apply runtime PM workaround for ASUS B23E
    67fece6289a9 btrfs: prevent rename2 from exchanging a subvol with a directory from different parents
    16cfa72766b5 mmc: sdhci-iproc: Set SDHCI_QUIRK_CAP_CLOCK_BASE_BROKEN on BCM2711
    2566c1d8239d mmc: sdhci-iproc: Cap min clock frequency on BCM2711
    110b7f72f6d0 ALSA: hda/realtek: Enable 4-speaker output for Dell XPS 15 9510 laptop
    258782b93701 ipack: tpci200: fix memory leak in the tpci200_register
    3ee1b08097c1 ipack: tpci200: fix many double free issues in tpci200_pci_probe
    0775bc462ae7 slimbus: ngd: reset dma setup during runtime pm
    45d6fc21cd4d slimbus: messaging: check for valid transaction id
    b700b523ddaf slimbus: messaging: start transaction ids from 1 instead of zero
    bd0c2f83d072 tracing / histogram: Fix NULL pointer dereference on strcmp() on NULL event name
    f7c125493c78 ALSA: hda - fix the 'Capture Switch' value change notifications
    7451c309c7a3 clk: qcom: gdsc: Ensure regulator init state matches GDSC state
    7203b4986d9a clk: imx6q: fix uart earlycon unwork
    3f8920c5706e mmc: sdhci-msm: Update the software timeout value for sdhc
    8f499a90e7ee mmc: mmci: stm32: Check when the voltage switch procedure should be done
    f8dac276a9b4 mmc: dw_mmc: Fix hang on data CRC error
    645fd92c3ed4 Revert "flow_offload: action should not be NULL when it is referenced"
    2f6c42806e10 iavf: Fix ping is lost after untrusted VF had tried to change MAC
    7873c29832a3 i40e: Fix ATR queue selection
    e003a8921949 r8152: fix writing USB_BP2_EN
    21ca0b18ad64 iommu/vt-d: Fix incomplete cache flush in intel_pasid_tear_down_entry()
    81578e587c08 iommu/vt-d: Consolidate duplicate cache invaliation code
    eee84eafc3bb ovs: clear skb->tstamp in forwarding path
    47a1161dacb1 net: mdio-mux: Handle -EPROBE_DEFER correctly
    13af9c81e62f net: mdio-mux: Don't ignore memory allocation errors
    df61235881c8 sch_cake: fix srchost/dsthost hashing mode
    e1ec5858bae1 ixgbe, xsk: clean up the resources in ixgbe_xsk_pool_enable error path
    3b7397b203cc net: qlcnic: add missed unlock in qlcnic_83xx_flash_read32
    9bc2d1a5a890 virtio-net: use NETIF_F_GRO_HW instead of NETIF_F_LRO
    b7adfde94930 virtio-net: support XDP when not more queues
    1ce62fe6e4cb vrf: Reset skb conntrack connection on VRF rcv
    8ae539a36194 bnxt_en: Add missing DMA memory barriers
    9751aa443695 bnxt_en: Disable aRFS if running on 212 firmware
    efd9b79b92a3 ptp_pch: Restore dependency on PCI
    85e0518f181a net: 6pack: fix slab-out-of-bounds in decode_data
    e0ae16836027 bnxt: count Tx drops
    296fe765dd02 bnxt: make sure xmit_more + errors does not miss doorbells
    d913d5cc3ba5 bnxt: disable napi before canceling DIM
    5b24ae8f05ca bnxt: don't lock the tx queue from napi poll
    585ff7344ec1 bpf: Clear zext_dst of dead insns
    8dfdeeb1e98e drm/mediatek: Add AAL output size configuration
    a8b8d61babb4 drm/mediatek: Fix aal size config
    6715cefa72f6 soc / drm: mediatek: Move DDP component defines into mtk-mmsys.h
    1b6fc6f739d4 vdpa/mlx5: Avoid destroying MR on empty iotlb
    ecdd7c488062 vhost: Fix the calculation in vhost_overflow()
    e0b603c89a93 bus: ti-sysc: Fix error handling for sysc_check_active_timer()
    1af7ccbd920a vhost-vdpa: Fix integer overflow in vhost_vdpa_process_iotlb_update()
    293180f59342 virtio: Protect vqs list access
    9108120fbe31 dccp: add do-while-0 stubs for dccp_pr_debug macros
    e352531ed020 cpufreq: armada-37xx: forbid cpufreq for 1.2 GHz variant
    d2ab5491de91 iommu: Check if group is NULL before remove device
    44f454a146c0 arm64: dts: qcom: msm8992-bullhead: Remove PSCI
    95ed753d91bf arm64: dts: qcom: c630: fix correct powerdown pin for WSA881x
    d7d04c67492e Bluetooth: hidp: use correct wait queue when removing ctrl_wait
    2e6cc93e1b8c drm/amd/display: workaround for hard hang on HPD on native DP
    dcc8c5fb8d85 drm/amd/display: Fix Dynamic bpp issue with 8K30 with Navi 1X
    8849a8c7058e net: usb: lan78xx: don't modify phy_device state concurrently
    735e613fa587 net: usb: pegasus: Check the return value of get_geristers() and friends;
    6b368411bc0f ARM: dts: nomadik: Fix up interrupt controller node names
    410d1ea4ff3a qede: fix crash in rmmod qede while automatic debug collection
    7525f2e4de00 drm/amdgpu: fix the doorbell missing when in CGPG issue for renoir.
    711459514e29 scsi: core: Fix capacity set to zero after offlinining device
    8071dbe1bdd0 scsi: core: Avoid printing an error if target_alloc() returns -ENXIO
    4f78db7df6ed scsi: scsi_dh_rdac: Avoid crash during rdac_bus_attach()
    cc312fa7e6ef scsi: megaraid_mm: Fix end of loop tests for list_for_each_entry()
    968ee9176a44 scsi: pm80xx: Fix TMF task completion race condition
    b353028aed92 dmaengine: of-dma: router_xlate to return -EPROBE_DEFER if controller is not yet available
    35f416223673 ARM: dts: am43x-epos-evm: Reduce i2c0 bus speed for tps65218
    505884a0c7a1 net: xfrm: Fix end of loop tests for list_for_each_entry
    f1c0533fae59 spi: spi-mux: Add module info needed for autoloading
    b618a32142c7 dmaengine: usb-dmac: Fix PM reference leak in usb_dmac_probe()
    c160df90b0ca dmaengine: xilinx_dma: Fix read-after-free bug when terminating transfers
    d4930271a409 USB: core: Fix incorrect pipe calculation in do_proc_control()
    ba6c1b004ac5 USB: core: Avoid WARNings for 0-length descriptor requests
    8e100c72b6de KVM: X86: Fix warning caused by stale emulation context
    47d4c7999799 KVM: x86: Factor out x86 instruction emulation with decoding
    ff2fc9e4aaa6 media: drivers/media/usb: fix memory leak in zr364xx_probe
    56320b1ad4d0 media: zr364xx: fix memory leaks in probe()
    b5c7ec6d15af media: zr364xx: propagate errors from zr364xx_start_readpipe()
    779a0f4347a4 mtd: cfi_cmdset_0002: fix crash when erasing/writing AMD cards
    e2036bc3fc7d ath9k: Postpone key cache entry deletion for TXQ frames reference it
    609c0cfd07f0 ath: Modify ath_key_delete() to not need full key entry
    2925a8385ec7 ath: Export ath_hw_keysetmac()
    6566c207e576 ath9k: Clear key cache explicitly on disabling hardware
    8f05076983dd ath: Use safer key clearing with key cache entries

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  4 ++--
 .../linux/linux-yocto-tiny_5.10.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index d1100817df..c53c6f74c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "c8efa3efd890f35f8037a8c3533ba52e6de83fdf"
+SRCREV_machine ?= "6cd3b8cc48adcec0f91a2f95d12679a8ceb3d77d"
 SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.60"
+LINUX_VERSION ?= "5.10.61"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index b2af273aa6..c142c9c996 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.60"
+LINUX_VERSION ?= "5.10.61"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,8 +15,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "ffaf70463da1502399f192470dae2d2fbdc7cfbc"
-SRCREV_machine ?= "f92b026dba8bd4e55a5cc88b6231f9118a6ac26b"
+SRCREV_machine:qemuarm ?= "b359e868f08a317762618a0c8240769ede6205ee"
+SRCREV_machine ?= "458347294271cddba33b7cfefabf83181eba3440"
 SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index f1fe87abda..5276657494 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,16 +13,16 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "1d02041bcc6eb8969d832e89b5c893d717b7ed04"
-SRCREV_machine:qemuarm64 ?= "2675ef4d9aefc588d16d085718866a33c62c10e6"
-SRCREV_machine:qemumips ?= "b503b2da9b2487453a9d9b0fa99654f00e1ad311"
-SRCREV_machine:qemuppc ?= "4ef9462af524cbbfcb719304a923e51f88cc3e68"
-SRCREV_machine:qemuriscv64 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
-SRCREV_machine:qemuriscv32 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
-SRCREV_machine:qemux86 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
-SRCREV_machine:qemux86-64 ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
-SRCREV_machine:qemumips64 ?= "2d0707a62d33b1626329fde6ed9e906f5aba3022"
-SRCREV_machine ?= "65ba2a0d8428c23b7b4375994d417157a35a251b"
+SRCREV_machine:qemuarm ?= "c21afa1c405a581d0fbec7df31cf7e4d61ceabb9"
+SRCREV_machine:qemuarm64 ?= "749a8e1ffe820d07371d35850e31201d8583b08a"
+SRCREV_machine:qemumips ?= "8feace594d68ec0c4cde54be4b6ed312bef6def2"
+SRCREV_machine:qemuppc ?= "25cc0f5de71a992745898b9da9f109f30adacc18"
+SRCREV_machine:qemuriscv64 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
+SRCREV_machine:qemuriscv32 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
+SRCREV_machine:qemux86 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
+SRCREV_machine:qemux86-64 ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
+SRCREV_machine:qemumips64 ?= "82f98a83c19c2a3e1d9b4b53a2117e84a37bb88d"
+SRCREV_machine ?= "815f74d88d7be5ca75dc8b98479d4d8e2736dcd7"
 SRCREV_meta ?= "bce2813b162bb472c137fb503951295a931c25b6"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
@@ -32,7 +32,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.60"
+LINUX_VERSION ?= "5.10.61"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

