Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web12.2411.1613620784684198702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:59:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=MDol1g4o;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id v19so360579qvl.7
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NJi3eG/e+fGLXf7wqFthhnS+GhOEdyYZodxPmVYzwgQ=;
        b=MDol1g4oIewHGmOZSAEmtapY6invS2ckdHRfRCuf4W9MzBlnyxwz9u4hD2HKY8jltx
         YLpu1JuQpVPxvG+Rr63EXwvoVRo56DCiq+WDUxaMnGmJHNFNJMAltywkitk1YZW7FbaB
         aIIPn7HHpI7Hn2kJv5sagPAcjpcs+IenPVVUbMuf1FK3Hv9MmPMeoD/5zAFdpvHeyrqx
         NnVYDMoIfOPZGvRuDZ6Z11AAsI57WDtS6Mngdw7Jw6hqCqcPP3RCx3Elp/eB4pHuhY6U
         do1vwVpz8Qr/YI3cPXs2qRb+JYN8tOsCfEXFi/0SsLjcgev6Y/Vt9aW6+7ehr3iEP9Ix
         TSLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NJi3eG/e+fGLXf7wqFthhnS+GhOEdyYZodxPmVYzwgQ=;
        b=pi30kExz+7HVNbHQ0oLoQcviqyK24qDslbzctsEBDa7HUZ4cCr4p/ImmKn0fYx+j56
         8rDTgWlLq1DzUre3Dbagkyco+fSVNMt1coO1SOXE2r386o6RwldHFQnxo4bjjeoyKYHm
         b4iUZzsEypTuwKlrXE8apHnPd2GypbCj/Bnt108Wo1WApWoYhEYpA+9Ry7b50TiqwGOo
         QaH8BHnnRxhgoJxc270pPWHq0TQcqDlolbIZb3LKVDpXRDJ3VFY2OwIU0OfmyDAi3VuD
         MJrYRTjsIKzw42GEt9YRSEWv/bydFOUGe6apfAoGfN4HA9RCr6X2zYbXqiwv71z23+oR
         3JIg==
X-Gm-Message-State: AOAM5305WNGvejC+Z17y4+rfCwZHs/j1ix419dCVNDAyRv5EPhQTAMmK
	qMfxDyhS3Vnl7UtHzW5/HX9hSQdK8jLBzUTt
X-Google-Smtp-Source: ABdhPJxYJRSMgwSV2O6hJnrefpxKJSxbW6Eu8o3IwMMI611xDS8wyoBRQ4dc0gDU8h+HdnjCtCRQNw==
X-Received: by 2002:ad4:584b:: with SMTP id de11mr2321088qvb.13.1613620783814;
        Wed, 17 Feb 2021 19:59:43 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id g9sm945184qth.53.2021.02.17.19.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:59:43 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 4/6] linux-yocto/5.10: update to v5.10.16
Date: Wed, 17 Feb 2021 22:59:36 -0500
Message-Id: <3f5cb5dd8b05b345470fe6200bb97e975321ab91.1613620662.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1613620662.git.bruce.ashfield@gmail.com>
References: <cover.1613620662.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    de53befa79cf Linux 5.10.16
    bddcce15cd1f squashfs: add more sanity checks in xattr id lookup
    5e22b39b377e squashfs: add more sanity checks in inode lookup
    6634147f5128 squashfs: add more sanity checks in id lookup
    ff3a75bda722 squashfs: avoid out of bounds writes in decompressors
    dd0a41bc17bb Revert "mm: memcontrol: avoid workload stalls when lowering memory.high"
    237ee28818a9 nilfs2: make splice write available again
    4e78c33874e5 drm/i915: Skip vswing programming for TBT
    43f39b85e9bd drm/i915: Fix ICL MG PHY vswing handling
    67afdc7d95b9 bpf: Fix verifier jsgt branch analysis on max bound
    1d16cc210fab bpf: Fix 32 bit src register truncation on div/mod
    569033c0825e bpf: Fix verifier jmp32 pruning decision logic
    bf9e4307920f regulator: Fix lockdep warning resolving supplies
    fb8f9b2f7d22 blk-cgroup: Use cond_resched() when destroy blkgs
    4d00f1bade78 i2c: mediatek: Move suspend and resume handling to NOIRQ phase
    518416a75c22 SUNRPC: Handle 0 length opaque XDR object data properly
    eda725f8cfe0 SUNRPC: Move simple_get_bytes and simple_get_netobj into private header
    6fb6d5410e41 iwlwifi: queue: bail out on invalid freeing
    38da9b033bec iwlwifi: mvm: guard against device removal in reprobe
    2262294d4258 iwlwifi: pcie: add rules to match Qu with Hr2
    492f762b9c16 iwlwifi: mvm: invalidate IDs of internal stations at mvm start
    05132a72cc1d iwlwifi: pcie: fix context info memory leak
    fbdf0bf97cb0 iwlwifi: pcie: add a NULL check in iwl_pcie_txq_unmap
    cc1d805aa544 iwlwifi: mvm: take mutex for calling iwl_mvm_get_sync_time()
    a90e8588f7eb iwlwifi: mvm: skip power command when unbinding vif during CSA
    428831e8e9aa ASoC: Intel: sof_sdw: set proper flags for Dell TGL-H SKU 0A5E
    b579c572d4cf ASoC: ak4458: correct reset polarity
    f0e3c36a5244 ALSA: hda: intel-dsp-config: add PCI id for TGL-H
    ff557bf971ad pNFS/NFSv4: Improve rejection of out-of-order layouts
    386b142945d3 pNFS/NFSv4: Try to return invalid layout in pnfs_layout_process()
    8007199fe372 chtls: Fix potential resource leak
    439ac48a33c5 ASoC: Intel: Skylake: Zero snd_ctl_elem_value
    4618aea34448 mac80211: 160MHz with extended NSS BW in CSA
    676575b93ddf drm/nouveau/nvif: fix method count when pushing an array
    4b877845e388 ASoC: wm_adsp: Fix control name parsing for multi-fw
    61e97f32fded regulator: core: avoid regulator_resolve_supply() race condition
    1c19d6ae581b af_key: relax availability checks for skb size calculation
    7f546959b378 powerpc/64/signal: Fix regression in __kernel_sigtramp_rt64() semantics
    3cb8393c4143 gpiolib: cdev: clear debounce period if line set to output
    5592eae7846c io_uring: drop mm/files between task_work_submit
    88dbd085a51e io_uring: reinforce cancel on flush during exit
    aa435155d396 io_uring: fix sqo ownership false positive warning
    8c7febfc919a io_uring: fix list corruption for splice file_get
    7250f333ce03 io_uring: fix flush cqring overflow list while TASK_INTERRUPTIBLE
    d300d03a93a2 io_uring: fix cancellation taking mutex while TASK_UNINTERRUPTIBLE
    52382df81d29 io_uring: replace inflight_wait with tctx->wait
    b462a7beab3f io_uring: fix __io_uring_files_cancel() with TASK_UNINTERRUPTIBLE
    f0ff1a95bfa8 io_uring: if we see flush on exit, cancel related tasks
    d16692a34e8e io_uring: account io_uring internal files as REQ_F_INFLIGHT
    1e7eb063a0f0 io_uring: fix files cancellation
    dbdcde4422df io_uring: always batch cancel in *cancel_files()
    f8fbdbb60793 io_uring: pass files into kill timeouts/poll
    49250f33bb43 io_uring: don't iterate io_uring_cancel_files()
    f6d93f855553 io_uring: add a {task,files} pair matching helper
    fe9334186a50 io_uring: simplify io_task_match()
    2d18b3ee633e Linux 5.10.15
    0414bde77968 net: sched: replaced invalid qdisc tree flush helper in qdisc_replace
    836f791aba58 net: dsa: mv88e6xxx: override existent unicast portvec in port_fdb_add
    3d6df63a5cbe udp: ipv4: manipulate network header of NATed UDP GRO fraglist
    f2b30f9f0889 net: ip_tunnel: fix mtu calculation
    6e4583ad6df0 neighbour: Prevent a dead entry from updating gc_list
    0a8a25d56a63 igc: Report speed and duplex as unknown when device is runtime suspended
    fe272570d003 md: Set prev_flush_start and flush_bio in an atomic way
    3a492e4403ee Input: ili210x - implement pressure reporting for ILI251x
    1841be8d0bc6 Input: xpad - sync supported devices with fork on GitHub
    b442912f678a Input: goodix - add support for Goodix GT9286 chip
    2ce5be67d134 x86/apic: Add extra serialization for non-serializing MSRs
    3dcf233b5845 x86/debug: Prevent data breakpoints on cpu_dr7
    b796770c6db3 x86/debug: Prevent data breakpoints on __per_cpu_offset
    c000dcfb3aed x86/debug: Fix DR6 handling
    2a2dfe6a319a x86/build: Disable CET instrumentation in the kernel
    032f8e04c035 mm/filemap: add missing mem_cgroup_uncharge() to __add_to_page_cache_locked()
    0a249ac189fc mm: thp: fix MADV_REMOVE deadlock on shmem THP
    9abdd2c05b59 mm/vmalloc: separate put pages and flush VM flags
    76303d3fab9f mm, compaction: move high_pfn to the for loop scope
    eca84ebef17f mm: hugetlb: remove VM_BUG_ON_PAGE from page_huge_active
    5b9631cb6f34 mm: hugetlb: fix a race between isolating and freeing page
    e334b1fec6f4 mm: hugetlb: fix a race between freeing and dissolving the page
    afe6c31b84f6 mm: hugetlbfs: fix cannot migrate the fallocated HugeTLB page
    2de0745463e3 ARM: 9043/1: tegra: Fix misplaced tegra_uart_config in decompressor
    384cddbee46f ARM: footbridge: fix dc21285 PCI configuration accessors
    cc7b2fc90916 ARM: dts; gta04: SPI panel chip select is active low
    160237c192c4 DTS: ARM: gta04: remove legacy spi-cs-high to make display work again
    7159239d2de1 KVM: x86: Set so called 'reserved CR3 bits in LM mask' at vCPU reset
    d73af5ae22d4 KVM: x86: Update emulator context mode if SYSENTER xfers to 64-bit mode
    46add0349ba3 KVM: x86: fix CPUID entries returned by KVM_GET_CPUID2 ioctl
    6c0e069ac6e8 KVM: x86: Allow guests to see MSR_IA32_TSX_CTRL even if tsx=off
    dd7f10523b19 KVM: x86/mmu: Fix TDP MMU zap collapsible SPTEs
    ff0c437a0e02 KVM: SVM: Treat SVM as unsupported when running as an SEV guest
    720639ef01f5 nvme-pci: avoid the deepest sleep state on Kingston A2000 SSDs
    4f25d448d947 io_uring: don't modify identity's files uncess identity is cowed
    2fd938741a79 drm/amd/display: Revert "Fix EDID parsing after resume from suspend"
    09c6d51b16ef drm/i915: Power up combo PHY lanes for for HDMI as well
    24946da51ce7 drm/i915: Extract intel_ddi_power_up_lanes()
    1f27c7362e2b drm/i915/display: Prevent double YUV range correction on HDR planes
    2545b18b9834 drm/i915/gt: Close race between enable_breadcrumbs and cancel_breadcrumbs
    1cd8e3ef7f68 drm/i915/gem: Drop lru bumping on display unpinning
    0fe98e455784 drm/i915: Fix the MST PBN divider calculation
    8ef4cf6abaa7 drm/dp/mst: Export drm_dp_get_vc_payload_bw()
    4f627ecde732 Fix unsynchronized access to sev members through svm_register_enc_region
    a03a8693b1a2 mmc: core: Limit retries when analyse of SDIO tuples fails
    57b452c5ab1e mmc: sdhci-pltfm: Fix linking err for sdhci-brcmstb
    2502610927ee smb3: fix crediting for compounding when only one request in flight
    b793e9fca633 smb3: Fix out-of-bounds bug in SMB2_negotiate()
    e2bb221a16ac iommu: Check dev->iommu in dev_iommu_priv_get() before dereferencing it
    7a3361e5ecf1 cifs: report error instead of invalid when revalidating a dentry fails
    c026844c6156 RISC-V: Define MAXPHYSMEM_1GB only for RV32
    57ea7b257a1a xhci: fix bounce buffer usage for non-sg list case
    ee23b9329ec2 scripts: use pkg-config to locate libcrypto
    0fe48a40ac63 genirq/msi: Activate Multi-MSI early when MSI_FLAG_ACTIVATE_EARLY is set
    d2415fde8cad genirq: Prevent [devm_]irq_alloc_desc from returning irq 0
    a80e9eee5003 libnvdimm/dimm: Avoid race between probe and available_slots_show()
    a2560f88e1c3 libnvdimm/namespace: Fix visibility of namespace resource attribute
    059e68da31b0 tracepoint: Fix race between tracing and removing tracepoint
    9e4a668f4f0a tracing: Use pause-on-trace with the latency tracers
    8ce84b8e8eb3 kretprobe: Avoid re-registration of the same kretprobe earlier
    fb03f14cc148 tracing/kprobe: Fix to support kretprobe events on unloaded modules
    43b5bdbf9644 fgraph: Initialize tracing_graph_pause at task creation
    8847a756e1df gpiolib: free device name on error path to fix kmemleak
    2ca1ddc32b88 mac80211: fix station rate table updates on assoc
    8ccf963c6227 ovl: implement volatile-specific fsync error behaviour
    a66f82a1de02 ovl: avoid deadlock on directory ioctl
    fb8caef7c020 ovl: fix dentry leak in ovl_get_redirect
    0e5cb872fbbb thunderbolt: Fix possible NULL pointer dereference in tb_acpi_add_link()
    19155473f3ba kbuild: fix duplicated flags in DEBUG_CFLAGS
    1897a8f0ef20 memblock: do not start bottom-up allocations with kernel_end
    346ea7cc27b7 vdpa/mlx5: Restore the hardware used index after change map
    c1debbaf158d nvmet-tcp: fix out-of-bounds access when receiving multiple h2cdata PDUs
    b9464c5f4663 ARM: dts: sun7i: a20: bananapro: Fix ethernet phy-mode
    38b83bcec904 net: ipa: pass correct dma_handle to dma_free_coherent()
    714c19bc1315 r8169: fix WoL on shutdown if CONFIG_DEBUG_SHIRQ is set
    397ae1a24502 net: mvpp2: TCAM entry enable should be written after SRAM data
    dec629e97261 net: lapb: Copy the skb before sending a packet
    6a5c3bac8054 net/mlx5e: Release skb in case of failure in tc update skb
    c2b2c4d24b40 net/mlx5e: Update max_opened_tc also when channels are closed
    11c2c8fb889d net/mlx5: Fix leak upon failure of rule creation
    ada342012b2d net/mlx5: Fix function calculation for page trees
    b5802b747596 ibmvnic: device remove has higher precedence over reset
    cd77dccc122f i40e: Revert "i40e: don't report link up for a VF who hasn't enabled queues"
    1ac8bec2205e igc: check return value of ret_val in igc_config_fc_after_link_up
    0cda16041858 igc: set the default return value to -IGC_ERR_NVM in igc_write_nvm_srwr
    8e081627f3a7 SUNRPC: Fix NFS READs that start at non-page-aligned offsets
    ceca8baed5d8 arm64: dts: ls1046a: fix dcfg address range
    e5ed4e08d850 rxrpc: Fix deadlock around release of dst cached on udp tunnel
    7fc1a5a50e6e r8169: work around RTL8125 UDP hw bug
    ee1709a311cd arm64: dts: meson: switch TFLASH_VDD_EN pin to open drain on Odroid-C4
    6f5ee57a68c7 bpf, preload: Fix build when $(O) points to a relative path
    72c8389fc7ff um: virtio: free vu_dev only with the contained struct device
    571fe1ba22c2 bpf, inode_storage: Put file handler if no storage was found
    9447d0f8a621 bpf, cgroup: Fix problematic bounds check
    ee3844e61706 bpf, cgroup: Fix optlen WARN_ON_ONCE toctou
    28ad17a5e936 vdpa/mlx5: Fix memory key MTT population
    636ef657eedf ARM: dts: stm32: Fix GPIO hog flags on DHCOM DRC02
    6ec543da64e1 ARM: dts: stm32: Disable optional TSC2004 on DRC02 board
    43019f6f8884 ARM: dts: stm32: Disable WP on DHCOM uSD slot
    f7a74822c6eb ARM: dts: stm32: Connect card-detect signal on DHCOM
    29aebc79169c ARM: dts: stm32: Fix polarity of the DH DRC02 uSD card detect
    25af99f88d3e arm64: dts: rockchip: Use only supported PCIe link speed on Pinebook Pro
    c2947904fbba arm64: dts: rockchip: fix vopl iommu irq on px30
    9b1996ae3a27 arm64: dts: amlogic: meson-g12: Set FL-adj property value
    4fcaf04963e2 Input: i8042 - unbreak Pegatron C15B
    bd508a509c2a arm64: dts: qcom: c630: keep both touchpad devices enabled
    4bcb395a7f67 ARM: OMAP1: OSK: fix ohci-omap breakage
    f808da6bc6e4 usb: xhci-mtk: break loop when find the endpoint to drop
    85f0409e9ce3 usb: xhci-mtk: skip dropping bandwidth of unchecked endpoints
    5139bf6a3455 usb: xhci-mtk: fix unreleased bandwidth data
    b6609c0a537b usb: dwc3: fix clock issue during resume in OTG mode
    750829e1931a usb: dwc2: Fix endpoint direction check in ep_from_windex
    039656997da3 usb: renesas_usbhs: Clear pipe running flag in usbhs_pkt_pop()
    75582ceb723e USB: usblp: don't call usb_set_interface if there's a single alt
    4025244544b8 usb: gadget: aspeed: add missing of_node_put
    c8e1dabc1e05 USB: gadget: legacy: fix an error code in eth_bind()
    d56e0ac9a1fc usb: host: xhci: mvebu: make USB 3.0 PHY optional for Armada 3720
    73b1de6b5ea3 USB: serial: option: Adding support for Cinterion MV31
    c43cb08791a2 USB: serial: cp210x: add new VID/PID for supporting Teraoka AD2000
    17fb12b4a756 USB: serial: cp210x: add pid/vid for WSDA-200-USB

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 2545e5aa9d..54996a8aee 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8c522d7f89f95f35786aee5ac2a0334c4fbe3f86"
-SRCREV_meta ?= "6a6087a6f214dad06eb807e7338d0d15182f5f9e"
+SRCREV_machine ?= "142456428adbf16db56572889232220afb201974"
+SRCREV_meta ?= "8f72218572b1d4a5f053ced2bbf0558d0557072d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.14"
+LINUX_VERSION ?= "5.10.16"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index de0d8bd477..8ecd10716a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.14"
+LINUX_VERSION ?= "5.10.16"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "41260ff8baf7b7ef9e9edd1148099c1b6e03bec7"
-SRCREV_machine ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_meta ?= "6a6087a6f214dad06eb807e7338d0d15182f5f9e"
+SRCREV_machine_qemuarm ?= "be720c1ce6d1cba2bb3815ad04773355339380ab"
+SRCREV_machine ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_meta ?= "8f72218572b1d4a5f053ced2bbf0558d0557072d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 0cfdd5f838..38b56c17bf 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "393a7dd5f995ee7b815b649fb8dea11869083de9"
-SRCREV_machine_qemuarm64 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_machine_qemumips ?= "2dafb3cec20ce5efae592d52e73744623d53b8a0"
-SRCREV_machine_qemuppc ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_machine_qemuriscv64 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_machine_qemux86 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_machine_qemux86-64 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_machine_qemumips64 ?= "199fb1fd43a6ad51599136aa077b6dbdb3aa1dd5"
-SRCREV_machine ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
-SRCREV_meta ?= "6a6087a6f214dad06eb807e7338d0d15182f5f9e"
+SRCREV_machine_qemuarm ?= "57a6fbd33df5c7f057f301387b03a70cdc582282"
+SRCREV_machine_qemuarm64 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_machine_qemumips ?= "79bd439bff3c9f95cac6fb81c76b559a404a32dc"
+SRCREV_machine_qemuppc ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_machine_qemuriscv64 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_machine_qemux86 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_machine_qemux86-64 ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_machine_qemumips64 ?= "07bda345fe202b1d2ce233ffc20b7570f78c9c7f"
+SRCREV_machine ?= "98eda36c9616b598b3586c7cc532e8e0ba8b3953"
+SRCREV_meta ?= "8f72218572b1d4a5f053ced2bbf0558d0557072d"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.14"
+LINUX_VERSION ?= "5.10.16"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

