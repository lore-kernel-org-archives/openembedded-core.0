Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.2396.1613620783183922830
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 19:59:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=JKl5/vaq;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id b14so992173qkk.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 19:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=F3T99n4lkOQ8YAbV1zTbshxWHn64SWvhGCeQecGEGrc=;
        b=JKl5/vaqGzZdOfSYxaREJbgJM6Ji8S/5oPoJt6IxJHISgCXTmhC8TztQqbEXhAqF5n
         Gibl+2IzGy7Uqsxd6EICNsBlD2O71QbN2GclviAtdfmgHeA15mamH6QlhqZaaKv3hWqY
         ghfCdK2MyKJAxG4a316weQ5n0zPh1BjLm+s0XTzEjRP83I5bwhf8mvP4WQWc2kNbdaAA
         TxI5YYAyTXb6lQNo2ybl38TUZCImBkspwf+M6d3idxur6uj9jtdn9Tk0Sk5UDddIt6sD
         9F5F+mKJFsrp/WEgG/E1F//inqgHmVEnI1XiajoSAskinto6LoVXBr657OKJgaZOdrmB
         0aAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=F3T99n4lkOQ8YAbV1zTbshxWHn64SWvhGCeQecGEGrc=;
        b=CeBxPyTMCqX64MGTn6VOHE9pvlEY9wd4/zgHPlKLrvSVBMfltlC+pZz6seJ0qiZzrm
         ynW/0zS2/aC3tZ9jgqMs2zbyRexVnUsr6JDMf+urDHwLSgUEAYYann7+WUS/Bgn4ZYvR
         JB8nP+CLcLXIo4zo8q6res1R98OhnNOq7kRmF7MO7KZVtLGcwKfURF0ON5aPDDU3lkJ1
         kk8Cwo1jdxqigrSXce8XP9MkYrBVegcMpsTK+EXQLhBJAg2n8nVc3aE/AXIs+HzjBv/W
         L2IA5K4Yq7wZ8wvFxhjG4nzBaVuA6Z/RBUF1aXzquNbx26rWo75d1iso1TfmeQsDy5hd
         L50Q==
X-Gm-Message-State: AOAM530Rst83A7/biFmAey2OQUEay2VEBNCacMre1TkkSR0Bc+a1Ujs6
	abRnfGMgIXFVmVTR4qkjaV8=
X-Google-Smtp-Source: ABdhPJzMgUd8dAWkUiJD8KvIx27LsHINHpTd7fo+VRBHE0G3jlwah2iiSicLL+nrXTL7KB4h4cDWKw==
X-Received: by 2002:a37:556:: with SMTP id 83mr2601231qkf.298.1613620782184;
        Wed, 17 Feb 2021 19:59:42 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id g9sm945184qth.53.2021.02.17.19.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 19:59:41 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] linux-yocto/5.10: update to v5.10.14
Date: Wed, 17 Feb 2021 22:59:34 -0500
Message-Id: <0943ae0653b9f524a360fef090f44bd4abd751b6.1613620662.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1613620662.git.bruce.ashfield@gmail.com>
References: <cover.1613620662.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    b0c8835fc649 Linux 5.10.14
    b80df6517d35 workqueue: Restrict affinity change to rescuer
    b20475a80b4b kthread: Extract KTHREAD_IS_PER_CPU
    d8649eb8e352 x86/cpu: Add another Alder Lake CPU to the Intel family
    9c8bb3eac07d objtool: Don't fail the kernel build on fatal errors
    4587cb6f27a6 habanalabs: disable FW events on device removal
    90981a2171b9 habanalabs: fix backward compatibility of idle check
    4439d22c3758 habanalabs: zero pci counters packet before submit to FW
    e8911b02ccb6 drm/amd/display: Fixed corruptions on HPDRX link loss restore
    932ab13b8af3 drm/amd/display: Use hardware sequencer functions for PG control
    95850b9d0b23 drm/amd/display: Change function decide_dp_link_settings to avoid infinite looping
    a2245a995563 drm/amd/display: Allow PSTATE chnage when no displays are enabled
    af2fc0f4acb6 drm/amd/display: Update dram_clock_change_latency for DCN2.1
    89ca15b71b91 selftests/powerpc: Only test lwm/stmw on big endian
    713373080c7e platform/x86: thinkpad_acpi: Add P53/73 firmware to fan_quirk_table for dual fan control
    f243b5dd9837 nvmet: set right status on error in id-ns handler
    3e554aa3d08a nvme-pci: allow use of cmb on v1.4 controllers
    82ae0714c344 nvme-tcp: avoid request double completion for concurrent nvme_tcp_timeout
    3b87f9b06245 nvme-rdma: avoid request double completion for concurrent nvme_rdma_timeout
    57f26d9d09d6 nvme: check the PRINFO bit before deciding the host buffer length
    a9fd4ef6e50c udf: fix the problem that the disc content is not displayed
    40545c4dd90c i2c: tegra: Create i2c_writesl_vi() to use with VI I2C for filling TX FIFO
    6826f0b4a159 ALSA: hda: Add Cometlake-R PCI ID
    b45a47e9adfc scsi: ibmvfc: Set default timeout to avoid crash during migration
    cedc60fbd7a1 mac80211: fix encryption key selection for 802.3 xmit
    20790b2534f2 mac80211: fix fast-rx encryption check
    c2601c9c2a96 mac80211: fix incorrect strlen of .write in debugfs
    9d6dbf4e3721 objtool: Don't add empty symbols to the rbtree
    91a585783dff ALSA: hda: Add AlderLake-P PCI ID and HDMI codec vid
    1fe0ce2f9afd ASoC: SOF: Intel: hda: Resume codec to do jack detection
    946d15aa09d3 scsi: fnic: Fix memleak in vnic_dev_init_devcmd2
    47daa439c389 scsi: libfc: Avoid invoking response handler twice if ep is already completed
    28693cc0fc0d scsi: scsi_transport_srp: Don't block target in failfast state
    5929bcb4a49d x86: __always_inline __{rd,wr}msr()
    d2c880ed2cff locking/lockdep: Avoid noinstr warning for DEBUG_LOCKDEP
    2f2a4c04b889 habanalabs: fix dma_addr passed to dma_mmap_coherent
    a55c4bf2c8f0 platform/x86: intel-vbtn: Support for tablet mode on Dell Inspiron 7352
    a8f69a32ee91 platform/x86: touchscreen_dmi: Add swap-x-y quirk for Goodix touchscreen on Estar Beauty HD tablet
    4d06445ad762 tools/power/x86/intel-speed-select: Set higher of cpuinfo_max_freq or base_frequency
    f667433cb379 tools/power/x86/intel-speed-select: Set scaling_max_freq to base_frequency
    0c1a24a098a8 phy: cpcap-usb: Fix warning for missing regulator_disable
    c4e8fa21a30b iommu/vt-d: Do not use flush-queue when caching-mode is on
    c7cd7a3b5076 ARM: 9025/1: Kconfig: CPU_BIG_ENDIAN depends on !LD_IS_LLD
    d9655c6854a6 Revert "x86/setup: don't remove E820_TYPE_RAM for pfn 0"
    a2c7d0667cf3 arm64: Do not pass tagged addresses to __is_lm_address()
    25fd5f8f8a23 arm64: Fix kernel address detection of __is_lm_address()
    beba2ac6b120 arm64: dts: meson: Describe G12b GPU as coherent
    9e96f711171c drm/panfrost: Support cache-coherent integrations
    b58486200402 iommu/io-pgtable-arm: Support coherency for Mali LPAE
    3766a00d765d ibmvnic: Ensure that CRQ entry read are correctly ordered
    c71bfc5f13c3 net: switchdev: don't set port_obj_info->handled true when -EOPNOTSUPP
    370ce41d2e58 net: dsa: bcm_sf2: put device node before return
    a555c2faf02e mlxsw: spectrum_span: Do not overwrite policer configuration
    3c564a9f9e43 stmmac: intel: Configure EHL PSE0 GbE and PSE1 GbE to 32 bits DMA addressing
    fb8e6a0b3c66 net: octeontx2: Make sure the buffer is 128 byte aligned
    d51f7ff5413b net: fec: put child node on error path
    cedbfddf4dab net: stmmac: dwmac-intel-plat: remove config data on error
    1aa4ee0ec7fe net: dsa: microchip: Adjust reset release timing to match reference reset circuit
    0c245c5fe93f Linux 5.10.13
    55d900415b81 vsock: fix the race conditions in multi-transport support
    a9cd144eb745 tcp: fix TLP timer not set when CA_STATE changes from DISORDER to OPEN
    011c3d9427da tcp: make TCP_USER_TIMEOUT accurate for zero window probes
    bcc83b43e1ed team: protect features update by RCU to avoid deadlock
    01de4bc09d38 scsi: qla2xxx: Fix description for parameter ql2xenforce_iocb_limit
    1e3a8d94dd6b ASoC: topology: Fix memory corruption in soc_tplg_denum_create_values()
    4a97f42a6690 ASoC: topology: Properly unregister DAI on removal
    52a2895f122d ASoC: mediatek: mt8183-mt6358: ignore TDM DAI link by default
    8cd91442d9a2 ASoC: mediatek: mt8183-da7219: ignore TDM DAI link by default
    5a48918811c8 NFC: fix possible resource leak
    e10a1aad5f7c NFC: fix resource leak when target index is invalid
    2e83a57a23a6 rxrpc: Fix memory leak in rxrpc_lookup_local
    99bacbcd5621 selftests: forwarding: Specify interface when invoking mausezahn
    c9e668a196db nvme-multipath: Early exit if no path is available
    cf7ed01e02c0 iommu/vt-d: Correctly check addr alignment in qi_flush_dev_iotlb_pasid()
    974b6289e8da iommu/amd: Use IVHD EFR for early initialization of IOMMU features
    57e2393f5de0 of/device: Update dma_range_map only when dev has valid dma-ranges
    aa8604fe63d1 ACPI/IORT: Do not blindly trust DMA masks from firmware
    f3d8e20e11ae can: dev: prevent potential information leak in can_fill_info()
    17dbec01beb9 net/mlx5: CT: Fix incorrect removal of tuple_nat_node from nat rhashtable
    f5430661f2f7 net/mlx5e: Revert parameters on errors when changing MTU and LRO state without reset
    f24b493eba50 net/mlx5e: Revert parameters on errors when changing trust state without reset
    890f413ae524 net/mlx5e: Correctly handle changing the number of queues when the interface is down
    e1e71f1eb74c net/mlx5e: Fix CT rule + encap slow path offload and deletion
    bf1864854ab2 net/mlx5e: Disable hw-tc-offload when MLX5_CLS_ACT config is disabled
    1a06120d6ff2 net/mlx5: Maintain separate page trees for ECPF and PF functions
    034bd75f619f net/mlx5e: Reduce tc unsupported key print level
    a1b500010f09 net/mlx5e: free page before return
    2778913fb080 net/mlx5e: E-switch, Fix rate calculation for overflow
    d62665cac603 net/mlx5: Fix memory leak on flow table creation error flow
    4c919b215bb3 igc: fix link speed advertising
    d11a1402ec16 i40e: acquire VSI pointer only after VF is initialized
    b2a76ea0479e ice: Fix MSI-X vector fallback logic
    04cd96db6f88 ice: Don't allow more channels than LAN MSI-X available
    55717a10a6b8 ice: update dev_addr in ice_set_mac_address even if HW filter exists
    35c50e69af15 ice: Implement flow for IPv6 next header (extension header)
    bdcd8b9d8249 ice: fix FDir IPv6 flexbyte
    1c3b27b05a43 mac80211: pause TX while changing interface type
    a59a7b96dc13 iwlwifi: pcie: reschedule in long-running memory reads
    bcb9c4009618 iwlwifi: pcie: use jiffies for memory read spin time limit
    05bb42538d90 iwlwifi: pcie: set LTR on more devices
    92044488a8d3 iwlwifi: pnvm: don't try to load after failures
    fb1e501d8a69 iwlwifi: pnvm: don't skip everything when not reloading
    c00b0b65b3b3 iwlwifi: pcie: avoid potential PNVM leaks
    fd8c453d53f8 ASoC: qcom: lpass: Fix out-of-bounds DAI ID lookup
    b030ba7f1294 ASoC: SOF: Intel: soundwire: fix select/depend unmet dependencies
    d46c0d64dbcd pNFS/NFSv4: Update the layout barrier when we schedule a layoutreturn
    dba0d4b1508b pNFS/NFSv4: Fix a layout segment leak in pnfs_layout_process()
    ae02c0008c27 powerpc/64s: prevent recursive replay_soft_interrupts causing superfluous interrupt
    5f78c6ce1f6f ASoC: Intel: Skylake: skl-topology: Fix OOPs ib skl_tplg_complete
    cea3d7cd951a spi: altera: Fix memory leak on error path
    2bfc7e605aaf ASoC: qcom: lpass-ipq806x: fix bitwidth regmap field
    02e5a1ee97a1 ASoC: qcom: Fix broken support to MI2S TERTIARY and QUATERNARY
    c74d671e7154 ASoC: qcom: Fix incorrect volatile registers
    52178bea2cf5 ASoC: dt-bindings: lpass: Fix and common up lpass dai ids
    571a2dd89818 RDMA/cxgb4: Fix the reported max_recv_sge value
    0fade2af3eae firmware: imx: select SOC_BUS to fix firmware build
    bd10eba71351 arm64: dts: imx8mp: Correct the gpio ranges of gpio3
    50c701d94f64 ARM: dts: imx6qdl-sr-som: fix some cubox-i platforms
    fd59c86ac9b0 ARM: dts: imx6qdl-kontron-samx6i: fix i2c_lcd/cam default status
    d871650a7d06 ARM: imx: fix imx8m dependencies
    9f87dd2fe3f2 arm64: dts: ls1028a: fix the offset of the reset register
    6daa52884c3f xfrm: Fix wraparound in xfrm_policy_addr_delta()
    8ea899803bb5 selftests: xfrm: fix test return value override issue in xfrm_policy.sh
    2f7ecc841daa xfrm: fix disable_xfrm sysctl when used on xfrm interfaces
    f632d34091e6 xfrm: Fix oops in xfrm_replay_advance_bmp
    f39005edf513 Revert "block: simplify set_init_blocksize" to regain lost performance
    34b0c04c884c Revert "RDMA/mlx5: Fix devlink deadlock on net namespace deletion"
    28adabf8cdd2 netfilter: nft_dynset: add timeout extension to template
    fec7ae28d905 ARM: zImage: atags_to_fdt: Fix node names on added root nodes
    69da790360f3 ARM: imx: build suspend-imx6.S with arm instruction set
    d095985e1ce1 clk: qcom: gcc-sm250: Use floor ops for sdcc clks
    cee27fcc8ccf clk: mmp2: fix build without CONFIG_PM
    c143ab555679 clk: imx: fix Kconfig warning for i.MX SCU clk
    20786fdd2fb0 blk-mq: test QUEUE_FLAG_HCTX_ACTIVE for sbitmap_shared in hctx_may_queue
    7d6e01e27560 xen-blkfront: allow discard-* nodes to be optional
    a164789b86c6 tee: optee: replace might_sleep with cond_resched
    d1fd90bf5554 KVM: Documentation: Fix spec for KVM_CAP_ENABLE_CAP_VM
    c48f69093e5e uapi: fix big endian definition of ipv6_rpl_sr_hdr
    921f48afdd3a drm/i915/selftest: Fix potential memory leak
    7306177c9ed3 drm/i915: Check for all subplatform bits
    e4d2a196fdc5 drm/nouveau/dispnv50: Restore pushing of all data.
    e50b0cb7da81 drm/vc4: Correct POS1_SCL for hvs5
    21e3ad805486 drm/vc4: Correct lbm size and calculation
    112821f254b6 drm/nouveau/svm: fail NOUVEAU_SVM_INIT ioctl on unsupported devices
    1310c7a48279 ARM: dts: imx6qdl-kontron-samx6i: fix pwms for lcd-backlight
    99bb37ab284c net/mlx5e: Fix IPSEC stats
    37ef64511f31 drm/i915/pmu: Don't grab wakeref when enabling events
    520d05a77b28 drm/i915/gt: Clear CACHE_MODE prior to clearing residuals
    800ca7687c87 iwlwifi: Fix IWL_SUBDEVICE_NO_160 macro to use the correct bit.
    621f05288c3d mt7601u: fix rx buffer refcounting
    cfe3425c5acd mt76: mt7663s: fix rx buffer refcounting
    083274407a8e mt7601u: fix kernel crash unplugging the device
    b04c1c534b66 arm64: dts: broadcom: Fix USB DMA address translation for Stingray
    736924801c1d leds: trigger: fix potential deadlock with libata
    5f3d54c00f1f xen: Fix XenStore initialisation for XS_LOCAL
    bc79ff0b1a19 io_uring: fix wqe->lock/completion_lock deadlock
    256a0040c6c9 KVM: Forbid the use of tagged userspace addresses for memslots
    e895a39a2bcd KVM: x86: get smi pending status correctly
    427adbb3be8a KVM: nVMX: Sync unsync'd vmcs02 state to vmcs12 on migration
    cffcb5e0fe2c KVM: x86: allow KVM_REQ_GET_NESTED_STATE_PAGES outside guest mode for VMX
    0faceb7d6dda KVM: nSVM: cancel KVM_REQ_GET_NESTED_STATE_PAGES on nested vmexit
    dca38d7f33bf KVM: arm64: Filter out v8.1+ events on v8.0 HW
    a519d9804456 KVM: x86/pmu: Fix UBSAN shift-out-of-bounds warning in intel_pmu_refresh()
    0517693dcc41 KVM: x86/pmu: Fix HW_REF_CPU_CYCLES event pseudo-encoding in intel_arch_events[]
    2175bf57dc95 btrfs: fix possible free space tree corruption with online conversion
    f343bf1aaf55 btrfs: fix lockdep warning due to seqcount_mutex on 32bit arch
    767c8777ce9c drivers: soc: atmel: add null entry at the end of at91_soc_allowed_list[]
    6975f470ca5d drivers: soc: atmel: Avoid calling at91_soc_init on non AT91 SoCs
    326644a0ede0 crypto: marvel/cesa - Fix tdma descriptor on 64-bit
    c6da54164497 efi/apple-properties: Reinstate support for boolean properties
    4c973f75074a x86/entry: Emit a symbol for register restoring thunk
    c95981ecd985 PM: hibernate: flush swap writer after marking
    e6e9ded8ffa4 s390/vfio-ap: No need to disable IRQ after queue reset
    9218a6b031a1 s390: uv: Fix sysfs max number of VCPUs reporting
    6c6bd9dd1c8d net: usb: qmi_wwan: added support for Thales Cinterion PLSx3 modem family
    1a39162bac95 bcache: only check feature sets when sb->version >= BCACHE_SB_VERSION_CDEV_WITH_FEATURES
    cc11bd18d4a3 drivers/nouveau/kms/nv50-: Reject format modifiers for cursor planes
    29d35b73ead4 drm/i915/gt: Always try to reserve GGTT address 0x0
    aa39818d9256 drm/i915: Always flush the active worker before returning from the wait
    5ebb1cbe463f drm/nouveau/kms/gk104-gp1xx: Fix > 64x64 cursors
    0634449e9977 Revert "drm/amdgpu/swsmu: drop set_fan_speed_percent (v2)"
    39714b66a8b1 ASoC: AMD Renoir - refine DMI entries for some Lenovo products
    b444b86e37b2 x86/xen: avoid warning in Xen pv guest with CONFIG_AMD_MEM_ENCRYPT enabled
    d16c5dfe93ef wext: fix NULL-ptr-dereference with cfg80211's lack of commit()
    442278e4928e ARM: dts: imx6qdl-gw52xx: fix duplicate regulator naming
    a9079d8d3b02 ARM: dts: ux500: Reserve memory carveouts
    14e3388f2f95 ARM: dts: tbs2910: rename MMC node aliases
    b3b75f8cd187 media: rc: ensure that uevent can be read directly after rc device register
    ce9e154a8bcb media: rc: ite-cir: fix min_timeout calculation
    8429fee29143 media: rc: fix timeout handling after switch to microsecond durations
    4b5a88b3f45c media: hantro: Fix reset_raw_fmt initialization
    ae584fbbb658 media: cedrus: Fix H264 decoding
    e76b40d8e9ad media: cec: add stm32 driver
    6141f82fd5ee parisc: Enable -mlong-calls gcc option by default when !CONFIG_MODULES
    d56e3b6a6b14 ALSA: hda/via: Apply the workaround generically for Clevo machines
    eacb5d4e6b64 ALSA: hda/realtek: Enable headset of ASUS B1400CEPE with ALC256
    aa9a6dc62611 kernel: kexec: remove the lock operation of system_transition_mutex
    2aa7eab3e7f0 ACPI: thermal: Do not call acpi_thermal_check() directly
    d6f80e01fade ACPI: sysfs: Prefer "compatible" modalias
    8fe07159fc53 tty: avoid using vfs_iocb_iter_write() for redirected console writes
    41f6f4a31435 nbd: freeze the queue while we're adding connections
    51f58c4882ec iwlwifi: provide gso_type to GSO packets

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 3e469bb02a..2545e5aa9d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "631d91f7275e350638157d52232fb34bd212a8f4"
-SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
+SRCREV_machine ?= "8c522d7f89f95f35786aee5ac2a0334c4fbe3f86"
+SRCREV_meta ?= "6a6087a6f214dad06eb807e7338d0d15182f5f9e"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.12"
+LINUX_VERSION ?= "5.10.14"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 9c0ac98a94..de0d8bd477 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.12"
+LINUX_VERSION ?= "5.10.14"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "acfa890cd51fe66cdcee10c0eb031a07da423a3c"
-SRCREV_machine ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
+SRCREV_machine_qemuarm ?= "41260ff8baf7b7ef9e9edd1148099c1b6e03bec7"
+SRCREV_machine ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_meta ?= "6a6087a6f214dad06eb807e7338d0d15182f5f9e"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index b56dadea69..0cfdd5f838 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "3ea1273f3112f558eb8176bfc67b8dd65a3b16ac"
-SRCREV_machine_qemuarm64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_machine_qemumips ?= "9685593f232f431e8fc3a756d4fcb50ee3c6dea1"
-SRCREV_machine_qemuppc ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_machine_qemuriscv64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_machine_qemux86 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_machine_qemux86-64 ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_machine_qemumips64 ?= "3bf957724edd501fbb634e271224b49aaf186bba"
-SRCREV_machine ?= "cdca78778415b4b3bd64e8390ee8adf04bf7e17a"
-SRCREV_meta ?= "5833ca701711d487c9094bd1efc671e8ef7d001e"
+SRCREV_machine_qemuarm ?= "393a7dd5f995ee7b815b649fb8dea11869083de9"
+SRCREV_machine_qemuarm64 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_machine_qemumips ?= "2dafb3cec20ce5efae592d52e73744623d53b8a0"
+SRCREV_machine_qemuppc ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_machine_qemuriscv64 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_machine_qemux86 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_machine_qemux86-64 ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_machine_qemumips64 ?= "199fb1fd43a6ad51599136aa077b6dbdb3aa1dd5"
+SRCREV_machine ?= "cf12f17b160deadd80de910ca4c69224e586d22f"
+SRCREV_meta ?= "6a6087a6f214dad06eb807e7338d0d15182f5f9e"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.12"
+LINUX_VERSION ?= "5.10.14"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

