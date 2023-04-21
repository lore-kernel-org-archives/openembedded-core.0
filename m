Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 573F9C7EE22
	for <webhook@archiver.kernel.org>; Fri, 21 Apr 2023 16:42:03 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web11.17734.1682095315757489611
 for <openembedded-core@lists.openembedded.org>;
 Fri, 21 Apr 2023 09:41:56 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=m7QkwjBm;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-74e19dcf217so121241785a.2
        for <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 09:41:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682095315; x=1684687315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RrXfE3MUY6BWGRnyS77Jaqtxvb1Ox09Ke06BdWJbikk=;
        b=m7QkwjBmaGowr+tiG+1TafuMZjuZSUKyk1rwtoDb5MnnGy+C5a6lknlTrWTlzGU2iK
         E6wuxISa8fRyjsaIQZBZHfccNxjlLKlNlSX2cL4x4xElpTb+UlYeMVFn/+72cUZSdUEL
         Omb0+v4oXxysB3EAZnxqWVZDEYFZGga1QdGt0v0XNSLnCL0sBrsrC1QUNzkHGgoGtHFL
         //5X1f833CtU8QXeUvBiPWeMPuvUvm/Rkwd3RnacDpsAq8it30NeWzjcKDaNr9Bk8aio
         oC1/5IV+17wJgqhLaqM7jaPsxXKR7/lA6ysGIGl5QgnKy+YpX2+NT6agPNX8Rn603XZp
         3rtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682095315; x=1684687315;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrXfE3MUY6BWGRnyS77Jaqtxvb1Ox09Ke06BdWJbikk=;
        b=GDx4CKdHZn0vyAcO+KhT8eiV3gDigRHSTMiud1xgS1Rfzkd6V+gqoh2wk11XuqWOjQ
         R7HBHVDXO0DLlIIYbDF9gDW/DwcorybedSNPkDXIpD6GyqwMfL0v4S4IBh+SPhyXxOqd
         t646Ai/IogpeM0yKMYLdjFdfT2RXDa/Rn2LJljkm9Tc+DFnL1YOUAXoCjgAVAZud5y1x
         4TV8+Ofr7hQntb+d2DtXEjk/cxz95fW9dkHx5P6hGX1lIlgoxT4LuJi4ajFNtGQRIaag
         0un92998GP1Hw0MotjXGBdN11PR5G661z2eKrKZ6qRUjvrXMirrL9nZI72ci0xmXfO2L
         RTPQ==
X-Gm-Message-State: AAQBX9foAzwRXWuqGLr9YKq6UMARQP+eFEBiruwI3YvjJKG7kW5cuXNp
	iRM2yV6m9DhndPlkjAmgQt18eQmNcAqW6A==
X-Google-Smtp-Source: AKy350ZtRtskkKx0kCm+GU5ZejG5O+BZpoIArJfTzpQG/ygsnz1wYw7Rj4fl0L7EDoEr7eVNr1nBOw==
X-Received: by 2002:ac8:5884:0:b0:3e9:ae13:524b with SMTP id t4-20020ac85884000000b003e9ae13524bmr6153964qta.62.1682095314081;
        Fri, 21 Apr 2023 09:41:54 -0700 (PDT)
Received: from localhost.localdomain ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id 9-20020ac85909000000b003ef573e24cfsm1131245qty.12.2023.04.21.09.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Apr 2023 09:41:53 -0700 (PDT)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/6] linux-yocto/6.1: update to v6.1.23
Date: Fri, 21 Apr 2023 12:41:45 -0400
Message-Id: <5a68a30daf2ac9a7dcbbf3cbf6329d8ed3511f04.1682095127.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1682095127.git.bruce.ashfield@gmail.com>
References: <cover.1682095127.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 21 Apr 2023 16:42:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180290

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    543aff194ab6 Linux 6.1.23
    9c5aa3c8619f Revert "cpuidle, intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE *again*"
    cafb47f5f59b x86/PVH: avoid 32-bit build warning when obtaining VGA console info
    9f291f2348ed hsr: ratelimit only when errors are printed
    d0386bd84e6d drm/amdkfd: Get prange->offset after svm_range_vram_node_new
    fbfe493874e9 usb: ucsi: Fix ucsi->connector race
    e5c5cb47a9eb libbpf: Fix btf_dump's packed struct determination
    6c8afd54f8e9 selftests/bpf: Add few corner cases to test padding handling of btf_dump
    524617e553bc libbpf: Fix BTF-to-C converter's padding logic
    2e35b08b66b0 selftests/bpf: Test btf dump for struct with padding only fields
    0f9e728e1a6c net: dsa: mv88e6xxx: replace VTU violation prints with trace points
    be831b5c6963 net: dsa: mv88e6xxx: replace ATU violation prints with trace points
    8f872c781f64 net: dsa: mv88e6xxx: read FID when handling ATU violations
    e4ca4572de06 KVM: arm64: Disable interrupts while walking userspace PTs
    051e660c8185 KVM: arm64: PMU: Fix GET_ONE_REG for vPMC regs to return the current value
    fcf712b4e5d0 drm/i915: Move CSC load back into .color_commit_arm() when PSR is enabled on skl/glk
    0fc6fea41c71 drm/i915: Disable DC states for all commits
    c781c107731f drm/i915/dpt: Treat the DPT BO as a framebuffer
    21ee19974b19 drm/i915/gem: Flush lmem contents after construction
    fd71f4c9e3fa drm/amd/display: Take FEC Overhead into Timeslot Calculation
    41abe8828c83 drm/amd/display: Add DSC Support for Synaptics Cascaded MST Hub
    febacc33298f drm/amdgpu: allow more APUs to do mode2 reset when go to S4
    f931ca46773a drm/etnaviv: fix reference leak when mmaping imported buffer
    3f878da42862 s390: reintroduce expoline dependence to scripts
    a028d92967bb s390/uaccess: add missing earlyclobber annotations to __clear_user()
    bc2f8b56217b dt-bindings: mtd: jedec,spi-nor: Document CPOL/CPHA support
    69bec5ac6ea0 rcu: Fix rcu_torture_read ftrace event
    75289cdbe125 xtensa: fix KASAN report for show_stack
    3a0e34af6bff ALSA: hda/realtek: Add quirk for Lenovo ZhaoYang CF4620Z
    036d5ae0a7cf ALSA: hda/realtek: Add quirks for some Clevo laptops
    3e120e920016 ALSA: usb-audio: Fix regression on detection of Roland VS-100
    0c60b9c0b774 ALSA: hda/conexant: Partial revert of a quirk for Lenovo
    f6bcbd556978 NFSv4: Fix hangs when recovering open state after a server reboot
    3f5ded246953 powerpc/64s: Fix __pte_needs_flush() false positive warning
    0bb88976bdd2 powerpc/pseries/vas: Ignore VAS update for DLPAR if copy/paste is not enabled
    064a1c7b0f84 powerpc: Don't try to copy PPR for task with NULL pt_regs
    44917e8c38d8 platform/x86: ideapad-laptop: Stop sending KEY_TOUCHPAD_TOGGLE
    61c1f420bb01 pinctrl: at91-pio4: fix domain name assignment
    d9c63daa576b pinctrl: amd: Disable and mask interrupts on resume
    0e7ac17634d2 modpost: Fix processing of CRCs on 32-bit build machines
    2269be495142 net: phy: dp83869: fix default value for tx-/rx-internal-delay
    cdfac0a50641 xen/netback: don't do grant copy across page boundary
    ace6aa2ab5ba can: j1939: prevent deadlock by moving j1939_sk_errqueue()
    8b7c731e5444 dm: fix __send_duplicate_bios() to always allow for splitting IO
    d7c67be755cc zonefs: Always invalidate last cached page on append write
    4d35d375efed vmxnet3: use gro callback when UPT is enabled
    d67b3cdacac9 io_uring: fix poll/netmsg alloc caches
    ef329fa764c3 io_uring/rsrc: fix rogue rsrc node grabbing
    3eb2138d4693 io_uring/poll: clear single/double poll flags on poll arming
    e5da11825ef7 block/io_uring: pass in issue_flags for uring_cmd task_work handling
    4a8f1f512266 zonefs: Do not propagate iomap_dio_rw() ENOTBLK error to user space
    8a6539ea362e btrfs: scan device in non-exclusive mode
    a38ff2024805 btrfs: fix race between quota disable and quota assign ioctls
    6134a4bb6b1c btrfs: fix deadlock when aborting transaction during relocation with scrub
    85ec44199b5a Input: goodix - add Lenovo Yoga Book X90F to nine_bytes_report DMI table
    89c4b695431d Input: i8042 - add quirk for Fujitsu Lifebook A574/H
    b7d854c33ab4 cifs: fix DFS traversal oops without CONFIG_CIFS_DFS_UPCALL
    eb94ea52afff cifs: prevent infinite recursion in CIFSGetDFSRefer()
    f8bdc959cefe Input: focaltech - use explicitly signed char type
    5ee6df525715 Input: alps - fix compatibility with -funsigned-char
    30a8863f21ec Input: i8042 - add TUXEDO devices to i8042 quirk tables for partial fix
    973043d6bdea iommu/vt-d: Allow zero SAGAW if second-stage not supported
    db0ac14908af Input: xpad - fix incorrectly applied patch for MAP_PROFILE_BUTTON
    2a858f3f804c pinctrl: ocelot: Fix alt mode for ocelot
    106fb49b14af net: ethernet: mtk_eth_soc: add missing ppe cache flush when deleting a flow
    a7bd974edf12 net: ethernet: mtk_eth_soc: fix flow block refcounting logic
    1b0e8aba4510 net: dsa: mv88e6xxx: Enable IGMP snooping on user ports only
    b055e322907e bnxt_en: Add missing 200G link speed reporting
    f06ae13e995a bnxt_en: Fix typo in PCI id to device description string mapping
    a4dd9f756973 bnxt_en: Fix reporting of test result in ethtool selftest
    37f9fe34482e i40e: fix registers dump after run ethtool adapter self test
    6e43dc9dcf22 net: ipa: compute DMA pool size properly
    32b9bd7cfc2e ALSA: ymfpci: Fix BUG_ON in probe function
    db7d7782677f ALSA: ymfpci: Create card with device-managed snd_devm_card_new()
    9bc9e4442fe3 ice: fix invalid check for empty list in ice_sched_assoc_vsi_to_agg()
    d10900058fa6 ice: add profile conflict check for AVF FDIR
    088573884165 ice: Fix ice_cfg_rdma_fltr() to only update relevant fields
    0b9541ae1dd1 smsc911x: avoid PHY being resumed when interface is not up
    a921dbbc04e3 net: mvpp2: parser fix PPPoE
    2a4f74420538 net: mvpp2: parser fix QinQ
    5718b58ca0ec net: mvpp2: classifier flow fix fragmentation flags
    bee9ca40b839 loop: LOOP_CONFIGURE: send uevents for partitions
    b7707176f858 ACPI: bus: Rework system-level device notification handling
    6a40fda14b4b s390/vfio-ap: fix memory leak in vfio_ap device driver
    c11dbc7705b3 can: bcm: bcm_tx_setup(): fix KMSAN uninit-value in vfs_write
    7ffdf7e6fc92 platform/x86/intel/pmc: Alder Lake PCH slp_s0_residency fix
    75084659969f drm/i915/tc: Fix the ICL PHY ownership check in TC-cold state
    ce1b88dd4013 net: stmmac: don't reject VLANs when IFF_PROMISC is set
    c942f5cd63b7 net/net_failover: fix txq exceeding warning
    f70328a0bfb2 regulator: Handle deferred clk
    1b808f5d8449 r8169: fix RTL8168H and RTL8107E rx crc error
    4ffa3fec1c34 net: dsa: microchip: ksz8: fix MDB configuration with non-zero VID
    adfe55665203 net: dsa: microchip: ksz8863_smi: fix bulk access
    8d86ea65e0f1 net: dsa: microchip: ksz8: ksz8_fdb_dump: avoid extracting ghost entry from empty dynamic MAC table.
    628f76b8ae7b net: dsa: microchip: ksz8: fix offset for the timestamp filed
    91840597869d net: dsa: microchip: ksz8: fix ksz8_fdb_dump() to extract all 1024 entries
    9524c2ea47cc net: dsa: microchip: ksz8: fix ksz8_fdb_dump()
    43b4331ce0cd ptp_qoriq: fix memory leak in probe()
    cc0f9bb99735 net: dsa: realtek: fix out-of-bounds access
    089e6318e1de scsi: mpt3sas: Don't print sense pool info twice
    9526222c1a11 scsi: megaraid_sas: Fix crash after a double completion
    1da26860a348 sfc: ef10: don't overwrite offload features at NIC reset
    c5a159d5e559 SUNRPC: fix shutdown of NFS TCP client socket
    43b70c9c4c90 mtd: rawnand: meson: invalidate cache on polling ECC bit
    53dc0b69fbac platform/surface: aggregator: Add missing fwnode_handle_put()
    f0a67ad7dce4 platform/x86: think-lmi: Add possible_values for ThinkStation
    5b2e50d837f2 platform/x86: think-lmi: only display possible_values if available
    3991efd0c1aa platform/x86: think-lmi: use correct possible_values delimiters
    6c69f1ab7bdc platform/x86: think-lmi: add missing type attribute
    ba85e83f9330 PCI: dwc: Fix PORT_LINK_CONTROL update when CDM check enabled
    e39afd6095a5 ALSA: usb-audio: Fix recursive locking at XRUN during syncing
    2cdbcff99f15 mips: bmips: BCM6358: disable RAC flush for TP1
    a07cf4fd610e riscv/kvm: Fix VM hang in case of timer delta being zero.
    60b2027077ea ca8210: Fix unsigned mac_len comparison with zero in ca8210_skb_tx()
    8b46440d1a63 mtd: nand: mxic-ecc: Fix mxic_ecc_data_xfer_wait_for_completion() when irq is used
    c84d28b32236 mtd: rawnand: meson: initialize struct with zeroes
    f5527b3b4d3d btrfs: use temporary variable for space_info in btrfs_update_block_group
    bd265f2061aa btrfs: fix uninitialized variable warning in btrfs_update_block_group
    089d656992c0 tracing: Fix wrong return in kprobe_event_gen_test.c
    88cdf1d8a522 tools/power turbostat: fix decoding of HWP_STATUS
    6ecdea91ef95 tools/power turbostat: Fix /dev/cpu_dma_latency warnings
    2a3562ea9d72 fbdev: au1200fb: Fix potential divide by zero
    9f2a69d5e677 fbdev: lxfb: Fix potential divide by zero
    8ab9eada22d9 fbdev: intelfb: Fix potential divide by zero
    c8d88107971e fbdev: nvidia: Fix potential divide by zero
    35a32a50dc8f net/mlx5e: Lower maximum allowed MTU in XSK to match XDP prerequisites
    b969838c9554 drm/amdkfd: Fixed kfd_process cleanup on module exit.
    e437554b1452 nvme-pci: add NVME_QUIRK_BOGUS_NID for Lexar NM620
    c8943cf3ab9b sched_getaffinity: don't assume 'cpumask_size()' is fully initialized
    2961b331b074 ACPI: tools: pfrut: Check if the input of level and type is in the right numeric range
    b8b7d5eac5ee fbdev: tgafb: Fix potential divide by zero
    32854bc91ae7 ALSA: hda/ca0132: fixup buffer overrun at tuning_ctl_set()
    69280e8e669c ALSA: asihpi: check pao in control_message()
    8b4dc07eb938 net: hsr: Don't log netdev_err message on unknown prp dst node
    5045360f3bb6 drm/amdkfd: fix potential kgd_mem UAFs
    b861f0e62ae1 drm/amdkfd: fix a potential double free in pqm_create_queue
    b61b21bcbb8a drm/amdkfd: Fix BO offset for multi-VMA page migration
    3e48f7b53de4 x86/PVH: obtain VGA console info in Dom0
    df0833da4bfa md: avoid signed overflow in slot_store()
    50f6507aadf8 ASoC: SOF: IPC4: update gain ipc msg definition to align with fw
    6d0ab3efb282 ASoC: SOF: Intel: pci-tng: revert invalid bar size setting
    6290404aa142 ASoC: SOF: ipc4-topology: Fix incorrect sample rate print unit
    a56be07a8c0c ASoC: SOF: ipc3: Check for upper size limit for the received message
    ab7a700fec40 ACPI: video: Add backlight=native DMI quirk for Dell Vostro 15 3535
    78b342f0cda7 zstd: Fix definition of assert()
    6beb32105eea ASoC: Intel: avs: nau8825: Adjust clock control
    30878a7eec00 ASoC: Intel: avs: ssm4567: Remove nau8825 bits
    ea7950db7650 ASoC: Intel: avs: da7219: Explicitly define codec format
    d0652061c3b8 ASoC: Intel: avs: max98357a: Explicitly define codec format
    57f9a9a232bd ASoC: codecs: tx-macro: Fix for KASAN: slab-out-of-bounds
    5218af4ad5d8 xfrm: Zero padding when dumping algos and encap
    2b4830eefc41 cifs: fix missing unload_nls() in smb2_reconnect()
    e0169d62efce arm64: efi: Set NX compat flag in PE/COFF header
    ec6cd79c4e54 net: mscc: ocelot: fix stats region batching
    39cd75f2f3a4 tracing: Do not let histogram values have some modifiers
    8ebeea1052f6 tracing: Add .graph suffix option to histogram value
    93454d1a306e tracing: Add .percent suffix option to histogram values
    954fc9931f0a tty: serial: fsl_lpuart: fix race on RX DMA shutdown
    3a4d6f959caa tty: serial: fsl_lpuart: switch to new dmaengine_terminate_* API
    33123ad902f3 drm/msm/disp/dpu: fix sc7280_pp base offset
    3f7c4839fc04 drm/msm/dpu: correct sm8250 and sm8350 scaler
    30fff49ea686 drm/msm/dpu: Refactor sc7280_pp location
    942100ec928c ARM: dts: aspeed: p10bmc: Update battery node name
    84cfcf240f4a riscv: ftrace: Fixup panic by disabling preemption
    a35f863210e8 net: ethernet: ti: am65-cpsw/cpts: Fix CPTS release action
    64621e4607f4 btrfs: zoned: count fresh BG region as zone unusable
    ea34b8bcc7ae btrfs: rename BTRFS_FS_NO_OVERCOMMIT to BTRFS_FS_ACTIVE_ZONE_TRACKING
    bae092f58759 kcsan: avoid passing -g for test
    01f3150cc7a7 kernel: kcsan: kcsan_test: build without structleak plugin
    0b0e1551ba9a fsverity: don't drop pagecache at end of FS_IOC_ENABLE_VERITY
    fc426026c3a3 zonefs: Fix error message in zonefs_file_dio_append()
    81cf745f1105 zonefs: Separate zone information from inode information
    7558b249cb4e zonefs: Reduce struct zonefs_inode_info size
    3741898b1694 zonefs: Simplify IO error handling
    a624b4796f38 zonefs: Reorganize code
    9dad2690b126 cifs: avoid race conditions with parallel reconnects
    a5698f3ebb78 cifs: prevent data race in cifs_reconnect_tcon()
    f60cdd319b2c cifs: update ip_addr for ses only for primary chan setup
    eddee1c229c2 thunderbolt: Limit USB3 bandwidth of certain Intel USB4 host routers
    3b29299e5f60 Linux 6.1.22
    8c31b663edc1 drm/amdkfd: Fix the memory overrun
    132f1d394391 drm/amdkfd: add GC 11.0.4 KFD support
    0ac954ec7f6c drm/amdkfd: Fix the warning of array-index-out-of-bounds
    a5528973c676 drm/amdkfd: introduce dummy cache info for property asic
    388c4c1d1212 sched/fair: Sanitize vruntime of entity being migrated
    e427be68892e sched/fair: sanitize vruntime of entity being placed
    b9d6816713b0 dm crypt: avoid accessing uninitialized tasklet
    f0eb61b493db dm crypt: add cond_resched() to dmcrypt_write()
    a42180dd3615 dm stats: check for and propagate alloc_percpu failure
    7c64e839585e i2c: xgene-slimpro: Fix out-of-bounds bug in xgene_slimpro_i2c_xfer()
    d22bc65a98ff bus: imx-weim: fix branch condition evaluates to a garbage value
    286b0cab31ba mm/ksm: fix race with VMA iteration and mm_struct teardown
    318b65386756 soc: qcom: llcc: Fix slice configuration values for SC8280XP
    83f40feee690 arm64: dts: qcom: sm8150: Fix the iommu mask used for PCIe controllers
    267b899375bf arm64: dts: qcom: sc7280: Mark PCIe controller as cache coherent
    0156ad2a60fe firmware: arm_scmi: Fix device node validation for mailbox transport
    a63cce9393e4 tee: amdtee: fix race condition in amdtee_open_session
    8a09fa7be62f riscv: Handle zicsr/zifencei issues between clang and binutils
    aa8a49b61007 riscv: mm: Fix incorrect ASID argument when flushing TLB
    75e10d7fb979 drm/amdgpu: reposition the gpu reset checking for reuse
    9f7e1dd835ec drm/amdgpu: skip ASIC reset for APUs when go to S4
    220da3bf1fc3 drm/i915: Preserve crtc_state->inherited during state clearing
    c355945957ef drm/i915/active: Fix missing debug object activation
    ed6364fb7c40 drm/amdgpu/nv: Apply ASPM quirk on Intel ADL + AMD Navi
    19b4396f0a39 drm/meson: fix missing component unbind on bind errors
    c590fce42c21 drm/amd/display: fix wrong index used in dccg32_set_dpstreamclk
    dec28169efd8 drm/bridge: lt8912b: return EPROBE_DEFER if bridge is not found
    5f33b042f74f nilfs2: fix kernel-infoleak in nilfs_ioctl_wrap_copy()
    c5d24e07e316 wifi: mac80211: fix qos on mesh interfaces
    0b3ec5671ac0 ksmbd: return unsupported error on smb1 mount
    3060466e38ca ksmbd: return STATUS_NOT_SUPPORTED on unsupported smb2.0 dialect
    fe9591a5a004 ksmbd: don't terminate inactive sessions after a few seconds
    d55c0560893c ksmbd: set FILE_NAMED_STREAMS attribute in FS_ATTRIBUTE_INFORMATION
    e54752f596a7 ksmbd: fix wrong signingkey creation when encryption is AES256
    0608b3da04f5 maple_tree: fix mas_skip_node() end slot detection
    94f6b92bad23 test_maple_tree: add more testing for mas_empty_area()
    450317033f04 Revert "kasan: drop skip_kasan_poison variable in free_pages_prepare"
    7b100a45dc19 io_uring/rsrc: fix null-ptr-deref in io_file_bitmap_get()
    87f2d329f4cb io_uring/net: avoid sending -ECONNABORTED on repeated connection requests
    1c00030a59a9 kfence: avoid passing -g for test
    f2a4304e9ff5 mm: kfence: fix using kfence_metadata without initialization in show_object()
    1e8525f37871 usb: ucsi_acpi: Increase the command completion timeout
    1c5abcb13491 usb: ucsi: Fix NULL pointer deref in ucsi_connector_change()
    2d0558c29122 usb: dwc3: gadget: Add 1ms delay after end transfer command without IOC
    4c1a06454f00 usb: chipidea: core: fix possible concurrent when switch role
    4e3498143863 usb: chipdea: core: fix return -EINVAL if request role is the same with current role
    bfcd692c833e usb: cdnsp: changes PCI Device ID to fix conflict with CNDS3 driver
    4e6e31e0a6ee usb: cdnsp: Fixes issue with redundant Status Stage
    0cc5fbfaacaa usb: cdns3: Fix issue with using incorrect PCI device function
    d55ca2d2ea1a usb: typec: tcpm: fix warning when handle discover_identity message
    657431b040b8 usb: typec: tcpm: fix create duplicate source-capabilities file
    0131f901835b dm thin: fix deadlock when swapping to thin device
    62a646457499 igb: revert rtnl_lock() that causes deadlock
    f8b34ed7cdac arm64: dts: imx8mm-nitrogen-r2: fix WM8960 clock name
    41a68444e562 lockd: set file_lock start and end when decoding nlm4 testargs
    260becc3891a fsverity: Remove WQ_UNBOUND from fsverity read workqueue
    d77531fac6a1 fscrypt: destroy keyring after security_sb_delete()
    f311869d72f7 mm/slab: Fix undefined init_cache_node_node() for NUMA and !SMP
    a6766e457d4c efi: sysfb_efi: Fix DMI quirks not working for simpledrm
    608901a77c94 Bluetooth: Fix race condition in hci_cmd_sync_clear
    00331677c084 btrfs: zoned: fix btrfs_can_activate_zone() to support DUP profile
    3bc7324e4911 usb: gadget: u_audio: don't let userspace block driver unbind
    ffb8ab6f87bd usb: dwc2: fix a devres leak in hw_enable upon suspend resume
    cd1340202266 usb: dwc2: drd: fix inconsistent mode if role-switch-default-mode="host"
    ac49318c8adf usb: misc: onboard-hub: add support for Microchip USB2517 USB 2.0 hub
    b03b85ec8247 scsi: core: Add BLIST_SKIP_VPD_PAGES for SKhynix H28U74301AMR
    d080337f6827 selftests/x86/amx: Add a ptrace test
    79f1e15c6b4b x86/fpu/xstate: Prevent false-positive warning in __copy_xstate_uabi_buf()
    362628048710 cifs: fix dentry lookups in directory handle cache
    d4bab65f80ce cifs: print session id while listing open files
    dc9e203f9f51 cifs: dump pending mids for all channels in DebugData
    f401c35e6cb4 cifs: empty interface list when server doesn't support query interfaces
    ee1767a12e13 cifs: do not poll server interfaces too regularly
    a163106b6d16 cifs: append path to open_enter trace event
    f11f6ea883de cifs: lock chan_lock outside match_session
    4c8fc3fe28e4 act_mirred: use the backlog for nested calls to mirred ingress
    e0c12b9bfffc net/sched: act_mirred: better wording on protection against excessive stack growth
    a0e39cdddc15 drm/amd: Fix initialization mistake for NBIO 7.3.0
    f06b902511ea drm/amdgpu: Fix call trace warning and hang when removing amdgpu device
    5fdb54270f7c sh: sanitize the flags on sigreturn
    b66804fc7e21 drm/amd/display: Update clock table to include highest clock setting
    43c33c487252 net: usb: qmi_wwan: add Telit 0x1080 composition
    8224ef96a8de net: usb: cdc_mbim: avoid altsetting toggling for Telit FE990
    886acbcb2982 platform/x86: int3472: Add GPIOs to Surface Go 3 Board data
    4a7d64d38584 scsi: storvsc: Handle BlockSize change in Hyper-V VHD/VHDX file
    1f822ae8fb2a scsi: mpi3mr: Bad drive in topology results kernel crash
    a0b33e1d8dc1 scsi: mpi3mr: NVMe command size greater than 8K fails
    92548801f01e scsi: mpi3mr: Wait for diagnostic save during controller init
    88f7fb47e0f0 scsi: mpi3mr: Driver unload crashes host when enhanced logging is enabled
    ec3a119c30e5 scsi: lpfc: Avoid usage of list iterator variable after loop
    4829a1e11715 scsi: lpfc: Check kzalloc() in lpfc_sli4_cgn_params_read()
    476d8ca83e6c scsi: ufs: core: Add soft dependency on governor_simpleondemand
    d92460985d78 scsi: hisi_sas: Check devm_add_action() return value
    b139678fb1b3 scsi: qla2xxx: Add option to disable FC2 Target support
    27f6579f3c0c scsi: target: iscsi: Fix an error message in iscsi_check_key()
    95ba926edd65 selftests/bpf: check that modifier resolves after pointer
    54fa25ffab2b m68k: Only force 030 bus error if PC not in exception table
    4ee33bfaeb3f m68k: mm: Fix systems with memory at end of 32-bit address space
    0a594cb490ca HID: intel-ish-hid: ipc: Fix potential use-after-free in work function
    e6f150861b28 HID: logitech-hidpp: Add support for Logitech MX Master 3S mouse
    fd176a18db96 ca8210: fix mac_len negative array access
    aee32b594f2c HID: cp2112: Fix driver not registering GPIO IRQ chip as threaded
    586a9fe14283 drm/cirrus: NULL-check pipe->plane.state->fb in cirrus_pipe_update()
    fd20cc4e5ea0 riscv: Bump COMMAND_LINE_SIZE value to 1024
    48bef3023f4d ACPI: x86: utils: Add Cezanne to the list for forcing StorageD3Enable
    d146b2741320 ACPI: x86: Drop quirk for HP Elitebook
    f845ecdd1342 ASoC: amd: yc: Add DMI entries to support HP OMEN 16-n0xxx (8A43)
    bf83d04c135d ASoC: amd: yp: Add OMEN by HP Gaming Laptop 16z-n000 to quirks
    03b5fae39897 thunderbolt: Rename shadowed variables bit to interrupt_bit and auto_clear_bit
    587dd59049bf thunderbolt: Use const qualifier for `ring_interrupt_index`
    278fb64ce473 thunderbolt: Add missing UNSET_INBOUND_SBTX for retimer access
    416db7fa3e89 thunderbolt: Disable interrupt auto clear for rings
    f390095bbd13 thunderbolt: Fix memory leak in margining
    f2326d046ae7 thunderbolt: Add quirk to disable CLx
    516b1752fe6a thunderbolt: Call tb_check_quirks() after initializing adapters
    b82c564886a0 thunderbolt: Use scale field when allocating USB3 bandwidth
    3497afbd5780 uas: Add US_FL_NO_REPORT_OPCODES for JMicron JMS583Gen 2
    4a369bb39187 smb3: fix unusable share after force unmount failure
    3de686a36592 smb3: lower default deferred close timeout to address perf regression
    cd0a1804ac5b scsi: qla2xxx: Perform lockless command completion in abort path
    6d57b77d7369 scsi: qla2xxx: Synchronize the IOCB count to be in order
    682938af0a5f hwmon (it87): Fix voltage scaling for chips with 10.9mV ADCs
    f3263768965f hwmon: fix potential sensor registration fail if of_node is missing
    d716ea059cd3 entry/rcu: Check TIF_RESCHED _after_ delayed RCU wake-up
    ab33a8f7649b perf/x86/amd/core: Always clear status for idx
    adfc7aaa0df9 entry: Fix noinstr warning in __enter_from_user_mode()
    eab28bfafcd1 platform/chrome: cros_ec_chardev: fix kernel data leak from ioctl
    b3168abd2424 Bluetooth: HCI: Fix global-out-of-bounds
    24997df50b35 Bluetooth: mgmt: Fix MGMT add advmon with RSSI command
    cbf8deacb705 Bluetooth: btsdio: fix use after free bug in btsdio_remove due to unfinished work
    c357e28b01c4 Bluetooth: L2CAP: Fix responding with wrong PDU type
    95085960062d Bluetooth: btqcomsmd: Fix command timeout after setting BD address
    612cf2495ec6 drm/amd/display: Set dcn32 caps.seamless_odm
    d84fe6dc7377 net: mdio: thunder: Add missing fwnode_handle_put()
    d1775958c2ae net: dsa: mt7530: move setting ssc_delta to PHY_INTERFACE_MODE_TRGMII case
    cd6251c02ac9 net: dsa: mt7530: move lowering TRGMII driving to mt7530_setup()
    4424f88795d6 net: dsa: mt7530: move enabling disabling core clock to mt7530_pll_setup()
    d4fe4edc6cf0 net: asix: fix modprobe "sysfs: cannot create duplicate filename"
    1b9613402ce2 gve: Cache link_speed value from device
    554828c833e6 Bluetooth: Remove "Power-on" check from Mesh feature
    e2a90a5b153a Bluetooth: ISO: fix timestamped HCI ISO data packet parsing
    e0338af405ae Bluetooth: btusb: Remove detection of ISO packets over bulk
    f770ce652b27 Bluetooth: hci_core: Detect if an ACL packet is in fact an ISO packet
    bc7a5dde52a2 Bluetooth: hci_sync: Resume adv with no RPA when active scan
    303f8e58cc3a ksmbd: fix possible refcount leak in smb2_open()
    a4e6cd9253c8 ksmbd: add low bound validation to FSCTL_QUERY_ALLOCATED_RANGES
    bd344dc3bbf0 ksmbd: add low bound validation to FSCTL_SET_ZERO_DATA
    82268b2da28a hvc/xen: prevent concurrent accesses to the shared ring
    4df371323e4f mlxsw: spectrum_fid: Fix incorrect local port type
    869bb1932bc7 nvme-tcp: fix nvme_tcp_term_pdu to match spec
    a338bd69e55b net/sonic: use dma_mapping_error() for error check
    9c7d6803689c erspan: do not use skb_mac_header() in ndo_start_xmit()
    ff0d8cc6cde9 atm: idt77252: fix kmemleak when rmmod idt77252
    774865342132 net: dsa: tag_brcm: legacy: fix daisy-chained switches
    c4c977935b2f net/mlx5: E-Switch, Fix an Oops in error handling code
    fba0b70e8cf7 net/mlx5: Read the TC mapping of all priorities on ETS query
    4e42fd7c0be5 net/mlx5e: Overcome slow response for first macsec ASO WQE
    63546395a0e6 net/mlx5: Fix steering rules cleanup
    93260bd809e0 net/mlx5e: Block entering switchdev mode with ns inconsistency
    3169140ee294 net/mlx5e: Set uplink rep as NETNS_LOCAL
    9cda812c7606 bpf: Adjust insufficient default bpf_jit_limit
    25634e4df7b2 i40e: fix flow director packet filter programming
    502b898235f0 iavf: fix hang on reboot with ice
    e16fa0c9ff7c ice: check if VF exists before mode check
    32c2b3f157d8 keys: Do not cache key in task struct if key is requested from kernel thread
    8a22203bec3b bootconfig: Fix testcase to increase max node
    840631bcf21f octeontx2-vf: Add missing free for alloc_percpu
    84548ce2b2db net/ps3_gelic_net: Use dma_mapping_error
    e6c10d12ae76 net/ps3_gelic_net: Fix RX sk_buff length
    83de34967473 net: usb: lan78xx: Limit packet length to skb->len
    5fc2c4e311a9 net: qcom/emac: Fix use after free bug in emac_remove due to race condition
    6e516595e886 drm/i915/gt: perform uc late init after probe error injection
    be8c6ad6b16e drm/i915/guc: Fix missing ecodes
    d2b9357d3da3 drm/i915/guc: Rename GuC register state capture node to be more obvious
    9595d71b2a27 drm/i915/fbdev: lock the fbdev obj before vma pin
    b6375c5ecd8c drm/i915: Print return value on error
    be282c83caec mlxsw: core_thermal: Fix fan speed in maximum cooling state
    a71f388045ed thermal/drivers/mellanox: Use generic thermal_zone_get_trip() function
    0e60f30e65d3 net: stmmac: Fix for mismatched host/device DMA address width
    77800daf7529 net: mdio: fix owner field for mdio buses registered using ACPI
    c2b6e1a440d2 net: mdio: fix owner field for mdio buses registered using device-tree
    8f07f16b3455 net: phy: Ensure state transitions are processed from phy_stop()
    9d882229d365 xirc2ps_cs: Fix use after free bug in xirc2ps_detach
    97ea704f39b5 qed/qed_sriov: guard against NULL derefs from qed_iov_get_vf_info
    58c11bc7adaa efi/libstub: smbios: Use length member instead of record struct size
    e041bef1adee net: usb: smsc95xx: Limit packet length to skb->len
    53a915a00bd1 net: dsa: b53: mmap: fix device tree support
    51ddb84baff6 nfsd: don't replace page in rq_pages if it's a continuation of last page
    1c55982beb80 scsi: scsi_dh_alua: Fix memleak for 'qdata' in alua_activate()
    a0de3f29d878 i2c: hisi: Only use the completion interrupt to finish the transfer
    d6ea83a476a3 i2c: mxs: ensure that DMA buffers are safe for DMA
    6d1c6e982b7e i2c: imx-lpi2c: check only for enabled interrupt flags
    ec897f7524de igc: fix the validation logic for taprio's gate list
    910e2013d098 igbvf: Regard vf reset nack as success
    460e4073b715 intel/igbvf: free irq on the error path in igbvf_request_msix()
    3faa2b8f8f39 iavf: do not track VLAN 0 filters
    c9c56af093aa iavf: fix non-tunneled IPv6 UDP packet type and hashing
    0bfadea827eb iavf: fix inverted Rx hash condition leading to disabled hash
    a069909acc44 xsk: Add missing overflow check in xdp_umem_reg
    4797ad1f5617 NFS: Fix /proc/PID/io read_bytes for buffered reads
    26aef3be6efa arm64: dts: imx93: add missing #address-cells and #size-cells to i2c nodes
    9f66c5dbaf0a arm64: dts: imx8mn: specify #sound-dai-cells for SAI nodes
    d75af9878680 ARM: dts: imx6sl: tolino-shine2hd: fix usbotg1 pinctrl
    0828dda42e5f ARM: dts: imx6sll: e60k02: fix usbotg1 pinctrl
    8505ead526be ARM: dts: imx6sll: e70k02: fix usbotg1 pinctrl
    08589e3ca8b1 arm64: dts: imx8dxl-evk: Fix eqos phy reset gpio
    bcbc0df73111 arm64: dts: imx8dxl-evk: Disable hibernation mode of AR8031 for EQOS
    47b2e1a67e6d power: supply: da9150: Fix use after free bug in da9150_charger_remove due to race condition
    84bdb3b76b07 power: supply: bq24190: Fix use after free bug in bq24190_remove due to race condition
    1b483a983a84 arm64: dts: qcom: sm8450: Mark UFS controller as cache coherent
    ee9caccc5e5c drm/amd/display: Fix DP MST sinks removal issue
    5564be74a22a mptcp: fix UaF in listener shutdown
    2827f099b3fb mptcp: use the workqueue to destroy unaccepted sockets
    1516ddbc34bc mptcp: refactor passive socket initialization
    75eb69023ba3 drm/amd/display: Remove OTG DIV register write for Virtual signals.
    0ac86f7dda2b drm/amd/display: fix k1 k2 divider programming for phantom streams
    4a36da161b7a drm/amd/display: Include virtual signal to set k1 and k2 values
    a1f48806559a tracing/hwlat: Replace sched_setaffinity with set_cpus_allowed_ptr
    d496185c25a6 perf: fix perf_event_context->time
    ff8137727a2a perf/core: Fix perf_output_begin parameter is incorrectly invoked in perf_event_bpf_output
    e13d1b6979ca interconnect: qcom: qcm2290: Fix MASTER_SNOC_BIMC_NRT
    e598cf599a39 interconnect: qcom: sm8450: switch to qcom_icc_rpmh_* function
    d4c3aaee17fb interconnect: qcom: osm-l3: fix icc_onecell_data allocation
    e3a87a10f259 Linux 6.1.21
    7f4da237af30 powerpc/64: Replace -mcpu=e500mc64 by -mcpu=e5500
    6ec2eb9db3f9 powerpc: Disable CPU unknown by CLANG when CC_IS_CLANG
    529546ea2834 perf: Fix check before add_event_to_groups() in perf_group_detach()
    36773a78b0de io_uring/msg_ring: let target know allocated index
    ba4045cc7d0c virt/coco/sev-guest: Add throttling awareness
    917f21725452 virt/coco/sev-guest: Convert the sw_exit_info_2 checking to a switch-case
    77be7df33e99 virt/coco/sev-guest: Do some code style cleanups
    77083f3c392d virt/coco/sev-guest: Carve out the request issuing logic into a helper
    92bbffb33f44 virt/coco/sev-guest: Remove the disable_vmpck label in handle_guest_request()
    9579ca57104b virt/coco/sev-guest: Simplify extended guest request handling
    12319ef1cfc7 virt/coco/sev-guest: Check SEV_SNP attribute at probe time
    bed3a56c5718 powerpc: Pass correct CPU reference to assembler
    3fc5941ecc31 x86/resctrl: Clear staged_config[] before and after it is used
    701d3da21321 x86/mm: Fix use of uninitialized buffer in sme_enable()
    18211af8ef1a x86/mce: Make sure logged MCEs are processed after sysfs update
    c87ada07340f ASoC: qcom: q6prm: fix incorrect clk_root passed to ADSP
    bfbbfb709ded ASoC: Intel: soc-acpi: fix copy-paste issue in topology names
    d511caa25dda cpuidle: psci: Iterate backwards over list in psci_pd_remove()
    1ea3e18e53f2 fbdev: Fix incorrect page mapping clearance at fb_deferred_io_release()
    697893e0da3c net: phy: nxp-c45-tja11xx: fix MII_BASIC_CONFIG_REV bit
    1318a07706bb ACPI: PPTT: Fix to avoid sleep in the atomic context when PPTT is absent
    ac1d15d58d8a trace/hwlat: Do not start per-cpu thread if it is already running
    a78eab86e2a8 trace/hwlat: Do not wipe the contents of per-cpu thread data
    15f6110abd27 fbdev: stifb: Provide valid pixelclock and add fb_check_var() checks
    0ad710a83dfa mmc: sdhci_am654: lower power-on failed message severity
    c2f879fd141c powerpc/boot: Don't always pass -mcpu=powerpc when building 32-bit uImage
    da0beae24493 powerpc/64: Set default CPU in Kconfig
    aff80fb99bd2 mm: teach mincore_hugetlb about pte markers
    b8388048b59f mm/userfaultfd: propagate uffd-wp bit when PTE-mapping the huge zeropage
    baafa2960731 vp_vdpa: fix the crash in hot unplug with vp_vdpa
    0556fd71a140 ice: avoid bonding causing auxiliary plug/unplug under RTNL lock
    b61e86e38881 nvme-pci: add NVME_QUIRK_BOGUS_NID for Netac NV3000
    47eb055ad358 ocfs2: fix data corruption after failed write
    4f84f31f6341 ftrace: Fix invalid address access in lookup_rec() when index is 0
    c3c3d36430dc mptcp: fix lockdep false positive in mptcp_pm_nl_create_listen_socket()
    85cd9045f193 mptcp: avoid setting TCP_CLOSE state twice
    d283617f97e1 mptcp: add ro_after_init for tcp{,v6}_prot_override
    f76e08cf98aa mptcp: fix possible deadlock in subflow_error_report
    39374fc8bb11 drm/amd/display: disconnect MPCC only on OTG change
    f8080f1e300e drm/amd/display: Do not set DRR on pipe Commit
    20f8225ae7f4 drm/amd/pm: bump SMU 13.0.4 driver_if header version
    6e403a0a69f7 drm/amd/pm: Fix sienna cichlid incorrect OD volage after resume
    dab920478e2b drm/amdgpu: Don't resume IOMMU after incomplete init
    0243590e33a7 drm/i915/dg2: Add HDMI pixel clock frequencies 267.30 and 319.89 MHz
    5c7591b8574c drm/i915/active: Fix misuse of non-idle barriers as fence trackers
    8bfeb1dd6f57 drm/sun4i: fix missing component unbind on bind errors
    dede8c14a37a drm/shmem-helper: Remove another errant put in error path
    873657813618 riscv: asid: Fixup stale TLB entry cause application crash
    eed0dc9c42ea Revert "riscv: mm: notify remote harts about mmu cache updates"
    d813d8e6d9a0 ALSA: hda/realtek: fix speaker, mute/micmute LEDs not work on a HP platform
    3ce3f1558b61 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book2 Pro
    44717bdf7139 ALSA: hda: intel-dsp-config: add MTL PCI id
    4bba9c8adec8 KVM: nVMX: add missing consistency checks for CR0 and CR4
    ade62ea3e897 KVM: SVM: Modify AVIC GATag to support max number of 512 vCPUs
    acb0288bdd42 KVM: SVM: Fix a benign off-by-one bug in AVIC physical table mask
    72f90f9cf032 cifs: Fix smb2_set_path_size()
    c8f31c1a0b7c tracing: Make tracepoint lockdep check actually test something
    3968bb946a07 tracing: Check field value in hist_field_name()
    192dcbf57311 tracing: Make splice_read available again
    4aa004224c07 cifs: generate signkey for the channel that's reconnecting
    ae75a110ccc1 md: select BLOCK_LEGACY_AUTOLOAD
    313a5dc3a2aa interconnect: exynos: fix registration race
    c479e4ac4a3d interconnect: exynos: fix node leak in probe PM QoS error path
    323e51d21d67 interconnect: qcom: msm8974: fix registration race
    1b1325879ca6 interconnect: qcom: rpmh: fix registration race
    0add9360fee9 interconnect: qcom: rpmh: fix probe child-node error handling
    5e8d808cb274 interconnect: qcom: rpm: fix registration race
    1d7dd7291b88 interconnect: qcom: rpm: fix probe child-node error handling
    306b406e4ec9 interconnect: qcom: osm-l3: fix registration race
    3167306455d0 interconnect: fix mem leak when freeing nodes
    c8a8ebeaa040 interconnect: imx: fix registration race
    949cb37d21bc interconnect: fix provider registration API
    3d6e1ac21d79 interconnect: fix icc_provider_del() error handling
    f99450d919ff s390/ipl: add missing intersection check to ipl_report handling
    9ba1720f6c4a drm/ttm: Fix a NULL pointer dereference
    20d305f79c4e memory: tegra30-emc: fix interconnect registration race
    d40e710e956b memory: tegra124-emc: fix interconnect registration race
    32013d947a76 memory: tegra20-emc: fix interconnect registration race
    772764570bd7 memory: tegra: fix interconnect registration race
    162049c31eb6 firmware: xilinx: don't make a sleepable memory allocation from an atomic context
    fad3809467df serial: 8250: ASPEED_VUART: select REGMAP instead of depending on it
    4d8c41584bc9 serial: 8250_fsl: fix handle_irq locking
    ba2849db4983 serial: 8250_em: Fix UART port type
    d72ebe4855eb tty: serial: fsl_lpuart: skip waiting for transmission complete when UARTCTRL_SBK is asserted
    4d2304d8f779 Revert "tty: serial: fsl_lpuart: adjust SERIAL_FSL_LPUART_CONSOLE config dependency"
    e71eb4dca41f ext4: fix possible double unlock when moving a directory
    a16394b5d661 drm/amd/display: fix shift-out-of-bounds in CalculateVMAndRowBytes
    7be9a2f8c517 drm/amdgpu: fix ttm_bo calltrace warning in psp_hw_fini
    ff74b0122f56 sh: intc: Avoid spurious sizeof-pointer-div warning
    b9c379e1d7e1 LoongArch: Only call get_timer_irq() once in constant_clockevent_init()
    3f7c09f64289 net/9p: fix bug in client create for .L
    d9923e7214a8 drm/amdkfd: Fix an illegal memory access
    94fd091576b1 ext4: fix task hung in ext4_xattr_delete_inode
    70e66bdeae4d ext4: update s_journal_inum if it changes after journal replay
    b4afe4629ec8 ext4: fail ext4_iget if special inode unallocated
    20ca409886ce rust: arch/um: Disable FP/SIMD instruction to match x86
    1cffdf91ca2b jffs2: correct logic when creating a hole in jffs2_write_begin
    71285be619cb soc: mediatek: mtk-svs: keep svs alive if CONFIG_DEBUG_FS not supported
    2746fdf51b59 mmc: atmel-mci: fix race between stop command and start of next command
    a2b8a41cc9e3 media: m5mols: fix off-by-one loop termination error
    d3827d53b098 hwmon: (ltc2992) Set `can_sleep` flag for GPIO chip
    b9e80aa64ee0 hwmon: (adm1266) Set `can_sleep` flag for GPIO chip
    8a3876f8c79f kconfig: Update config changed flag before calling callback
    fc331de5523f hwmon: tmp512: drop of_match_ptr for ID table
    634b3304f78d hwmon: (ucd90320) Add minimum delay between bus accesses
    265656c43eb9 hwmon: (ina3221) return prober error code
    b2ae1f15cd6f hwmon: (xgene) Fix use after free bug in xgene_hwmon_remove due to race condition
    afda11bae889 hwmon: (adt7475) Fix masking of hysteresis registers
    ad22336d33d5 hwmon: (adt7475) Display smoothing attributes in correct order
    ecb1b5135bd3 bonding: restore bond's IFF_SLAVE flag if a non-eth dev enslave fails
    40d8c4f6e427 bonding: restore IFF_MASTER/SLAVE flags on bond enslave ether type change
    42e8ecb1d30d ethernet: sun: add check for the mdesc_grab()
    6992a1004def net: dsa: microchip: fix RGMII delay configuration on KSZ8765/KSZ8794/KSZ8795
    5f916531e750 qed/qed_mng_tlv: correctly zero out ->min instead of ->hour
    51b6912a6bac selftests: net: devlink_port_split.py: skip test if no suitable device available
    76d8a9a194ca i825xx: sni_82596: use eth_hw_addr_set()
    c78f1345db4e net/iucv: Fix size of interrupt data
    ee744ac65c40 net: atlantic: Fix crash when XDP is enabled but no program is loaded
    4caee8e7d91e net: usb: smsc75xx: Move packet length check to prevent kernel panic in skb_pull
    1c5642cfa6d5 ipv4: Fix incorrect table ID in IOCTL path
    c058d3e4e82a sh_eth: avoid PHY being resumed when interface is not up
    fba6fb5447c6 ravb: avoid PHY being resumed when interface is not up
    eaae4e3f3a1d net: dsa: mv88e6xxx: fix max_mtu of 1492 on 6165, 6191, 6220, 6250, 6290
    b5d6e4f6b97c net: dsa: don't error out when drivers return ETH_DATA_LEN in .port_max_mtu()
    2ecc6e449593 ice: xsk: disable txq irq before flushing hw
    717d20710596 veth: Fix use after free in XDP_REDIRECT
    555a9c6a191a net/mlx5: Set BREAK_FW_WAIT flag first when removing driver
    b7350f8dbe0c net/mlx5e: Fix cleanup null-ptr deref on encap lock
    a506e38b6940 net/mlx5: E-switch, Fix missing set of split_count when forward to ovs internal port
    3a1f54924548 net/mlx5: E-switch, Fix wrong usage of source port rewrite in split rules
    76422c92e480 net/mlx5e: Support Geneve and GRE with VF tunnel offload
    bec05b05e698 net/mlx5: Disable eswitch before waiting for VF pages
    752860d8aaf4 net/mlx5: Fix setting ec_function bit in MANAGE_PAGES
    20b097ca2205 net/mlx5e: Don't cache tunnel offloads capability
    e79eee0e7091 net/mlx5e: Fix macsec ASO context alignment
    f72a9737f5f9 block: sunvdc: add check for mdesc_grab() returning NULL
    bcd535f07c58 nvmet: avoid potential UAF in nvmet_req_complete()
    afd94e7cbabb nvme: fix handling single range discard request
    351c9633c9d4 block: null_blk: Fix handling of fake timeout request
    5ca66a9fff75 powerpc/mm: Fix false detection of read faults
    9821576e1170 drm/bridge: Fix returned array size name for atomic_get_input_bus_fmts kdoc
    c7bdc137ca16 net: usb: smsc75xx: Limit packet length to skb->len
    3517584cf1b3 net/smc: fix deadlock triggered by cancel_delayed_work_syn()
    bb0c7212efb9 mlxsw: spectrum: Fix incorrect parsing depth after reload
    5e331022b448 nfc: st-nci: Fix use after free bug in ndlc_remove due to race condition
    b339c0af83d4 tcp: Fix bind() conflict check for dual-stack wildcard address.
    42173a7147e2 net: phy: smsc: bail out in lan87xx_read_status if genphy_read_status fails
    a69b72b57b7d net: tunnels: annotate lockless accesses to dev->needed_headroom
    e3fda704903f loop: Fix use-after-free issues
    221f655b574d block: do not reverse request order when flushing plug list
    68fbc35583ab net: dsa: mt7530: set PLL frequency and trgmii only when trgmii is used
    85d6c1fc36b3 net: dsa: mt7530: remove now incorrect comment regarding port 5
    e10c7ab7d3a1 qed/qed_dev: guard against a possible division by zero
    3c270435db8a net/smc: fix NULL sndbuf_desc in smc_cdc_tx_handler()
    1a1682abf739 drm/i915/sseu: fix max_subslices array-index-out-of-bounds access
    d586d58c3f2a drm/i915/psr: Use calculated io and fast wake lines
    a2410d0c3d2d PCI: s390: Fix use-after-free of PCI resources with per-function hotplug
    1e803737141f vdpa_sim: set last_used_idx as last_avail_idx in vdpasim_queue_ready
    6efd13e9acd1 vdpa_sim: not reset state in vdpasim_queue_ready
    374bcab6c141 vhost-vdpa: free iommu domain after last use during cleanup
    c703362a66ea i40e: Fix kernel crash during reboot when adapter is in recovery mode
    e92ee025b53d ipvlan: Make skb->skb_iif track skb->dev for l3s mode
    a97ef110c491 nfc: pn533: initialize struct pn533_out_arg properly
    4d2ee43ac2a9 selftests: fix LLVM build for i386 and x86_64
    dcf94604d4a9 wifi: cfg80211: fix MLO connection ownership
    87e80ea4fbc9 wifi: nl80211: fix NULL-ptr deref in offchan check
    928fa441f149 vdpa/mlx5: should not activate virtq object when suspended
    9180aa4622a7 tcp: tcp_make_synack() can be called from process context
    6f93f5d6d7af ftrace,kcfi: Define ftrace_stub_graph conditionally
    7e0ae8667fcd scsi: core: Fix a procfs host directory removal regression
    d2112b18b591 scsi: core: Add BLIST_NO_VPD_SIZE for some VDASD
    71ba8c384b77 netfilter: nft_redir: correct value of inet type `.maxattrs`
    d0f645ea552c netfilter: nft_redir: correct length for loading protocol registers
    8b02143c2ea6 netfilter: nft_masq: correct length for loading protocol registers
    ef6b379d5cec netfilter: nft_nat: correct length for loading protocol registers
    d0564e648c7a ALSA: hda: Match only Intel devices with CONTROLLER_IN_GPU()
    0023972a7593 scsi: mpi3mr: Fix expander node leak in mpi3mr_remove()
    c6260ceea4a0 scsi: mpi3mr: ioctl timeout when disabling/enabling interrupt
    5aab9342f12f scsi: mpi3mr: Fix memory leaks in mpi3mr_init_ioc()
    705097d52a15 scsi: mpi3mr: Return proper values for failures in firmware init path
    480aae2f3063 scsi: mpi3mr: Fix sas_hba.phy memory leak in mpi3mr_remove()
    f28bdab9e208 scsi: mpi3mr: Fix mpi3mr_hba_port memory leak in mpi3mr_remove()
    dca06ccf13de scsi: mpi3mr: Fix config page DMA memory leak
    574cc10edaa7 scsi: mpi3mr: Fix throttle_groups memory leak
    b5e5bbb3fa5f scsi: mpt3sas: Fix NULL pointer access in mpt3sas_transport_port_add()
    704e3a33bda4 docs: Correct missing "d_" prefix for dentry_operations member d_weak_revalidate
    22ea42969325 ASoC: SOF: ipc4-topology: set dmic dai index from copier
    827700ad25d6 ASOC: SOF: Intel: pci-tgl: Fix device description
    1415eb56dd2a ASoC: SOF: Intel: SKL: Fix device description
    47a7b53c52c7 ASoC: SOF: Intel: HDA: Fix device description
    bda78144c8a5 ASoC: SOF: Intel: MTL: Fix the device description
    019fb49c3d83 clk: HI655X: select REGMAP instead of depending on it
    33f080889cfe drm/meson: fix 1px pink line on GXM when scaling video overlay
    0b26f080ccf5 cifs: Move the in_send statistic to __smb_send_rqst()
    59f750e5d2ea fbdev: chipsfb: Fix error codes in chipsfb_pci_init()
    2ece1e25bb42 drm/panfrost: Don't sync rpm suspension after mmu flushing
    96a5aee27439 drm/msm/gem: Prevent blocking within shrinker loop
    5ed267cc7b6c drm/virtio: Pass correct device to dma_sync_sgtable_for_device()
    c436a1743333 xfrm: Allow transport-mode states with AF_UNSPEC selector

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++--
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++--
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 28 +++++++++----------
 3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 2cf1b048c9..99d89a5b4a 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -14,13 +14,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8d55a90b757757f76ec124508fd2bcace5d276b5"
-SRCREV_meta ?= "1a97a82e62ebf4ef3787768a1f5937e2d2f280ce"
+SRCREV_machine ?= "6a4ee2488620a26c6ef9083ae896f342906264ec"
+SRCREV_meta ?= "9a82ca088b3bacb994837bd55ab8fb7f1ff7fb0d"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.20"
+LINUX_VERSION ?= "6.1.23"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index ff3bcad5db..7a78369297 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -8,7 +8,7 @@ require recipes-kernel/linux/linux-yocto.inc
 # CVE exclusions
 include recipes-kernel/linux/cve-exclusion_6.1.inc
 
-LINUX_VERSION ?= "6.1.20"
+LINUX_VERSION ?= "6.1.23"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -17,8 +17,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_meta ?= "1a97a82e62ebf4ef3787768a1f5937e2d2f280ce"
+SRCREV_machine ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_meta ?= "9a82ca088b3bacb994837bd55ab8fb7f1ff7fb0d"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 033bc10e55..36d2ac6b0a 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -17,25 +17,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "fad8850ff15dfbf8fb2e7d71583fc54b809d10ef"
-SRCREV_machine:qemuarm64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemuloongarch64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemumips ?= "dd663b72efce61f63f0b38403254eb52e6ad9a59"
-SRCREV_machine:qemuppc ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemuriscv64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemuriscv32 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemux86 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemux86-64 ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_machine:qemumips64 ?= "587a945baf13cdca2421e280b7b07dead6ad2a77"
-SRCREV_machine ?= "423e1996694b61fbfc8ec3bf062fc6461d64fde1"
-SRCREV_meta ?= "a8881762b53231bb914329cac3c2cf8db8b6779b"
+SRCREV_machine:qemuarm ?= "cd6a9dfb3868f58ad820b714857f46794711fa60"
+SRCREV_machine:qemuarm64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemuloongarch64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemumips ?= "4403b4323a1e87d824411b5ecae8531ef7876ef5"
+SRCREV_machine:qemuppc ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemuriscv64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemuriscv32 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemux86 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemux86-64 ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_machine:qemumips64 ?= "b1990cb332cb78304bc1b5529f8d8c22ecee73d1"
+SRCREV_machine ?= "467317c61bcae6f23fab17fa54301a265e41725b"
+SRCREV_meta ?= "9a82ca088b3bacb994837bd55ab8fb7f1ff7fb0d"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "7eaef76fbc4621ced374c85dbc000dd80dc681d7"
+SRCREV_machine:class-devupstream ?= "543aff194ab6286af7791c5a138978ee7da4c93f"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -43,7 +43,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.20"
+LINUX_VERSION ?= "6.1.23"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


