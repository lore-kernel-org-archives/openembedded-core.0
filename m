Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web12.17400.1610489655195379436
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 Jan 2021 14:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RMbwT2cy;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id e22so7518172iom.5
        for <openembedded-core@lists.openembedded.org>; Tue, 12 Jan 2021 14:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d1HC+0CmiDypgx59HxvE8pgn3d7SeT3YEXLX3FZGxLg=;
        b=RMbwT2cyhOvqphlHhVo+ZrwuQhjU50BiRyJeIlx7IBUYR4InFUyuwpfMpj3jUoKlro
         a8vaQC8s3rXkfJoWZK4nXREQ3z4udgBfznQBW0kPRupnwwjVv7n6QqXQlC1EE+v7P+9C
         pYI9wg1Jl14nMqA9MhGxWgJfDgsind29cWcSsndQb0SQQ8y1gsW0SOcEYuYfGyJ6OXIp
         v7Pd7WbJOJeA/Hxl8oqzUrU3JOtDMTtUkOCIkzQFOCRL4IclwOQti5s7FGZpwAyfdPTX
         QAvcSuhWTaNyMPjQlhxG2fIwWvAXuQq2KLJ1HeuwVuImf9ugKTyKr1v6R1stOa2nhTdL
         +OSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d1HC+0CmiDypgx59HxvE8pgn3d7SeT3YEXLX3FZGxLg=;
        b=aXIkCw9X+fhpxuJv/11qprhVu1TJ2eFv6rNmmhwrhIzrhSWPm0e7eKPeMw8msF7fdq
         BKv3CW/mLS/qfTaJADRr/iV/9XC5uKfZYu2Y3Ocjoqrx/qB55xPRbFONBygpqHwN0zml
         /tXQMWlgd/HKPwHhy2kTBSoFp04HbqQpkT24c7ypPyUSWJDHzrKuaGiHTD5PlfwycZCo
         /kN+05jsHAjD8b6OzGEBvxsF5U6n5ZJ0Oa5XlLm1ujLzExHflMPaYn9xhyamiyeWX9T+
         rrIIX/IUnPI2snxCeHorqEmlp0xHMTyCBXOpGoEt1JVq0gqHaCH4OsBMcTM7f+ixCvsU
         yxPQ==
X-Gm-Message-State: AOAM531j9ZNs9t91RmG8mkyKEJdRLxgzt1Kp/pWI2LGIvkNS04/aQZKN
	C3GEmTQ9n+BHunk8Tq+A8JijjAx3QkvKtg==
X-Google-Smtp-Source: ABdhPJw8S5no7qaxQOtWYygeYnp7YUrEd/BFBshvCVfJouKZW3FQRJRgYEFBsK1L2oaCy5o0qrBs8w==
X-Received: by 2002:a92:d990:: with SMTP id r16mr1284907iln.10.1610489654248;
        Tue, 12 Jan 2021 14:14:14 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.159.151])
        by smtp.gmail.com with ESMTPSA id s10sm62356iob.4.2021.01.12.14.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jan 2021 14:14:13 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] linux-yocto/5.10: update to v5.10.4
Date: Tue, 12 Jan 2021 17:14:07 -0500
Message-Id: <3adb861298b94003c359ed099f9cbe6033a7944d.1610489445.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1610489445.git.bruce.ashfield@gmail.com>
References: <cover.1610489445.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating linux-yocto/5.10 to the latest korg -stable release that comprises
the following commits:

    b1313fe517ca Linux 5.10.4
    700d098acec5 x86/CPU/AMD: Save AMD NodeId as cpu_die_id
    bb25fd492693 drm/edid: fix objtool warning in drm_cvt_modes()
    c13edadf1029 null_blk: Fail zone append to conventional zones
    92ee9b9fa8a4 null_blk: Fix zone size initialization
    2bbb32065694 Revert: "ring-buffer: Remove HAVE_64BIT_ALIGNED_ACCESS"
    783c5d48b22f rtc: ep93xx: Fix NULL pointer dereference in ep93xx_rtc_read_time
    b98ce1a17266 thermal/drivers/cpufreq_cooling: Update cpufreq_state only if state has changed
    450fc74de129 remoteproc: sysmon: Ensure remote notification ordering
    3f4b60a70c56 regulator: axp20x: Fix DLDO2 voltage control register mask for AXP22x
    39a6f4bef6a5 PCI: Fix pci_slot_release() NULL pointer dereference
    94bc6f5e2c14 of: fix linker-section match-table corruption
    680e7b2a0e09 mt76: add back the SUPPORTS_REORDERING_BUFFER flag
    f2d7cffc20f6 tracing: Disable ftrace selftests when any tracer is running
    054c923fd376 platform/x86: intel-vbtn: Allow switch events on Acer Switch Alpha 12
    16ecf8cecdd1 libnvdimm/namespace: Fix reaping of invalidated block-window-namespace labels
    ea43135a3cb2 memory: renesas-rpc-if: Fix unbalanced pm_runtime_enable in rpcif_{enable,disable}_rpm
    4f826e66b067 memory: renesas-rpc-if: Return correct value to the caller of rpcif_manual_xfer()
    739704940425 memory: renesas-rpc-if: Fix a node reference leak in rpcif_probe()
    e6fc90d170df memory: jz4780_nemc: Fix an error pointer vs NULL check in probe()
    c88347ae9364 xenbus/xenbus_backend: Disallow pending watch messages
    1a72241aabcb xen/xenbus: Count pending messages for each watch
    6835334e1546 xen/xenbus/xen_bus_type: Support will_handle watch callback
    9ae6d2f4ca8a xen/xenbus: Add 'will_handle' callback support in xenbus_watch_path()
    b4898bdd2020 xen/xenbus: Allow watches discard events before queueing
    aadd67750f43 xen-blkback: set ring->xenblkd to NULL after kthread_stop()
    c26062328e72 driver: core: Fix list corruption after device_del()
    0c500d6a5c7a dma-buf/dma-resv: Respect num_fences when initializing the shared fence list.
    224adad2c975 device-dax/core: Fix memory leak when rmmod dax.ko
    1e75951e9b43 counter: microchip-tcb-capture: Fix CMR value check
    b11905a3b977 clk: tegra: Do not return 0 on failure
    db003855f7d1 clk: mvebu: a3700: fix the XTAL MODE pin to MPP1_9
    070e386727fd clk: ingenic: Fix divider calculation with div tables
    dcea0b3835df pinctrl: sunxi: Always call chained_irq_{enter, exit} in sunxi_pinctrl_irq_handler
    d27d1942e173 md/cluster: fix deadlock when node is doing resync job
    3ace8d52ee4a md/cluster: block reshape with remote resync job
    c1f4549a7399 iio:adc:ti-ads124s08: Fix alignment and data leak issues.
    c834798d783e iio:adc:ti-ads124s08: Fix buffer being too long.
    1d14e2f4ca00 iio:imu:bmi160: Fix alignment and data leak issues
    f57464c4037b iio:imu:bmi160: Fix too large a buffer.
    5550e16128ed iio:pressure:mpl3115: Force alignment of buffer
    c02f8e0ef056 iio:magnetometer:mag3110: Fix alignment and data leak issues.
    2409bfd6e344 iio:light:st_uvis25: Fix timestamp alignment and prevent data leak.
    45ebad3dc057 iio:light:rpr0521: Fix timestamp alignment and prevent data leak.
    6e94b8314c1f iio: imu: st_lsm6dsx: fix edge-trigger interrupts
    160ec8afa7cf iio: adc: rockchip_saradc: fix missing clk_disable_unprepare() on error in rockchip_saradc_resume
    2adb3f8bcc29 iio: buffer: Fix demux update
    aa606ebab122 openat2: reject RESOLVE_BENEATH|RESOLVE_IN_ROOT
    da65881cecf5 scsi: lpfc: Re-fix use after free in lpfc_rq_buf_free()
    d234a0e76c74 scsi: lpfc: Fix scheduling call while in softirq context in lpfc_unreg_rpi
    0af3d9342c32 scsi: lpfc: Fix invalid sleeping context in lpfc_sli4_nvmet_alloc()
    6a6754485b0c scsi: qla2xxx: Fix crash during driver load on big endian machines
    3e7312ba3e31 mtd: rawnand: meson: fix meson_nfc_dma_buffer_release() arguments
    392a56b9f2c5 mtd: rawnand: qcom: Fix DMA sync on FLASH_STATUS register read
    d5e3fc275ea1 mtd: core: Fix refcounting for unpartitioned MTDs
    9e43463d5a97 mtd: parser: cmdline: Fix parsing of part-names with colons
    baad618d078c mtd: spinand: Fix OOB read
    3bcf02208e9e soc: qcom: smp2p: Safely acquire spinlock without IRQs
    785eee857dba spi: atmel-quadspi: Fix AHB memory accesses
    e7351d8c7804 spi: atmel-quadspi: Disable clock in probe error path
    671ad53ff3d5 spi: mt7621: Don't leak SPI master in probe error path
    81950b6fbf32 spi: mt7621: Disable clock in probe error path
    7efdae0bd6cf spi: synquacer: Disable clock in probe error path
    e932dce770ec spi: st-ssc4: Fix unbalanced pm_runtime_disable() in probe error path
    186147729d83 spi: spi-qcom-qspi: Fix use-after-free on unbind
    ad8a844fec32 spi: spi-geni-qcom: Fix use-after-free on unbind
    a4fd01eef86d spi: sc18is602: Don't leak SPI master in probe error path
    11b81d94f8df spi: rpc-if: Fix use-after-free on unbind
    a3e86ed72890 spi: rb4xx: Don't leak SPI master in probe error path
    cc5a0cb11450 spi: pic32: Don't leak DMA channels in probe error path
    a73ee1d8faff spi: npcm-fiu: Disable clock in probe error path
    3bf639fe0661 spi: mxic: Don't leak SPI master in probe error path
    0c2867db23e4 spi: gpio: Don't leak SPI master in probe error path
    ea923e72784e spi: fsl: fix use of spisel_boot signal on MPC8309
    4e80a2e96037 spi: davinci: Fix use-after-free on unbind
    bbba6b7a5357 spi: ar934x: Don't leak SPI master in probe error path
    f9fc76c394df spi: spi-mtk-nor: Don't leak SPI master in probe error path
    9be450fa3f46 spi: atmel-quadspi: Fix use-after-free on unbind
    672631640424 spi: spi-sh: Fix use-after-free on unbind
    14949322a14c spi: pxa2xx: Fix use-after-free on unbind
    067d9120a328 iio: ad_sigma_delta: Don't put SPI transfer buffer on the stack
    43be7c3b8192 drm/i915: Fix mismatch between misplaced vma check and vma insert
    f8357c910e41 drm/dp_aux_dev: check aux_dev before use in drm_dp_aux_dev_get_by_minor()
    ea64b21c6638 drm/amd/display: Fix memory leaks in S3 resume
    08a050c197ed drm/amdgpu: only set DP subconnector type on DP and eDP connectors
    898f999e940f platform/x86: mlx-platform: remove an unused variable
    86fcb7910df7 drm/panfrost: Move the GPU reset bits outside the timeout handler
    a61da034c5e9 drm/panfrost: Fix job timeout handling
    c2032bf94ba4 jfs: Fix array index bounds check in dbAdjTree
    41bf5eed809e fsnotify: fix events reported to watching parent and child
    5e78c6bd905e inotify: convert to handle_inode_event() interface
    c9be99c86191 fsnotify: generalize handle_inode_event()
    1aa8e7801ec2 jffs2: Fix ignoring mounting options problem during remounting
    ecdb868accde jffs2: Fix GC exit abnormally
    453f2dfa340f ubifs: wbuf: Don't leak kernel memory to flash
    6489b80239ad SMB3.1.1: do not log warning message if server doesn't populate salt
    639fd38197ee SMB3.1.1: remove confusing mount warning when no SPNEGO info on negprot rsp
    aa36952c5662 SMB3: avoid confusing warning message on mount to Azure
    db1c6b8a266e ceph: fix race in concurrent __ceph_remove_cap invocations
    ef82413937d1 um: Fix time-travel mode
    c4b425322134 um: Remove use of asprinf in umid.c
    0f2206e3d90a ima: Don't modify file descriptor mode on the fly
    7c8c9e1e53fa ovl: make ioctl() safe
    cd2eda58ea03 powerpc/powernv/memtrace: Fix crashing the kernel when enabling concurrently
    4b8dcb006e18 powerpc/powernv/memtrace: Don't leak kernel memory to user space
    8fe4bee4c0f6 powerpc/powernv/npu: Do not attempt NPU2 setup on POWER8NVL NPU
    600ebd043469 powerpc/mm: Fix verification of MMU_FTR_TYPE_44x
    a8b871dfacfb powerpc/8xx: Fix early debug when SMC1 is relocated
    8bc125f596d1 powerpc/xmon: Change printk() to pr_cont()
    2ae45223e46b powerpc/feature: Add CPU_FTR_NOEXECUTE to G2_LE
    fe534d76d450 powerpc/bitops: Fix possible undefined behaviour with fls() and fls64()
    e02baf91c7cc powerpc/rtas: Fix typo of ibm,open-errinjct in RTAS filter
    a4af71ae5a6b powerpc: Fix incorrect stw{, ux, u, x} instructions in __set_pte_at
    ac9911f8119d powerpc/32: Fix vmap stack - Properly set r1 before activating MMU on syscall too
    35f71f3cbd7d xprtrdma: Fix XDRBUF_SPARSE_PAGES support
    6a9a98fdd45e ARM: tegra: Populate OPP table for Tegra20 Ventana
    8a7899afed75 ARM: dts: at91: sama5d2: fix CAN message ram offset and size
    f02ba166a56d ARM: dts: pandaboard: fix pinmux for gpio user button of Pandaboard ES
    1dd44b5e5f20 iommu/arm-smmu-qcom: Implement S2CR quirk
    f48e7f77713e iommu/arm-smmu-qcom: Read back stream mappings
    3192e184ad94 iommu/arm-smmu: Allow implementation specific write_s2cr
    711081d7e096 KVM: SVM: Remove the call to sev_platform_status() during setup
    49830b2d1b91 KVM: x86: reinstate vendor-agnostic check on SPEC_CTRL cpuid bits
    e365b97a1576 KVM: arm64: Introduce handling of AArch32 TTBCR2 traps
    e0dad9a78c85 arm64: dts: marvell: keep SMMU disabled by default for Armada 7040 and 8040
    0403bf25a46d arm64: dts: ti: k3-am65: mark dss as dma-coherent
    72b5a6ace8a8 RISC-V: Fix usage of memblock_enforce_memory_limit
    0b3ade0b8686 ext4: don't remount read-only with errors=continue on reboot
    a8f8e6ae9744 ext4: fix deadlock with fs freezing and EA inodes
    d28f60699590 ext4: fix a memory leak of ext4_free_data
    bc0e046052b2 ext4: fix an IS_ERR() vs NULL check
    8f4bf6eea3f3 btrfs: fix race when defragmenting leads to unnecessary IO
    5c5bc5738be2 btrfs: update last_byte_to_unpin in switch_commit_roots
    56d1654dc2fe btrfs: do not shorten unpin len for caching block groups
    ed5e2515a3d6 USB: serial: keyspan_pda: fix write unthrottling
    28a9c268380a USB: serial: keyspan_pda: fix tx-unthrottle use-after-free
    df2754ae5f0e USB: serial: keyspan_pda: fix write-wakeup use-after-free
    1254104e1c43 USB: serial: keyspan_pda: fix stalled writes
    3a24c8cbb618 USB: serial: keyspan_pda: fix write deadlock
    24372050388d USB: serial: keyspan_pda: fix dropped unthrottle interrupts
    272c6a678efe USB: serial: digi_acceleport: fix write-wakeup deadlocks
    ddbb36cb3f2d USB: serial: mos7720: fix parallel-port state restore
    fe9db435d27e dyndbg: fix use before null check
    771b663fa532 cpuset: fix race between hotplug work and later CPU offline
    eae95da7fcc6 EDAC/amd64: Fix PCI component registration
    3a881be1b4e9 EDAC/i10nm: Use readl() to access MMIO registers
    d03b710d8eae Documentation: seqlock: s/LOCKTYPE/LOCKNAME/g
    29563a73819a m68k: Fix WARNING splat in pmac_zilog driver
    da446be71e3b crypto: arm/aes-ce - work around Cortex-A57/A72 silion errata
    c49bfdb52101 crypto: ecdh - avoid unaligned accesses in ecdh_set_secret()
    fef8633a85fb cpufreq: intel_pstate: Use most recent guaranteed performance values
    58b97af1768d powerpc/perf: Exclude kernel samples while counting events in user space.
    0b505007f93e perf/x86/intel/lbr: Fix the return type of get_lbr_cycles()
    2bc4ac17ece7 perf/x86/intel: Fix rtm_abort_event encoding on Ice Lake
    3fdd3589a263 perf/x86/intel: Add event constraint for CYCLE_ACTIVITY.STALLS_MEM_ANY
    746d179b0e66 z3fold: stricter locking and more careful reclaim
    b8b1d4e96a10 z3fold: simplify freeing slots
    e885d1c515da staging: comedi: mf6x4: Fix AI end-of-conversion detection
    6dcea0e5d277 ASoC: AMD Raven/Renoir - fix the PCI probe (PCI revision)
    f7d6aaca08c6 ASoC: AMD Renoir - add DMI table to avoid the ACP mic probe (broken BIOS)
    74a4802ff431 ASoC: cx2072x: Fix doubly definitions of Playback and Capture streams
    06da7fff7701 binder: add flag to clear buffer on txn complete
    983e7f3521f1 s390/dasd: fix list corruption of lcu list
    18494d12ef9b s390/dasd: fix list corruption of pavgroup group list
    96aca84128f2 s390/dasd: prevent inconsistent LCU device data
    a67e261b5b9e s390/dasd: fix hanging device offline processing
    24d9a8ef1f92 s390/idle: fix accounting with machine checks
    d5d21549d7eb s390/idle: add missing mt_cycles calculation
    bc8f8833e994 s390/kexec_file: fix diag308 subcode when loading crash kernel
    0063e1142a73 s390/smp: perform initial CPU reset also for SMT siblings
    bb9dc2f2e590 ALSA: core: memalloc: add page alignment for iram
    ac95e33828cd ALSA: usb-audio: Add alias entry for ASUS PRIME TRX40 PRO-S
    de8f8a38f222 ALSA: usb-audio: Disable sample read check if firmware doesn't give back
    92549c90ed0f ALSA: usb-audio: Add VID to support native DSD reproduction on FiiO devices
    11ba87db73b5 ALSA: hda/realtek - Supported Dell fixed type headset
    dab63c1908af ALSA: hda/realtek: Remove dummy lineout on Acer TravelMate P648/P658
    c131e56ac910 ALSA: hda/realtek: Apply jack fixup for Quanta NL3
    8a0e34b2739c ALSA: hda/realtek: Add quirk for MSI-GP73
    8fdb96104588 ALSA/hda: apply jack fixup for the Acer Veriton N4640G/N6640G/N2510G
    01b4436d0270 ALSA: pcm: oss: Fix a few more UBSAN fixes
    eae5f04c9346 ALSA: hda/realtek - Add supported for more Lenovo ALC285 Headset Button
    753f5e987ccd ALSA: hda/realtek - Enable headset mic of ASUS Q524UQK with ALC255
    c4be5cc0199e ALSA: hda/realtek - Enable headset mic of ASUS X430UN with ALC256
    8fcbbcdcdf23 ALSA: hda/realtek: make bass spk volume adjustable on a yoga laptop
    fa4b536033d6 ALSA: hda/ca0132 - Fix AE-5 rear headphone pincfg.
    66d7c29bcb43 ALSA: hda: Fix regressions on clear and reconfig sysfs
    66afcbcc7554 ACPI: PNP: compare the string length in the matching_id()
    c5f7d62440ee Revert "ACPI / resources: Use AE_CTRL_TERMINATE to terminate resources walks"
    0a9801f58ab2 PM: ACPI: PCI: Drop acpi_pm_set_bridge_wakeup()
    36fdd770c037 ACPI: NFIT: Fix input validation of bus-family
    3e437f7e7a76 ALSA: hda/ca0132 - Change Input Source enum strings.
    f5a430c8ee0b Input: cyapa_gen6 - fix out-of-bounds stack access
    3974a5004626 media: ipu3-cio2: Make the field on subdev format V4L2_FIELD_NONE
    dd9d14e067fb media: ipu3-cio2: Validate mbus format in setting subdev format
    ffa790f9e17e media: ipu3-cio2: Serialise access to pad format
    8a0f5b91e78c media: ipu3-cio2: Return actual subdev format
    6dbe4457e4d7 media: ipu3-cio2: Remove traces of returned buffers
    f3d752c6cd32 media: netup_unidvb: Don't leak SPI master in probe error path
    330787231015 media: sunxi-cir: ensure IR is handled when it is continuous
    7b81e2af5a55 io_uring: make ctx cancel on exit targeted to actual ctx
    5998fe548db9 io_uring: fix double io_uring free
    9f8ebecc86a4 io_uring: fix ignoring xa_store errors
    10e5fb03e2da io_uring: hold uring_lock while completing failed polled io in io_wq_submit_work()
    72a016d42d36 io_uring: fix 0-iov read buffer select
    b1442adcd964 io_uring: fix io_wqe->work_list corruption
    acdd941fca53 media: gspca: Fix memory leak in probe
    06e5f9bb114b vfio/pci/nvlink2: Do not attempt NPU2 setup on POWER8NVL NPU
    be9aaec325cb vfio/pci: Move dummy_resources_list init in vfio_pci_probe()
    cd13f1d002a6 io_uring: always let io_iopoll_complete() complete polled io
    f961c2b496e6 io_uring: fix racy IOPOLL completions
    821d12a15cc2 io_uring: fix io_cqring_events()'s noflush
    54677c80ba1c proc mountinfo: make splice available again
    8f939abd8119 Smack: Handle io_uring kernel thread privileges
    b2ec2b12a450 io_uring: cancel reqs shouldn't kill overflow list
    c0fd45a9a97e io_uring: fix racy IOPOLL flush overflow
    b931ea024e45 perf probe: Fix memory leak when synthesizing SDT probes
    7ca9c3919387 ARM: 9036/1: uncompress: Fix dbgadtb size parameter name
    bf7b8c112a93 ARM: 9044/1: vfp: use undef hook for VFP support detection
    3f27cb2e13a1 powerpc/smp: Add __init to init_big_cores()
    d670c4b43e3e powerpc/boot: Fix build of dts/fsl
    87c0d2ab8a8e kconfig: fix return value of do_error_if()
    edc71c5fe563 clk: vc5: Use "idt,voltage-microvolt" instead of "idt,voltage-microvolts"
    fdc8fe51a706 clk: sunxi-ng: Make sure divider tables have sentinel
    75b84dafb943 clk: s2mps11: Fix a resource leak in error handling paths in the probe function
    64f3af800c61 clk: at91: sam9x60: remove atmel,osc-bypass support
    fcf9b5fa1c9a clk: at91: sama7g5: fix compilation error
    4713787c1f9c clk: bcm: dvp: Add MODULE_DEVICE_TABLE()
    1afb979cdcee epoll: check for events when removing a timed out thread from the wait queue
    b7bc097f2908 vhost scsi: fix error return code in vhost_scsi_set_endpoint()
    dbdfefc71ae5 virtio_ring: Fix two use after free bugs
    78b35fd94cf9 virtio_net: Fix error code in probe()
    bfffbd34bb0a virtio_ring: Cut and paste bugs in vring_create_virtqueue_packed()
    069fedf3fba2 vdpa/mlx5: Use write memory barrier after updating CQ index
    8ae314300079 nfp: move indirect block cleanup to flower app stop callback
    466587ce57bf qlcnic: Fix error code in probe
    98c9b3aeff7d perf record: Fix memory leak when using '--user-regs=?' to list registers
    03cbbd564850 tools build: Add missing libcap to test-all.bin target
    a773dea1a9f2 io_uring: cancel only requests of current task
    4b148744090b pwm: sun4i: Remove erroneous else branch
    7c4544a216e3 pwm: imx27: Fix overflow for bigger periods
    2cacf60c9245 pwm: lp3943: Dynamically allocate PWM chip base
    00fb97e2d7c8 pwm: zx: Add missing cleanup in error path
    91877b1fb0da clk: ti: Fix memleak in ti_fapll_synth_setup
    43fc2d3a4a84 watchdog: coh901327: add COMMON_CLK dependency
    45867d2ee459 watchdog: qcom: Avoid context switch in restart handler
    a3c168082828 powerpc/32s: Fix cleanup_cpu_mmu_context() compile bug
    0572a4aa7415 libnvdimm/label: Return -ENXIO for no slot in __blk_label_update
    0eecef0fec4a devlink: use _BITUL() macro instead of BIT() in the UAPI header
    027112b2671b net: korina: fix return value
    de16a86c9d70 NFS/pNFS: Fix a typo in ff_layout_resend_pnfs_read()
    1b75aea3e360 block/rnbd-clt: Fix possible memleak
    996ce53a2af7 block/rnbd-clt: Get rid of warning regarding size argument in strlcpy
    e50eea719ff0 net: allwinner: Fix some resources leak in the error handling path of the probe and in the remove function
    8f995afae90a net: mscc: ocelot: Fix a resource leak in the error handling path of the probe function
    1e7524c981cc net: bcmgenet: Fix a resource leak in an error handling path in the probe functin
    5c0109f7794c dpaa2-eth: fix the size of the mapped SGT buffer
    d50170ac3054 net: dsa: qca: ar9331: fix sleeping function called from invalid context bug
    bc79bf6c581c i40e, xsk: clear the status bits for the next_to_use descriptor
    0c3d87fa50a6 ice, xsk: clear the status bits for the next_to_use descriptor
    f290c9bed144 lan743x: fix rx_napi_poll/interrupt ping-pong
    185640586280 s390/test_unwind: fix CALL_ON_STACK tests
    0633094ec7ff checkpatch: fix unescaped left brace
    b202ac9c7345 proc: fix lookup in /proc/net subdirectories after setns(2)
    bd3f4b6fd98c mm: don't wake kswapd prematurely when watermark boosting is disabled
    9b52a37fb348 hugetlb: fix an error code in hugetlb_reserve_pages()
    b7bf8ed8d177 mm,memory_failure: always pin the page in madvise_inject_error
    23713b480da1 mm/vmalloc.c: fix kasan shadow poisoning size
    4a9d8b0789e3 mm/vmalloc: Fix unlock order in s_stop()
    bbb7c059fd5e sparc: fix handling of page table constructor failure
    dd156e3fcabf mm/rmap: always do TTU_IGNORE_ACCESS
    6d48fff6d350 mm: memcg/slab: fix use after free in obj_cgroup_charge
    02314d05e8a0 mm: memcg/slab: fix return of child memcg objcg for root memcg
    cfde6c1810c9 mm/gup: combine put_compound_head() and unpin_user_page()
    537946556cc9 mm/gup: prevent gup_fast from racing with COW during fork
    bcb0f647c1fa mm/gup: reorganize internal_get_user_pages_fast()
    c51e3679ebb5 drm/amdgpu: fix regression in vbios reservation handling on headless
    33e8ef090bef perf test: Fix metric parsing test
    280f29c6bae1 powerpc/ps3: use dma_mapping_error()
    34169b582aa9 powerpc/perf: Fix Threshold Event Counter Multiplier width for P10
    b6fba53d44e8 drm: mxsfb: Silence -EPROBE_DEFER while waiting for bridge
    582e1021fb68 nfc: s3fwrn5: Release the nfc firmware
    04ca5e7fa40d RDMA/cma: Don't overwrite sgid_attr after device is released
    d9a7b8fcd083 RDMA/mlx5: Fix MR cache memory leak
    c02c1df4fbd8 sunrpc: fix xs_read_xdr_buf for partial pages receive
    d26a4edda515 um: chan_xterm: Fix fd leak
    48628ec96d2e um: tty: Fix handling of close in tty lines
    4553c8cecbef um: Monitor error events in IRQ controller
    0cc9725e4b25 ubifs: Fix error return code in ubifs_init_authentication()
    9dc1b44d4f96 watchdog: Fix potential dereferencing of null pointer
    17a3ee000334 watchdog: sprd: check busy bit before new loading rather than after that
    f71f75aceadb watchdog: sprd: remove watchdog disable from resume fail path
    2d42e0354db1 watchdog: sirfsoc: Add missing dependency on HAS_IOMEM
    118a8b7e4d57 watchdog: armada_37xx: Add missing dependency on HAS_IOMEM
    9721dd96e904 irqchip/qcom-pdc: Fix phantom irq when changing between rising/falling
    6003ff9ca725 ath11k: Fix incorrect tlvs in scan start command
    2d9284c18862 gpiolib: irq hooks: fix recursion in gpiochip_irq_unmask
    78d22dd98942 RDMA/hns: Do shift on traffic class when using RoCEv2
    44dd35a01730 RDMA/hns: Normalization the judgment of some features
    27f2d59a4a5c RDMA/hns: Limit the length of data copied between kernel and userspace
    567a8417b7fe dmaengine: ti: k3-udma: Correct normal channel offset when uchan_cnt is not 0
    1ce041fad241 irqchip/ti-sci-intr: Fix freeing of irqs
    629d6ba81ff2 irqchip/ti-sci-inta: Fix printing of inta id on probe success
    d05c219375b7 irqchip/alpine-msi: Fix freeing of interrupts on allocation error path
    ebfeeb104fac ASoC: wm_adsp: remove "ctl" from list on error in wm_adsp_create_control()
    7fcf1c13802f mac80211: fix a mistake check for rx_stats update
    1a889bda7d7c mac80211: don't set set TDLS STA bandwidth wider than possible
    7682cd97aa38 crypto: atmel-i2c - select CONFIG_BITREVERSE
    df1c37a8786b extcon: max77693: Fix modalias string
    9f5ab03f7fc5 fs: Handle I_DONTCACHE in iput_final() instead of generic_drop_inode()
    81ef603e8616 samples/bpf: Fix possible hang in xdpsock with multiple threads
    4d0721cb10aa mtd: rawnand: gpmi: Fix the random DMA timeout issue
    03c9406a3ef8 mtd: rawnand: meson: Fix a resource leak in init
    a50f5a6393e4 mtd: rawnand: gpmi: fix reference count leak in gpmi ops
    0440989a08a5 clk: tegra: Fix duplicated SE clock entry
    be5c560996ac clk: qcom: gcc-sc7180: Use floor ops for sdcc clks
    6ca59ab95f9f remoteproc/mediatek: unprepare clk if scp_before_load fails
    9d909187e538 remoteproc: qcom: Fix potential NULL dereference in adsp_init_mmio()
    2fc6cdb1d67e remoteproc: k3-dsp: Fix return value check in k3_dsp_rproc_of_get_memories()
    f1bf8c9f49ad remoteproc: qcom: pas: fix error handling in adsp_pds_enable
    cce77d667f55 remoteproc: qcom: fix reference leak in adsp_start
    70ea4c7d1d39 remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
    01e2c27b8a30 remoteproc/mtk_scp: surround DT device IDs with CONFIG_OF
    c7fd58cc440b remoteproc/mediatek: change MT8192 CFG register base
    1cbcdec82c53 RDMA/uverbs: Fix incorrect variable type
    53e9a5a692f8 RDMA/core: Do not indicate device ready when device enablement fails
    db71bc7ef3ed ALSA: hda/hdmi: fix silent stream for first playback to DP
    0bc1c2d4a7e8 slimbus: qcom: fix potential NULL dereference in qcom_slim_prg_slew()
    2ae4b562d78f powerpc/sstep: Cover new VSX instructions under CONFIG_VSX
    bf608cf329a3 powerpc/sstep: Emulate prefixed instructions only when CPU_FTR_ARCH_31 is set
    62cd477bbdff can: m_can: m_can_config_endisable(): remove double clearing of clock stop request bit
    23b70b31675c clk: renesas: r8a779a0: Fix R and OSC clocks
    a60cb39186fb erofs: avoid using generic_block_bmap
    82d87b59df4c iwlwifi: mvm: hook up missing RX handlers
    31269e6ac076 iwlwifi: dbg-tlv: fix old length in is_trig_data_contained()
    1b4f4a160b0c s390/cio: fix use-after-free in ccw_device_destroy_console
    11b2118f4ddd fsi: Aspeed: Add mutex to protect HW access
    67475eb26416 bus: fsl-mc: fix error return code in fsl_mc_object_allocate()
    45f8472fa26b bus: fsl-mc: add back accidentally dropped error check
    096ee6ebd01e misc: pci_endpoint_test: fix return value of error branch
    70f87d48bf56 platform/chrome: cros_ec_spi: Don't overwrite spi::mode
    8ed7389709a4 scsi: qla2xxx: Fix N2N and NVMe connect retry failure
    bf69f3bbbde6 scsi: qla2xxx: Fix FW initialization error on big endian machines
    50cf9c6ca267 x86/kprobes: Restore BTF if the single-stepping is cancelled
    2deeead49c7a nfs_common: need lock during iterate through the list
    ac228fbe522d NFSD: Fix 5 seconds delay when doing inter server copy
    5f6742261ab9 nfsd: Fix message level for normal termination
    837935e21f7f speakup: fix uninitialized flush_lock
    12dba6742b13 usb: oxu210hp-hcd: Fix memory leak in oxu_create
    db1ccd6b7ea6 usb: ehci-omap: Fix PM disable depth umbalance in ehci_hcd_omap_probe
    7a5870d95403 powerpc/mm: sanity_check_fault() should work for all, not only BOOK3S
    69f46de82358 ASoC: max98390: Fix error codes in max98390_dsm_init()
    939b32e18e8b coresight: remove broken __exit annotations
    64ffbfb1d734 ASoC: amd: change clk_get() to devm_clk_get() and add missed checks
    e52398d49d8d drm/mediatek: avoid dereferencing a null hdmi_phy on an error message
    66d1918b2ddb powerpc/powermac: Fix low_sleep_handler with CONFIG_VMAP_STACK
    904c6f64fda6 powerpc/pseries/hibernation: remove redundant cacheinfo update
    b155175979e1 powerpc/pseries/hibernation: drop pseries_suspend_begin() from suspend ops
    40a281cbef6c ARM: 9030/1: entry: omit FP emulation for UND exceptions taken in kernel mode
    00c54f28046d platform/x86: mlx-platform: Fix item counter assignment for MSN2700/ComEx system
    acf787ea279d platform/x86: mlx-platform: Fix item counter assignment for MSN2700, MSN24xx systems
    b8c0a6e6574d scsi: fnic: Fix error return code in fnic_probe()
    adbd2547e0c5 seq_buf: Avoid type mismatch for seq_buf_init
    dcda662622b1 scsi: iscsi: Fix inappropriate use of put_device()
    f6d844be9502 scsi: pm80xx: Fix error return in pm8001_pci_probe()
    2619d3cbf774 scsi: qedi: Fix missing destroy_workqueue() on error in __qedi_probe
    45d670efcb0b clk: fsl-sai: fix memory leak
    608918e878d4 arm64: dts: meson: g12b: w400: fix PHY deassert timing requirements
    cb7fadab988e arm64: dts: meson: g12a: x96-max: fix PHY deassert timing requirements
    aaeb52620dd9 ARM: dts: meson: fix PHY deassert timing requirements
    46b7f2249854 arm64: dts: meson: fix PHY deassert timing requirements
    a83bf1290710 arm64: dts: meson: g12b: odroid-n2: fix PHY deassert timing requirements
    b9ee2a910d44 mtd: spi-nor: atmel: fix unlock_all() for AT25FS010/040
    d4f620ed499c mtd: spi-nor: atmel: remove global protection flag
    c39f4a1191f0 mtd: spi-nor: ignore errors in spi_nor_unlock_all()
    f79f7258f3b7 mtd: spi-nor: sst: fix BPn bits for the SST25VF064C
    bfe3dcabb9a0 adm8211: fix error return code in adm8211_probe()
    948882479547 platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting 1 on some HP x360 models
    6af7b5ab2a03 Bluetooth: btusb: Fix detection of some fake CSR controllers with a bcdDevice val of 0x0134
    aa4f552aec3d block/rnbd: fix a null pointer dereference on dev->blk_symlink_name
    a7d4dd109eae block/rnbd-clt: Dynamically alloc buffer for pathname & blk_symlink_name
    6013c9974216 Bluetooth: sco: Fix crash when using BT_SNDMTU/BT_RCVMTU option
    046182ddb934 Bluetooth: btmtksdio: Add the missed release_firmware() in mtk_setup_firmware()
    ae0e737765b8 Bluetooth: btusb: Add the missed release_firmware() in btusb_mtk_setup_firmware()
    848120a0d13b spi: dw: Fix error return code in dw_spi_bt1_probe()
    f636755d7fe5 staging: greybus: audio: Fix possible leak free widgets in gbaudio_dapm_free_controls
    b4db71c2d7af staging: bcm2835: fix vchiq_mmal dependencies
    e7884eed1301 macintosh/adb-iop: Send correct poll command
    bbae91abbc27 macintosh/adb-iop: Always wait for reply message from IOP
    d806ffec27b1 cpufreq: imx: fix NVMEM_IMX_OCOTP dependency
    d62b3d146ab0 cpufreq: vexpress-spc: Add missing MODULE_ALIAS
    35f501f734b6 cpufreq: scpi: Add missing MODULE_ALIAS
    8f92fe114fa7 cpufreq: loongson1: Add missing MODULE_ALIAS
    60b517181a6e cpufreq: sun50i: Add missing MODULE_DEVICE_TABLE
    b15fcc3a31c4 cpufreq: st: Add missing MODULE_DEVICE_TABLE
    757ee8737ddf cpufreq: qcom: Add missing MODULE_DEVICE_TABLE
    5f03e8a02c4e cpufreq: mediatek: Add missing MODULE_DEVICE_TABLE
    7000750ae37a cpufreq: highbank: Add missing MODULE_DEVICE_TABLE
    345990ffc952 cpufreq: ap806: Add missing MODULE_DEVICE_TABLE
    276c71eea8c7 clocksource/drivers/arm_arch_timer: Correct fault programming of CNTKCTL_EL1.EVNTI
    f94df0cb1e09 clocksource/drivers/arm_arch_timer: Use stable count reader in erratum sne
    5acad354237d drm/msm: add IOMMU_SUPPORT dependency
    5471864d27e5 drm/msm: a5xx: Make preemption reset case reentrant
    d7af811f2e74 memory: jz4780_nemc: Fix potential NULL dereference in jz4780_nemc_probe()
    20d79c2a5415 memory: ti-emif-sram: only build for ARMv7
    3aec054f58c7 phy: renesas: rcar-gen3-usb2: disable runtime pm in case of failure
    8178c539e4df phy: mediatek: allow compile-testing the hdmi phy
    5ae5c3f9f4d9 ASoC: qcom: fix QDSP6 dependencies, attempt #3
    f3ea5a0a1e38 ASoC: atmel: mchp-spdifrx needs COMMON_CLK
    7b00ff200d89 ASoC: cros_ec_codec: fix uninitialized memory read
    6a579661e584 dm ioctl: fix error return code in target_message
    54919a715324 ASoC: q6afe-clocks: Add missing parent clock rate
    7403022a695a ASoC: jz4740-i2s: add missed checks for clk_get()
    2952eef157b9 mt76: fix tkip configuration for mt7615/7663 devices
    e2dea65052ee mt76: fix memory leak if device probing fails
    d5f908355d1b net/mlx5: Properly convey driver version to firmware
    1669724f7052 mt76: dma: fix possible deadlock running mt76_dma_cleanup
    8b5b803ba5b7 mt76: set fops_tx_stats.owner to THIS_MODULE
    722faae3826a mt76: mt7915: set fops_sta_stats.owner to THIS_MODULE
    28f41cc1baed mt76: mt7663s: fix a possible ple quota underflow
    a3164472e2eb MIPS: Don't round up kernel sections size for memblock_add()
    db4a90026e15 memstick: r592: Fix error return in r592_probe()
    28cb1d639ee8 arm64: dts: rockchip: Fix UART pull-ups on rk3328
    4771a82fa0dd soc: rockchip: io-domain: Fix error return code in rockchip_iodomain_probe()
    64ae763eefd3 pinctrl: falcon: add missing put_device() call in pinctrl_falcon_probe()
    b23eae9fc726 selftests/bpf: Fix invalid use of strncat in test_sockmap
    4322f9a64653 bpf: Fix bpf_put_raw_tracepoint()'s use of __module_address()
    9cee26031015 scripts: kernel-doc: fix parsing function-like typedefs
    3a8db263abc4 ARM: dts: at91: sama5d2: map securam as device
    94c84a4327d7 ARM: dts: at91: sam9x60ek: remove bypass property
    beef1b4383e7 libbpf: Sanitise map names before pinning
    b113f3bf167f iio: hrtimer-trigger: Mark hrtimer to expire in hard interrupt context
    0e3847accafa arm64: mte: fix prctl(PR_GET_TAGGED_ADDR_CTRL) if TCF0=NONE
    16cf69c25c96 clocksource/drivers/riscv: Make RISCV_TIMER depends on RISCV_SBI
    df4411e4b8d0 clocksource/drivers/ingenic: Fix section mismatch
    93bf920799d9 clocksource/drivers/cadence_ttc: Fix memory leak in ttc_setup_clockevent()
    e2983080b023 clocksource/drivers/orion: Add missing clk_disable_unprepare() on error path
    ba6a7e6ca5b7 powerpc/perf: Fix the PMU group constraints for threshold events in power10
    e559aaba71b9 powerpc/perf: Update the PMU group constraints for l2l3 events in power10
    0760233fd450 powerpc/perf: Fix to update radix_scope_qual in power10
    36daf5b174a1 powerpc/xmon: Fix build failure for 8xx
    746ef5ac254c powerpc/64: Fix an EMIT_BUG_ENTRY in head_64.S
    668f649850ae powerpc/perf: Fix crash with is_sier_available when pmu is not set
    8486f6f9de6b media: saa7146: fix array overflow in vidioc_s_audio()
    1067e2496e93 media: tvp5150: Fix wrong return value of tvp5150_parse_dt()
    9c14fb58a1a7 f2fs: fix double free of unicode map
    55dbc5e2d9c9 hwmon: (ina3221) Fix PM usage counter unbalance in ina3221_write_enable
    a08dbd012001 vfio-pci: Use io_remap_pfn_range() for PCI IO memory
    79449799269f selftests/seccomp: Update kernel config
    eb9cc35ae98b NFS: switch nfsiod to be an UNBOUND workqueue.
    0e1c02e4e085 lockd: don't use interval-based rebinding over TCP
    7941ee42dcca net: sunrpc: Fix 'snprintf' return value check in 'do_xprt_debugfs'
    77303b6b5e4a NFSv4: Fix the alignment of page data in the getdeviceinfo reply
    c1e628f91051 SUNRPC: xprt_load_transport() needs to support the netid "rdma6"
    78c9026a7270 NFSv4.2: condition READDIR's mask for security label based on LSM state
    d1296acac0c1 SUNRPC: rpc_wake_up() should wake up tasks in the correct order
    bd6019d83a9a ath10k: Release some resources in an error handling path
    96e8abed38b1 ath10k: Fix an error handling path
    6165f20d351d ath10k: Fix the parsing error in service available event
    01c0691ead1e ath11k: Fix an error handling path
    08c7e5615496 ath11k: Reset ath11k_skb_cb before setting new flags
    345511c3f496 ath11k: Don't cast ath11k_skb_cb to ieee80211_tx_info.control
    aa7396d8b36b media: i2c: imx219: Selection compliance fixes
    4440b4861798 media: rdacm20: Enable GPIO1 explicitly
    978649ab70c1 media: max9271: Fix GPIO enable/disable
    af85e2467900 ASoC: Intel: Boards: tgl_max98373: update TDM slot_width
    e94331e0d7d2 platform/x86: dell-smbios-base: Fix error return code in dell_smbios_init
    df40cc8c1c86 soundwire: master: use pm_runtime_set_active() on add
    a3592fa49daf mailbox: arm_mhu_db: Fix mhu_db_shutdown by replacing kfree with devm_kfree
    482d2345bf8f RDMA/hns: Bugfix for calculation of extended sge
    a5c7bc609740 RDMA/hns: Fix 0-length sge calculation error
    38fcd69c7ae5 ARM: dts: at91: at91sam9rl: fix ADC triggers
    f107dfac508f spi: spi-fsl-dspi: Use max_native_cs instead of num_chipselect to set SPI_MCR
    ee9f3f0ff496 scsi: pm80xx: Do not sleep in atomic context
    2ca2795bfe22 scsi: hisi_sas: Fix up probe error handling for v3 hw
    f9e71ed020b9 soc: amlogic: canvas: add missing put_device() call in meson_canvas_get()
    67d91e51f98f arm64: dts: meson-sm1: fix typo in opp table
    95fae43b04e4 arm64: dts: meson: fix spi-max-frequency on Khadas VIM2
    3ff34b89a430 PCI: iproc: Invalidate correct PAXB inbound windows
    98518a523354 PCI: iproc: Fix out-of-bound array accesses
    2df49a5de565 PCI: Fix overflow in command-line resource alignment requests
    3ce258140380 PCI: Bounds-check command-line resource alignment requests
    25cff7f51418 arm64: dts: qcom: c630: Fix pinctrl pins properties
    71d0ca4e29ee arm64: dts: qcom: c630: Polish i2c-hid devices
    0ad229df4732 phy: tegra: xusb: Fix usb_phy device driver field
    e747c8d16eb9 arm64: dts: freescale: sl28: combine SPI MTD partitions
    893d1502500c arm64: dts: ls1028a: fix FlexSPI clock input
    cb8447610e2e arm64: dts: ls1028a: fix ENETC PTP clock input
    f11ebb7651a9 genirq/irqdomain: Don't try to free an interrupt that has no mapping
    891bb86926f2 power: supply: bq24190_charger: fix reference leak
    67c91336e0d1 power: supply: axp288_charger: Fix HP Pavilion x2 10 DMI matching
    e6207f098896 power: supply: max17042_battery: Fix current_{avg,now} hiding with no current sense
    d73be8a24bb2 arm64: dts: rockchip: Set dr_mode to "host" for OTG on rk3328-roc-cc
    a47f8c953769 power: supply: bq25890: Use the correct range for IILIM register
    8d4ba95a41fb arm64: dts: armada-3720-turris-mox: update ethernet-phy handle name
    f64ffe32f54f ARM: dts: Remove non-existent i2c1 from 98dx3236
    9e363d142f2e HSI: omap_ssi: Don't jump to free ID in ssi_add_controller()
    38429d879dcd drm/mediatek: Use correct aliases name for ovl
    deaeb67c9da0 RDMA/core: Track device memory MRs
    aaaa7a6006c7 slimbus: qcom-ngd-ctrl: Avoid sending power requests without QMI
    1f29c438707d media: max2175: fix max2175_set_csm_mode() error code
    1108b0f4920d mips: cdmm: fix use-after-free in mips_cdmm_bus_discover
    e7fd18c20342 media: imx214: Fix stop streaming
    5bf76d566a76 samples: bpf: Fix lwt_len_hist reusing previous BPF map
    048a04aa031b serial: 8250-mtk: Fix reference leak in mtk8250_probe
    af7ae245945a RDMA/hns: Avoid setting loopback indicator when smac is same as dmac
    6b8a015eda20 RDMA/hns: Fix missing fields in address vector
    ba9479d75ef1 RDMA/hns: Only record vlan info for HIP08
    57d22f146803 arm64: dts: qcom: sc7180: limit IPA iommu streams
    bdb7acb89261 platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform configuration
    d285968ae009 platform/x86: mlx-platform: Remove PSU EEPROM from default platform configuration
    0736d6a86fd3 media: siano: fix memory leak of debugfs members in smsdvb_hotplug
    bac43b0f1144 drm/imx/dcss: fix rotations for Vivante tiled formats
    c87a177fa7ca soundwire: qcom: Fix build failure when slimbus is module
    f85d05c0a599 RDMA/cma: Fix deadlock on &lock in rdma_cma_listen_on_all() error unwind
    98e72ffe934d arm64: tegra: Fix DT binding for IO High Voltage entry
    dbbc5e42c467 leds: turris-omnia: check for LED_COLOR_ID_RGB instead LED_COLOR_ID_MULTI
    ad316987c4e4 leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
    1687f01f0ea8 leds: netxbig: add missing put_device() call in netxbig_leds_get_of_pdata()
    4827f0cabc16 arm64: dts: qcom: sdm845: Limit ipa iommu streams
    17fdb0eb50e7 dmaengine: mv_xor_v2: Fix error return code in mv_xor_v2_probe()
    0dee7fabab78 cw1200: fix missing destroy_workqueue() on error in cw1200_init_common
    b8da48050a26 rsi: fix error return code in rsi_reset_card()
    71a0eb78d6f0 qtnfmac: fix error return code in qtnf_pcie_probe()
    15e39825a270 orinoco: Move context allocation after processing the skb
    174f2189f769 brcmfmac: fix error return code in brcmf_cfg80211_connect()
    2c9e1e32a288 mmc: pxamci: Fix error return code in pxamci_probe
    3ab2d54ae31e ARM: dts: at91: sama5d3_xplained: add pincontrol for USB Host
    a0f8184693e3 ARM: dts: at91: sama5d4_xplained: add pincontrol for USB Host
    1d8ae9da94eb ARM: dts: at91: sam9x60: add pincontrol for USB Host
    365a94fc1e3d memstick: fix a double-free bug in memstick_check
    c802d9e5e69d pinctrl: sunxi: fix irq bank map for the Allwinner A100 pin controller
    ed27e6b21505 soundwire: Fix DEBUG_LOCKS_WARN_ON for uninitialized attribute
    623793c8da90 RDMA/cxgb4: Validate the number of CQEs
    7688ca1121ba ath11k: Fix the rx_filter flag setting for peer rssi stats
    0121a853eace staging: mfd: hi6421-spmi-pmic: fix error return code in hi6421_spmi_pmic_probe()
    47324dbd5680 clk: meson: Kconfig: fix dependency for G12A
    0e8d632e4162 Input: omap4-keypad - fix runtime PM error handling
    94268e0c9a59 arm64: dts: qcom: msm8916-samsung-a2015: Disable muic i2c pin bias
    281c972aaa4e arm64: dts: qcom: sm8250: correct compatible for sm8250-mtp
    6d3131ace303 soc: qcom: initialize local variable
    561397df16e3 drivers: soc: ti: knav_qmss_queue: Fix error return code in knav_queue_probe
    97d14d592159 soc: ti: Fix reference imbalance in knav_dma_probe
    bdf76d879ac3 soc: ti: knav_qmss: fix reference leak in knav_queue_probe
    e7e8d6dc17a8 PCI: brcmstb: Initialize "tmp" before use
    ddf1dab2919b PCI: Disable MSI for Pericom PCIe-USB adapter
    6cf9c3f4dfa0 drm/meson: dw-hdmi: Enable the iahb clock early enough
    d0ef2d794000 drm/meson: dw-hdmi: Disable clocks on driver teardown
    ddbed6d02751 spi: fix resource leak for drivers without .remove callback
    098a597f3115 crypto: sun8i-ce - fix two error path's memory leak
    3cf33a4686c4 crypto: omap-aes - Fix PM disable depth imbalance in omap_aes_probe
    2ec7b49a1f39 crypto: crypto4xx - Replace bitwise OR with logical OR in crypto4xx_build_pd
    9b81af9c8455 rcu/tree: Defer kvfree_rcu() allocation to a clean context
    5cacd18c5207 rcu,ftrace: Fix ftrace recursion
    4540e84bd8a9 rcu: Allow rcu_irq_enter_check_tick() from NMI
    bbab483613f2 scsi: ufs: Fix clkgating on/off
    df7ae049e02a scsi: ufs: Avoid to call REQ_CLKS_OFF to CLKS_OFF
    3897b71e1a68 EDAC/mce_amd: Use struct cpuinfo_x86.cpu_die_id for AMD NodeId
    2081572eb105 mfd: cpcap: Fix interrupt regression with regmap clear_ack
    de39384806af mfd: stmfx: Fix dev_err_probe() call in stmfx_chip_init()
    b278cdb10039 mfd: MFD_SL28CPLD should depend on ARCH_LAYERSCAPE
    0300c814520a mfd: htc-i2cpld: Add the missed i2c_put_adapter() in htcpld_register_chip_i2c()
    3e377bb0734d powerpc/powernv/sriov: fix unsigned int win compared to less than zero
    02cf67c9b608 Revert "powerpc/pseries/hotplug-cpu: Remove double free in error path"
    a063e3faa3ed ARM: dts: tacoma: Fix node vs reg mismatch for flash memory
    1c6e4b13306f powerpc/feature: Fix CPU_FTRS_ALWAYS by removing CPU_FTRS_GENERIC_32
    b1a0097b8298 powerpc: Avoid broken GCC __attribute__((optimize))
    6014c6ed74f1 selftests/bpf: Fix broken riscv build
    98283ebab45c spi: mxs: fix reference leak in mxs_spi_probe
    b6e018b059a5 usb/max3421: fix return error code in max3421_probe()
    351c360a7c2d bus: mhi: core: Fix null pointer access when parsing MHI configuration
    417602ef3f4a bus: mhi: core: Remove double locking from mhi_driver_remove()
    d2fd75615c2f Input: ads7846 - fix unaligned access on 7845
    eced9dfb6691 Input: ads7846 - fix integer overflow on Rt calculation
    77b0790ac6bd Input: ads7846 - fix race that causes missing releases
    1a94c18952af iommu/vt-d: include conditionally on CONFIG_INTEL_IOMMU_SVM
    1f1e14d91704 ASoC: intel: SND_SOC_INTEL_KEEMBAY should depend on ARCH_KEEMBAY
    d3f027ec7649 drm/meson: dw-hdmi: Ensure that clocks are enabled before touching the TOP registers
    2ce569f4b501 drm/meson: dw-hdmi: Register a callback to disable the regulator
    2777970add40 drm/meson: Unbind all connectors on module removal
    d2ddf64f5e96 drm/meson: Free RDMA resources after tearing down DRM
    b087cb814da2 drm/omap: dmm_tiler: fix return error code in omap_dmm_probe()
    b9e069283b78 mmc: sdhci: tegra: fix wrong unit with busy_timeout
    58d23abd5fa1 video: fbdev: atmel_lcdfb: fix return error code in atmel_lcdfb_of_init()
    a622848f5938 media: solo6x10: fix missing snd_card_free in error handling case
    e1a709edc21d media: venus: put dummy vote on video-mem path after last session release
    43275d43b521 scsi: core: Fix VPD LUN ID designator priorities
    c77798b58799 spi: dw: fix build error by selecting MULTIPLEXER
    7a5333fb175b ASoC: meson: fix COMPILE_TEST error
    70ba8b1697e3 RDMA/cma: Add missing error handling of listen_id
    8d82904f8d22 media: venus: core: vote with average bandwidth and peak bandwidth as zero
    2d28c98f44af media: venus: core: vote for video-mem path
    9acc5fa0aeb2 media: venus: core: change clk enable and disable order in resume and suspend
    393957d39762 media: platform: add missing put_device() call in mtk_jpeg_probe() and mtk_jpeg_remove()
    a3307503af9e media: cedrus: fix reference leak in cedrus_start_streaming
    d5b2529aa572 media: staging: rkisp1: cap: fix runtime PM imbalance on error
    cbb25882cd66 media: ov5640: fix support of BT656 bus mode
    8b9209c963fb media: v4l2-fwnode: v4l2_fwnode_endpoint_parse caller must init vep argument
    f43c83293044 media: v4l2-fwnode: Return -EINVAL for invalid bus-type
    6453c1ade8d8 media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_enc_pm()
    1144412d4a0c media: mtk-vcodec: add missing put_device() call in mtk_vcodec_release_dec_pm()
    d9292412258b media: mtk-vcodec: add missing put_device() call in mtk_vcodec_init_dec_pm()
    c7ffc289daa3 media: platform: add missing put_device() call in mtk_jpeg_clk_init()
    22ec70191039 media: tm6000: Fix sizeof() mismatches
    3d28470532a3 ionic: change set_rx_mode from_ndo to can_sleep
    ee6bf69107b0 ionic: flatten calls to ionic_lif_rx_mode
    68684d55e578 ionic: use mc sync for multicast filters
    91a5950181d1 drm/amdkfd: Put ACPI table after using it
    5c0aa48d046d scripts: kernel-doc: Restore anonymous enum parsing
    7f1cae8e15a6 staging: gasket: interrupt: fix the missed eventfd_ctx_put() in gasket_interrupt.c
    63c4e010a530 staging: greybus: codecs: Fix reference counter leak in error handling
    e4e1f57c6afb drm/udl: Fix missing error code in udl_handle_damage()
    2fa9f2944153 firmware: arm_scmi: Fix missing destroy_workqueue()
    27a26763de9a crypto: qat - fix status check in qat_hal_put_rel_rd_xfer()
    4110602d9d73 crypto: Kconfig - CRYPTO_MANAGER_EXTRA_TESTS requires the manager
    53cb44edb267 soc: ti: omap-prm: Do not check rstst bit on deassert if already deasserted
    d5f81cb875ba drm/amdgpu: fix compute queue priority if num_kcq is less than 4
    070dfffdc278 MIPS: BCM47XX: fix kconfig dependency bug for BCM47XX_BCMA
    c77a95b65bdc arm64: dts: ti: k3-am65*/j721e*: Fix unit address format error for dss node
    10811262111e ASoC: SOF: Intel: fix Kconfig dependency for SND_INTEL_DSP_CONFIG
    ec6a178521bf RDMa/mthca: Work around -Wenum-conversion warning
    81d23c1d63f3 ASoC: arizona: Fix a wrong free in wm8997_probe
    941327d40d30 virtiofs fix leak in setup
    b14a8f29c31e spi: sprd: fix reference leak in sprd_spi_remove
    82162f4bdf6a ASoC: wm8998: Fix PM disable depth imbalance on error
    351d0015c1bf ASoC: wm8994: Fix PM disable depth imbalance on error
    8f48a2000249 selftest/bpf: Add missed ip6ip6 test back
    f8a4a04ddfdb selftests/run_kselftest.sh: fix dry-run typo
    56b491d7de00 drm/msm/dp: do not notify audio subsystem if sink doesn't support audio
    be5795e2098f drm/msm/dp: skip checking LINK_STATUS_UPDATED bit
    ae5b3fc2dce4 drm/msm/dp: return correct connection status after suspend
    6b0a337dec82 firmware: tegra: fix strncpy()/strncat() confusion
    66bb2a8a6011 drm/msm/a5xx: Clear shadow on suspend
    3edab64c3e42 drm/msm/a6xx: Clear shadow on suspend
    b38258b69352 mwifiex: fix mwifiex_shutdown_sw() causing sw reset failure
    00f7592609c9 ath11k: Handle errors if peer creation fails
    468b3a1ab287 ASoC: qcom: common: Fix refcounting in qcom_snd_parse_of()
    851228fd1f67 spi: imx: fix reference leak in two imx operations
    b8c65a716e8d spi: bcm63xx-hsspi: fix missing clk_disable_unprepare() on error in bcm63xx_hsspi_resume
    d7dc725c7eb4 spi: tegra114: fix reference leak in tegra spi ops
    b25ccec94969 spi: tegra20-sflash: fix reference leak in tegra_sflash_resume
    0c26f7b292da spi: tegra20-slink: fix reference leak in slink ops of tegra20
    6f3e58894446 spi: mt7621: fix missing clk_disable_unprepare() on error in mt7621_spi_probe
    7e2556779cb7 spi: spi-ti-qspi: fix reference leak in ti_qspi_setup
    ea5ee372c726 spi: stm32-qspi: fix reference leak in stm32 qspi operations
    f48dbf515233 Bluetooth: hci_h5: fix memory leak in h5_close
    c98d33579206 Bluetooth: Fix: LL PRivacy BLE device fails to connect
    147cdf5f344b Bluetooth: Fix null pointer dereference in hci_event_packet()
    1a5f0500d885 drm/panel: simple: Add flags to boe_nv133fhm_n61
    848ad332d74d arm64: dts: exynos: Correct psci compatible used on Exynos7
    ac5ae8c92667 arm64: dts: exynos: Include common syscon restart/poweroff for Exynos7
    af9d37f43436 brcmfmac: Fix memory leak for unpaired brcmf_{alloc/free}
    8a8fe3e58c3e ath11k: fix wmi init configuration
    e3f640e6a085 ath11k: Fix number of rules in filtered ETSI regdomain
    ce79baf7b3eb ath11k: Initialize complete alpha2 for regulatory change
    5d43f95abf1c drm/edid: Fix uninitialized variable in drm_cvt_modes()
    2aa2d48927a1 x86/mce: Correct the detection of invalid notifier priorities
    c306918ce98b bpf: Fix tests for local_storage
    26a19bbe6003 spi: stm32: fix reference leak in stm32_spi_resume
    615bc1ba5b87 nl80211/cfg80211: fix potential infinite loop
    6e5ea342fc65 selinux: fix inode_doinit_with_dentry() LABEL_INVALID error handling
    ae292e43b06d crypto: caam - fix printing on xts fallback allocation error path
    6aa4660cba61 crypto: arm/aes-neonbs - fix usage of cbc(aes) fallback
    17df190b6a33 crypto: arm64/poly1305-neon - reorder PAC authentication with SP update
    6ed6e024e3bb drm/bridge: tpd12s015: Fix irq registering in tpd12s015_probe
    332a2c3b6f87 ASoC: pcm: DRAIN support reactivation
    3b0c3b66b6b9 pinctrl: core: Add missing #ifdef CONFIG_GPIOLIB
    6dd60eb9b3de scsi: aacraid: Improve compat_ioctl handlers
    92b6415e977c spi: spi-mem: fix reference leak in spi_mem_access_start
    159869d42023 drm/msm/dpu: fix clock scaling on non-sc7180 board
    c72aa2169db1 drm/msm/dsi_pll_10nm: restore VCO rate during restore_state
    9e737d120b52 drm/msm/dsi_pll_7nm: restore VCO rate during restore_state
    cfc0c1840354 drm/msm/dp: DisplayPort PHY compliance tests fixup
    3647b89442e5 perf test: Use generic event for expand_libpfm_events()
    c5c1af1107d6 RDMA/mlx5: Fix corruption of reg_pages in mlx5_ib_rereg_user_mr()
    8b1a51fb4218 f2fs: call f2fs_get_meta_page_retry for nat page
    5eab98b40aaa spi: img-spfi: fix reference leak in img_spfi_resume
    130a8874f811 powerpc/64: Set up a kernel stack for secondaries before cpu_restore()
    61b3d5e201c1 drm/amdgpu: fix build_coefficients() argument
    764184e33908 ARM: dts: aspeed: tiogapass: Remove vuart
    651df0443878 drm/msm: Add missing stub definition
    f7e27d606484 ASoC: sun4i-i2s: Fix lrck_period computation for I2S justified mode
    f7428e7ca889 crypto: inside-secure - Fix sizeof() mismatch
    16ec50845816 crypto: talitos - Fix return type of current_desc_hdr()
    7023c8164125 crypto: talitos - Endianess in current_desc_hdr()
    326713235393 drm/amdgpu: fix incorrect enum type
    8933a5253421 sched: Reenable interrupts in do_sched_yield()
    6d4250fe7d98 sched/deadline: Fix sched_dl_global_validate()
    e3c471e7f1a4 ASoC: qcom: fix unsigned int bitwidth compared to less than zero
    b8ab21e01717 x86/apic: Fix x2apic enablement without interrupt remapping
    459c15dd6847 RDMA/rtrs-srv: Don't guard the whole __alloc_srv with srv_mutex
    4f647978994c RDMA/rtrs-clt: Missing error from rtrs_rdma_conn_established
    78bd070fa38a RDMA/rtrs-clt: Remove destroy_con_cq_qp in case route resolving failed
    78905c6ab154 ARM: p2v: fix handling of LPAE translation in BE mode
    9c79c9e658e3 x86/mm/ident_map: Check for errors from ident_pud_init()
    965f5593933f RDMA/rxe: Compute PSN windows correctly
    e7c49c634aff RDMA/core: Fix error return in _ib_modify_qp()
    56cc090c2b21 ARM: dts: aspeed: s2600wf: Fix VGA memory region location
    5ea241ef9543 ARM: dts: aspeed-g6: Fix the GPIO memory size
    f0d7de09261b selinux: fix error initialization in inode_doinit_with_dentry()
    ae3739fcfe3b RDMA/bnxt_re: Fix entry size during SRQ create
    c647cc8e5804 rtc: pcf2127: fix pcf2127_nvmem_read/write() returns
    4d281791bee5 RDMA/bnxt_re: Set queue pair state when being queried
    942e8f31dff6 Revert "i2c: i2c-qcom-geni: Fix DMA transfer race"
    614199a8d1d1 soc: qcom: geni: More properly switch to DMA mode
    dd90a827ff18 arm64: dts: qcom: sc7180: Fix one forgotten interconnect reference
    2c6b8eda1ee6 arm64: dts: ipq6018: update the reserved-memory node
    33be7295fbeb arm64: dts: mediatek: mt8183: fix gce incorrect mbox-cells value
    a2eaddba03b3 soc: mediatek: Check if power domains can be powered on at boot time
    de37cfd12056 soc: renesas: rmobile-sysc: Fix some leaks in rmobile_init_pm_domains()
    a7b30bb95982 arm64: dts: renesas: cat875: Remove rxc-skew-ps from ethernet-phy node
    f53a67657127 arm64: dts: renesas: hihope-rzg2-ex: Drop rxc-skew-ps from ethernet-phy node
    172b7228a31f drm/tve200: Fix handling of platform_get_irq() error
    22bf07001762 drm/mcde: Fix handling of platform_get_irq() error
    cc797be0e38c drm/aspeed: Fix Kconfig warning & subsequent build errors
    e8c27b95869d iio: adc: at91_adc: add Kconfig dep on the OF symbol and remove of_match_ptr()
    3d7961ef3d89 drm/gma500: fix double free of gma_connector
    dafbfbed308f hwmon: (k10temp) Remove support for displaying voltage and current on Zen CPUs
    02164534cb86 Linux 5.10.3
    70eb256f8c8a md: fix a warning caused by a race between concurrent md_ioctl()s
    05725b40b945 nl80211: validate key indexes for cfg80211_registered_device
    709b2d03bb29 crypto: af_alg - avoid undefined behavior accessing salg_name
    7730b2f41cef media: msi2500: assign SPI bus number dynamically
    f5d4e47871c8 fs: quota: fix array-index-out-of-bounds bug by passing correct argument to vfs_cleanup_quota_inode()
    e196311e0d69 quota: Sanity-check quota file headers on load
    b260e4a68853 Bluetooth: Fix slab-out-of-bounds read in hci_le_direct_adv_report_evt()
    c2c9944b5607 f2fs: prevent creating duplicate encrypted filenames
    e5a2a002f83d ext4: prevent creating duplicate encrypted filenames
    456fcfca6dcf ubifs: prevent creating duplicate encrypted filenames
    2da473e59e11 fscrypt: add fscrypt_is_nokey_name()
    3b7c17a81426 fscrypt: remove kernel-internal constants from UAPI header
    e6160ad6e729 serial_core: Check for port state when tty is in error state
    45a13c35c7f8 HID: i2c-hid: add Vero K147 to descriptor override
    79ab763e574f scsi: megaraid_sas: Check user-provided offsets
    7812d88349b6 f2fs: init dirty_secmap incorrectly
    4cad005fe512 f2fs: fix to seek incorrect data offset in inline data file
    1384d0cba681 coresight: etm4x: Handle TRCVIPCSSCTLR accesses
    08af50ba2819 coresight: etm4x: Fix accesses to TRCPROCSELR
    c3ac42626ea9 coresight: etm4x: Fix accesses to TRCCIDCTLR1
    004f79bec798 coresight: etm4x: Fix accesses to TRCVMIDCTLR1
    99203d728205 coresight: etm4x: Skip setting LPOVERRIDE bit for qcom, skip-power-up
    3e89c7f97889 coresight: etb10: Fix possible NULL ptr dereference in etb_enable_perf()
    cda539d024c8 coresight: tmc-etr: Fix barrier packet insertion for perf buffer
    35d07b02187b coresight: tmc-etr: Check if page is valid before dma_map_page()
    8c5c48b60caa coresight: tmc-etf: Fix NULL ptr dereference in tmc_enable_etf_sink_perf()
    61bed86699e8 ARM: dts: exynos: fix USB 3.0 pins supply being turned off on Odroid XU
    8ed259869637 ARM: dts: exynos: fix USB 3.0 VBUS control and over-current pins on Exynos5410
    d012f0c8367b ARM: dts: exynos: fix roles of USB 3.0 ports on Odroid XU
    39fb7424d4ed usb: chipidea: ci_hdrc_imx: Pass DISABLE_DEVICE_STREAMING flag to imx6ul
    2a548c32d550 USB: gadget: f_rndis: fix bitrate for SuperSpeed and above
    4ef3fc712c77 usb: gadget: f_fs: Re-use SS descriptors for SuperSpeedPlus
    245cb2f26ea0 USB: gadget: f_midi: setup SuperSpeed Plus descriptors
    798be9a2f9d7 USB: gadget: f_acm: add support for SuperSpeed Plus
    e4ef9c8d13b3 USB: serial: option: add interface-number sanity check to flag handling
    4cfc27cb5620 usb: mtu3: fix memory corruption in mtu3_debugfs_regset()
    e8d7daf69edb soc/tegra: fuse: Fix index bug in get_process_id
    5f5240c03aa3 exfat: Avoid allocating upcase table using kcalloc()
    84bcbb0779c6 x86/split-lock: Avoid returning with interrupts enabled
    eadec7f5374e net: ipconfig: Avoid spurious blank lines in boot log

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index 1c54ec1719..dccebbf6e7 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "dca023723e0dbfba1c7e8933ca6d70b17af0eab6"
-SRCREV_meta ?= "6b12385f7d89ccac211c3981420a84394530ce83"
+SRCREV_machine ?= "1dcdbc5795a354afb36900b5b3708068d61524b5"
+SRCREV_meta ?= "28606a1711047b0d6e0fb6deb5bf185492081fe2"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.2"
+LINUX_VERSION ?= "5.10.4"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index 1a1845f470..cefabfbff4 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.2"
+LINUX_VERSION ?= "5.10.4"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "d02c60a7622d7f06805925ae1742dad2b36eaab9"
-SRCREV_machine ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_meta ?= "6b12385f7d89ccac211c3981420a84394530ce83"
+SRCREV_machine_qemuarm ?= "e6e2b3380857eddf0f15546273733dfe2628bfdb"
+SRCREV_machine ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_meta ?= "28606a1711047b0d6e0fb6deb5bf185492081fe2"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index fdfc32123d..e4ebcca125 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.10/standard/base"
 KBRANCH_qemux86-64 ?= "v5.10/standard/base"
 KBRANCH_qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "5397e4b8744f2319707fef0b1fed890dcdbb30c8"
-SRCREV_machine_qemuarm64 ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_machine_qemumips ?= "925ed2e122804bb2d3b86622c1309c04d8e13652"
-SRCREV_machine_qemuppc ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_machine_qemuriscv64 ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_machine_qemux86 ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_machine_qemux86-64 ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_machine_qemumips64 ?= "2395091f9593bd8465c37f67fabdee14de1900a5"
-SRCREV_machine ?= "0c61b00f3d64aebc1b8248f50d4855d609030fbf"
-SRCREV_meta ?= "6b12385f7d89ccac211c3981420a84394530ce83"
+SRCREV_machine_qemuarm ?= "57796ff5e0c7fca8fb83590131281555ed9f9a8b"
+SRCREV_machine_qemuarm64 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_machine_qemumips ?= "bc1695e59cf55c6484d48cf4c71a3c183ab1073f"
+SRCREV_machine_qemuppc ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_machine_qemuriscv64 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_machine_qemux86 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_machine_qemux86-64 ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_machine_qemumips64 ?= "0a302891f926c1b0d7be0c67c66d6780499d83ee"
+SRCREV_machine ?= "63598f23e388a77901afde1c54f49ef6547bfaaa"
+SRCREV_meta ?= "28606a1711047b0d6e0fb6deb5bf185492081fe2"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.2"
+LINUX_VERSION ?= "5.10.4"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

