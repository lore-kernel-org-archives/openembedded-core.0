Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7079BC3F2D4
	for <webhook@archiver.kernel.org>; Thu, 14 Jul 2022 19:15:10 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.268.1657826096482073373
 for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hLlku3pU;
 spf=pass (domain: gmail.com, ip: 209.85.219.43,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id g9so2175670qvq.7
        for <openembedded-core@lists.openembedded.org>;
 Thu, 14 Jul 2022 12:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6bEK/OziizS3hEvSktAdGb58BsbqCGkH5lj7jiMj5w0=;
        b=hLlku3pUnGVVg3f37ASw7lOoe+mEtu0o6RR/dg1pZTwGOJWLbgjrFwCBBuuC2SWehw
         jGQsnKWFr02MtU9C8UpdJFlOy65JJ1eY45PqSHiAcugbdcubzea9iNFLMrio34tprFti
         W1fP/BF8iN6I3EuoJn3A4dBSh4qeno7SrpKA7hRu5yv/SEcvNxCzTq7pwoKDMeAss+gs
         leP2iARgOoVcg0cHHGwjTjOa2nhNugrEGEWyrawTPBLJUBp+x7DGSgeKx3ChwDNeRLOc
         +uSW0OsrKkbxADX1WwrJmTB7vFhwqjZWTMMy6NH3sArF5CH3CRklsZ5qZfqtOFpKfItk
         yZhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6bEK/OziizS3hEvSktAdGb58BsbqCGkH5lj7jiMj5w0=;
        b=34kxrpox4fUWoUeSqDYIACuQRhU/ePIaNfzpEO07nsBNJnOrvtZcpgvCficRWbqrlj
         /DVXJ8Ab1SsVjaBANrkPhq0oggHq2jynzVNIEk1I89bYgB1UDgGQ6qd/1O1CStOBb4Am
         vdPeWzfUFh5kd9V/mvX0kUiv/J9s1s4WESmPukt5B+omI7Zj+L/d7eSSDGTNsZW3eIHf
         fBYu8+FfO5M8xtx1HIuz5FXuYZhdX7kC1M86uTNWuZ33VT0mkEeMGDeNLvvft5PK9cys
         PW+9R0KrXW+m7ybNqZ9UA3yyzKQyCCUDA8kLapd7+S30mBBkV+wsVqK9L/i2rDdPteSq
         AALg==
X-Gm-Message-State: AJIora89DOl8KC0qveXmfcov0c4miJfLZ0VFfl0jeaZqYiahTDWK7u2G
	M+C5gxZfcczeIToDxKqBx8f6+Qe8Qr6EWg==
X-Google-Smtp-Source: 
 AGRyM1tGw5/jm5yg6OZiJRHjUTRGknnjK0HNIZlnPcZFJ4smUyqhwhVidhTTs8xTdyvzRPQisCmwRA==
X-Received: by 2002:ad4:5bc6:0:b0:473:74d1:2146 with SMTP id
 t6-20020ad45bc6000000b0047374d12146mr8955701qvt.51.1657826103240;
        Thu, 14 Jul 2022 12:15:03 -0700 (PDT)
Received: from build.lan ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 d11-20020a05620a240b00b006b253a6dd1fsm1966022qkn.125.2022.07.14.12.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 12:15:01 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 05/10] linux-yocto/5.15: update to v5.15.54
Date: Thu, 14 Jul 2022 15:14:48 -0400
Message-Id: 
 <08b2ae81c02654aab8c01eb42b5f1bfd15d29145.1657825809.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1657825809.git.bruce.ashfield@gmail.com>
References: <cover.1657825809.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 14 Jul 2022 19:15:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168045

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    843dae1756d9 Linux 5.15.54
    c0c041a60cac selftests/net: fix section name when using xdp_dummy.o
    a5fe76328ea5 dmaengine: idxd: force wq context cleanup on device disable path
    568b2bd79b59 dmaengine: ti: Add missing put_device in ti_dra7_xbar_route_allocate
    2f6ded79068c dmaengine: qcom: bam_dma: fix runtime PM underflow
    cb9813d7eae9 dmaengine: ti: Fix refcount leak in ti_dra7_xbar_route_allocate
    e08ccbaa5fb3 dmaengine: at_xdma: handle errors of at_xdmac_alloc_desc() correctly
    c787908bee3f dmaengine: lgm: Fix an error handling path in intel_ldma_probe()
    0bbb30d077f2 dmaengine: pl330: Fix lockdep warning about non-static key
    8b07022de2d3 ida: don't use BUG_ON() for debugging
    9839d89112d4 dt-bindings: dma: allwinner,sun50i-a64-dma: Fix min/max typo
    e99bad0d76cf Revert "serial: 8250_mtk: Make sure to select the right FEATURE_SEL"
    2fa22e7906c1 Revert "mm/memory-failure.c: fix race with changing page compound again"
    c1c98764c3c3 misc: rtsx_usb: set return value in rsp_buf alloc err path
    bab1a05a1141 misc: rtsx_usb: use separate command and response buffers
    378080b7d8dd misc: rtsx_usb: fix use of dma mapped buffer for usb bulk transfer
    d76704f8ccbb dmaengine: imx-sdma: Allow imx8m for imx7 FW revs
    530ee8d3c6a4 i2c: cadence: Unregister the clk notifier in error path
    941d77b795d1 r8169: fix accessing unset transport header
    3abec0b38173 selftests: forwarding: fix error message in learning_test
    1b74fe2e8f5c selftests: forwarding: fix learning_test when h1 supports IFF_UNICAST_FLT
    8e5fcfecd99a selftests: forwarding: fix flood_unicast_test when h2 supports IFF_UNICAST_FLT
    3fdca34e7811 ibmvnic: Properly dispose of all skbs during a failover.
    5912e5e47ac9 ARM: dts: stm32: add missing usbh clock and fix clk order on stm32mp15
    d5670adf5cff ARM: dts: stm32: use usbphyc ck_usbo_48m as USBH OHCI clock on stm32mp151
    ddec6cbbe227 i40e: Fix VF's MAC Address change on VM
    9d1e322a9103 i40e: Fix dropped jumbo frames statistics
    d2bf1a6480e8 i2c: piix4: Fix a memory leak in the EFCH MMIO support
    e7a1d5100921 xsk: Clear page contiguity bit when unmapping pool
    a2b92fffd51b ARM: at91: fix soc detection for SAM9X60 SiPs
    e3ee4ffa3c92 ARM: dts: at91: sama5d2_icp: fix eeprom compatibles
    f5b0e6d7b453 ARM: dts: at91: sam9x60ek: fix eeprom compatible and size
    a65b92628ae0 ARM: at91: pm: use proper compatibles for sama7g5's rtc and rtt
    cfd0e717bd93 ARM: at91: pm: use proper compatibles for sam9x60's rtc and rtt
    9ec5fe55ba75 ARM: at91: pm: use proper compatible for sama5d2's rtc
    ec5533b2ce26 arm64: dts: qcom: msm8992-*: Fix vdd_lvs1_2-supply typo
    76292cf4b3bc pinctrl: sunxi: sunxi_pconf_set: use correct offset
    c041165d8f04 arm64: dts: imx8mp-phyboard-pollux-rdk: correct i2c2 & mmc settings
    44826474a39a arm64: dts: imx8mp-phyboard-pollux-rdk: correct eqos pad settings
    ea8dbe870c84 arm64: dts: imx8mp-phyboard-pollux-rdk: correct uart pad settings
    67a21eb8c48e arm64: dts: imx8mp-evk: correct I2C3 pad settings
    b34da817e3fa arm64: dts: imx8mp-evk: correct I2C1 pad settings
    37413a0ea090 arm64: dts: imx8mp-evk: correct eqos pad settings
    ebad4d73ab1c arm64: dts: imx8mp-evk: correct vbus pad settings
    f1571c8c8724 arm64: dts: imx8mp-evk: correct gpio-led pad settings
    637b3dab51f7 arm64: dts: imx8mp-evk: correct the uart2 pinctl value
    401d27fec614 arm64: dts: imx8mp-evk: correct mmc pad settings
    ee1ced3dd863 ARM: mxs_defconfig: Enable the framebuffer
    89a718d1d080 arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node
    216094007699 arm64: dts: qcom: msm8994: Fix CPU6/7 reg values
    4157343a6a1a ASoC: codecs: rt700/rt711/rt711-sdca: resume bus/codec in .set_jack_detect
    ac80a45ddb62 ASoC: rt711-sdca: Add endianness flag in snd_soc_component_driver
    25e61636a5c3 ASoC: rt711: Add endianness flag in snd_soc_component_driver
    29029ca6eed7 pinctrl: sunxi: a83t: Fix NAND function name for some pins
    7208101ded1e ARM: meson: Fix refcount leak in meson_smp_prepare_cpus
    9c26be2c3e69 tty: n_gsm: fix encoding of command/response bit
    3b9f49138669 btrfs: fix use of uninitialized variable at rm device ioctl
    cb91c0548ff2 virtio-blk: modify the value type of num in virtio_queue_rq()
    d35b78cb053a btrfs: fix error pointer dereference in btrfs_ioctl_rm_dev_v2()
    f88e79727fba Revert "serial: sc16is7xx: Clear RS485 bits in the shutdown"
    83d3449e8ae5 xfs: remove incorrect ASSERT in xfs_rename
    63a3d2377715 can: kvaser_usb: kvaser_usb_leaf: fix bittiming limits
    420b99306b7e can: kvaser_usb: kvaser_usb_leaf: fix CAN clock frequency regression
    baffaed7fab3 can: kvaser_usb: replace run-time checks with struct kvaser_usb_driver_info
    188c798f3c25 net: dsa: qca8k: reset cpu port on MTU change
    c79726aba6af powerpc/powernv: delay rng platform device creation until later in boot
    cc409f88e8f7 video: of_display_timing.h: include errno.h
    6c9c8a7a9a54 memregion: Fix memregion_free() fallback definition
    79827e53b069 PM: runtime: Redefine pm_runtime_release_supplier()
    9c9e44bb3dd5 fbcon: Prevent that screen size is smaller than font size
    688632778025 fbcon: Disallow setting font bigger than screen size
    738d06ef99cb fbmem: Check virtual screen sizes in fb_set_var()
    989b2c40322e fbdev: fbmem: Fix logo center image dx issue
    e5fde29135a4 iommu/vt-d: Fix PCI bus rescan device hot add
    09cb6663618a module: fix [e_shstrndx].sh_size=0 OOB access
    e9f331bb5d43 module: change to print useful messages from elf_validity_check()
    82b50219c85d dt-bindings: soc: qcom: smd-rpm: Fix missing MSM8936 compatible
    93dfb9c6deeb dt-bindings: soc: qcom: smd-rpm: Add compatible for MSM8953 SoC
    8371666ef44c rxrpc: Fix locking issue
    d74b09b933b9 irqchip/gic-v3: Refactor ISB + EOIR at ack time
    b82dfacba576 irqchip/gic-v3: Ensure pseudo-NMIs have an ISB between ack and handling
    51ebf1b6a077 io_uring: avoid io-wq -EAGAIN looping for !IOPOLL
    b3cec8a42fcd Bluetooth: btmtksdio: fix use-after-free at btmtksdio_recv_event
    5781bb8a3191 Bluetooth: protect le accept and resolv lists with hdev->lock
    8a2dbdeccef6 drm/mediatek: Add vblank register/unregister callback functions
    2c4396693698 drm/mediatek: Add cmdq_handle in mtk_crtc
    d3f153557045 drm/mediatek: Detect CMDQ execution timeout
    6f77386ddb1c drm/mediatek: Remove the pointer of struct cmdq_client
    d953c679022c drm/mediatek: Use mailbox rx_callback instead of cmdq_task_cb
    51a405dea0ae drm/i915: Fix a race between vma / object destruction and unbinding
    7a9e13b86536 drm/amdgpu: vi: disable ASPM on Intel Alder Lake based systems
    0a9a60dcedaa drm/amd: Refactor `amdgpu_aspm` to be evaluated per device
    00fa5cbbb6a7 tty: n_gsm: fix invalid gsmtty_write_room() result
    156f2c2378e1 serial: 8250_mtk: Make sure to select the right FEATURE_SEL
    e58094e2b516 tty: n_gsm: fix sometimes uninitialized warning in gsm_dlci_modem_output()
    b952aa508786 tty: n_gsm: fix invalid use of MSC in advanced option
    62d1655b9229 mm/hwpoison: fix race between hugetlb free/demotion and memory_failure_hugetlb()
    5429eb5502fc mm/memory-failure.c: fix race with changing page compound again
    7a07875fabcc mm/hwpoison: avoid the impact of hwpoison_filter() return value on mce handler
    d04b62b64056 mm/hwpoison: mf_mutex for soft offline and unpoison
    a0f4fd486896 KVM: Initialize debugfs_dentry when a VM is created to avoid NULL deref
    70e2e87ea878 btrfs: zoned: use dedicated lock for data relocation
    1519e6e28478 btrfs: zoned: encapsulate inode locking for zoned relocation
    920e849b7d23 tty: n_gsm: fix missing update of modem controls after DLCI open
    4db0a8dd9067 ALSA: usb-audio: add mapping for MSI MAG X570S Torpedo MAX.
    a7fe6934ce7c ALSA: usb-audio: add mapping for MSI MPG X570S Carbon Max Wifi.
    6dcf1e5581b4 tty: n_gsm: fix frame reception handling
    375dfcfca4a1 tty: n_gsm: Save dlci address open status when config requester
    88a4fb1346b3 tty: n_gsm: Modify CR,PF bit when config requester
    e73c0eaf7f35 KVM: Don't create VM debugfs files outside of the VM directory
    f3647c369c17 drm/amd/vcn: fix an error msg on vcn 3.0
    a976456c797c ASoC: rt5682: fix an incorrect NULL check on list iterator
    c0058893a4a9 ASoC: rt5682: move clk related code to rt5682_i2c_probe
    121af0231f82 uapi/linux/stddef.h: Add include guards
    1d9bd723e7b4 stddef: Introduce DECLARE_FLEX_ARRAY() helper
    c2f3dab1ac54 bus: mhi: Fix pm_state conversion to string
    3f6d5cb0a5e5 bus: mhi: core: Use correctly sized arguments for bit field
    170a08ad3d1a serial: sc16is7xx: Clear RS485 bits in the shutdown
    5dce84f475d1 powerpc/tm: Fix more userspace r13 corruption
    ed8a5d63a0da powerpc: flexible GPR range save/restore macros
    0a80e66a10af powerpc/32: Don't use lmw/stmw for saving/restoring non volatile regs
    b342feb49141 scsi: qla2xxx: Fix loss of NVMe namespaces after driver reload test
    31c60d15ccd1 KVM: s390x: fix SCK locking
    83772314e1e0 btrfs: don't access possibly stale fs_info data in device_list_add
    6784b694ecd8 KVM: use __vcalloc for very large allocations
    c33904fd1ef4 mm: vmalloc: introduce array allocation functions
    ff41804632e5 Compiler Attributes: add __alloc_size() for better bounds checking
    a1e69c36de17 mtd: spi-nor: Skip erase logic when SPI_NOR_NO_ERASE is set
    e65d78b12fbc batman-adv: Use netif_rx().
    4c0bb583a444 iio: accel: mma8452: use the correct logic to get mma8452_data
    ffd3e67f0dfb riscv/mm: Add XIP_FIXUP for riscv_pfn_base
    d6f1651ddf91 NFSD: COMMIT operations must not return NFS?ERR_INVAL
    c2a9881bc2ca NFSD: De-duplicate net_generic(nf->nf_net, nfsd_net_id)
    59bf2aca4b1c drm/amd/display: Fix by adding FPU protection for dcn30_internal_validate_bw
    f276634b12fa drm/amd/display: Set min dcfclk if pipe count is 0
    f799df4569c1 drbd: fix an invalid memory access caused by incorrect use of list iterator
    5bb1df0bfd46 drbd: Fix double free problem in drbd_create_device
    dbbcf21ad6a8 drbd: add error handling support for add_disk()
    72fa2ea3e0ab btrfs: remove device item and update super block in the same transaction
    f75534a71abf btrfs: use btrfs_get_dev_args_from_path in dev removal ioctls
    321a81835b4a btrfs: add a btrfs_get_dev_args_from_path helper
    5578b681fbf2 btrfs: handle device lookup with btrfs_dev_lookup_args
    09674bfd8054 vdpa/mlx5: Avoid processing works if workqueue was destroyed
    008e29d172ca gfs2: Fix gfs2_file_buffered_write endless loop workaround
    9b7eb92dac24 scsi: qla2xxx: Fix crash during module load unload test
    72806635ee63 scsi: qla2xxx: edif: Replace list_for_each_safe with list_for_each_entry_safe
    d4510119911c scsi: qla2xxx: Fix laggy FC remote port session recovery
    241afac69b96 scsi: qla2xxx: Move heartbeat handling from DPC thread to workqueue
    1e9d6854951a KVM: x86/mmu: Use common TDP MMU zap helper for MMU notifier unmap hook
    eabbe74e7de5 KVM: x86/mmu: Use yield-safe TDP MMU root iter in MMU notifier unmapping
    0855054fa889 clk: renesas: r9a07g044: Update multiplier and divider values for PLL2/3
    518bb9636712 cxl/port: Hold port reference until decoder release
    8b5ce83872b4 mt76: mt7921: do not always disable fw runtime-pm
    9d721a17505b mt76: mt76_connac: fix MCU_CE_CMD_SET_ROC definition error
    6512c3c39cb6 media: davinci: vpif: fix use-after-free on driver unbind
    2823225fbba0 media: omap3isp: Use struct_group() for memcpy() region
    d57ab893cdf8 stddef: Introduce struct_group() helper macro
    af9452dfdba4 block: fix rq-qos breakage from skipping rq_qos_done_bio()
    13141cceadd0 block: only mark bio as tracked if it really is tracked
    eb79d1353cd0 block: use bdev_get_queue() in bio.c
    df1ec53252d5 io_uring: ensure that fsnotify is always called
    5c82c94b0be7 virtio-blk: avoid preallocating big SGL for data
    32ac44b70e17 ibmvnic: Allow queueing resets during probe
    85996ef17952 ibmvnic: clear fop when retrying probe
    4fe1439ef2e0 ibmvnic: init init_done_rc earlier
    a29c71f3a4b1 s390/setup: preserve memory at OLDMEM_BASE and OLDMEM_SIZE
    06de5cf61538 s390/setup: use physical pointers for memblock_reserve()
    6ed826c949cf s390/boot: allocate amode31 section in decompressor
    aa1f19606558 netfilter: nft_payload: don't allow th access for fragments
    5445819e76a6 netfilter: nft_payload: support for inner header matching / mangling
    0d9bd7e6ac3a netfilter: nf_tables: convert pktinfo->tprot_set to flags field
    25ca15fed4bb ASoC: rt5682: Fix deadlock on resume
    f536e0df64b8 ASoC: rt5682: Re-detect the combo jack after resuming
    4b72179e53bd ASoC: rt5682: Avoid the unexpected IRQ event during going to suspend
    301ebfa578e3 net/mlx5e: TC, Reject rules with forward and drop actions
    6d1ac7f882da net/mlx5e: TC, Reject rules with drop and modify hdr action
    aa944fefb396 net/mlx5e: Split actions_match_supported() into a sub function
    f1c36a47a3b4 net/mlx5e: Check action fwd/drop flag exists also for nic flows
    910349170ac0 RISC-V: defconfigs: Set CONFIG_FB=y, for FB console
    49ae6abd617f riscv: defconfig: enable DRM_NOUVEAU
    feacd73fd8b2 bpf, arm64: Use emit_addr_mov_i64() for BPF_PSEUDO_FUNC
    d53c8fe9ee29 bpf: Stop caching subprog index in the bpf_pseudo_func insn
    d3688bfa5af4 mt76: mt7921: fix a possible race enabling/disabling runtime-pm
    281a194f5a67 mt76: mt7921: introduce mt7921_mcu_set_beacon_filter utility routine
    09aee8375b0c mt76: mt7921: get rid of mt7921_mac_set_beacon_filter
    9846b9e4bba7 platform/x86: wmi: Fix driver->notify() vs ->probe() race
    4b5356231989 platform/x86: wmi: Replace read_takes_no_args with a flags field
    789382ce7359 platform/x86: wmi: introduce helper to convert driver to WMI driver
    a9a101842420 qed: Improve the stack space of filter_config()
    8a29aec244ae ath11k: add hw_param for wakeup_mhi
    16b7cb2803bf memory: renesas-rpc-if: Avoid unaligned bus access for HyperFlash
    a4ac45aff8d3 media: ir_toy: prevent device from hanging during transmit
    e1716b0ff925 PCI: pciehp: Ignore Link Down/Up caused by error-induced Hot Reset
    006d00d826fb PCI/portdrv: Rename pm_iter() to pcie_port_device_iter()
    b33035945b0a drm/i915: Replace the unconditional clflush with drm_clflush_virt_range()
    9cf3a1c1288e drm/i915/gt: Register the migrate contexts with their engines
    d839d15b5074 drm/i915: Disable bonding on gen12+ platforms
    70fc07e30817 btrfs: fix deadlock between chunk allocation and chunk btree modifications
    3fb11d13220d dma-buf/poll: Get a file reference for outstanding fence callbacks
    140395211626 Input: goodix - try not to touch the reset-pin on x86/ACPI devices
    8422a9b306f1 Input: goodix - refactor reset handling
    f5b1c6d526d8 Input: goodix - add a goodix.h header file
    1354ceb1b6bf Input: goodix - change goodix_i2c_write() len parameter type to int
    8d1d6b29baa9 Input: cpcap-pwrbutton - handle errors from platform_get_irq()
    48f8f198a2ab btrfs: fix warning when freeing leaf after subvolume creation failure
    9bc53f5a3932 btrfs: fix invalid delayed ref after subvolume creation failure
    661820504717 btrfs: add additional parameters to btrfs_init_tree_ref/btrfs_init_data_ref
    bb5c24715501 btrfs: rename btrfs_alloc_chunk to btrfs_create_chunk
    c1784d207513 netfilter: nf_tables: stricter validation of element data
    5ccecafc728b netfilter: nft_set_pipapo: release elements in clone from abort path
    75e9009edabc net: rose: fix UAF bug caused by rose_t0timer_expiry
    db89582ff330 usbnet: fix memory leak in error case
    a7de8d436db9 bpf: Fix insufficient bounds propagation from adjust_scalar_min_max_vals
    a703cbdd791b bpf: Fix incorrect verifier simulation around jmp32's jeq/jne
    f7c9b38cc5a2 can: mcp251xfd: mcp251xfd_regmap_crc_read(): update workaround broken CRC on TBC register
    0cab3fb917c5 can: mcp251xfd: mcp251xfd_regmap_crc_read(): improve workaround handling for mcp2517fd
    c7333f798884 can: m_can: m_can_{read_fifo,echo_tx_event}(): shift timestamp to full 32 bits
    f4d90e9c95d4 can: m_can: m_can_chip_config(): actually enable internal timestamping
    0e60230bc643 can: gs_usb: gs_usb_open/close(): fix memory leak
    8cfa1a33b0fb can: grcan: grcan_probe(): remove extra of_node_get()
    f34f2a18e47b can: bcm: use call_rcu() instead of costly synchronize_rcu()
    51aab37a66a2 ALSA: cs46xx: Fix missing snd_card_free() call at probe error
    f768f3ca5f38 ALSA: hda/realtek: Add quirk for Clevo L140PU
    f62c53c6e70d ALSA: usb-audio: Workarounds for Behringer UMC 204/404 HD
    e63b94b8dd5f Revert "selftests/bpf: Add test for bpf_timer overwriting crash"
    066a5b678472 mm/filemap: fix UAF in find_lock_entries
    0515cc9b6b24 mm/slub: add missing TID updates on slab deactivation
    eb18ccd14633 Linux 5.15.53
    6b316eedff44 hwmon: (ibmaem) don't call platform_device_del() if platform_device_add() fails
    8848842f0a9b hwmon: (occ) Prevent power cap command overwriting poll response
    38920480329f hwmon: (occ) Remove sequence numbering and checksum calculation
    5b458d3de9cf drm/fourcc: fix integer type usage in uapi header
    f2def2643350 platform/x86: panasonic-laptop: filter out duplicate volume up/down/mute keypresses
    b9b7a115dfd1 platform/x86: panasonic-laptop: don't report duplicate brightness key-presses
    6201123ca5bc platform/x86: panasonic-laptop: revert "Resolve hotkey double trigger bug"
    484e10843a74 platform/x86: panasonic-laptop: sort includes alphabetically
    b619348d9d69 platform/x86: panasonic-laptop: de-obfuscate button codes
    8547315c1377 drivers: cpufreq: Add missing of_node_put() in qoriq-cpufreq.c
    68aa6f13dc43 drm/msm/gem: Fix error return on fence id alloc fail
    a13ea254268c drm/i915/gem: add missing else
    4dc036ddf4bf net: fix IFF_TX_SKB_NO_LINEAR definition
    25daf14eacd1 fsi: occ: Force sequence numbering per OCC
    8169198652b9 clocksource/drivers/ixp4xx: remove EXPORT_SYMBOL_GPL from ixp4xx_timer_setup()
    74acf9cc87c7 net: usb: qmi_wwan: add Telit 0x1070 composition
    9f83c8f6ab14 xen/arm: Fix race in RB-tree based P2M accounting
    1052fc2b7391 xen-netfront: restore __skb_queue_tail() positioning in xennet_get_responses()
    6d0a9127279a xen/blkfront: force data bouncing when backend is untrusted
    ed3cfc690675 xen/netfront: force data bouncing when backend is untrusted
    5dd0993c3683 xen/netfront: fix leaking data in shared pages
    7ed65a4ad8fa xen/blkfront: fix leaking data in shared pages
    472863c7b523 selftests/rseq: Change type of rseq_offset to ptrdiff_t
    df2e933a5348 selftests/rseq: x86-32: use %gs segment selector for accessing rseq thread area
    f5a656b4ab48 selftests/rseq: x86-64: use %fs segment selector for accessing rseq thread area
    4633aa6fadc6 selftests/rseq: Fix: work-around asm goto compiler bugs
    786bd3511934 selftests/rseq: Remove arm/mips asm goto compiler work-around
    33307f2afd85 selftests/rseq: Fix warnings about #if checks of undefined tokens
    21199d90428e selftests/rseq: Fix ppc32 offsets by using long rather than off_t
    56cbd6e40e41 selftests/rseq: Fix ppc32 missing instruction selection "u" and "x" for load/store
    1969c5eff964 selftests/rseq: Fix ppc32: wrong rseq_cs 32-bit field pointer on big endian
    b9a8ebe29636 selftests/rseq: Uplift rseq selftests for compatibility with glibc-2.35
    e49d1c413d28 selftests/rseq: Introduce thread pointer getters
    d471088d078b selftests/rseq: Introduce rseq_get_abi() helper
    c9a96b4231c3 selftests/rseq: Remove volatile from __rseq_abi
    3c35d9cbd99b selftests/rseq: Remove useless assignment to cpu variable
    94a913fe6271 selftests/rseq: introduce own copy of rseq uapi header
    58f64962a697 selftests/rseq: remove ARRAY_SIZE define from individual tests
    34ec62bc44b0 selftests/bpf: Add test_verifier support to fixup kfunc call insns
    e11cdd74519e tcp: add a missing nf_reset_ct() in 3WHS handling
    010d7c422296 MAINTAINERS: add Leah as xfs maintainer for 5.15.y
    c28f95515503 net: tun: avoid disabling NAPI twice
    9db9e649f88f mlxsw: spectrum_router: Fix rollback in tunnel next hop init
    2930ee1a166d ipv6: fix lockdep splat in in6_dump_addrs()
    d6371303b4db ipv6/sit: fix ipip6_tunnel_get_prl return value
    674a641e5b67 tunnels: do not assume mac header is set in skb_tunnel_check_pmtu()
    b43a47c1c5c7 ACPI: video: Change how we determine if brightness key-presses are handled
    50fefe57f45e io_uring: ensure that send/sendmsg and recv/recvmsg check sqe->ioprio
    c8fb40fd7bb7 epic100: fix use after free on rmmod
    35fcb2ba35b4 tipc: move bc link creation back to tipc_node_create
    eaf7e6fe4b07 NFC: nxp-nci: Don't issue a zero length i2c_master_read()
    d13a5b86e284 nfc: nfcmrvl: Fix irq_of_parse_and_map() return value
    89296ac435e2 powerpc/memhotplug: Add add_pages override for PPC
    ef0af7d08d26 net: bonding: fix use-after-free after 802.3ad slave unbind
    7227bc7bd103 net: phy: ax88772a: fix lost pause advertisement configuration
    0d139145cc0f net: bonding: fix possible NULL deref in rlb code
    efafb28ff39f net: asix: fix "can't send until first packet is send" issue
    ed303cc7aab9 net/sched: act_api: Notify user space if any actions were flushed before error
    1d776f085006 net/dsa/hirschmann: Add missing of_node_get() in hellcreek_led_setup()
    031561caa38a netfilter: nft_dynset: restore set element counter when failing to update
    a6c5c65f4c37 s390: remove unneeded 'select BUILD_BIN2C'
    10f88306f9f3 vdpa/mlx5: Update Control VQ callback information
    01121e39ef53 PM / devfreq: exynos-ppmu: Fix refcount leak in of_get_devfreq_events
    7cf7ed8f23c4 caif_virtio: fix race between virtio_device_ready() and ndo_open()
    4d5055873e24 vfs: fix copy_file_range() regression in cross-fs copies
    115d94191691 NFSD: restore EINVAL error translation in nfsd_commit()
    c9f8f94d3ca9 net: ipv6: unexport __init-annotated seg6_hmac_net_init()
    0b842b9e84cd selftests: mptcp: more stable diag tests
    536d2a6a4fd6 usbnet: fix memory allocation in helpers
    f7eaa228b0fa net: usb: asix: do not force pause frames support
    0b6e0eb5c45e linux/dim: Fix divide by 0 in RDMA DIM
    889000874c12 RDMA/cm: Fix memory leak in ib_cm_insert_listen
    732e73bd81c7 RDMA/qedr: Fix reporting QP timeout attribute
    c16404122a7c net: dp83822: disable rx error interrupt
    7191cecb99b2 net: dp83822: disable false carrier interrupt
    92e4f3ee5831 net: tun: stop NAPI when detaching queues
    8145f77d38de net: tun: unlink NAPI from device on destruction
    1e2327ba0fe9 net: dsa: bcm_sf2: force pause link settings
    cc38c1eaa2e0 selftests/net: pass ipv6_args to udpgso_bench's IPv6 TCP test
    4db9730360ab virtio-net: fix race between ndo_open() and virtio_device_ready()
    aa0806efb8f0 net: usb: ax88179_178a: Fix packet receiving
    659d39545260 net: rose: fix UAF bugs caused by timer handler
    6437d3deee28 SUNRPC: Fix READ_PLUS crasher
    0222575395bd s390/archrandom: simplify back to earlier design and initialize earlier
    d5b06039b195 dm raid: fix KASAN warning in raid5_add_disks
    6352b2f4d8e9 dm raid: fix accesses beyond end of raid member array
    bdb4d98d6d95 powerpc/bpf: Fix use of user_pt_regs in uapi
    e646baf1a4fd powerpc/book3e: Fix PUD allocation size in map_kernel_page()
    0c1d781d6b08 powerpc/prom_init: Fix kernel config grep
    be74e588f1a5 nvdimm: Fix badblocks clear off-by-one error
    526b53192d09 nvme-pci: add NVME_QUIRK_BOGUS_NID for ADATA IM2P33F8ABR1
    58caf60ce217 nvme-pci: add NVME_QUIRK_BOGUS_NID for ADATA XPG SX6000LNP (AKA SPECTRIX S40G)
    25fab798784b net: phy: Don't trigger state machine while in suspend
    159f2454ab12 ipv6: take care of disable_policy when restoring routes
    e33f5b581574 ksmbd: use vfs_llseek instead of dereferencing NULL
    9d48194d3e49 ksmbd: check invalid FileOffset and BeyondFinalZero in FSCTL_ZERO_DATA
    6791b57284f5 ksmbd: set the range of bytes to zero without extending file size in FSCTL_ZERO_DATA
    31c371b61d13 drm/amdgpu: To flush tlb for MMHUB of RAVEN series
    990132bebcc8 Revert "drm/amdgpu/display: set vblank_disable_immediate for DC"

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.15.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.15.bb            |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_5.15.bb | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
index f1f5de3b18..0cac752eba 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.15.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "3a7da2af1ba40b8c2247bac03a1fae488a1abde2"
-SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
+SRCREV_machine ?= "3a0e5a16b0c30008959538258553ca70f33ff2fc"
+SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.15.52"
+LINUX_VERSION ?= "5.15.54"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
index e271c6741a..3a35c1e44c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.15.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.15.52"
+LINUX_VERSION ?= "5.15.54"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "122de5742628e6b4303f0bbc653d409ff9f93557"
-SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
+SRCREV_machine ?= "e7447cb9afee4a22b0d3102922c3430eeb44bcc3"
+SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.15.bb b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
index 1c090db7b8..0b499b29ff 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.15.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.15.bb
@@ -13,24 +13,24 @@ KBRANCH:qemux86  ?= "v5.15/standard/base"
 KBRANCH:qemux86-64 ?= "v5.15/standard/base"
 KBRANCH:qemumips64 ?= "v5.15/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "41652fad285637467681f47d4e94a886ffb473cd"
-SRCREV_machine:qemuarm64 ?= "b28bd930f849c23a8f1576b22a8e59a0b2ac8cc1"
-SRCREV_machine:qemumips ?= "fb51b7d8d905883f2595f006428c142975231886"
-SRCREV_machine:qemuppc ?= "731587ce51ec087bfbb6255a1e9c763b4f71f7cb"
-SRCREV_machine:qemuriscv64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_machine:qemuriscv32 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_machine:qemux86 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_machine:qemux86-64 ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_machine:qemumips64 ?= "5fcf0d1536623c9ede2ee54d143a650c59ca9d59"
-SRCREV_machine ?= "6c085baf183868ed45d8c1d44408d7b24724cde5"
-SRCREV_meta ?= "f122fe59e74365eba84bae800898ffd7329c628d"
+SRCREV_machine:qemuarm ?= "e12b73a556e5cbd2c5cb157aba0d84e2c3be1ddf"
+SRCREV_machine:qemuarm64 ?= "b1f3c7dddb39848a5b6bae9f6490927bf090de84"
+SRCREV_machine:qemumips ?= "aa4bd512de00a1054205069ac334d97f82564b1e"
+SRCREV_machine:qemuppc ?= "fcd84bc0d01c29fe94f736812ef58978c57d6836"
+SRCREV_machine:qemuriscv64 ?= "d81d20a55992c55475d7b5570589cd5884059147"
+SRCREV_machine:qemuriscv32 ?= "d81d20a55992c55475d7b5570589cd5884059147"
+SRCREV_machine:qemux86 ?= "d81d20a55992c55475d7b5570589cd5884059147"
+SRCREV_machine:qemux86-64 ?= "d81d20a55992c55475d7b5570589cd5884059147"
+SRCREV_machine:qemumips64 ?= "694134b0fceb27051d3b0cfccc7ba0649319aa7e"
+SRCREV_machine ?= "d81d20a55992c55475d7b5570589cd5884059147"
+SRCREV_meta ?= "0e3a81a5aefbea03388b1235fbcc3dec278425d0"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "545aecd229613138d6db54fb2b5221faca10137f"
+SRCREV_machine:class-devupstream ?= "843dae1756d9bddee21a96827784791fd97d484e"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v5.15/base"
 
@@ -38,7 +38,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.15;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.15.52"
+LINUX_VERSION ?= "5.15.54"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


