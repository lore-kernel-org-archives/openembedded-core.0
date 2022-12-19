Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FEC4C46467
	for <webhook@archiver.kernel.org>; Mon, 19 Dec 2022 17:44:47 +0000 (UTC)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web11.28852.1671471884212133051
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Dec 2022 09:44:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EyoTq5km;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id 128so9422950vsz.12
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 09:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FWoNgmf1Awv/zqL9GTfo9WX7bS51Jhn4feUTROjh51I=;
        b=EyoTq5km6kULPqSP72xYfi/kv0U9eFQ2GKhVUdd9zNuy/090+l4pVQKXdzNF+Y5bHo
         qG7npPNS9q3oDcWvuM748xk9rm/RuxzxaAqaazrAYPwPuTOElWo+w+g/PFLtVW51VZNl
         HrEtc+UZ4Xjq471dUh18BW5LpH0v9WIscOFlG5Yxd9fnWsIlLiuhaAdIAm0wLUri2nrY
         G2jmXvV180489hvXue7dxPWKiKTQp4z8DBY0uyr+hA65ZhkJrMCK8tvjdDaGKRdhTWcf
         /xAYyzqdCjUEcUOsu+PcyXYxSZixaHocpVNwEfHzRSMBSYUlx3IgtqsTjxaEFEUOBdPn
         TgwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FWoNgmf1Awv/zqL9GTfo9WX7bS51Jhn4feUTROjh51I=;
        b=Mw8bqd9TjDpRcgN9tUQNAAls15AvnP/g2Y9PVAJr6jhfQdjGF90dzO3Oz6WCZX5jYn
         lnNf1XI/eaDBM//yLuWYKDaN11+ZQWFRUpULODyvI4lCXpKvKu029CC7bx0l4pTQgQhC
         9/eXcq+sgihO0RExOi+ECvSpSo8uu7yfczze3Xt2C/taqkWwIGQdDTyZSuufyFEoXiCV
         IdInHvQqJNjm3d4xUmnQ4SHX1fIVTRNELJIP+Bfb9GATtpqbUDdKbA8/VSVxmdicCXsE
         LpLNip9K38/KSewRVaOanYAC+C0CPwgB+PaiOJyxPmDTVHAFFJYU2NjL3bl25KBcJHG/
         I38g==
X-Gm-Message-State: ANoB5plp164tR8cn4Slu8TulvFwHsSPUQH1uyJaWQhhj4G+6+W/Eao6M
	Vq6OVGBN1/QcU1xYxx/Xj+cY/J++BR0=
X-Google-Smtp-Source: AA0mqf4sOYbCvLAXFd8sduCNsaXQoWnpL01jPoWa8bXAtBb4Z7m6PsnP5qRUvI+I3VYJ3EcHHX+elg==
X-Received: by 2002:a05:6102:20f:b0:3b1:299c:d05 with SMTP id z15-20020a056102020f00b003b1299c0d05mr22951363vsp.2.1671471882819;
        Mon, 19 Dec 2022 09:44:42 -0800 (PST)
Received: from build.lan (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id bn35-20020a05620a2ae300b006ce76811a07sm7268913qkb.75.2022.12.19.09.44.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Dec 2022 09:44:42 -0800 (PST)
From: bruce.ashfield@gmail.com
To: steve@sakoman.com
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/3][kirkstone] linux-yocto/5.10: update to v5.10.152
Date: Mon, 19 Dec 2022 12:44:39 -0500
Message-Id: <20221219174441.64835-1-bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Dec 2022 17:44:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174827

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Updating  to the latest korg -stable release that comprises
the following commits:

    7d51b4c67cfb Linux 5.10.152
    43d5109296fa udp: Update reuse->has_conns under reuseport_lock.
    a50ed2d28727 mm: /proc/pid/smaps_rollup: fix no vma's null-deref
    31b1570677e8 blk-wbt: fix that 'rwb->wc' is always set to 1 in wbt_init()
    e2f9b62ead9a mmc: core: Add SD card quirk for broken discard
    3a260e9844c9 Makefile.debug: re-enable debug info for .S files
    6ab2287b26f1 x86/Kconfig: Drop check for -mabi=ms for CONFIG_EFI_STUB
    67dafece56b6 ACPI: video: Force backlight native for more TongFang devices
    dcaf6313202a hv_netvsc: Fix race between VF offering and VF association message from host
    da54c5f4b5b5 perf/x86/intel/pt: Relax address filter validation
    79c3482fbe20 riscv: topology: fix default topology reporting
    a6e770733dc4 arm64: topology: move store_cpu_topology() to shared code
    cb1024d8a4d0 arm64: dts: qcom: sc7180-trogdor: Fixup modem memory region
    f687e2111b6f fcntl: fix potential deadlocks for &fown_struct.lock
    b1efc196446a fcntl: make F_GETOWN(EX) return 0 on dead owner task
    ca4c49838278 perf: Skip and warn on unknown format 'configN' attrs
    dea47fefa6aa perf pmu: Validate raw event with sysfs exported format bits
    86e995f964f6 riscv: always honor the CONFIG_CMDLINE_FORCE when parsing dtb
    0e4c06ae7c54 riscv: Add machine name to kernel boot log and stack dump output
    7fba4a389d07 mmc: sdhci-tegra: Use actual clock rate for SW tuning correction
    3c6a888e3522 xen/gntdev: Accommodate VMA splitting
    5232411f37d7 xen: assume XENFEAT_gnttab_map_avail_bits being set for pv guests
    ea82edad0aee tracing: Do not free snapshot if tracer is on cmdline
    bd6af07e7993 tracing: Simplify conditional compilation code in tracing_set_tracer()
    4e3a15ca24b3 dmaengine: mxs: use platform_driver_register
    1da5d2497046 dmaengine: mxs-dma: Remove the unused .id_table
    1414e9bf3c30 drm/virtio: Use appropriate atomic state in virtio_gpu_plane_cleanup_fb()
    d74196bb278b iommu/vt-d: Clean up si_domain in the init_dmars() error path
    ef11e8ec00b9 iommu/vt-d: Allow NVS regions in arch_rmrr_sanity_check()
    35c92435be76 net: phy: dp83822: disable MDI crossover status change interrupt
    7aa3d623c11b net: sched: fix race condition in qdisc_graft()
    2974f3b330ef net: hns: fix possible memory leak in hnae_ae_register()
    3032e316e0a9 sfc: include vport_id in filter spec hash and equal()
    ded86c4191a3 net: sched: sfb: fix null pointer access issue when sfb_init() fails
    305aa36b628e net: sched: delete duplicate cleanup of backlog and qlen
    ae48bee2830b net: sched: cake: fix null pointer access issue when cake_init() fails
    2008ad08a2ae nvme-hwmon: kmalloc the NVME SMART log buffer
    770b7e3a2c1f nvme-hwmon: consistently ignore errors from nvme_hwmon_init
    67106ac27243 nvme-hwmon: Return error code when registration fails
    bc17f727b005 nvme-hwmon: rework to avoid devm allocation
    191d71c6357e ionic: catch NULL pointer issue on reconfig
    ff7ba7667583 net: hsr: avoid possible NULL deref in skb_clone()
    7286f8755104 cifs: Fix xid leak in cifs_ses_add_channel()
    2d08311aa305 cifs: Fix xid leak in cifs_flock()
    bf49d4fe4ab7 cifs: Fix xid leak in cifs_copy_file_range()
    05cc22c0085e net: phy: dp83867: Extend RX strap quirk for SGMII mode
    118f412bedc5 net/atm: fix proc_mpc_write incorrect return value
    c8310a99e7e4 sfc: Change VF mac via PF as first preference if available.
    39d10f0dfb72 HID: magicmouse: Do not set BTN_MOUSE on double report
    ed5baf3d0a33 i40e: Fix DMA mappings leak
    e558e1489384 tipc: fix an information leak in tipc_topsrv_kern_subscr
    1f4ed95ce617 tipc: Fix recognition of trial period
    fc8c6b8bb294 ACPI: extlog: Handle multiple records
    57e157749ad9 btrfs: fix processing of delayed tree block refs during backref walking
    590929ef6972 btrfs: fix processing of delayed data refs during backref walking
    cc841a8a704c r8152: add PID for the Lenovo OneLink+ Dock
    51b96ecaedc0 arm64: errata: Remove AES hwcap for COMPAT tasks
    910ba49b3345 blk-wbt: call rq_qos_add() after wb_normal is initialized
    392536023da1 block: wbt: Remove unnecessary invoking of wbt_update_limits in wbt_init
    ab6aaa821024 media: venus: dec: Handle the case where find_format fails
    bce5808fc95d media: mceusb: set timeout to at least timeout provided
    6d725672ce85 KVM: arm64: vgic: Fix exit condition in scan_its_table()
    34db701dc65f kvm: Add support for arch compat vm ioctls
    e55feb31df3f cpufreq: qcom: fix memory leak in error path
    303d0f761431 ata: ahci: Match EM_MAX_SLOTS with SATA_PMP_MAX_PORTS
    6a2aadcb0186 ata: ahci-imx: Fix MODULE_ALIAS
    d9f0159da05d hwmon/coretemp: Handle large core ID value
    0fb04676c4fd x86/microcode/AMD: Apply the patch early on every logical thread
    6dcf1f0802cc i2c: qcom-cci: Fix ordering of pm_runtime_xx and i2c_add_adapter
    794ded0bc461 cpufreq: qcom: fix writes in read-only memory region
    2723875e9d67 selinux: enable use of both GFP_KERNEL and GFP_ATOMIC in convert_context()
    0d65f040fdbb ocfs2: fix BUG when iput after ocfs2_mknod fails
    b838dcfda164 ocfs2: clear dinode links count in case of error
    c34d1b22fef3 Linux 5.10.151
    ecad33121117 kbuild: Add skip_encoding_btf_enum64 option to pahole
    c5006abb80e2 kbuild: Unify options for BTF generation for vmlinux and modules
    f5f413cb3e8a kbuild: skip per-CPU BTF generation for pahole v1.18-v1.21
    06481cd9f7f6 kbuild: Quote OBJCOPY var to avoid a pahole call break the build
    bbaea0f1cd33 bpf: Generate BTF_KIND_FLOAT when linking vmlinux
    a10a57a224f3 Linux 5.10.150
    243c8f42ba10 Revert "drm/amdgpu: make sure to init common IP before gmc"
    8026d58b495a gcov: support GCC 12.1 and newer compilers
    cbf2c43b36e0 f2fs: fix wrong condition to trigger background checkpoint correctly
    7b19858803d7 thermal: intel_powerclamp: Use first online CPU as control_cpu
    f039b43cbaea inet: fully convert sk->sk_rx_dst to RCU rules
    67de22cb0b6c ext4: continue to expand file system when the target size doesn't reach
    357db159e965 Revert "drm/amdgpu: use dirty framebuffer helper"
    98ab15bfdcda Revert "drm/amdgpu: move nbio sdma_doorbell_range() into sdma code for vega"
    791489a5c563 net/ieee802154: don't warn zero-sized raw_sendmsg()
    a96336a5f28b Revert "net/ieee802154: reject zero-sized raw_sendmsg()"
    dc54ff9fc4a4 net: ieee802154: return -EINVAL for unknown addr type
    45c33966759e mm: hugetlb: fix UAF in hugetlb_handle_userfault
    c378c479c517 io_uring/af_unix: defer registered files gc to io_uring release
    67cbc8865a66 io_uring: correct pinned_vm accounting
    904f881b5736 arm64: topology: fix possible overflow in amu_fie_setup()
    b5dc2f25789d perf intel-pt: Fix segfault in intel_pt_print_info() with uClibc
    9b4e849777a9 clk: bcm2835: Make peripheral PLLC critical
    b8bbae3236ab usb: idmouse: fix an uninit-value in idmouse_open
    d5bb45f47b37 nvmet-tcp: add bounds check on Transfer Tag
    b79da0080d81 nvme: copy firmware_rev on each init
    e6cc39db24a6 staging: rtl8723bs: fix a potential memory leak in rtw_init_cmd_priv()
    3a5a34ed9d68 Revert "usb: storage: Add quirk for Samsung Fit flash"
    acf0006f2b2b usb: musb: Fix musb_gadget.c rxstate overflow bug
    91271a3e772e usb: host: xhci: Fix potential memory leak in xhci_alloc_stream_info()
    782b3e71c957 md/raid5: Wait for MD_SB_CHANGE_PENDING in raid5d
    dbcca76435a6 HID: roccat: Fix use-after-free in roccat_read()
    f00c049ede46 soundwire: intel: fix error handling on dai registration issues
    f04a673d4a27 soundwire: cadence: Don't overwrite msg->buf during write commands
    c263516c2c20 bcache: fix set_at_max_writeback_rate() for multiple attached devices
    fcad2ac86399 ata: libahci_platform: Sanity check the DT child nodes number
    19c010ae44f0 blk-throttle: prevent overflow while calculating wait time
    1b3cebeca99e staging: vt6655: fix potential memory leak
    89f305a71418 power: supply: adp5061: fix out-of-bounds read in adp5061_get_chg_type()
    b2700f98b3f4 nbd: Fix hung when signal interrupts nbd_start_device_ioctl()
    5942e5c63dc9 scsi: 3w-9xxx: Avoid disabling device if failing to enable it
    48727117bd62 usb: host: xhci-plat: suspend/resume clks for brcm
    c13d0d2f5a48 usb: host: xhci-plat: suspend and resume clocks
    12d31182de8d clk: zynqmp: pll: rectify rate rounding in zynqmp_pll_round_rate
    c2257c8a5015 media: cx88: Fix a null-ptr-deref bug in buffer_prepare()
    d9e2585c3bce clk: zynqmp: Fix stack-out-of-bounds in strncpy`
    70f8b48d0b61 btrfs: scrub: try to fix super block errors
    8f554dd23c18 arm64: dts: imx8mq-librem5: Add bq25895 as max17055's power supply
    451ce2521c21 kselftest/arm64: Fix validatation termination record after EXTRA_CONTEXT
    017cabfb3f86 ARM: dts: imx6sx: add missing properties for sram
    9d3ca48722d3 ARM: dts: imx6sll: add missing properties for sram
    9735f2b62be9 ARM: dts: imx6sl: add missing properties for sram
    2829b6ad30c2 ARM: dts: imx6qp: add missing properties for sram
    0c3a0b3d5e9c ARM: dts: imx6dl: add missing properties for sram
    2763a3b43ac3 ARM: dts: imx6q: add missing properties for sram
    82e0d91484f7 ARM: dts: imx7d-sdb: config the max pressure for tsc2046
    166feb964fc8 drm/amd/display: Remove interface for periodic interrupt 1
    1bb6f4a8db5a drm/dp: Don't rewrite link config when setting phy test pattern
    bb91c06b0be4 mmc: sdhci-msm: add compatible string check for sdm670
    8a427a22839d drm/meson: explicitly remove aggregate driver at module unload time
    1c7d957c5d81 drm/amdgpu: fix initial connector audio value
    69130888b226 ASoC: SOF: pci: Change DMI match info to support all Chrome platforms
    54f2585e2de0 platform/x86: msi-laptop: Change DMI match / alias strings to fix module autoloading
    a9d6a7c9b685 platform/chrome: cros_ec: Notify the PM of wake events during resume
    e29d20deaf9a drm: panel-orientation-quirks: Add quirk for Anbernic Win600
    bfdb391d57df drm/vc4: vec: Fix timings for VEC modes
    b70f8abc1a44 drm: bridge: dw_hdmi: only trigger hotplug event on link change
    bbe2f6f90310 udmabuf: Set ubuf->sg = NULL if the creation of sg table fails
    0a4fddc95c63 drm/amd/display: fix overflow on MIN_I64 definition
    3959e8faf8bf gpu: lontium-lt9611: Fix NULL pointer dereference in lt9611_connector_init()
    c28a8082b25c drm: Prevent drm_copy_field() to attempt copying a NULL pointer
    e7d701800365 drm: Use size_t type for len variable in drm_copy_field()
    3339a51bcd89 drm/nouveau/nouveau_bo: fix potential memory leak in nouveau_bo_alloc()
    484400d433ca r8152: Rate limit overflow messages
    0c108cf3ad38 Bluetooth: L2CAP: Fix user-after-free
    65029aaedd15 net: If sock is dead don't access sock's sk_wq in sk_stream_wait_memory
    4851303c8539 wifi: rt2x00: correctly set BBP register 86 for MT7620
    a01614447954 wifi: rt2x00: set SoC wmac clock register
    5aa0461d1180 wifi: rt2x00: set VGC gain for both chains of MT7620
    8d9c00979a7e wifi: rt2x00: set correct TX_SW_CFG1 MAC register for MT7620
    27ed98e8a9b0 wifi: rt2x00: don't run Rt5592 IQ calibration on MT7620
    3d67986e7208 can: bcm: check the result of can_send() in bcm_can_tx()
    7b674dce4162 Bluetooth: hci_sysfs: Fix attempting to call device_add multiple times
    e25ca9af8a13 Bluetooth: L2CAP: initialize delayed works at l2cap_chan_create()
    b051d9bf98bd regulator: core: Prevent integer underflow
    e01d96494a9d wifi: brcmfmac: fix use-after-free bug in brcmf_netdev_start_xmit()
    be81c44242b2 xfrm: Update ipcomp_scratches with NULL when freed
    9661724f6206 wifi: ath9k: avoid uninit memory read in ath9k_htc_rx_msg()
    0958e487e81b tcp: annotate data-race around tcp_md5sig_pool_populated
    129ca0db956e openvswitch: Fix overreporting of drops in dropwatch
    4398e8a7fd6a openvswitch: Fix double reporting of drops in dropwatch
    e3c9b9473453 bpftool: Clear errno after libcap's checks
    50e45034c580 wifi: brcmfmac: fix invalid address access when enabling SCAN log level
    bbacfcde5fff NFSD: fix use-after-free on source server when doing inter-server copy
    3de402a5248a NFSD: Return nfserr_serverfault if splice_ok but buf->pages have data
    1f730d4ae6f9 x86/entry: Work around Clang __bdos() bug
    513943bf879d thermal: intel_powerclamp: Use get_cpu() instead of smp_processor_id() to avoid crash
    708b9abe1b4a powercap: intel_rapl: fix UBSAN shift-out-of-bounds issue
    b434edb0e9d1 MIPS: BCM47XX: Cast memcmp() of function to (void *)
    6c61a37ea70e ACPI: video: Add Toshiba Satellite/Portege Z830 quirk
    0dd025483f15 rcu-tasks: Convert RCU_LOCKDEP_WARN() to WARN_ONCE()
    36d4ffbedff7 rcu: Back off upon fill_page_cache_func() allocation failure
    278d8ba2b288 selftest: tpm2: Add Client.__del__() to close /dev/tpm* handle
    b60aa21e2f3a f2fs: fix to account FS_CP_DATA_IO correctly
    0b8230d44ce7 f2fs: fix to avoid REQ_TIME and CP_TIME collision
    ecbd95958c48 f2fs: fix race condition on setting FI_NO_EXTENT flag
    110146ce8f84 ACPI: APEI: do not add task_work to kernel thread to avoid memory leak
    dce07e87ee1e thermal/drivers/qcom/tsens-v0_1: Fix MSM8939 fourth sensor hw_id
    3a720eb89026 crypto: cavium - prevent integer overflow loading firmware
    7bfa7d677353 crypto: marvell/octeontx - prevent integer overflows
    cdd42eb4689b kbuild: rpm-pkg: fix breakage when V=1 is used
    6d1aef17e7f2 kbuild: remove the target in signal traps when interrupted
    8d76dd508093 tracing: kprobe: Make gen test module work in arm and riscv
    c6512a6f0cb1 tracing: kprobe: Fix kprobe event gen test module on exit
    9e6ba62d418d iommu/iova: Fix module config properly
    426d5bc089e7 crypto: qat - fix DMA transfer direction
    a43babc059a7 crypto: qat - use pre-allocated buffers in datapath
    a91af5085027 crypto: qat - fix use of 'dma_map_single'
    8a4ed09ed816 crypto: inside-secure - Change swab to swab32
    d33935e66604 crypto: ccp - Release dma channels before dmaengine unrgister
    a1354bdd191d crypto: akcipher - default implementation for setting a private key
    2fee0dbfaeaa iommu/omap: Fix buffer overflow in debugfs
    cfde58a8e41f cgroup/cpuset: Enable update_tasks_cpumask() on top_cpuset
    ab2485eb5dfa hwrng: imx-rngc - Moving IRQ handler registering after imx_rngc_irq_mask_clear()
    d88b88514ef2 crypto: hisilicon/zip - fix mismatch in get/set sgl_sge_nr
    25f134247372 crypto: sahara - don't sleep when in softirq
    2d285164fbe4 powerpc: Fix SPE Power ISA properties for e500v1 platforms
    2bde4e1e4f01 powerpc/64s: Fix GENERIC_CPU build flags for PPC970 / G5
    7ae8bed9087a x86/hyperv: Fix 'struct hv_enlightened_vmcs' definition
    6315998170b4 powerpc/powernv: add missing of_node_put() in opal_export_attrs()
    434db6d17b6b powerpc/pci_dn: Add missing of_node_put()
    718e2d802388 powerpc/sysdev/fsl_msi: Add missing of_node_put()
    592d283a656d powerpc/math_emu/efp: Include module.h
    44c26ceffaa3 mailbox: bcm-ferxrm-mailbox: Fix error check for dma_map_sg
    b1616599c99a clk: ast2600: BCLK comes from EPLL
    6d01017247ee clk: ti: dra7-atl: Fix reference leak in of_dra7_atl_clk_probe
    9b65fd651334 clk: bcm2835: fix bcm2835_clock_rate_from_divisor declaration
    9a6087a438ef clk: baikal-t1: Add SATA internal ref clock buffer
    5f143f3bc2e0 clk: baikal-t1: Add shared xGMAC ref/ptp clocks internal parent
    823fd523912f clk: baikal-t1: Fix invalid xGMAC PTP clock divider
    2f19a1050e1b clk: vc5: Fix 5P49V6901 outputs disabling when enabling FOD
    92f52770a7af spmi: pmic-arb: correct duplicate APID to PPID mapping logic
    a01c0c160049 dmaengine: ioat: stop mod_timer from resurrecting deleted timer in __cleanup()
    1dd5148445eb clk: mediatek: mt8183: mfgcfg: Propagate rate changes to parent
    6e58f2469ec5 mfd: sm501: Add check for platform_driver_register()
    3469dd8e22ff mfd: fsl-imx25: Fix check for platform_get_irq() errors
    b425e03c9639 mfd: lp8788: Fix an error handling path in lp8788_irq_init() and lp8788_irq_init()
    f7b438863622 mfd: lp8788: Fix an error handling path in lp8788_probe()
    08d40518033d mfd: fsl-imx25: Fix an error handling path in mx25_tsadc_setup_irq()
    28868b940b53 mfd: intel_soc_pmic: Fix an error handling path in intel_soc_pmic_i2c_probe()
    382a5fc49e6e fsi: core: Check error number after calling ida_simple_get
    ed8e6011b953 clk: qcom: apss-ipq6018: mark apcs_alias0_core_clk as critical
    884a788f0655 scsi: iscsi: iscsi_tcp: Fix null-ptr-deref while calling getpeername()
    a9e5176ead6d scsi: libsas: Fix use-after-free bug in smp_execute_task_sg()
    8f740c11d891 serial: 8250: Fix restoring termios speed after suspend
    ab5a3e714437 firmware: google: Test spinlock on panic path to avoid lockups
    95ac62e8545b staging: vt6655: fix some erroneous memory clean-up loops
    878f9871668f phy: qualcomm: call clk_disable_unprepare in the error handling
    9a56ade124d4 tty: serial: fsl_lpuart: disable dma rx/tx use flags in lpuart_dma_shutdown
    572fb97fce35 serial: 8250: Toggle IER bits on only after irq has been set up
    3fbfa5e3cc0d serial: 8250: Add an empty line and remove some useless {}
    71ffe5111f0f drivers: serial: jsm: fix some leaks in probe
    7efdd91d54cb usb: gadget: function: fix dangling pnp_string in f_printer.c
    cc952e3bf61c xhci: Don't show warning for reinit on known broken suspend
    dac769dd7dc8 IB: Set IOVA/LENGTH on IB_MR in core/uverbs layers
    360386e11c8d RDMA/cm: Use SLID in the work completion as the DLID in responder side
    a1263294b55c md/raid5: Ensure stripe_fill happens on non-read IO with journal
    76694e9ce0b2 md: Replace snprintf with scnprintf
    7bd5f3b4a805 mtd: rawnand: meson: fix bit map use in meson_nfc_ecc_correct()
    f5325f3202b8 ata: fix ata_id_has_dipm()
    f5a6fa1877f4 ata: fix ata_id_has_ncq_autosense()
    3c34a91c8aa7 ata: fix ata_id_has_devslp()
    fc61a0c8200a ata: fix ata_id_sense_reporting_enabled() and ata_id_has_sense_reporting()
    e3917c85f41e RDMA/siw: Always consume all skbuf data in sk_data_ready() upcall.
    3a9d7d8dcf98 mtd: rawnand: fsl_elbc: Fix none ECC mode
    f87f72081132 mtd: devices: docg3: check the return value of devm_ioremap() in the probe
    d06cc0e11d5b dyndbg: drop EXPORTed dynamic_debug_exec_queries
    1d6598558914 dyndbg: let query-modname override actual module name
    c0e206da44e5 dyndbg: fix module.dyndbg handling
    5047bd3bd739 dyndbg: fix static_branch manipulation
    af12e209a9d5 dmaengine: hisilicon: Add multi-thread support for a DMA channel
    d3fd838536df dmaengine: hisilicon: Fix CQ head update
    d5065ca461a4 dmaengine: hisilicon: Disable channels when unregister hisi_dma
    f59861946fa5 fpga: prevent integer overflow in dfl_feature_ioctl_set_irq()
    7ba19a60c74f misc: ocxl: fix possible refcount leak in afu_ioctl()
    cf3bb86edd8f RDMA/rxe: Fix the error caused by qp->sk
    cdce36a88def RDMA/rxe: Fix "kernel NULL pointer dereference" error
    2630cc88327a media: xilinx: vipp: Fix refcount leak in xvip_graph_dma_init
    40aa0999a3e4 media: meson: vdec: add missing clk_disable_unprepare on error in vdec_hevc_start()
    551b87976a0c tty: xilinx_uartps: Fix the ignore_status
    28cdf6c6fb7a media: exynos4-is: fimc-is: Add of_node_put() when breaking out of loop
    1f683bff1a9c HSI: omap_ssi_port: Fix dma_map_sg error check
    962f22e7f769 HSI: omap_ssi: Fix refcount leak in ssi_probe
    70f0a0a27d79 clk: tegra20: Fix refcount leak in tegra20_clock_init
    c01bfd23cc13 clk: tegra: Fix refcount leak in tegra114_clock_init
    f487137a53b1 clk: tegra: Fix refcount leak in tegra210_clock_init
    59e90c4d9861 clk: sprd: Hold reference returned by of_get_parent()
    57141b1dd689 clk: berlin: Add of_node_put() for of_get_parent()
    dc190b46c63f clk: qoriq: Hold reference returned by of_get_parent()
    baadc6f58fa8 clk: oxnas: Hold reference returned by of_get_parent()
    b95f4f905461 clk: meson: Hold reference returned by of_get_parent()
    beec2f02555c usb: common: debug: Check non-standard control requests
    9d965a22f657 usb: common: move function's kerneldoc next to its definition
    20b63631a38a usb: common: add function to get interval expressed in us unit
    c1ef8c66a362 usb: common: Parse for USB SSP genXxY
    ffffb159e1e5 usb: ch9: Add USB 3.2 SSP attributes
    aa7aada4b7b8 iio: ABI: Fix wrong format of differential capacitance channel ABI.
    b9a0526cd02b iio: inkern: only release the device node when done with it
    44ec4b04fc99 iio: adc: at91-sama5d2_adc: disable/prepare buffer on suspend/resume
    513c72d76df6 iio: adc: at91-sama5d2_adc: lock around oversampling and sample freq
    d259b90f0c3d iio: adc: at91-sama5d2_adc: check return status for pressure and touch
    bc2b97e177a9 iio: adc: at91-sama5d2_adc: fix AT91_SAMA5D2_MR_TRACKTIM_MAX
    5b9bb0cbd9e7 ARM: dts: exynos: fix polarity of VBUS GPIO of Origen
    657de36c72f5 arm64: ftrace: fix module PLTs with mcount
    40e966a404c7 ARM: Drop CMDLINE_* dependency on ATAGS
    477dbf9d1bd5 ARM: dts: exynos: correct s5k6a3 reset polarity on Midas family
    5bbd3dd7f923 soc/tegra: fuse: Drop Kconfig dependency on TEGRA20_APB_DMA
    09c35f1520e7 ia64: export memory_add_physaddr_to_nid to fix cxl build error
    e31c0e14cfad ARM: dts: kirkwood: lsxl: remove first ethernet port
    df4f05b35634 ARM: dts: kirkwood: lsxl: fix serial line
    43faaedf3a7f ARM: dts: turris-omnia: Fix mpp26 pin name and comment
    d5c2051898fd soc: qcom: smem_state: Add refcounting for the 'state->of_node'
    39781c98ad46 soc: qcom: smsm: Fix refcount leak bugs in qcom_smsm_probe()
    1d312c12c91f memory: of: Fix refcount leak bug in of_lpddr3_get_ddr_timings()
    daaec4b3fe22 memory: of: Fix refcount leak bug in of_get_ddr_timings()
    fde46754d548 memory: pl353-smc: Fix refcount leak bug in pl353_smc_probe()
    2c442b0c0624 ALSA: hda/hdmi: Don't skip notification handling during PM operation
    f182de42d786 ASoC: mt6660: Fix PM disable depth imbalance in mt6660_i2c_probe
    37e3e01c9a78 ASoC: wm5102: Fix PM disable depth imbalance in wm5102_probe
    fb2356969935 ASoC: wm5110: Fix PM disable depth imbalance in wm5110_probe
    c1b269dda1e7 ASoC: wm8997: Fix PM disable depth imbalance in wm8997_probe
    71704c2e1b2c mmc: wmt-sdmmc: Fix an error handling path in wmt_mci_probe()
    c940636d9c74 ALSA: dmaengine: increment buffer pointer atomically
    4993c1511d66 ASoC: da7219: Fix an error handling path in da7219_register_dai_clks()
    ef59819976da drm/msm/dp: correct 1.62G link rate at dp_catalog_ctrl_config_msa()
    598d8f7d86f1 drm/msm/dpu: index dpu_kms->hw_vbif using vbif_idx
    a9a60d640572 ASoC: eureka-tlv320: Hold reference returned from of_find_xxx API
    ad0b8ed172a1 mmc: au1xmmc: Fix an error handling path in au1xmmc_probe()
    1f340e1c1c74 drm/omap: dss: Fix refcount leak bugs
    cbe37857dda1 ALSA: hda: beep: Simplify keep-power-at-enable behavior
    f0fb0817ebce ASoC: rsnd: Add check for rsnd_mod_power_on
    877e92e9b1bd drm/bridge: megachips: Fix a null pointer dereference bug
    c577b4e97227 drm: fix drm_mipi_dbi build errors
    804d8e59f34f platform/x86: msi-laptop: Fix resource cleanup
    c21c08fab716 platform/x86: msi-laptop: Fix old-ec check for backlight registering
    b77755f58ede ASoC: tas2764: Fix mute/unmute
    2e6b64df54cd ASoC: tas2764: Drop conflicting set_bias_level power setting
    c2c6022e1004 ASoC: tas2764: Allow mono streams
    868fc93b615b platform/chrome: fix memory corruption in ioctl
    84da5cdf43d2 platform/chrome: fix double-free in chromeos_laptop_prepare()
    5e25bfcd12d8 drm:pl111: Add of_node_put() when breaking out of for_each_available_child_of_node()
    ad06d6bed5f2 drm/dp_mst: fix drm_dp_dpcd_read return value checks
    3f5889fd6500 drm/bridge: parade-ps8640: Fix regulator supply order
    45120fa5e522 drm/mipi-dsi: Detach devices when removing the host
    050b65050741 drm/bridge: Avoid uninitialized variable warning
    7839f2b3495b drm: bridge: adv7511: fix CEC power down control register offset
    29f50bcf0f8b net: mvpp2: fix mvpp2 debugfs leak
    6cb54f21623d once: add DO_ONCE_SLOW() for sleepable contexts
    67cb80a9d2c8 net/ieee802154: reject zero-sized raw_sendmsg()
    6cc0e2afc6a1 bnx2x: fix potential memory leak in bnx2x_tpa_stop()
    da349221c4d2 net: rds: don't hold sock lock when cancelling work from rds_tcp_reset_callbacks()
    d9e25dc053f6 spi: Ensure that sg_table won't be used after being freed
    96a3ddb87031 tcp: fix tcp_cwnd_validate() to not forget is_cwnd_limited
    f65955340e00 sctp: handle the error returned from sctp_auth_asoc_init_active_key
    2a1d03632085 mISDN: fix use-after-free bugs in l1oip timer handlers
    b4a5905fd2ef vhost/vsock: Use kvmalloc/kvfree for larger packets.
    d2b5dc3a5394 wifi: rtl8xxxu: Fix AIFS written to REG_EDCA_*_PARAM
    17196f2f98ab spi: s3c64xx: Fix large transfers with DMA
    b284e1fe15c4 netfilter: nft_fib: Fix for rpath check with VRF devices
    b384e8fb1606 Bluetooth: hci_core: Fix not handling link timeouts propertly
    129f01116b8c i2c: mlxbf: support lock mechanism
    534909fe3c92 spi/omap100k:Fix PM disable depth imbalance in omap1_spi100k_probe
    9da61e7b5993 spi: dw: Fix PM disable depth imbalance in dw_spi_bt1_probe
    1ef5798638bd x86/cpu: Include the header of init_ia32_feat_ctl()'s prototype
    6ed7b05a3592 x86/microcode/AMD: Track patch allocation size explicitly
    07299e52e5b9 wifi: ath11k: fix number of VHT beamformee spatial streams
    d7cc0d51ffcb Bluetooth: hci_{ldisc,serdev}: check percpu_init_rwsem() failure
    ed403bcd979d bpf: Ensure correct locking around vulnerable function find_vpid()
    2a1c29dc9b7e net: fs_enet: Fix wrong check in do_pd_setup
    795954d75197 wifi: rtl8xxxu: Remove copy-paste leftover in gen2_update_rate_mask
    226e6f241258 wifi: rtl8xxxu: gen2: Fix mistake in path B IQ calibration
    0a60ac7a0dad bpf: btf: fix truncated last_member_type_id in btf_struct_resolve
    8398a45d3d72 spi: meson-spicc: do not rely on busy flag in pow2 clk ops
    351cf55595d3 wifi: rtl8xxxu: Fix skb misuse in TX queue selection
    1e911790576f spi: qup: add missing clk_disable_unprepare on error in spi_qup_pm_resume_runtime()
    7b83d11d48ff spi: qup: add missing clk_disable_unprepare on error in spi_qup_resume()
    557600830515 selftests/xsk: Avoid use-after-free on ctx
    c823df067941 wifi: rtl8xxxu: tighten bounds checking in rtl8xxxu_read_efuse()
    ea1b6b54098c Bluetooth: btusb: mediatek: fix WMT failure during runtime suspend
    07194ccbb14c Bluetooth: btusb: fix excessive stack usage
    cdadf95435ff Bluetooth: btusb: Fine-tune mt7663 mechanism.
    294395caacf1 x86/resctrl: Fix to restore to original value when re-enabling hardware prefetch register
    029a1de92ce2 spi: mt7621: Fix an error message in mt7621_spi_probe()
    2afb93e4e416 bpftool: Fix a wrong type cast in btf_dumper_int
    61905bbb6116 wifi: mac80211: allow bw change during channel switch in mesh
    75652070667f leds: lm3601x: Don't use mutex after it was destroyed
    08faf07717be wifi: ath10k: add peer map clean up for peer delete in ath10k_sta_state()
    e060c4b9f33c nfsd: Fix a memory leak in an error handling path
    730191a098d8 objtool: Preserve special st_shndx indexes in elf_update_symbol
    84837738d406 ARM: 9247/1: mm: set readonly for MT_MEMORY_RO with ARM_LPAE
    f1d6edeaa8d0 ARM: 9244/1: dump: Fix wrong pg_level in walk_pmd()
    da2aecef866b MIPS: SGI-IP27: Fix platform-device leak in bridge_platform_create()
    0c667858c026 MIPS: SGI-IP27: Free some unused memory
    35984456983b sh: machvec: Use char[] for section boundaries
    6e4be747f15f userfaultfd: open userfaultfds with O_RDONLY
    28d9b3973307 selinux: use "grep -E" instead of "egrep"
    d11e09953cc0 smb3: must initialize two ACL struct fields to zero
    abd13b21004d drm/i915: Fix watermark calculations for gen12+ MC CCS modifier
    fd37286f392a drm/i915: Fix watermark calculations for gen12+ RC CCS modifier
    5d6093c49c09 drm/nouveau: fix a use-after-free in nouveau_gem_prime_import_sg_table()
    57f1a89a8e4e drm/nouveau/kms/nv140-: Disable interlacing
    d0febad83e29 staging: greybus: audio_helper: remove unused and wrong debugfs usage
    ceeb8d4a43ac KVM: VMX: Drop bits 31:16 when shoving exception error code into VMCS
    83fe0b009bd0 KVM: nVMX: Unconditionally purge queued/injected events on nested "exit"
    085ca1d33b19 KVM: x86/emulator: Fix handing of POP SS to correctly set interruptibility
    bda8120e5b10 media: cedrus: Set the platform driver data earlier
    dbdd3b1448e5 efi: libstub: drop pointless get_memory_map() call
    68158654b583 thunderbolt: Explicitly enable lane adapter hotplug events at startup
    fc08f8438172 tracing: Disable interrupt or preemption before acquiring arch_spinlock_t
    0cf6c09dafee ring-buffer: Fix race between reset page and reading page
    588f02f8b9d9 ring-buffer: Add ring_buffer_wake_waiters()
    586f02c500b2 ring-buffer: Check pending waiters when doing wake ups as well
    6617e5132c44 ring-buffer: Have the shortest_full queue be the shortest not longest
    4a3bbd40e452 ring-buffer: Allow splice to read previous partially read pages
    f2ca4609d0c3 ftrace: Properly unset FTRACE_HASH_FL_MOD
    846f041203b9 livepatch: fix race between fork and KLP transition
    2189756eabbb ext4: update 'state->fc_regions_size' after successful memory allocation
    2cfb769d60a2 ext4: fix potential memory leak in ext4_fc_record_regions()
    c9ce7766dc4e ext4: fix potential memory leak in ext4_fc_record_modified_inode()
    d575fb52c466 ext4: fix miss release buffer head in ext4_fc_write_inode
    74d2a398d2d8 ext4: place buffer head allocation before handle start
    fbb0e601bd51 ext4: ext4_read_bh_lock() should submit IO if the buffer isn't uptodate
    0e1764ad71ab ext4: don't increase iversion counter for ea_inodes
    483831ad0440 ext4: fix check for block being out of directory size
    ac66db1a4365 ext4: make ext4_lazyinit_thread freezable
    f34ab9516276 ext4: fix null-ptr-deref in ext4_write_info
    fb98cb61efff ext4: avoid crash when inline data creation follows DIO write
    e65506ff181f jbd2: add miss release buffer head in fc_do_one_pass()
    1d4d16daec2a jbd2: fix potential use-after-free in jbd2_fc_wait_bufs
    7a33dde572fc jbd2: fix potential buffer head reference count leak
    eea3e455a3ae jbd2: wake up journal waiters in FIFO order, not LIFO
    ba52e685d29b hardening: Remove Clang's enable flag for -ftrivial-auto-var-init=zero
    bdcb1d7cf285 hardening: Avoid harmless Clang option under CONFIG_INIT_STACK_ALL_ZERO
    d621a87064fa hardening: Clarify Kconfig text for auto-var-init
    4a8e8bf28070 f2fs: fix to do sanity check on summary info
    73fb4bd2c055 f2fs: fix to do sanity check on destination blkaddr during recovery
    12014eaf1b3f f2fs: increase the limit for reserve_root
    47b5ffe86332 btrfs: fix race between quota enable and quota rescan ioctl
    e50472949604 fbdev: smscufx: Fix use-after-free in ufx_ops_open()
    9931bd05bb8d scsi: qedf: Populate sysfs attributes for vport
    102c4b6e8c4b powerpc/boot: Explicitly disable usage of SPE instructions
    7db60fd46e0c powercap: intel_rapl: Use standard Energy Unit for SPR Dram RAPL domain
    9119a92ad93e PCI: Sanitise firmware BAR assignments behind a PCI-PCI bridge
    a3c08c021778 mm/mmap: undo ->mmap() when arch_validate_flags() fails
    7d551b7d6114 block: fix inflight statistics of part0
    0a129790893b drm/udl: Restore display mode on resume
    f134f261d76a drm/virtio: Check whether transferred 2D BO is shmem
    303436e301ba nvme-pci: set min_align_mask before calculating max_hw_sectors
    6a73e6edcbf3 UM: cpuinfo: Fix a warning for CONFIG_CPUMASK_OFFSTACK
    1a053f597f42 riscv: Pass -mno-relax only on lld < 15.0.0
    d15dca1d46ab riscv: Make VM_WRITE imply VM_READ
    d8c6f9b2e194 riscv: Allow PROT_WRITE-only mmap()
    a6dcc6cfa293 parisc: fbdev/stifb: Align graphics memory size to 4MB
    2ce9fab94b8d RISC-V: Make port I/O string accessors actually work
    ffb571e1232f regulator: qcom_rpm: Fix circular deferral regression
    85909424a1f5 hwmon: (gsc-hwmon) Call of_node_get() before of_find_xxx API
    8ef0e1c0ae50 ASoC: wcd934x: fix order of Slimbus unprepare/disable
    9b2c82af65f7 ASoC: wcd9335: fix order of Slimbus unprepare/disable
    1c20d672e3a5 platform/chrome: cros_ec_proto: Update version on GET_NEXT_EVENT failure
    6b7ae4a904a4 quota: Check next/prev free block number after reading from quota file
    5b1a56beb6b8 HID: multitouch: Add memory barriers
    bfe60d7641b0 fs: dlm: handle -EBUSY first in lock arg validation
    0b2d8e4db40c fs: dlm: fix race between test_bit() and queue_work()
    057d5838c795 mmc: sdhci-sprd: Fix minimum clock limit
    448fffc1aea6 can: kvaser_usb_leaf: Fix CAN state after restart
    a3776e09b361 can: kvaser_usb_leaf: Fix TX queue out of sync after restart
    0f8c88978da4 can: kvaser_usb_leaf: Fix overread with an invalid command
    5d1cb7bfad21 can: kvaser_usb: Fix use of uninitialized completion
    b239a0993aa2 usb: add quirks for Lenovo OneLink+ Dock
    afbbf305dbac iio: pressure: dps310: Reset chip after timeout
    9daadd1d1015 iio: pressure: dps310: Refactor startup procedure
    ae49d80400e6 iio: adc: ad7923: fix channel readings for some variants
    ea4dcd3d6acc iio: ltc2497: Fix reading conversion results
    30e1bd0d3e66 iio: dac: ad5593r: Fix i2c read protocol requirements
    9312e04b6c6b cifs: Fix the error length of VALIDATE_NEGOTIATE_INFO message
    64f23e5430d3 cifs: destage dirty pages before re-reading them for cache=none
    50d3d895375c mtd: rawnand: atmel: Unmap streaming DMA mappings
    e8eb44eeee59 ALSA: hda/realtek: Add Intel Reference SSID to support headset keys
    4491fbd0a79c ALSA: hda/realtek: Add quirk for ASUS GV601R laptop
    4285d06d1296 ALSA: hda/realtek: Correct pin configs for ASUS G533Z
    768cd2cd1ae6 ALSA: hda/realtek: remove ALC289_FIXUP_DUAL_SPK for Dell 5530
    3e29645fbaa6 ALSA: usb-audio: Fix NULL dererence at error path
    bc1d16d282bc ALSA: usb-audio: Fix potential memory leaks
    ef1658bc482c ALSA: rawmidi: Drop register_mutex in snd_rawmidi_free()
    026fcb6336d6 ALSA: oss: Fix potential deadlock at unregistration

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 .../linux/linux-yocto-rt_5.10.bb              |  6 ++---
 .../linux/linux-yocto-tiny_5.10.bb            |  8 +++----
 meta/recipes-kernel/linux/linux-yocto_5.10.bb | 24 +++++++++----------
 3 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
index f04f444f07..62c494a868 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.10.bb
@@ -11,13 +11,13 @@ python () {
         raise bb.parse.SkipRecipe("Set PREFERRED_PROVIDER_virtual/kernel to linux-yocto-rt to enable it")
 }
 
-SRCREV_machine ?= "2d7a731e45ade04ee2f2714f189c7c98e00b2238"
-SRCREV_meta ?= "47b7070aa771dec970b79cb84e7b8c9329a93678"
+SRCREV_machine ?= "899cf349eab4ac3020c6bad06f889e679509a1d2"
+SRCREV_meta ?= "dd90d836c062535cc2e8fff8c69959178215a552"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
-LINUX_VERSION ?= "5.10.149"
+LINUX_VERSION ?= "5.10.152"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
index e3cfd65a0d..bbb645803c 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.10.bb
@@ -6,7 +6,7 @@ KCONFIG_MODE = "--allnoconfig"
 
 require recipes-kernel/linux/linux-yocto.inc
 
-LINUX_VERSION ?= "5.10.149"
+LINUX_VERSION ?= "5.10.152"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
@@ -15,9 +15,9 @@ DEPENDS += "openssl-native util-linux-native"
 KMETA = "kernel-meta"
 KCONF_BSP_AUDIT_LEVEL = "2"
 
-SRCREV_machine:qemuarm ?= "bfcb0909af273bd7fb7ff1376637c9e23c344a0e"
-SRCREV_machine ?= "84e9465dec9a7dfe8790c70d44def5aaee8f9968"
-SRCREV_meta ?= "47b7070aa771dec970b79cb84e7b8c9329a93678"
+SRCREV_machine:qemuarm ?= "7827d8bea61af83f961b011d45b4fc6afecbe65f"
+SRCREV_machine ?= "bde76dde922d5b44ea86ec55bcac956a1361e5d7"
+SRCREV_meta ?= "dd90d836c062535cc2e8fff8c69959178215a552"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.10.bb b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
index 81c96ae69c..e025e62067 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.10.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.10.bb
@@ -13,23 +13,23 @@ KBRANCH:qemux86  ?= "v5.10/standard/base"
 KBRANCH:qemux86-64 ?= "v5.10/standard/base"
 KBRANCH:qemumips64 ?= "v5.10/standard/mti-malta64"
 
-SRCREV_machine:qemuarm ?= "9b3a47c50c96c81ab492cc37023deef03718d36d"
-SRCREV_machine:qemuarm64 ?= "fc6a3081ecfda16e3c2a1b9f5f0b0fb561f72435"
-SRCREV_machine:qemumips ?= "fc97b0bf35ce6d3c17cf2037d2097654d16c643b"
-SRCREV_machine:qemuppc ?= "3a90218bbe8c5e71c9aa64dc3db41e16718ae8d3"
-SRCREV_machine:qemuriscv64 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
-SRCREV_machine:qemuriscv32 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
-SRCREV_machine:qemux86 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
-SRCREV_machine:qemux86-64 ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
-SRCREV_machine:qemumips64 ?= "7b6dc74b768b8015bdd2cf88abdf0106a56de0f9"
-SRCREV_machine ?= "7abf3b31ec4e4fc9564b7a8db6844d9b4d71a1b2"
-SRCREV_meta ?= "47b7070aa771dec970b79cb84e7b8c9329a93678"
+SRCREV_machine:qemuarm ?= "2f3c80866ab9071dc1ac9f3aad4a464b7e079aa3"
+SRCREV_machine:qemuarm64 ?= "c787702068ec311d8b60bf772b54f2a182519bb2"
+SRCREV_machine:qemumips ?= "52c60eb7dcd36cb6a978723b198b0a2bdb92450a"
+SRCREV_machine:qemuppc ?= "89f4096a15892c8cfb003443a1d52818c27d5d11"
+SRCREV_machine:qemuriscv64 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
+SRCREV_machine:qemuriscv32 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
+SRCREV_machine:qemux86 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
+SRCREV_machine:qemux86-64 ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
+SRCREV_machine:qemumips64 ?= "473c87e4e9438b67a13b23e1a94ed3d872b09df4"
+SRCREV_machine ?= "7d078581c0f754d6cb38b2bf1952925e0460ef84"
+SRCREV_meta ?= "dd90d836c062535cc2e8fff8c69959178215a552"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;name=machine;branch=${KBRANCH}; \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.10;destsuffix=${KMETA}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=6bc538ed5bd9a7fc9398086aedcd7e46"
-LINUX_VERSION ?= "5.10.149"
+LINUX_VERSION ?= "5.10.152"
 
 DEPENDS += "${@bb.utils.contains('ARCH', 'x86', 'elfutils-native', '', d)}"
 DEPENDS += "openssl-native util-linux-native"
-- 
2.19.1


