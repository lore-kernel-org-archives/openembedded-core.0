Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web10.9162.1593494337607153205
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2020 22:18:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NAZ4hzrt;
 spf=pass (domain: gmail.com, ip: 209.85.222.195, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f195.google.com with SMTP id b185so6909010qkg.1
        for <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2020 22:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PU7HIo6pXUWPyxRuGoTKeA/fwQ6KN9yxKWRC/fRv4qo=;
        b=NAZ4hzrti85HuzuJfxBEu0kZ3Af5gprVsnjLVu1kCbyGqLEdPdpKZUpXoBRTTTbn86
         DvZKtCiGfP7Hx+XmrIaQfIQXKZcR3b4L4go2prNqCzJgNh+JahlApxV1uFbVkhobx+2D
         uP9N7pR3PlYXJkaYSWOngbFIrjoT2dPOTZ0MquaW6wyCFXhy143fhE8uROZmIb/H56ik
         9XcnnWNCHfBdA3m6KU+c5IAiw7n9XHNjQeolGfJaOJbTugKDLHV1BA2XkzyesA2w5Og5
         1TtpoOy3lUFKgFIEpjYplwHPoyCGhtLBPDsotRvOUG6zKkresRdGJdPy7x68AR2A7lRQ
         ALVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PU7HIo6pXUWPyxRuGoTKeA/fwQ6KN9yxKWRC/fRv4qo=;
        b=CyN3NPLH2OGRyyqQcK63NOhlaDm+wuFv4T4fePLmZqWJht65r6UQ0o+yQEef2Tz8/q
         dbrvxb+wNXKHHdK76e5RgCMNvgCcLitwXmwiFkaAh0P15lb7E4I4Bzhuixy395mLJnO8
         BCIMqSBWIQtjJKYnuxDxZNNxAytqnMBB7lX/ckGS+e6EY7f2xz7mY3LoYhBhqMfCuvUu
         tDGB0OXNI+bJ51IMc8V6IOmswI878t2kyVcixzaGXyGPF0olgTUKD0KCYRrN2OF+QzLU
         d7S5mXBpVymhhjOvPy47m9hKIGi5AnylxXmY9LOVhnnbD5SFQdyqWb9HWwjw7v0nyHm/
         T6kw==
X-Gm-Message-State: AOAM532e2qFXwroUa3Y9LhD6ZYEJEidkju76a+uO/Kwn2oiWvhiJa1KE
	S0jrGzWsnHuuoiiHpBXrNhnjVJjmQzDRLQ==
X-Google-Smtp-Source: ABdhPJz6ZhaBxMp63EOil8kLHoUArRJuNMtydvGUnrmsRqrP4kCXdfrxVcZZfztH6Ijv/dgDkzYJpA==
X-Received: by 2002:a05:620a:211a:: with SMTP id l26mr18576130qkl.408.1593494336136;
        Mon, 29 Jun 2020 22:18:56 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id o10sm2163403qtq.71.2020.06.29.22.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 22:18:55 -0700 (PDT)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 6/6] linux-yocto/5.4: update to v5.4.49 and -rt28
Date: Tue, 30 Jun 2020 01:18:46 -0400
Message-Id: <df719b1023df2df4576ef3ae571e6f10be48fd2c.1593494109.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1593494109.git.bruce.ashfield@gmail.com>
References: <cover.1593494109.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating to -rt28 which has the following commits:

    6b9d790392dc Linux 5.4.47-rt28
    1a22749d1a0c Linux 5.4.44-rt27
    7dd4c4c793df mm/zswap: Use local lock to protect per-CPU data
    80552b4a4cf3 printk: Force a line break on pr_cont(" ")
    446f5195e149 mm: Don't warn about atomic memory allocations during suspend
    ec1f996f6740 Revert "rt: Improve the serial console PASS_LIMIT"
    119ca1ac9160 fs/dcache: Include swait.h header
    4df88505f123 printk: console must not schedule for drivers
    b60c8a8279f5 Linux 5.4.44-rt26

Updating linux-yocto/5.4 to the latest korg -stable release that comprises
the following commits:

    4e9688ad3d36 Linux 5.4.49
    99705220b22c net: core: device_rename: Use rwsem instead of a seqcount
    e33765201db7 sched/rt, net: Use CONFIG_PREEMPTION.patch
    a6030d71e62d pwm: jz4740: Enhance precision in calculation of duty cycle
    d0da4be60288 net: octeon: mgmt: Repair filling of RX ring
    96d98372b53a e1000e: Do not wake up the system via WOL if device wakeup is disabled
    3d390370d78c kretprobe: Prevent triggering kretprobe from within kprobe_flush_task
    c19f0c3c9a8a kprobes: Fix to protect kick_kprobe_optimizer() by kprobe_mutex
    f4748ee4fa15 tracing/probe: Fix memleak in fetch_op_data operations
    7bb62d0cd8ac crypto: algboss - don't wait during notifier callback
    993e0d12f226 crypto: algif_skcipher - Cap recv SG list at ctx->used
    972f961c5930 Revert "drm/amd/display: disable dcn20 abm feature for bring up"
    021935185e2a drm/i915/icl+: Fix hotplug interrupt disabling after storm detection
    d814e4732cbe drm/amd/display: Use kvfree() to free coeff in build_regamma()
    50df31ea31cc drm/connector: notify userspace on hotplug after register complete
    35bd59b8b68c drm/i915: Whitelist context-local timestamp in the gen9 cmdparser
    962d0e0c091c drm/i915/gem: Avoid iterating an empty list
    a09489576fe5 drm/msm: Check for powered down HW in the devfreq callbacks
    536ffde7df46 drm/i915: Fix AUX power domain toggling across TypeC mode resets
    190f6c2d6e38 s390: fix syscall_get_error for compat processes
    2173a7ed6358 f2fs: avoid utf8_strncasecmp() with unstable name
    de3feefa3bfd f2fs: split f2fs_d_compare() from f2fs_match_name()
    9fec865dde6e net/mlx5: DR, Fix freeing in dr_create_rc_qp()
    859a0a9afee3 block: nr_sects_write(): Disable preemption on seqcount write
    120307746990 x86/boot/compressed: Relax sed symbol type regex for LLVM ld.lld
    bba1f4ac037c drm/amd/display: Use swap() where appropriate
    8f16bebbb171 drm/dp_mst: Increase ACT retry timeout to 3s
    ffa9206a62d3 ext4: avoid race conditions when remounting with options that change dax
    0804b23d2ff1 jbd2: clean __jbd2_journal_abort_hard() and __journal_abort_soft()
    ae3c09e346bd selinux: fix double free
    5471b5287cc7 drm/amdgpu: Replace invalid device ID with a valid device ID
    3031fb61096c drm/qxl: Use correct notify port address when creating cursor ring
    1f3f21d53fa8 drm/dp_mst: Reformat drm_dp_check_act_status() a bit
    8c315a220930 ext4: avoid utf8_strncasecmp() with unstable name
    779286d9babf ext4: fix partial cluster initialization when splitting extent
    bc615a290faf drm: encoder_slave: fix refcouting error for modules
    ef4f3b65d5a9 libata: Use per port sync for detach
    81344ae52c77 arm64: hw_breakpoint: Don't invoke overflow handler on uaccess watchpoints
    64183b459624 mvpp2: remove module bugfix
    b3dc33946a74 block: Fix use-after-free in blkdev_get()
    cb5fe511b11e scsi: ufs-bsg: Fix runtime PM imbalance on error
    7c7dd0507842 bnxt_en: Return from timer if interface is not in open state.
    13e6e75e68f3 afs: Fix the mapping of the UAEOVERFLOW abort code
    b7420726bc8a afs: Set error flag rather than return error from file status decode
    66f38da13198 afs: Always include dir in bulk status fetch from afs_do_lookup()
    4fd68a35f62d afs: Fix EOF corruption
    c8c19fcdabdb afs: afs_write_end() should change i_size under the right lock
    6a9fd8046fbd afs: Fix non-setting of mtime when writing into mmap
    7b307d292ab2 powerpc: Fix kernel crash in show_instructions() w/DEBUG_VIRTUAL
    f651e94899ed bcache: fix potential deadlock problem in btree_gc_coalesce
    889b69a9982b ext4: stop overwrite the errcode in ext4_setup_super
    aa7baef53057 perf stat: Fix NULL pointer dereference
    676634f1a831 perf report: Fix NULL pointer dereference in hists__fprintf_nr_sample_events()
    335d720bb4bd usb/ehci-platform: Set PM runtime as active on resume
    21a45a1427dd usb: host: ehci-platform: add a quirk to avoid stuck
    57a1cd87efb9 usb/xhci-plat: Set PM runtime as active on resume
    33a76c15c7c2 bpf: Fix memlock accounting for sock_hash
    93b675736542 iavf: fix speed reporting over virtchnl
    e7847db7aa6d xdp: Fix xsk_generic_xmit errno
    57f71bb57f7c nfs: set invalid blocks after NFSv4 writes
    d3caf0e49492 nvme-pci: use simple suspend when a HMB is enabled
    9777d12a8b23 net/filter: Permit reading NET in load_bytes_relative when MAC not set
    0eb4e1573ffd x86/idt: Keep spurious entries unset in system_vectors
    04ce5f6f0d3c scsi: acornscsi: Fix an error handling path in acornscsi_probe()
    f3f9ee422842 libbpf: Handle GCC noreturn-turned-volatile quirk
    ab482b587207 drm/sun4i: hdmi ddc clk: Fix size of m divider
    c7c658ef5159 tracing/probe: Fix bpf_task_fd_query() for kprobes and uprobes
    5bed77b0a2a0 bpf, sockhash: Synchronize delete from bucket list on map free
    0f97842057c7 bpf/sockmap: Fix kernel panic at __tcp_bpf_recvmsg
    ea8837b9435e ASoC: rt5645: Add platform-data for Asus T101HA
    ebc448eb2de5 ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore WT10-A tablet
    69367d9f1f0e ASoC: SOF: nocodec: conditionally set dpcm_capture/dpcm_playback flags
    7b31ec2a011f ASoC: core: only convert non DPCM link to DPCM link
    445a847a5507 afs: Fix memory leak in afs_put_sysnames()
    3b50b29a2056 f2fs: don't return vmalloc() memory from f2fs_kmalloc()
    37be9b71b748 selftests/net: in timestamping, strncpy needs to preserve null byte
    a98132826820 drivers/perf: hisi: Fix wrong value for all counters enable
    e1ee6238534e i2c: icy: Fix build with CONFIG_AMIGA_PCMCIA=n
    ad67536d48ba NTB: ntb_test: Fix bug when counting remote files
    abf918236a79 NTB: perf: Fix race condition when run with ntb_test
    50a79b96b951 NTB: perf: Fix support for hardware that doesn't have port numbers
    ec8490131670 NTB: perf: Don't require one more memory window than number of peers
    2b97e354e586 NTB: Revert the change to use the NTB device dev for DMA allocations
    e5cd9e1df0c9 NTB: ntb_tool: reading the link file should not end in a NULL byte
    25abac5c9ff7 ntb_tool: pass correct struct device to dma_alloc_coherent
    f167d8f7b341 ntb_perf: pass correct struct device to dma_alloc_coherent
    08cc0ec9ba86 net: marvell: Fix OF_MDIO config check
    fbaf0137df1e gfs2: fix use-after-free on transaction ail lists
    e782a45789f8 blktrace: fix endianness for blk_log_remap()
    545bafecc0f2 blktrace: fix endianness in get_pdu_int()
    d578f98fa7b3 blktrace: use errno instead of bi_status
    718d9a863eb3 selftests/vm/pkeys: fix alloc_random_pkey() to make it really random
    7fd599522823 include/linux/bitops.h: avoid clang shift-count-overflow warnings
    b7ce2e4538f6 lib/zlib: remove outdated and incorrect pre-increment optimization
    62378b65237e geneve: change from tx_error to tx_dropped on missing metadata
    7791ab20b8eb crypto: omap-sham - add proper load balancing support for multicore
    b73df5915d13 drm/amd/display: Revalidate bandwidth before commiting DC updates
    ca0cac3373fa nfsd: safer handling of corrupted c_type
    e585a8b54046 pinctrl: freescale: imx: Fix an error handling path in 'imx_pinctrl_probe()'
    d184d62ceb19 pinctrl: imxl: Fix an error handling path in 'imx1_pinctrl_core_probe()'
    bd410e6600b4 scsi: ufs: Don't update urgent bkops level when toggling auto bkops
    88d678348430 scsi: iscsi: Fix reference count leak in iscsi_boot_create_kobj
    08904df10d3a gfs2: Allow lock_nolock mount to specify jid=X
    9adcc852d552 nfsd4: make drc_slab global, not per-net
    807460787179 ceph: don't return -ESTALE if there's still an open file
    145565f722c9 drm/nouveau/disp/gm200-: fix NV_PDISP_SOR_HDMI2_CTRL(n) selection
    43ba1b177a49 openrisc: Fix issue with argument clobbering for clone/fork
    6de31dc168f0 rxrpc: Adjust /proc/net/rxrpc/calls to display call->debug_id not user_ID
    2e48a738dc15 mailbox: zynqmp-ipi: Fix NULL vs IS_ERR() check in zynqmp_ipi_mbox_probe()
    2d9c7e0ff9f4 rtc: rv3028: Add missed check for devm_regmap_init_i2c()
    f4fbb592d9d7 vfio/mdev: Fix reference count leak in add_mdev_supported_type
    1957ac8d1b4f ASoC: fsl_asrc_dma: Fix dma_chan leak when config DMA channel failed
    c75f1641ef58 extcon: adc-jack: Fix an error handling path in 'adc_jack_probe()'
    5ed5f8db9582 powerpc/4xx: Don't unmap NULL mbase
    838d3e75ba50 input: i8042 - Remove special PowerPC handling
    cde05d643e51 of: Fix a refcounting bug in __of_attach_node_sysfs()
    f9db526da547 NFSv4.1 fix rpc_call_done assignment for BIND_CONN_TO_SESSION
    5e85d78ed4ff net: sunrpc: Fix off-by-one issues in 'rpc_ntop6'
    ece3a3337c50 /dev/mem: Revoke mappings when a driver claims the region
    3302d17ef6ea misc: xilinx-sdfec: improve get_user_pages_fast() error handling
    24aa54a8b0ec clk: ast2600: Fix AHB clock divider for A1
    c66e72f1721a clk: sprd: return correct type of value for _sprd_pll_recalc_rate
    e5497842e253 KVM: PPC: Book3S: Fix some RCU-list locks
    fd1a1089aed8 KVM: PPC: Book3S HV: Ignore kmemleak false positives
    39983e188624 scsi: ufs-qcom: Fix scheduling while atomic issue
    4d33659ac379 clk: bcm2835: Fix return type of bcm2835_register_gate
    41324c48301d scsi: target: tcmu: Fix a use after free in tcmu_check_expired_queue_cmd()
    87b3dca712b4 ASoC: fix incomplete error-handling in img_i2s_in_probe.
    5578bf5ce0d8 powerpc/32s: Don't warn when mapping RO data ROX.
    9669bf039ff6 mfd: stmfx: Disable IRQ in suspend to avoid spurious interrupt
    d8d1b8b41783 mfd: stmfx: Fix stmfx_irq_init error path
    cf90dd9fb161 mfd: stmfx: Reset chip on resume as supply was disabled
    dc69fec9271a x86/apic: Make TSC deadline timer detection message visible
    af92e4a595e0 RDMA/iw_cxgb4: cleanup device debugfs entries on ULD remove
    4c8a62c93984 scripts: headers_install: Exit with error on config leak
    c707e18796c6 usb: gadget: Fix issue with config_ep_by_speed function
    84e1326ffc61 usb: gadget: fix potential double-free in m66592_probe.
    51ad579d64dd usb: gadget: lpc32xx_udc: don't dereference ep pointer before null check
    4a8c5f25c6bc USB: gadget: udc: s3c2410_udc: Remove pointless NULL check in s3c2410_udc_nuke
    0a560f102d80 usb: dwc2: gadget: move gadget resume after the core is in L0 state
    f1b9e29983ae watchdog: da9062: No need to ping manually before setting timeout
    4820050e8438 IB/cma: Fix ports memory leak in cma_configfs
    6e934217c943 PCI: amlogic: meson: Don't use FAST_LINK_MODE to set up link
    443ed62ef80d PCI: dwc: Fix inner MSI IRQ domain registration
    0bd8e62464e0 PCI/PTM: Inherit Switch Downstream Port PTM settings from Upstream Port
    f04479f8d519 dm zoned: return NULL if dmz_get_zone_for_reclaim() fails to find a zone
    96cd8d249a37 powerpc/64s/pgtable: fix an undefined behaviour
    a7ba81f26d70 arm64: tegra: Fix flag for 64-bit resources in 'ranges' property
    17232b92cf79 arm64: tegra: Fix ethernet phy-mode for Jetson Xavier
    d658c127fc41 fuse: copy_file_range should truncate cache
    c9ddb8dd12e1 fuse: fix copy_file_range cache issues
    ad7f78b7ce39 firmware: imx: scu: Fix possible memory leak in imx_scu_probe()
    95ea51b2690e scsi: target: tcmu: Userspace must not complete queued commands
    1503314a3354 RDMA/hns: Fix cmdq parameter of querying pf timer resource
    d09de58d2b65 RDMA/hns: Bugfix for querying qkey
    7d95cb8a4073 clk: samsung: exynos5433: Add IGNORE_UNUSED flag to sclk_i2s1
    fddd06f7490f fpga: dfl: afu: Corrected error handling levels
    7454c171a88c tty: n_gsm: Fix bogus i++ in gsm_data_kick
    4f01308480c5 USB: host: ehci-mxc: Add error handling in ehci_mxc_drv_probe()
    0e0332473790 ASoC: Intel: bytcr_rt5640: Add quirk for Toshiba Encore WT8-A tablet
    f1069001bba7 drm/msm/mdp5: Fix mdp5_init error path for failed mdp5_kms allocation
    fbf719e5da12 usb/ohci-platform: Fix a warning when hibernating
    8a67dae365e0 vfio-pci: Mask cap zero
    f5e28a0824ec powerpc/ps3: Fix kexec shutdown hang
    8f4372f4724d drivers: phy: sr-usb: do not use internal fsm for USB2 phy init
    1a588c7edcd0 powerpc/pseries/ras: Fix FWNMI_VALID off by one
    8240829fc38c powerpc/64s/exception: Fix machine check no-loss idle wakeup
    b1bc8753eefc ipmi: use vzalloc instead of kmalloc for user creation
    5c2207ba2394 habanalabs: increase timeout during reset
    828b192c57e8 PCI/PM: Assume ports without DLL Link Active train links in 100 ms
    c6737f3a1b01 HID: Add quirks for Trust Panora Graphic Tablet
    7961800651fa ALSA: usb-audio: Add duplex sound support for USB devices using implicit feedback
    860b8717f724 tty: n_gsm: Fix waking up upper tty layer when room available
    3a497f97a3b6 tty: n_gsm: Fix SOF skipping
    7fcc2ca6a3fb powerpc/64: Don't initialise init_task->thread.regs
    c7fab8a5c3ba PCI: Fix pci_register_host_bridge() device_register() error handling
    86e8dd9d249c clk: ti: composite: fix memory leak
    4536dbe64bd1 USB: ohci-sm501: fix error return code in ohci_hcd_sm501_drv_probe()
    c17e7243051a dlm: remove BUG() before panic()
    d40e6a98aa55 pinctrl: rockchip: fix memleak in rockchip_dt_node_to_map
    5248114b9bcf ASoC: ti: omap-mcbsp: Fix an error handling path in 'asoc_mcbsp_probe()'
    5acfef99644c ASoC: ux500: mop500: Fix some refcounted resources issues
    b0ccdd2fdd00 SoC: rsnd: add interrupt support for SSI BUSIF buffer
    f34a3697a8d4 scsi: mpt3sas: Fix double free warnings
    f20dfec03b82 scsi: target: loopback: Fix READ with data and sensebytes
    a798daf42a35 arm64: dts: msm8996: Fix CSI IRQ types
    6544b95bd789 ASoC: SOF: core: fix error return code in sof_probe_continue()
    79790202d4f3 power: supply: smb347-charger: IRQSTAT_D is volatile
    ad8b5b5faf9d power: supply: lp8788: Fix an error handling path in 'lp8788_charger_probe()'
    c1bcf01aea0e ALSA: firewire-lib: fix invalid assignment to union data for directional parameter
    3201bb03c8fd scsi: qla2xxx: Fix warning after FC target reset
    766c787e55ca PCI/ASPM: Allow ASPM on links to PCIe-to-PCI/PCI-X Bridges
    742f8ac8edd4 PCI: rcar: Fix incorrect programming of OB windows
    efb5f7b106ea drivers: base: Fix NULL pointer exception in __platform_driver_probe() if a driver developer is foolish
    33cf7944af54 serial: amba-pl011: Make sure we initialize the port.lock spinlock
    32a5bc992b6c i2c: pxa: fix i2c_pxa_scream_blue_murder() debug output
    9eb54d0e8962 PCI: v3-semi: Fix a memory leak in v3_pci_probe() error handling paths
    4d30daf901aa staging: sm750fb: add missing case while setting FB_VISUAL
    2428682e3f6c staging: wilc1000: Increase the size of wid_list array
    b14b7359535d usb: dwc3: gadget: Properly handle failed kick_transfer
    1bfa09147282 usb: dwc3: gadget: Properly handle ClearFeature(halt)
    e320bb0e01db HID: intel-ish-hid: avoid bogus uninitialized-variable warning
    cbec16266a35 soundwire: slave: don't init debugfs on device registration error
    a45fc52449d7 ASoC: max98373: reorder max98373_reset() in resume
    7377ba16b542 clk: meson: meson8b: Don't rely on u-boot to init all GP_PLL registers
    ea78361174c4 thermal/drivers/ti-soc-thermal: Avoid dereferencing ERR_PTR
    3296e566b0d2 gpio: pca953x: fix handling of automatic address incrementing
    dd47c98992d6 clk: meson: meson8b: Fix the vclk_div{1, 2, 4, 6, 12}_en gate bits
    ecb9a8068ba5 clk: meson: meson8b: Fix the polarity of the RESET_N lines
    1fa1d1ceb02f clk: meson: meson8b: Fix the first parent of vid_pll_in_sel
    9a624802e628 slimbus: ngd: get drvdata from correct device
    793e15fb6681 tty: hvc: Fix data abort due to race in hvc_open
    eb3e85b3375d s390/qdio: put thinint indicator after early error
    d7852661f9fd ALSA: usb-audio: Fix racy list management in output queue
    aba41867dd66 ALSA: usb-audio: Improve frames size computation
    3468bca1ea44 staging: gasket: Fix mapping refcnt leak when register/store fails
    b3b4dcdc2bb4 staging: gasket: Fix mapping refcnt leak when put attribute fails
    0c884f3236f3 firmware: qcom_scm: fix bogous abuse of dma-direct internals
    0c48b6df64c0 arm64: dts: qcom: fix pm8150 gpio interrupts
    2b5e027657d4 virtiofs: schedule blocking async replies in separate worker
    ff86bd6cca2e pinctrl: rza1: Fix wrong array assignment of rza1l_swio_entries
    cd3f4ed1c567 scsi: qedf: Fix crash when MFW calls for protocol stats while function is still probing
    a0a00156d50e gpio: dwapb: Append MODULE_ALIAS for platform driver
    02416142fdf4 RDMA/mlx5: Fix udata response upon SRQ creation
    7acbadd1aa29 ARM: dts: sun8i-h2-plus-bananapi-m2-zero: Fix led polarity
    ef0c0fbf1d4a arm64: dts: qcom: msm8916: remove unit name for thermal trip points
    f37623862ec5 scsi: qedi: Do not flush offload work if ARP not resolved
    0e5d7bff3b06 arm64: dts: mt8173: fix unit name warnings
    7bf3a213f79e staging: greybus: fix a missing-check bug in gb_lights_light_config()
    c970dcc085b8 x86/purgatory: Disable various profiling and sanitizing options
    a78c65cb4b67 apparmor: fix nnp subset test for unconfined
    af1f72ad18bb scsi: ibmvscsi: Don't send host info in adapter info MAD after LPM
    08d2ea2e236a scsi: sr: Fix sr_probe() missing deallocate of device minor
    8f73ac0b6434 bpf, sockhash: Fix memory leak when unlinking sockets in sock_hash_free
    efdb1bf81aab ASoC: meson: add missing free_irq() in error path
    390f1688fb46 f2fs: handle readonly filesystem in f2fs_ioc_shutdown()
    039a79ef0b1e apparmor: check/put label on apparmor_sk_clone_security()
    2a9b3e4667f5 net: dsa: lantiq_gswip: fix and improve the unsupported interface error
    88bc3e060390 apparmor: fix introspection of of task mode for unconfined tasks
    d782d6a142d5 mksysmap: Fix the mismatch of '.L' symbols in System.map
    d0af43b47418 NTB: Fix the default port and peer numbers for legacy drivers
    f0b8eead5b1c NTB: ntb_pingpong: Choose doorbells based on port number
    0ec407dfc1ec yam: fix possible memory leak in yam_init_driver
    a4d4b8437731 sparc32: mm: Don't try to free page-table pages if ctor() fails
    7f16ba366a66 pwm: img: Call pm_runtime_put() in pm_runtime_get_sync() failed case
    9b163c91620c powerpc/crashkernel: Take "mem=" option into account
    211836827af3 ASoC: qcom: q6asm-dai: kCFI fix
    117929a41db1 cifs: set up next DFS target before generic_ip_connect()
    c0c8c8b10567 RDMA/core: Fix several reference count leaks.
    3851967ff567 PCI: vmd: Filter resource type bits from shadow register
    e8cac2e3067e nfsd: Fix svc_xprt refcnt leak when setup callback client failed
    db686568ae52 powerpc/perf/hv-24x7: Fix inconsistent output values incase multiple hv-24x7 events run
    ecb9c4d344c9 IB/mlx5: Fix DEVX support for MLX5_CMD_OP_INIT2INIT_QP command
    a2fe8d88aeff clk: clk-flexgen: fix clock-critical handling
    6a70c943a26f scsi: vhost: Notify TCM about the maximum sg entries supported per command
    296cec70500b scsi: lpfc: Fix lpfc_nodelist leak when processing unsolicited event
    82ac4863030c clk: zynqmp: fix memory leak in zynqmp_register_clocks
    bee9cc351308 scsi: cxgb3i: Fix some leaks in init_act_open()
    4deddbf7db45 mfd: wm8994: Fix driver operation if loaded as modules
    8e52a1eef19b powerpc/ptdump: Add _PAGE_COHERENT flag
    805bae7592fa usb: gadget: core: sync interrupt before unbind the udc
    2ec338547c67 gpio: dwapb: Call acpi_gpiochip_free_interrupts() on GPIO chip de-registration
    02bdd581404d m68k/PCI: Fix a memory leak in an error handling path
    ec475f960e92 PCI: pci-bridge-emul: Fix PCIe bit conflicts
    ba5192db9672 scsi: hisi_sas: Do not reset phy timer to wait for stray phy up
    2b670bbfd8c0 RDMA/mlx5: Add init2init as a modify command
    cbd55ce91abf coresight: tmc: Fix TMC mode read in tmc_read_prepare_etb()
    c74ead459747 vfio/pci: fix memory leaks in alloc_perm_bits()
    24911d387b84 arm64: dts: fvp/juno: Fix node address fields
    6d79ba8094fa ps3disk: use the default segment boundary
    bc881cd5334c PCI: aardvark: Don't blindly enable ASPM L0s and don't write to read-only register
    492c50fe65a9 arm64: dts: fvp: Fix GIC child nodes
    376ef9d7ee4c ASoC: SOF: Do nothing when DSP PM callbacks are not set
    1cdae7bb4221 clk: renesas: cpg-mssr: Fix STBCR suspend/resume handling
    14c5e25d3b00 pinctrl: ocelot: Fix GPIO interrupt decoding on Jaguar2
    4e55b843fa61 arm64: dts: juno: Fix GIC child nodes
    7df82e1754df arm64: dts: armada-3720-turris-mox: fix SFP binding
    4ca96a5de812 arm64: dts: armada-3720-turris-mox: forbid SDR104 on SDIO for FCC purposes
    a86306dbefc3 dm mpath: switch paths in dm_blk_ioctl() code path
    08f396eb02c8 misc: fastrpc: fix potential fastrpc_invoke_ctx leak
    8d8991bb2bf0 misc: fastrpc: Fix an incomplete memory release in fastrpc_rpmsg_probe()
    c2ff1fcc2530 serial: 8250: Fix max baud limit in generic 8250 port
    9e6a9201b78b usblp: poison URBs upon disconnect
    cc9024f69ba7 clk: samsung: Mark top ISP and CAM clocks on Exynos542x as critical
    2b5e61da68e8 remoteproc: qcom_q6v5_mss: map/unmap mpss segments before/after use
    8a44731af689 i2c: pxa: clear all master action bits in i2c_pxa_stop_message()
    ceb63ec0ef6e f2fs: report delalloc reserve as non-free in statfs for project quota
    ca90f67ece5c iio: bmp280: fix compensation of humidity
    30bd1f36b6eb rtc: mc13xxx: fix a double-unlock issue
    91fce7922a75 powerpc/kasan: Fix stack overflow by increasing THREAD_SHIFT
    a6a0317bf9c2 Input: edt-ft5x06 - fix get_default register write access
    70a2296d4bab scsi: qla2xxx: Fix issue with adapter's stopping state
    5800b7f7d231 PCI: Allow pci_resize_resource() for devices on root bus
    956a2e737a2c ALSA: isa/wavefront: prevent out of bounds write in ioctl
    23337efa940c ALSA: hda/realtek - Introduce polarity for micmute LED GPIO
    66a177ae4ed0 arm64: dts: meson: fixup SCP sram nodes
    7631dc491a3f scsi: qedi: Check for buffer overflow in qedi_set_path()
    545b86efa0d0 scsi: core: free sgtables in case command setup fails
    bde2d5d443c4 ARM: dts: stm32: Add missing ethernet PHY reset on AV96
    38ede4d7736e ARM: integrator: Add some Kconfig selections
    a1359b9fdd8d ASoC: davinci-mcasp: Fix dma_chan refcnt leak when getting dma type
    8908c555e06e ARM: dts: renesas: Fix IOMMU device node names
    2c40fc80331b backlight: lp855x: Ensure regulators are disabled on probe failure
    53057bd4ac84 ASoC: fsl_esai: Disable exception interrupt before scheduling tasklet
    b543c3595188 clk: qcom: msm8916: Fix the address location of pll->config_reg
    7906a075c900 remoteproc: Fix IDR initialisation in rproc_alloc()
    8bd207bb1a25 iio: pressure: bmp280: Tolerate IRQ before registering
    2e714a547ef8 ASoC: SOF: imx8: Fix randbuild error
    dc570a1fb48c i2c: piix4: Detect secondary SMBus controller on AMD AM4 chipsets
    30e82a3edd94 ASoC: tegra: tegra_wm8903: Support nvidia, headset property
    7b139b714a5d clk: sunxi: Fix incorrect usage of round_down()
    8aa822a1305c power: supply: bq24257_charger: Replace depends on REGMAP_I2C with select
    67cb016870e2 Linux 5.4.48
    8e38ea68da06 perf symbols: Fix kernel maps for kcore and eBPF
    807cc607f129 perf symbols: Fix debuginfo search for Ubuntu
    842645de05d5 perf probe: Check address correctness by map instead of _etext
    be781abe3ae8 perf probe: Fix to check blacklist address correctly
    a2e097910334 perf probe: Do not show the skipped events
    9660edf6729d f2fs: fix checkpoint=disable:%u%%
    1866b1493e2e w1: omap-hdq: cleanup to add missing newline for some dev_dbg
    2140d7d5d878 mtd: rawnand: tmio: Fix the probe error path
    ec851b26a3e5 mtd: rawnand: mtk: Fix the probe error path
    b5404756b54f mtd: rawnand: pasemi: Fix the probe error path
    44a9bf52ef80 mtd: rawnand: plat_nand: Fix the probe error path
    ab702f81e978 mtd: rawnand: sunxi: Fix the probe error path
    2d77d5575e09 mtd: rawnand: oxnas: Fix the probe error path
    2d6b0901b834 mtd: rawnand: socrates: Fix the probe error path
    3a54e242870b mtd: rawnand: orion: Fix the probe error path
    0b19623af5a6 mtd: rawnand: xway: Fix the probe error path
    ae7cf595e15b mtd: rawnand: ingenic: Fix the probe error path
    38abdd9bf77c mtd: rawnand: sharpsl: Fix the probe error path
    8d695fbaa5cb mtd: rawnand: diskonchip: Fix the probe error path
    1260c45ac55b mtd: rawnand: brcmnand: fix hamming oob layout
    ba4ffbb5592d mtd: rawnand: onfi: Fix redundancy detection check
    869a782420da mtd: rawnand: Fix nand_gpio_waitrdy()
    e5084eadf193 sunrpc: clean up properly in gss_mech_unregister()
    4a68a2e25e20 sunrpc: svcauth_gss_register_pseudoflavor must reject duplicate registrations.
    e4f7a7260737 kbuild: force to build vmlinux if CONFIG_MODVERSION=y
    1b0d830e0ce0 powerpc/64s: Save FSCR to init_task.thread.fscr after feature init
    b3b357d83079 powerpc/64s: Don't let DT CPU features set FSCR_DSCR
    1d9a4422c9ac powerpc/32: Disable KASAN with pages bigger than 16k
    4719cb8a16af powerpc/kasan: Fix shadow pages allocation failure
    002d22c4945a powerpc/kasan: Fix issues by lowering KASAN_SHADOW_END
    23e07a77aa7c powerpc/32s: Fix another build failure with CONFIG_PPC_KUAP_DEBUG
    c6077abc067f drivers/macintosh: Fix memleak in windfarm_pm112 driver
    1d5144d7dc5d ARM: dts: s5pv210: Set keep-power-in-suspend for SDHCI1 on Aries
    727111d44a59 ARM: dts: at91: sama5d2_ptc_ek: fix vbus pin
    1bfcafbb4d1e ARM: dts: exynos: Fix GPIO polarity for thr GalaxyS3 CM36651 sensor's bus
    8c7ca9ab5abc soc/tegra: pmc: Select GENERIC_PINCONF
    be20b99a86b3 ARM: tegra: Correct PL310 Auxiliary Control Register initialization
    b5d2f71b98b7 kernel/cpu_pm: Fix uninitted local in cpu_pm
    6d9cc26aa164 powerpc/fadump: Account for memory_limit while reserving memory
    6fd930da24e1 powerpc/fadump: consider reserved ranges while reserving memory
    3e9211d98803 powerpc/fadump: use static allocation for reserved memory ranges
    c81e34c4346f alpha: fix memory barriers so that they conform to the specification
    5018a0bd0964 dm crypt: avoid truncating the logical block size
    ee6fa4903f84 sparc64: fix misuses of access_process_vm() in genregs32_[sg]et()
    0dcbc7d6cd2d sparc32: fix register window handling in genregs32_[gs]et()
    f2f18147c7db gnss: sirf: fix error return code in sirf_probe()
    e75e551606f4 pinctrl: samsung: Save/restore eint_mask over suspend for EINT_TYPE GPIOs
    407933bbb385 pinctrl: samsung: Correct setting of eint wakeup mask on s5pv210
    8b28e5c35d32 power: supply: core: fix memory leak in HWMON error path
    6050811edffb power: supply: core: fix HWMON temperature labels
    0fd525d817ea power: vexpress: add suppress_bind_attrs to true
    7c71b9aa18a0 EDAC/amd64: Add AMD family 17h model 60h PCI IDs
    67712fa4a662 hwmon: (k10temp) Add AMD family 17h model 60h PCI match
    3046b09d45ec igb: Report speed and duplex as unknown when device is runtime suspended
    e6f91166fc37 clk: mediatek: assign the initial value to clk_init_data of mtk_mux
    adecd49745f8 media: ov5640: fix use of destroyed mutex
    3ef00d99199d b43_legacy: Fix connection problem with WPA3
    b74d369d2962 b43: Fix connection problem with WPA3
    5c039a9921b3 b43legacy: Fix case where channel status is corrupted
    eeb0cf8bb68e Bluetooth: hci_bcm: fix freeing not-requested IRQ
    4c79dd14c15d serial: 8250: Avoid error message on reprobe
    80462f7c296d media: cedrus: Program output format during each run
    6e688a315acf media: go7007: fix a miss of snd_card_free
    bda6ebf290fa carl9170: remove P2P_GO support
    cedbd8709cc1 e1000e: Relax condition to trigger reset for ME workaround
    0fedb80811f4 e1000e: Disable TSO for buffer overrun workaround
    f4cc36066a31 PCI: Program MPS for RCiEP devices
    e131e70e2144 ima: Set again build_ima_appraise variable
    2600136eaee9 ima: Remove redundant policy rule set in add_rules()
    70ce85319d45 x86/amd_nb: Add AMD family 17h model 60h PCI IDs
    44eec92cc4bf serial: 8250_pci: Move Pericom IDs to pci_ids.h
    3c8938fb19ed PCI: Add Loongson vendor ID
    9cfece5c0e2b x86/amd_nb: Add Family 19h PCI IDs
    b35415c0949a PCI: vmd: Add device id for VMD device 8086:9A0B
    3179b408c401 PCI: Add ACS quirk for Intel Root Complex Integrated Endpoints
    0e4528cdbaf0 PCI: Avoid FLR for AMD Starship USB 3.0
    cb5ac1a32552 PCI: Avoid FLR for AMD Matisse HD Audio & USB 3.0
    c41d7ca0061e PCI: Avoid Pericom USB controller OHCI/EHCI PME# defect
    fd8abb78b129 ext4: fix race between ext4_sync_parent() and rename()
    c316ebcf9f4b ext4: fix error pointer dereference
    319b553695ec ext4: fix EXT_MAX_EXTENT/INDEX to check for zeroed eh_max
    6de50456fe17 evm: Fix possible memory leak in evm_calc_hmac_or_hash()
    ce7f038f859d ima: Remove __init annotation from ima_pcrread()
    f387759c2d67 ima: Call ima_calc_boot_aggregate() in ima_eventdigest_init()
    64712383a186 ima: Directly assign the ima_default_policy pointer to ima_rules
    4ce29d9b1941 ima: Evaluate error in init_ima()
    5f7272bd228c ima: Switch to ima_hash_algo for boot aggregate
    0698eacdfc4f ima: Fix ima digest hash table key calculation
    13ae9eaae0cc mm: call cond_resched() from deferred_init_memmap()
    5386d93bc5b6 mm/pagealloc.c: call touch_nmi_watchdog() on max order boundaries in deferred init
    c388f173ed8a mm: initialize deferred pages with interrupts enabled
    a88d8aaf9b8b mm: thp: make the THP mapcount atomic against __split_huge_pmd_locked()
    e418045e25a9 powerpc/mm: Fix conditions to perform MMU specific management by blocks on PPC32.
    0ccfd7a531e8 btrfs: fix space_info bytes_may_use underflow during space cache writeout
    248cdf728895 btrfs: fix space_info bytes_may_use underflow after nocow buffered write
    8076bdd4fe00 btrfs: fix wrong file range cleanup after an error filling dealloc range
    c2c69ecb605f btrfs: fix error handling when submitting direct I/O bio
    05c5e98bf402 btrfs: force chunk allocation if our global rsv is larger than metadata
    f63545770fc4 btrfs: send: emit file capabilities after chown
    20f260ed536a btrfs: include non-missing as a qualifier for the latest_bdev
    fd9720b8e957 btrfs: free alien device after device add
    b008ae4cc74d string.h: fix incompatibility between FORTIFY_SOURCE and KASAN
    d6c2b4d246c5 kasan: stop tests being eliminated as dead code with FORTIFY_SOURCE
    c48a842d8ce7 selftests/bpf, flow_dissector: Close TAP device FD after the test
    e7b1564a24e6 bpf: Fix running sk_skb program types with ktls
    d9cd7b83942f bpf: Refactor sockmap redirect code so its easy to reuse
    215a256bc8dd bpf: Fix map permissions check
    0d55b7032ad1 libbpf: Fix perf_buffer__free() API for sparse allocs
    98545815cfcf platform/x86: asus_wmi: Reserve more space for struct bias_args
    4383a5dfbdc5 platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type
    5f3cba4bc241 platform/x86: intel-hid: Add a quirk to support HP Spectre X2 (2015)
    176396ad0594 platform/x86: hp-wmi: Convert simple_strtoul() to kstrtou32()
    b77412359c1e cpuidle: Fix three reference count leaks
    cf3359869819 spi: dw: Return any value retrieved from the dma_transfer callback
    2c95fc879a2f mmc: sdhci-esdhc-imx: fix the mask for tuning start point
    7fe3a1c29869 iwlwifi: mvm: fix aux station leak
    ffa118a164e6 ixgbe: fix signed-integer-overflow warning
    99ea968e3766 ice: fix potential double free in probe unrolling
    62b2fbb9c463 mmc: via-sdmmc: Respect the cmd->busy_timeout from the mmc core
    3d6143663f21 staging: greybus: sdio: Respect the cmd->busy_timeout from the mmc core
    8a7c5b83f846 mmc: sdhci-msm: Set SDHCI_QUIRK_MULTIBLOCK_READ_ACMD12 quirk
    62e7e4f5976c bcache: fix refcount underflow in bcache_device_free()
    d55960f7f6b7 MIPS: Fix IRQ tracing when call handle_fpe() and handle_msa_fpe()
    3f6482c0a486 PCI: Don't disable decoding when mmio_always_on is set
    fa99a4b3fb12 macvlan: Skip loopback packets in RX handler
    c6f1f12a8c3d btrfs: qgroup: mark qgroup inconsistent if we're inherting snapshot to a new qgroup
    1e42a1857bcf btrfs: improve global reserve stealing logic
    590aad883521 m68k: mac: Don't call via_flush_cache() on Mac IIfx
    ce066ce05e1b MIPS: tools: Fix resource leak in elf-entry.c
    87ef5086a3c2 x86/mm: Stop printing BRK addresses
    41b44325c9eb selftests/bpf: CONFIG_IPV6_SEG6_BPF required for test_seg6_loop.o
    5b8d09eeb4a6 drm/amdgpu: Sync with VM root BO when switching VM to CPU update mode
    b06a7dc9e5f6 drm/amd/powerpay: Disable gfxoff when setting manual mode on picasso and raven
    188e3e6ed902 crypto: stm32/crc32 - fix multi-instance
    d879598b8dae crypto: stm32/crc32 - fix run-time self test issue.
    8fe61a2027db crypto: stm32/crc32 - fix ext4 chksum BUG_ON()
    c79c643fca61 mips: Add udelay lpj numbers adjustment
    34a45e84edc5 mips: MAAR: Use more precise address mask
    9fa3b0bd9914 sched: Defend cfs and rt bandwidth quota against overflow
    fecf17b609a7 x86/boot: Correct relocation destination on old linkers
    7b3423eff20e kgdboc: Use a platform device to handle tty drivers showing up late
    39d7ce336ec5 mwifiex: Fix memory corruption in dump_station
    65f1c3e4e906 rtlwifi: Fix a double free in _rtl_usb_tx_urb_setup()
    916f41e40643 net/mlx5e: IPoIB, Drop multicast packets that this interface sent
    fa408bbe1007 veth: Adjust hard_start offset on redirect XDP frames
    894d9cd52466 iocost: don't let vrate run wild while there's no saturation signal
    7f5d77570b0c raid5: remove gfp flags from scribble_alloc()
    cd4013947eae md: don't flush workqueue unconditionally in md_open
    5deaa24167a6 mt76: avoid rx reorder buffer overflow
    095e7a6a326c drm/mcde: dsi: Fix return value check in mcde_dsi_bind()
    727093f432d1 net: qed*: Reduce RX and TX default ring count when running inside kdump kernel
    5099a9c22dbf wcn36xx: Fix error handling path in 'wcn36xx_probe()'
    dbf2fab3f540 ath10k: Remove msdu from idr when management pkt send fails
    671d8b8726a1 nvme-tcp: use bh_lock in data_ready
    a09fc96a3d54 nvme-pci: align io queue count with allocted nvme_queue in nvme_probe
    be7f2672c341 nvme: refine the Qemu Identify CNS quirk
    66ea23154df0 iwlwifi: avoid debug max amsdu config overwriting itself
    287a0f7a3393 platform/x86: intel-vbtn: Also handle tablet-mode switch on "Detachable" and "Portable" chassis-types
    708e0175edf5 platform/x86: intel-vbtn: Do not advertise switches to userspace if they are not there
    0ac5741007f1 platform/x86: intel-vbtn: Split keymap into buttons and switches parts
    4a091f1d273f platform/x86: intel-vbtn: Use acpi_evaluate_integer()
    b04c79255e8d xfs: fix duplicate verification from xfs_qm_dqflush()
    f69806af2a2f xfs: reset buffer write failure state on successful completion
    4f1a132115ef kgdb: Fix spurious true from in_dbg_master()
    fe99bb25c452 mips: cm: Fix an invalid error code of INTVN_*_ERR
    7bf491d01ea7 MIPS: Truncate link address into 32bit for 32bit kernel
    ec19b7a525aa Crypto/chcr: fix for ccm(aes) failed test
    984fc5f4e3b4 xfs: clean up the error handling in xfs_swap_extents
    0eeea4b8f0a9 libertas_tf: avoid a null dereference in pointer priv
    964de53149ab powerpc/spufs: fix copy_to_user while atomic
    dc091fc86216 net: allwinner: Fix use correct return type for ndo_start_xmit()
    8ca0e780b4e8 media: cec: silence shift wrapping warning in __cec_s_log_addrs()
    4f6762503fa2 drivers: net: davinci_mdio: fix potential NULL dereference in davinci_mdio_probe()
    b2083327ea3c selinux: fix error return code in policydb_read()
    86dced2417b7 net: lpc-enet: fix error return code in lpc_mii_init()
    7b88ccc137fb iocost_monitor: drop string wrap around numbers when outputting json
    5934e2270901 drivers/perf: hisi: Fix typo in events attribute array
    f7757368e0f0 sched/core: Fix illegal RCU from offline CPUs
    2e256dd5b055 exit: Move preemption fixup up, move blocking operations down
    338ff29604d9 lib/mpi: Fix 64-bit MIPS build with Clang
    4fbc334749e7 net: bcmgenet: Fix WoL with password after deep sleep
    d7b1ca9eebdf net: bcmgenet: set Rx mode before starting netif
    1dbb13ceedac selftests/bpf: Fix memory leak in extract_build_id()
    58ee4d253753 netfilter: nft_nat: return EOPNOTSUPP if type or flags are not supported
    d1a00c9bb1c7 dpaa2-eth: fix return codes used in ndo_setup_tc
    04ab099d1eb0 Drivers: hv: vmbus: Always handle the VMBus messages on CPU0
    51d2957b21b5 audit: fix a net reference leak in audit_list_rules_send()
    5b737a0ae101 Bluetooth: btbcm: Add 2 missing models to subver tables
    c5edfe811b4a ath10k: add flush tx packets for SDIO chip
    cc66b6bb3241 MIPS: Make sparse_init() using top-down allocation
    c3bc42b70ed1 media: platform: fcp: Set appropriate DMA parameters
    79d622a81322 media: dvb: return -EREMOTEIO on i2c transfer failure.
    189ca174b87d audit: fix a net reference leak in audit_send_reply()
    6315839f14b9 drm/mediatek: set dpi pin mode to gpio low to avoid leakage current
    878ca9ebf1a0 dt-bindings: display: mediatek: control dpi pins mode to avoid leakage
    4f8c52320202 e1000: Distribute switch variables for initialization
    0bf9805dfdae tools api fs: Make xxx__mountpoint() more scalable
    a17cc8a6abab regulator: qcom-rpmh: Fix typos in pm8150 and pm8150l
    22a734616824 brcmfmac: fix wrong location to get firmware feature
    90e5154c737c spi: Respect DataBitLength field of SpiSerialBusV2() ACPI resource
    42c22e4834c2 media: staging/intel-ipu3: Implement lock for stream on/off operations
    bfc0ee2b31f8 ath10k: fix kernel null pointer dereference
    76ecfcfefe3b staging: android: ion: use vmap instead of vm_map_ram
    3ec7b42f1747 x86: fix vmap arguments in map_irq_stack
    ece6218eea3a net: vmxnet3: fix possible buffer overflow caused by bad DMA value in vmxnet3_get_rss()
    af510d6fd690 x86/kvm/hyper-v: Explicitly align hcall param for kvm_hyperv_exit
    bd18ecbbc7aa spi: dw: Fix Rx-only DMA transfers
    999b59be5d20 Bluetooth: btmtkuart: Improve exception handling in btmtuart_probe()
    2daf747c2831 mmc: meson-mx-sdio: trigger a soft reset after a timeout or CRC error
    804664580662 ice: Fix for memory leaks and modify ICE_FREE_CQ_BUFS
    f9b545956421 ice: Fix memory leak
    f503e7fe3099 batman-adv: Revert "disable ethtool link speed detection when auto negotiation off"
    8cf93ef213f9 ARM: 8978/1: mm: make act_mm() respect THREAD_SIZE
    2a005026102e btrfs: do not ignore error from btrfs_next_leaf() when inserting checksums
    3bb51c966b9f btrfs: account for trans_block_rsv in may_commit_transaction
    cb0ee3f03f0b media: dvbdev: Fix tuner->demod media controller link
    bffe2c8e2303 clocksource: dw_apb_timer_of: Fix missing clockevent timers
    7bd656984566 clocksource: dw_apb_timer: Make CPU-affiliation being optional
    e8ec0ae0f3cf spi: dw: Enable interrupts in accordance with DMA xfer mode
    a2683765887d mips: Fix cpu_has_mips64r1/2 activation for MIPS32 CPUs
    b1d2d3dd016f ACPI/IORT: Fix PMCG node single ID mapping handling
    c2ad0dc7b9e0 pmu/smmuv3: Clear IRQ affinity hint on device removal
    308c2095da30 kgdb: Prevent infinite recursive entries to the debugger
    1343e0a85941 kgdb: Disable WARN_CONSOLE_UNLOCKED for all kgdb
    5c79bf440d35 Bluetooth: Add SCO fallback for invalid LMP parameters error
    461b239e3a73 MIPS: Loongson: Build ATI Radeon GPU driver as module
    544a3a292d8e platform/x86: dell-laptop: don't register micmute LED if there is no token
    ece1e470af13 ixgbe: Fix XDP redirect on archs with PAGE_SIZE above 4K
    6eec65c9e283 lockdown: Allow unprivileged users to see lockdown status
    00f73938ef65 drm: rcar-du: Set primary plane zpos immutably at initializing
    e7aefaba39d2 block: reset mapping if failed to update hardware queue count
    b432540123f5 arm64: insn: Fix two bugs in encoding 32-bit logical immediates
    201219691a9a block: alloc map and request for new hardware queue
    fec6f8c0b221 ACPICA: Dispatcher: add status checks
    c916af516d82 spi: dw: Zero DMA Tx and Rx configurations on stack
    92fb6909b058 rtw88: fix an issue about leak system resources
    bd7662d6036e media: staging: ipu3: Fix stale list entries on parameter queue failure
    9a0c99419125 arm64: cacheflush: Fix KGDB trap detection
    12d4dac2be77 ath10k: remove the max_sched_scan_reqs value
    c573a13f72fb efi/libstub/x86: Work around LLVM ELF quirk build regression
    fa15b59b1ea2 net: ena: fix error returning in ena_com_get_hash_function()
    84c8498320d2 net: atlantic: make hw_get_regs optional
    9f664eda61a0 sched/fair: Refill bandwidth before scaling
    91517e951830 x86,smap: Fix smap_{save,restore}() alternatives
    6fc5d5834b37 spi: pxa2xx: Apply CS clk quirk to BXT
    269e7b43f2b4 libbpf: Fix memory leak and possible double-free in hashmap__clear
    072d23eef600 arm64/kernel: Fix range on invalidating dcache for boot page tables
    614722f1ffd2 drm/amdgpu: Init data to avoid oops while reading pp_num_states.
    d2a244e74808 spi: spi-mem: Fix Dual/Quad modes on Octal-capable devices
    07d45406db69 objtool: Ignore empty alternatives
    1121685ca1bd media: si2157: Better check for running tuner in init
    18b2a6f250cc media: vicodec: Fix error codes in probe function
    f9f8f0c24203 crypto: ccp -- don't "select" CONFIG_DMADEVICES
    68aeaeac683b media: imx: imx7-mipi-csis: Cleanup and fix subdev pad format handling
    ff41c7b3c7db media: staging: imgu: do not hold spinlock during freeing mmu page table
    22710f6c35a3 drm: bridge: adv7511: Extend list of audio sample rates
    30c5d951a557 ath10k: Fix the race condition in firmware dump work queue
    6fc5719b85ec drm/amdgpu: fix and cleanup amdgpu_gem_object_close v4
    f3ec5b536fc1 ACPI: GED: use correct trigger type field in _Exx / _Lxx handling

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.4.bb               |  6 ++---
 .../linux/linux-yocto-tiny_5.4.bb             |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  | 22 +++++++++----------
 3 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
index 20b1586f52..e5401587d6 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.4.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "477bc652e6af1f1a21e36bb52045c78646608e22"
-SRCREV_meta ?= "8745aff15effeb7856b8dca7f8bd5a472f3173c7"
+SRCREV_machine ?= "f611b456c071c5898e3762a190b71e3a51b0ad65"
+SRCREV_meta ?= "30814016b37dc93699992221763ad4e2960b02fa"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.4.47"
+LINUX_VERSION ?= "5.4.49"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
index 058d7683cf..fb2d37405d 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.4.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.4.47"
+LINUX_VERSION ?= "5.4.49"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine_qemuarm ?= "2eee5e9cb9fbd8cfd84e5b90cbb05456a30c4032"
-SRCREV_machine ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_meta ?= "8745aff15effeb7856b8dca7f8bd5a472f3173c7"
+SRCREV_machine_qemuarm ?= "ddf262a3be1304a97d62bb8f60a0c0ae2b41fdc9"
+SRCREV_machine ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_meta ?= "30814016b37dc93699992221763ad4e2960b02fa"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.4.bb b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
index 13be2acc24..fc8c442ef1 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.4.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.4.bb
@@ -12,16 +12,16 @@ KBRANCH_qemux86  ?= "v5.4/standard/base"
 KBRANCH_qemux86-64 ?= "v5.4/standard/base"
 KBRANCH_qemumips64 ?= "v5.4/standard/mti-malta64"
 
-SRCREV_machine_qemuarm ?= "69a05705a437d3b0fc51518c66f93cc4db3cbd16"
-SRCREV_machine_qemuarm64 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_machine_qemumips ?= "93cc3c1275f5ef3a83610aadfcce7e8c7da7187d"
-SRCREV_machine_qemuppc ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_machine_qemuriscv64 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_machine_qemux86 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_machine_qemux86-64 ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_machine_qemumips64 ?= "ed4a5ca45f3ff5aee9cb76a584e9f8db4667035d"
-SRCREV_machine ?= "403891379b317f9f12e3cee8aa1622a6d74d7b0c"
-SRCREV_meta ?= "8745aff15effeb7856b8dca7f8bd5a472f3173c7"
+SRCREV_machine_qemuarm ?= "93677fbb328db35b696740a0c34e05036e75f1b7"
+SRCREV_machine_qemuarm64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_machine_qemumips ?= "c2068f8b670dce4a8d409981a8993df12b993fd3"
+SRCREV_machine_qemuppc ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_machine_qemuriscv64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_machine_qemux86 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_machine_qemux86-64 ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_machine_qemumips64 ?= "4c723a6a9eb908e34d228c5a478af237d9baabf8"
+SRCREV_machine ?= "ec485bd4afef57715eb45ba331b04b3f941e43bb"
+SRCREV_meta ?= "30814016b37dc93699992221763ad4e2960b02fa"
 
 # remap qemuarm to qemuarma15 for the 5.4 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
@@ -30,7 +30,7 @@ SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRA
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.4;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=bbea815ee2795b2f4230826c0c6b8814"
-LINUX_VERSION ?= "5.4.47"
+LINUX_VERSION ?= "5.4.49"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1

