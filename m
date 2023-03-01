Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9284C7EE36
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 15:13:59 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web11.24967.1677683635064922864
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Mar 2023 07:13:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=SMKlzVrI;
 spf=pass (domain: gmail.com, ip: 209.85.160.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f179.google.com with SMTP id h19so14540094qtk.7
        for <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 07:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OC8xXeSLiDdv8e+D1zIGbYTvjLXaAjTw7H5AijlMXEo=;
        b=SMKlzVrIYh4zu8euj0KddgXPAwvtUf/Smer9Y8Ev91RpOdiHf/H+hntNsiGYR6YX1W
         zdKv7ezJCPP7y2MR4t/M/phWQXstUZvNCoGbTpdXzZYOSGVKmjx90aki5uU4211t85pS
         nKKGlQQyjHhXXVl0tIFZlSLNwifjt2I/dZGFTvBxzLGQb6AszT2hqOh7W79RCwI8zfeZ
         CLItaP9yt8pys24Xkn9PugJlR65/pMlSExZS25M5G0CPQUvq5mQJaSisfa/vNV5iV5o1
         ztjFW9/3sPf8wPpUbYMQoQbr/UmshfRu3iR6kLRA3FBjTB0ubclpACdjZ+HBgDZMF3Oq
         Mo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OC8xXeSLiDdv8e+D1zIGbYTvjLXaAjTw7H5AijlMXEo=;
        b=iV/yB99/udEPud6B9FSTSZjF1YPl3XdM9FmMU/p7xggUKu5iEd20hzcB8HYw/FSzRT
         uliKsrkbi2CBJ4+AG2r74ATHhpqDcuXfrn0JMcgLCweeH23AzmEULgZ77hJsPzDmgtNi
         bM0tie9ILo62g8JvWVl8gq1v7UvnFy2NlnCsZVE0MaIFAtgRGyKtW3bJyK458rEifb79
         Ey6hSkF+SzscIiv1GC5fpSH9bVxOjyu2saZp1kF5xjCppAoSwegwRYbzRblcQl+skzep
         C6nha9nL66th6arf/VroBX5uqQa54+jG4ZadCNwK0Q5CUKiE/tAMVRgdtgMtm+Jcv1b2
         9t5Q==
X-Gm-Message-State: AO0yUKXhWPvr6GpExAbijC45rGnDVtoedFJ8hLazy5IrQ2KVs8BH1aJR
	RoD5KaO6pS9X2uNr6qZdu4knmLF3PDBE3g==
X-Google-Smtp-Source: AK7set83SgwONeR62QYQomLFQqQBE66PoOS75tpLErdlKlc1jYG9MZ7PGgvwUksmpaZczogjBcKsug==
X-Received: by 2002:ac8:5e10:0:b0:3b8:6c8e:4f85 with SMTP id h16-20020ac85e10000000b003b86c8e4f85mr13063597qtx.43.1677683633847;
        Wed, 01 Mar 2023 07:13:53 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x2-20020ac86b42000000b003b635a5d56csm8472323qts.30.2023.03.01.07.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 07:13:53 -0800 (PST)
From: bruce.ashfield@gmail.com
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/8] linux-yocto/6.1: update to v6.1.12
Date: Wed,  1 Mar 2023 10:13:41 -0500
Message-Id: <fd5386f0a521644083cfa5960913a6812731f020.1677683523.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1677683523.git.bruce.ashfield@gmail.com>
References: <cover.1677683523.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Mar 2023 15:13:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177938

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    129c15b60627 Linux 6.1.12
    da1ae884562c Documentation/hw-vuln: Add documentation for Cross-Thread Return Predictions
    40c4fdfc942e KVM: x86: Mitigate the cross-thread return address predictions bug
    cc95b5d240b6 x86/speculation: Identify processors vulnerable to SMT RSB predictions
    7fa83855852e drm/i915: Fix VBT DSI DVO port handling
    baaed8c92927 drm/i915: Initialize the obj flags for shmem objects
    bfa700d12274 drm/i915: Move fd_install after last use of fence
    5af27a53a881 drm/amd/display: fix cursor offset on rotation 180
    8d81e1c6865e drm/amd/display: properly handling AGP aperture in vm setup
    4609e1773222 drm/amdgpu/smu: skip pptable init under sriov
    2bcbbef9cace drm/amdgpu/fence: Fix oops due to non-matching drm_sched init/fini
    d82e6903b395 drm/amd/pm: bump SMU 13.0.7 driver_if header version
    e379d5662c26 drm/amdgpu: Add unique_id support for GC 11.0.1/2
    daaa0760cd0b drm/amd/pm: bump SMU 13.0.0 driver_if header version
    346631d52a42 arm64: efi: Force the use of SetVirtualAddressMap() on eMAG and Altra Max machines
    3b4c045a98f5 Fix page corruption caused by racy check in __free_pages
    274d9a28527d arm64: dts: meson-axg: Make mmc host controller interrupts level-sensitive
    222b1070b0fa arm64: dts: meson-g12-common: Make mmc host controller interrupts level-sensitive
    a01ad536becb arm64: dts: meson-gx: Make mmc host controller interrupts level-sensitive
    446ac8dd8997 rtmutex: Ensure that the top waiter is always woken up
    386a8d694f95 tracing: Fix TASK_COMM_LEN in trace event format file
    a2e60fee4b76 drm/amdgpu: Use the TGID for trace_amdgpu_vm_update_ptes
    6f097c24815e powerpc/64s/interrupt: Fix interrupt exit race with security mitigation switch
    026cae99d064 riscv: kprobe: Fixup misaligned load text
    7d151eccd07a riscv: Fixup race condition on PG_dcache_clean in flush_icache_pte
    9f55a0a2d94f nvdimm: Support sizeof(struct page) > MAX_STRUCT_PAGE_SIZE
    a89868254cd2 ceph: flush cap releases when the session is flushed
    62890f3eabf8 drm/amd/pm: add SMU 13.0.7 missing GetPptLimit message mapping
    7d2cd4736d1a pinctrl: qcom: sm8450-lpass-lpi: correct swr_rx_data group
    ab6fd64dda2b clk: ingenic: jz4760: Update M/N/OD calculation algorithm
    15f9f8eb3b8b cxl/region: Fix passthrough-decoder detection
    a04c7d062b53 cxl/region: Fix null pointer dereference for resetting decoder
    01815a1caf2f usb: typec: altmodes/displayport: Fix probe pin assign check
    db9c4a94b629 usb: core: add quirk for Alcor Link AK9563 smartcard reader
    51aa10112b12 btrfs: free device in btrfs_close_devices for a single device filesystem
    1ab4bed3fc8b btrfs: simplify update of last_dir_index_offset when logging a directory
    f676c8a69588 selftests: mptcp: stop tests earlier
    b7692fb9a2b0 selftests: mptcp: allow more slack for slow test-case
    ba36772a1cc9 mptcp: be careful on subflow status propagation on errors
    e266ad04ec39 mptcp: do not wait for bare sockets' timeout
    0d2cf3fae701 net: USB: Fix wrong-direction WARNING in plusb.c
    3684a2f6affa cifs: Fix use-after-free in rdata->read_into_pages()
    33dd18fbbb2d pinctrl: intel: Restore the pins that used to be in Direct IRQ mode
    3319d7292568 pinctrl: aspeed: Revert "Force to disable the function's signal"
    ebe63349cd48 spi: dw: Fix wrong FIFO level setting for long xfers
    bcc487001a15 pinctrl: single: fix potential NULL dereference
    9eab7b053947 pinctrl: aspeed: Fix confusing types in return value
    b048b969b362 pinctrl: mediatek: Fix the drive register definition of some Pins
    6353ebac4612 clk: microchip: mpfs-ccc: Use devm_kasprintf() for allocating formatted strings
    dcfe5431fb0f ASoC: topology: Return -ENOMEM on memory allocation failure
    3b858f23cefb ASoC: fsl_sai: fix getting version from VERID
    84560e33cea5 ASoC: tas5805m: add missing page switch.
    3e984873e4ac ASoC: tas5805m: rework to avoid scheduling while atomic.
    0f3d5c12b612 arm64: dts: mediatek: mt8195: Fix vdosys* compatible strings
    12773070b09b riscv: stacktrace: Fix missing the first frame
    885f729b249f ALSA: pci: lx6464es: fix a debug loop
    65473ade5062 arm64: dts: rockchip: set sdmmc0 speed to sd-uhs-sdr50 on rock-3a
    10150d350917 arm64: dts: rockchip: fix input enable pinconf on rk3399
    81685c59dc4b selftests: forwarding: lib: quote the sysctl values
    399f1cccc447 net: mscc: ocelot: fix all IPv6 getting trapped to CPU when PTP timestamping is used
    1d52bbfd469a rds: rds_rm_zerocopy_callback() use list_first_entry()
    da32c2d9f64b selftests: Fix failing VXLAN VNI filtering test
    0ae9d81109e9 txhash: fix sk->sk_txrehash default
    44a265af4aa9 net: ethernet: mtk_eth_soc: fix wrong parameters order in __xdp_rxq_info_reg()
    5f9c656ab2c4 igc: Add ndo_tx_timeout support
    190296d51b46 net/mlx5: Serialize module cleanup with reload and remove
    b266f3158171 net/mlx5: fw_tracer, Zero consumer index when reloading the tracer
    525e29974e3c net/mlx5: fw_tracer, Clear load bit when freeing string DBs buffers
    ee128b700fd0 net/mlx5: Expose SF firmware pages counter
    bbdfebb08ff5 net/mlx5: Store page counters in a single array
    5ccc3707e975 net/mlx5e: IPoIB, Show unknown speed instead of error
    026eb3e01a3d net/mlx5e: Fix crash unsetting rx-vlan-filter in switchdev mode
    1e9b6d279db1 net/mlx5: Bridge, fix ageing of peer FDB entries
    aee099bb0cd4 net/mlx5e: Update rx ring hw mtu upon each rx-fcs flag change
    4d15289c22fa net: mscc: ocelot: fix VCAP filters not matching on MAC with "protocol 802.1Q"
    139c759823b0 net: dsa: mt7530: don't change PVC_EG_TAG when CPU port becomes VLAN-aware
    47f4ff6f23f0 ice: switch: fix potential memleak in ice_add_adv_recipe()
    8eeca43d8e7e ice: Fix disabling Rx VLAN filtering with port VLAN enabled
    df59e0540145 ice: Do not use WQ_MEM_RECLAIM flag for workqueue
    437f8892ece7 nvidiafb: detect the hardware support before removing console.
    c47c2b173d0c cpuset: Call set_cpus_allowed_ptr() with appropriate mask for task
    5489930113dc drm/virtio: exbuf->fence_fd unmodified on interrupted wait
    d05b72328810 drm/i915: Don't do the WM0->WM1 copy w/a if WM1 is already enabled
    16da5f6d38ac HID: amd_sfh: if no sensors are enabled, clean up
    c0eb3c0cdd1b net: microchip: sparx5: fix PTP init/deinit not checking all ports
    89c0c69fc739 uapi: add missing ip/ipv6 header dependencies for linux/stddef.h
    c97c7c3103a3 cpufreq: qcom-hw: Fix cpufreq_driver->get() for non-LMH systems
    07154f94c213 ionic: missed doorbell workaround
    a16f6ea194fe ionic: refactor use of ionic_rx_fill()
    db34b5352e92 ionic: clean interrupt before enabling queue to avoid credit race
    95e29c11abe5 net: phy: meson-gxl: use MMD access dummy stubs for GXL, internal PHY
    9c6a896b8d40 net: macb: Perform zynqmp dynamic configuration only for SGMII interface
    d974330c1d99 bonding: fix error checking in bond_debug_reregister()
    a65723e299dc net: phylink: move phy_device_free() to correctly release phy device
    a7f0ec26cd67 of: Make OF framebuffer device names unique
    5954eaab6bb7 xfrm: fix bug with DSCP copy to v6 from v4 tunnel
    d53903cc2396 RDMA/usnic: use iommu_map_atomic() under spin_lock()
    360682fe7df2 RDMA/irdma: Fix potential NULL-ptr-dereference
    f6d8b6762bee xfrm: annotate data-race around use_time
    7197460dcd43 IB/IPoIB: Fix legacy IPoIB due to wrong number of queues
    419674224390 xfrm/compat: prevent potential spectre v1 gadget in xfrm_xlate32_attr()
    0a4f811f2e5d IB/hfi1: Restore allocated resources on failed copyout
    cf118814ae89 xfrm: compat: change expression for switch in xfrm_xlate64
    3fc0b7b7e9a5 HID: logitech: Disable hi-res scrolling on USB
    c86e6d30c522 can: j1939: do not wait 250 ms if the same addr was already claimed
    ad7e46427f92 of/address: Return an error when no valid dma-ranges are found
    0a3e60b3fe49 tracing: Fix poll() and select() do not work on per_cpu trace_pipe and trace_pipe_raw
    5c4bd3f2f6eb Revert "PCI/ASPM: Refactor L1 PM Substates Control Register programming"
    3361eb2256f9 Revert "PCI/ASPM: Save L1 PM Substates Capability for suspend/resume"
    63380b631f3d ALSA: hda/realtek: fix mute/micmute LEDs don't work for a HP platform.
    fdc304eef6e8 ALSA: hda/realtek: Add quirk for ASUS UM3402 using CS35L41
    566cad13beb6 ALSA: hda/realtek: Enable mute/micmute LEDs on HP Elitebook, 645 G9
    49f4284ab3b5 ALSA: hda/realtek: Fix the speaker output on Samsung Galaxy Book2 Pro 360
    9d26f571df4d ALSA: emux: Avoid potential array out-of-bound in snd_emux_xg_control()
    ab9b01a7acd5 ALSA: hda/realtek: Add Positivo N14KP6-TG
    8ab575add354 btrfs: zlib: zero-initialize zlib workspace
    66cf3a8273ab btrfs: limit device extents to the device size
    6b2aaf302ce8 hv_netvsc: Allocate memory in netvsc_dma_map() with GFP_ATOMIC
    d60c95efffe8 Linux 6.1.11
    74eec8266f37 bpf: Skip invalid kfunc call in backtrack_insn
    d458a0984429 gfs2: Always check inode size of inline inodes
    62b11a34a98c gfs2: Cosmetic gfs2_dinode_{in,out} cleanup
    f06de1bb6d61 wifi: brcmfmac: Check the count value of channel spec to prevent out-of-bounds reads
    5b25035fb888 f2fs: fix to do sanity check on i_extra_isize in is_alive()
    1b4c08844628 fbdev: smscufx: fix error handling code in ufx_usb_probe
    ddeff03bb338 f2fs: initialize locks earlier in f2fs_fill_super()
    07a96977b2f4 ovl: Use "buf" flexible array for memcpy() destination
    543bba3be262 fs/ntfs3: Validate attribute data and valid sizes
    0153009a7e65 powerpc/imc-pmu: Revert nest_init_lock to being a mutex
    5a9fe6b7f4c1 powerpc/64s: Fix local irq disable when PMIs are disabled
    18bac7de2459 powerpc/64s/radix: Fix crash with unaligned relocated kernel
    54fb38bcaaa0 iio:adc:twl6030: Enable measurement of VAC
    f6c0ebc10c0b ASoC: SOF: sof-audio: prepare_widgets: Check swidget for NULL on sink failure
    02b9d653531d platform/x86/amd: pmc: add CONFIG_SERIO dependency
    9d25aea2ab4f serial: 8250_dma: Fix DMA Rx rearm race
    bd8d2ba9d9e0 serial: 8250_dma: Fix DMA Rx completion race
    5f3dedbc3bf4 phy: qcom-qmp-combo: fix runtime suspend
    5288d522a987 nvmem: core: fix return value
    1dcd68c9cc5c nvmem: core: fix cell removal on error
    d78f5d46fc2a nvmem: core: fix device node refcounting
    897dfd346223 nvmem: core: fix registration vs use race
    39708bc8da78 nvmem: core: fix cleanup after dev_set_name()
    1e2a745a896e nvmem: core: remove nvmem_config wp_gpio
    28829e5f1c88 nvmem: core: initialise nvmem->id early
    86dbbc8f6ba7 drm/amdgpu: update wave data type to 3 for gfx11
    91ef43f6b65b drm/amd/pm: drop unneeded dpm features disablement for SMU 13.0.4/11
    814d83a710e8 drm/amd: Fix initialization for nbio 4.3.0
    0769f997a7b6 drm/i915: Fix potential bit_17 double-free
    764accc2c1b8 drm/i915: Avoid potential vm use-after-free
    52c6d3a84a3e serial: stm32: Merge hard IRQ and threaded IRQ handling into single IRQ handler
    e48a8ad77be3 dma-buf: actually set signaling bit for private stub fences
    d8b46cc1cf9b migrate: hugetlb: check for hugetlb shared PMD in node migration
    82587c0e2735 maple_tree: fix mas_empty_area_rev() lower bound validation
    a7da7d01ac5c Squashfs: fix handling and sanity checking of xattr_ids count
    c4fd07cd5e7e ia64: fix build error due to switch case label appearing next to declaration
    ef8a286338c4 highmem: round down the address passed to kunmap_flush_on_unmap()
    96aaaf866601 mm/MADV_COLLAPSE: catch !none !huge !bad pmd lookups
    97f17a737270 mm, mremap: fix mremap() expanding for vma's with vm_ops->close()
    acb08187b5a8 mm/khugepaged: fix ->anon_vma race
    49178d4d61e7 mm/swapfile: add cond_resched() in get_swap_pages()
    2d11727655bf mm/uffd: fix pte marker when fork() without fork event
    b10990bee73c fpga: stratix10-soc: Fix return value check in s10_ops_write_init()
    74cff472d3d6 fpga: m10bmc-sec: Fix probe rollback
    32beac7a3d0f x86/debug: Fix stack recursion caused by wrongly ordered DR7 accesses
    0b570a059cf4 HV: hv_balloon: fix memory leak with using debugfs_lookup()
    cf1c917bf1c7 kernel/irq/irqdomain.c: fix memory leak with using debugfs_lookup()
    512d1ed968d5 usb: gadget: udc: do not clear gadget driver.bus
    fdd11d7136fd usb: typec: ucsi: Don't attempt to resume the ports before they exist
    dd63f6f0d946 usb: gadget: f_uac2: Fix incorrect increment of bNumEndpoints
    b79ba5953f6f mm: memcg: fix NULL pointer in mem_cgroup_track_foreign_dirty_slowpath()
    139f866e420a mm: hugetlb: proc: check for hugetlb shared PMD in /proc/PID/smaps
    04448022311c mm: multi-gen LRU: fix crash during cgroup migration
    b40680220b13 Revert "mm: kmemleak: alloc gray object for reserved region with direct map"
    4afacf17ff0f riscv: disable generation of unwind tables
    3028c3a169a2 parisc: Wire up PTRACE_GETREGS/PTRACE_SETREGS for compat case
    a6a5b7067018 parisc: Replace hardcoded value with PRIV_USER constant in ptrace.c
    d386bc5bf1cd parisc: Fix return code of pdc_iodc_print()
    96d3b446680e nvmem: qcom-spmi-sdam: fix module autoloading
    68ce2c8f9d0e nvmem: sunxi_sid: Always use 32-bit MMIO reads
    f5249bbae0e7 nvmem: brcm_nvram: Add check for kzalloc
    4092267ad66a iio: imu: fxos8700: fix MAGN sensor scale and unit
    ad3c145485b2 iio: imu: fxos8700: remove definition FXOS8700_CTRL_ODR_MIN
    8ac10e1cb0f5 iio: imu: fxos8700: fix failed initialization ODR mode assignment
    555daa41074d iio: imu: fxos8700: fix incorrect ODR mode readback
    efc3dc3812cf iio: imu: fxos8700: fix swapped ACCEL and MAGN channels readback
    af7b50e4f6ee iio: imu: fxos8700: fix map label of channel type to MAGN sensor
    3a91ef914ab1 iio: imu: fxos8700: fix IMU data bits returned to user space
    8f1b6aa3bf0f iio: imu: fxos8700: fix incomplete ACCEL and MAGN channels readback
    fb06fc5af496 iio: imu: fxos8700: fix ACCEL measurement range selection
    1a48ba20a551 iio: light: cm32181: Fix PM support on system with 2 I2C resources
    930351148181 iio:adc:twl6030: Enable measurements of VUSB, VBAT and others
    e05b41391ab3 iio: imx8qxp-adc: fix irq flood when call imx8qxp_adc_read_raw()
    9e480211d0f8 iio: adc: berlin2-adc: Add missing of_node_put() in error path
    0b2f949909a3 iio: adc: xilinx-ams: fix devm_krealloc() return value check
    f9e5c6d9ac6c iio: hid: fix the retval in gyro_3d_capture_sample
    37b5824545e6 iio: hid: fix the retval in accel_3d_capture_sample
    8c3203f47d33 rtc: efi: Enable SET/GET WAKEUP services as optional
    661bb546c4d5 efi: Accept version 2 of memory attributes table
    ac515839b1f3 ASoC: SOF: keep prepare/unprepare widgets in sink path
    18691bdd5db5 ASoC: SOF: sof-audio: skip prepare/unprepare if swidget is NULL
    b6552a76015a ASoC: SOF: sof-audio: unprepare when swidget->use_count > 0
    60a1ffed517f ASoC: codecs: wsa883x: correct playback min/max rates
    dd405afa4e97 ALSA: hda/realtek: fix mute/micmute LEDs, speaker don't work for a HP platform
    e58d01b09930 ALSA: hda/realtek: Add Acer Predator PH315-54
    be606481eb33 watchdog: diag288_wdt: fix __diag288() inline assembly
    f3d786285f4c watchdog: diag288_wdt: do not use stack buffers for hardware data
    ad8860868141 can: isotp: handle wait_event_interruptible() return values
    cae4c9bc35f7 can: isotp: split tx timer into transmission and timeout
    6e62048f527d net: qrtr: free memory on error path in radix_tree_insert()
    334ce90fadd1 ARM: dts: imx7d-smegw01: Fix USB host over-current polarity
    78792d25b658 hv_netvsc: Fix missed pagebuf entries in netvsc_dma_map/unmap()
    a2ab7f2cf5ef cgroup/cpuset: Fix wrong check in update_parent_subparts_cpumask()
    5e7f6e2ade57 fbcon: Check font dimension limits
    8506f16aae9d vc_screen: move load of struct vc_data pointer in vcs_read() to avoid UAF
    3b1534f5bae7 usb: gadget: f_fs: Fix unbalanced spinlock in __ffs_ep0_queue_wait
    f3ce160b301c usb: dwc3: qcom: enable vbus override when in OTG dr-mode
    e99780c3e7a9 iio: adc: stm32-dfsdm: fill module aliases
    016dadc60e2e bcache: Silence memcpy() run-time false positive warnings
    f3056978934c drm/amd/display: Fix timing not changning when freesync video is enabled
    22312eeab33e net/x25: Fix to not accept on connected socket
    72e5a83b7c84 platform/x86/amd: pmc: Disable IRQ1 wakeup for RN/CZN
    37e9784331f2 platform/x86: gigabyte-wmi: add support for B450M DS3H WIFI-CF
    919ff2c40145 platform/x86: hp-wmi: Handle Omen Key event
    eb74184dcc70 platform/x86: dell-wmi: Add a keymap for KEY_MUTE in type 0x0010 table
    19e2f49914e7 x86/build: Move '-mindirect-branch-cs-prefix' out of GCC-only block
    40971f2e525e Revert "gfs2: stop using generic_writepages in gfs2_ail1_start_one"
    c671f7aaf2d8 i2c: rk3x: fix a bunch of kernel-doc warnings
    61e43ebfd243 scsi: iscsi_tcp: Fix UAF during login when accessing the shost ipaddress
    8859687f5b24 scsi: iscsi_tcp: Fix UAF during logout when accessing the shost ipaddress
    35e44dc40283 perf/x86/intel/cstate: Add Emerald Rapids
    e095f0d86e3a perf/x86/intel: Add Emerald Rapids
    fcf8b1a6d5b8 x86/aperfmperf: Erase stale arch_freq_scale values when disabling frequency invariance readings
    f6c8f682e588 scsi: target: core: Fix warning on RT kernels
    c1435f5a03c8 i2c: mxs: suppress probe-deferral error message
    8e9b15ad1484 i2c: designware-pci: Add new PCI IDs for AMD NAVI GPU
    65166bccd038 kbuild: modinst: Fix build error when CONFIG_MODULE_SIG_KEY is a PKCS#11 URI
    10282d9daaf7 certs: Fix build error when PKCS#11 URI contains semicolon
    71ebd83f320e rtc: sunplus: fix format string for printing resource
    a2e6a9ff89f1 efi: fix potential NULL deref in efi_mem_reserve_persistent
    70d40674a549 net: openvswitch: fix flow memory leak in ovs_flow_cmd_new
    2c036e21c2b6 virtio-net: Keep stop() to follow mirror sequence of open()
    462a2c1bdf1a selftests: net: udpgso_bench_tx: Cater for pending datagrams zerocopy benchmarking
    14782ea872e0 selftests: net: udpgso_bench: Fix racing bug between the rx/tx programs
    430bc0756ae1 selftests: net: udpgso_bench_rx/tx: Stop when wrong CLI args are provided
    5bbc22fdbcbc selftests: net: udpgso_bench_rx: Fix 'used uninitialized' compiler warning
    3b7fbcf86eee ata: libata: Fix sata_down_spd_limit() when no link speed is reported
    6366671954f0 can: mcp251xfd: mcp251xfd_ring_set_ringparam(): assign missing tx_obj_num_coalesce_irq
    c3033f91ebd6 can: raw: fix CAN FD frame transmissions over CAN XL devices
    1740a1e45eee can: j1939: fix errant WARN_ON_ONCE in j1939_session_deactivate
    0cb094179aa8 octeontx2-af: Fix devlink unregister
    adf848eab2d4 igc: return an error if the mac type is unknown in igc_ptp_systim_to_hwtstamp()
    12316538b1d1 riscv: kprobe: Fixup kernel panic when probing an illegal position
    848b6074654e ip/ip6_gre: Fix non-point-to-point tunnel not generating IPv6 link local address
    abac37d8f90c ip/ip6_gre: Fix changing addr gen mode not generating IPv6 link local address
    e2d967b42a71 drm/panel: boe-tv101wum-nl6: Ensure DSI writes succeed during disable
    11ee5d630827 net: phy: meson-gxl: Add generic dummy stubs for MMD register access
    0cfe084e1530 sctp: do not check hb_timer.expires when resetting hb_timer
    e0514483fa88 maple_tree: should get pivots boundary by type
    29e774dcb271 squashfs: harden sanity check in squashfs_read_xattr_id_table
    14f56034ec4e kunit: fix kunit_test_init_section_suites(...)
    ee1e3fe4b457 block: ublk: extending queue_size to fix overflow
    a1512f11ec02 netfilter: br_netfilter: disable sabotage_in hook after first suppression
    3214b04de31b ALSA: firewire-motu: fix unreleased lock warning in hwdep device
    37c0cdf7e491 net/tls: tls_is_tx_ready() checked list_entry
    7a435fe0b6bb drm/i915/adlp: Fix typo for reference clock
    04dcff26490c drm/i915: Fix up locking around dumping requests lists
    9467397f417d drm/i915: Fix request ref counting during error capture & debugfs dump
    de997938a7a5 drm/i915/guc: Fix locking when searching for a hung request
    e7cdec97ebeb platform/x86: thinkpad_acpi: Fix thinklight LED brightness returning 255
    21745fbfe760 platform/x86/amd/pmf: Ensure mutexes are initialized before use
    7f7f441347b4 platform/x86/amd/pmf: Fix to update SPS thermals when power supply change
    dadc3820a3d9 platform/x86/amd/pmf: Add helper routine to check pprof is balanced
    1db1edddb873 platform/x86/amd/pmf: Fix to update SPS default pprof thermals
    05484584cadf platform/x86/amd/pmf: Add helper routine to update SPS thermals
    bb4a5cef532d platform/x86/amd/pmf: update to auto-mode limits only after AMT event
    3be069f42a7b fscache: Use wait_on_bit() to wait for the freeing of relinquished volume
    5c2227f3f177 netrom: Fix use-after-free caused by accept on already connected socket
    cb1876fc33af block, bfq: fix uaf for bfqq in bic_set_bfqq()
    b2e181cf9e57 block, bfq: replace 0/1 with false/true in bic apis
    70fd5afb4c36 net: wwan: t7xx: Fix Runtime PM initialization
    78901b10522c net: phy: dp83822: Fix null pointer access on DP83825/DP83826 devices
    ddaf96f6953b sfc: correctly advertise tunneled IPv6 segmentation
    a838f8a69b1f skb: Do mix page pool and page referenced frags in GRO
    9e0d874c0a6b dpaa2-eth: execute xdp_do_flush() before napi_complete_done()
    71a773ab79c9 dpaa_eth: execute xdp_do_flush() before napi_complete_done()
    e5aed1336303 virtio-net: execute xdp_do_flush() before napi_complete_done()
    b9fd30ea66e8 qede: execute xdp_do_flush() before napi_complete_done()
    34e0dd0947e9 ice: Prevent set_channel from changing queues while RDMA active
    c4cadb84e71b vhost-scsi: unbreak any layout for response
    5a1909510387 use less confusing names for iov_iter direction initializers
    6d6e144ffbf2 fix "direction" argument of iov_iter_kvec()
    ff85ec97d14c fix 'direction' argument of iov_iter_{init,bvec}()
    02f719be2f2b fix iov_iter_bvec() "direction" argument
    b50705b5ef09 memcpy_real(): WRITE is "data source", not destination...
    cefb33f5be6e zcore: WRITE is "data source", not destination...
    98653e51618e READ is "data destination", not source...
    a7fcd22a55a6 WRITE is "data source", not destination...
    0332bdec060a copy_oldmem_kernel() - WRITE is "data source", not destination
    ccbe22d4843d vhost/net: Clear the pending messages when the backend is removed
    0b49da857d32 ALSA: memalloc: Workaround for Xen PV
    3331d3416076 bpf: Fix the kernel crash caused by bpf_setsockopt().
    c7ee7bad9c1b scsi: Revert "scsi: core: map PQ=1, PDT=other values to SCSI_SCAN_TARGET_PRESENT"
    9e0097cb51e6 drm/ssd130x: Init display before the SSD130X_DISPLAY_ON command
    c590a4a59a98 drm/vc4: hdmi: make CEC adapter name unique
    0bdd5a7b517f arm64: dts: imx8mm-verdin: Do not power down eth-phy
    3419ddcfa143 arm64: dts: imx8mm: Fix pad control for UART1_DTE_RX
    12b0ec7c6953 bpf, sockmap: Check for any of tcp_bpf_prots when cloning a listener
    7715f96f4ba6 media: v4l2-ctrls-api.c: move ctrl->is_new = 1 to the correct line
    d5c7a2ab5e1f bpf: Add missing btf_put to register_btf_id_dtor_kfuncs
    d52f34784e4e ASoC: SOF: ipc4-mtrace: prevent underflow in sof_ipc4_priority_mask_dfs_write()
    4ea7f83314f1 selftests/filesystems: grant executable permission to run_fat_tests.sh
    7c7652ffa986 bpf: Fix to preserve reg parent/live fields when copying range info
    f011360ad234 ALSA: hda/via: Avoid potential array out-of-bound in add_secret_dac_path()
    6a199d556c02 bpf: Fix a possible task gone issue with bpf_send_signal[_thread]() helpers
    c32efcf9ff85 bpf: Fix off-by-one error in bpf_mem_cache_idx()
    ba32923bcedd ASoC: Intel: avs: Implement PCI shutdown
    cdebb52d6098 ASoC: Intel: sof_es8336: Drop reference count of ACPI device after use
    c48af765e183 ASoC: Intel: bytcr_wm5102: Drop reference count of ACPI device after use
    c72c57b689bf ASoC: Intel: bytcr_rt5640: Drop reference count of ACPI device after use
    877699a054ec ASoC: Intel: bytcr_rt5651: Drop reference count of ACPI device after use
    eddc0f2ad6d5 ASoC: Intel: bytcht_es8316: Drop reference count of ACPI device after use
    7b1ed88ec3af ASoC: amd: acp-es8336: Drop reference count of ACPI device after use
    ac949eae8d59 arm64: dts: freescale: imx8dxl: fix sc_pwrkey's property name linux,keycode
    13d27de91ace arm64: dts: imx8m-venice: Remove incorrect 'uart-has-rtscts'
    17b83ef66d0e bus: sunxi-rsb: Fix error handling in sunxi_rsb_init()
    c8bdc88216f0 firewire: fix memory leak for payload of request subaction to IEC 61883-1 FCP region
    17d99ea98b62 Linux 6.1.10
    cfc15cbd85aa net: mctp: purge receive queues on sk destruction
    60cd03ffe938 rust: print: avoid evaluating arguments in `pr_*` macros in `unsafe` blocks
    888dad6f3e85 net: fix NULL pointer in skb_segment_list
    9d369cd505ae gpiolib-acpi: Don't set GPIOs for wakeup in S3 mode
    69622f270cc9 gpiolib: acpi: Add a ignore wakeup quirk for Clevo NL5xRU
    30dc1de44e75 nvme-apple: only reset the controller when RTKit is running
    38044859deee cifs: fix return of uninitialized rc in dfs_cache_update_tgthint()
    1dba6881e332 gpiolib: acpi: Allow ignoring wake capability on pins that aren't in _AEI
    ce4745a6b801 dmaengine: imx-sdma: Fix a possible memory leak in sdma_transfer_init
    6b1cebcd9e89 HID: playstation: sanity check DualSense calibration data.
    7f85560667ed HID: uclogic: Add support for XP-PEN Deco 01 V2
    1fc24f9da259 s390: workaround invalid gcc-11 out of bounds read warning
    6f13860bba96 block: fix hctx checks for batch allocation
    99db989945cd ACPI: video: Add backlight=native DMI quirk for Acer Aspire 4810T
    efc1058831f9 LoongArch: Get frame info in unwind_start() when regs is not available
    a4a1af9fa08e blk-cgroup: fix missing pd_online_fn() while activating policy
    6db03adf078e erofs: clean up parsing of fscache related options
    27c54591ba26 kselftest: Fix error message for unconfigured LLVM builds
    495cec3763d7 ARM: omap1: fix building gpio15xx
    1d34087944a6 arm64: dts: msm8994-angler: fix the memory map
    ea2be0ca6913 mac80211: Fix MLO address translation for multiple bss case
    9f31d8c889d9 erofs/zmap.c: Fix incorrect offset calculation
    1283a01b6e19 bpf: Skip task with pid=1 in send_signal_common()
    e0b9560bf170 firmware: arm_scmi: Clear stale xfer->hdr.status
    ba355e99eff0 arm64: dts: imx8mq-thor96: fix no-mmc property for SDHCI
    a5a629d7dafc arm64: dts: freescale: Fix pca954x i2c-mux node names
    ab603e92db12 ARM: dts: vf610: Fix pca9548 i2c-mux node names
    7f68b6ecf5e9 ARM: dts: imx: Fix pca9547 i2c-mux node name

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_6.1.bb               |  6 ++---
 .../linux/linux-yocto-tiny_6.1.bb             |  6 ++---
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  | 26 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
index 7a7537505e..d83fa28164 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_6.1.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "8183fc0efdb87bd314afda93a7c02ff85dc5833d"
-SRCREV_meta ?= "a833bd2ced5dcd01c043348ec47218a545d00c5f"
+SRCREV_machine ?= "3f8b7b19642bbcf9a170cb1d0edc881f0ca9b72b"
+SRCREV_meta ?= "6c723fc4d35fbdb277e28d0072f8117e43679528"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "6.1.9"
+LINUX_VERSION ?= "6.1.12"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
index 393952a980..a0b9e2d28f 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_6.1.bb
@@ -5,7 +5,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "6.1.9"
+LINUX_VERSION ?= "6.1.12"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -14,8 +14,8 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_meta ?= "a833bd2ced5dcd01c043348ec47218a545d00c5f"
+SRCREV_machine ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_meta ?= "6c723fc4d35fbdb277e28d0072f8117e43679528"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_6.1.bb b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
index 8c99b98933..988718f212 100644
--- a/meta/recipes-kernel/linux/linux-yocto_6.1.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_6.1.bb
@@ -14,25 +14,25 @@ KBRANCH:qemux86-64 ?= "v6.1/standard/base"
 KBRANCH:qemuloongarch64  ?= "v6.1/standard/base"
 KBRANCH:qemumips64 ?= "v6.1/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "ccd3b20fb504d35147d35962254b68b0041a4c6f"
-SRCREV_machine:qemuarm64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
+SRCREV_machine:qemuarm ?= "96685a4bde4e1642af2413a7b78ee5ea4d544e81"
+SRCREV_machine:qemuarm64 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
 SRCREV_machine:qemuloongarch64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemumips ?= "d60ecbda7d4de915c867f751f5c63555a14219d1"
-SRCREV_machine:qemuppc ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemuriscv64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemuriscv32 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemux86 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemux86-64 ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_machine:qemumips64 ?= "2949d76c3f79f3c7f700a6366d828f006d7dd5a8"
-SRCREV_machine ?= "1caf99d56881e1510afca553cd4a057f80479973"
-SRCREV_meta ?= "a833bd2ced5dcd01c043348ec47218a545d00c5f"
+SRCREV_machine:qemumips ?= "9ecebe9ac613fb9347e0fc0d932432571bc6c951"
+SRCREV_machine:qemuppc ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_machine:qemuriscv64 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_machine:qemuriscv32 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_machine:qemux86 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_machine:qemux86-64 ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_machine:qemumips64 ?= "bfd40de0f8fa3500b51b32e55be0a01723ee31e5"
+SRCREV_machine ?= "d855e638945ed4223775c19f4eb203381c3bc24c"
+SRCREV_meta ?= "6c723fc4d35fbdb277e28d0072f8117e43679528"
 
 # set your preferred provider of linux-yocto to 'linux-yocto-upstream', and you'll
 # get the <version>/base branch, which is pure upstream -stable, and the same
 # meta SRCREV as the linux-yocto-standard builds. Select your version using the
 # normal PREFERRED_VERSION settings.
 BBCLASSEXTEND = "devupstream:target"
-SRCREV_machine:class-devupstream ?= "68a95455c153f8adc513e5b688f4b348daa7c1b1"
+SRCREV_machine:class-devupstream ?= "129c15b606278f9254a16013f7e5a94a128d9bcd"
 PN:class-devupstream = "linux-yocto-upstream"
 KBRANCH:class-devupstream = "v6.1/base"
 
@@ -40,7 +40,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-6.1;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "6.1.9"
+LINUX_VERSION ?= "6.1.12"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.34.1


